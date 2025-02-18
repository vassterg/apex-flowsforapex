create or replace package body flow_engine_app_api
as

  function apex_error_handling (
    p_error in apex_error.t_error 
  )
  return apex_error.t_error_result
  is
    l_result          apex_error.t_error_result;
    l_reference_id    number;
    l_constraint_name varchar2(255);
  begin
    l_result := apex_error.init_error_result (
                    p_error => p_error );
                    
    -- If it's an internal error raised by APEX, like an invalid statement or
    -- code which can't be executed, the error text might contain security sensitive
    -- information. To avoid this security problem we can rewrite the error to
    -- a generic error message and log the original error message for further
    -- investigation by the help desk.
    if p_error.is_internal_error then
      -- mask all errors that are not common runtime errors (Access Denied
      -- errors raised by application / page authorization and all errors
      -- regarding session and session state)
      if not p_error.is_common_runtime_error then
        -- log error for example with an autonomous transaction and return
        -- l_reference_id as reference#
        -- l_reference_id := log_error (
        --                       p_error => p_error );
        --

        -- Change the message to the generic error message which doesn't expose
        -- any sensitive information.
        l_result.message         := 'An unexpected internal application error has occurred. '||
                                    'Please fill a bug at  https://github.com/flowsforapex/apex-flowsforapex/issues'||
                                    ' for further investigation.';
        l_result.additional_info := null;
      end if;
    else
      -- Note: If you want to have friendlier ORA error messages, you can also define
      --       a text message with the name pattern APEX.ERROR.ORA-number
      --       There is no need to implement custom code for that.

      -- If it's a constraint violation like
      --
      --   -) ORA-00001: unique constraint violated
      --   -) ORA-02091: transaction rolled back (-> can hide a deferred constraint)
      --   -) ORA-02290: check constraint violated
      --   -) ORA-02291: integrity constraint violated - parent key not found
      --   -) ORA-02292: integrity constraint violated - child record found
      --
      -- we try to get a friendly error message from APEX Text Messages.
      -- If we don't find the constraint in APEX text message then create it
      if p_error.ora_sqlcode in (-1, -2091, -2290, -2291, -2292) then
        l_constraint_name := apex_error.extract_constraint_name (
                                   p_error => p_error );

        l_result.message := apex_lang.message( l_constraint_name );

      end if;

      -- If no associated page item/tabular form column has been set, we can use
      -- apex_error.auto_set_associated_item to automatically guess the affected
      -- error field by examine the ORA error for constraint names or column names.
      if l_result.page_item_name is null and l_result.column_alias is null then
          apex_error.auto_set_associated_item (
              p_error        => p_error,
              p_error_result => l_result );
      end if;
    end if;

    return l_result;
  end apex_error_handling;

  procedure handle_ajax
  as 
    l_error_occured boolean := false;
    l_url           varchar2(4000);
    l_clob          clob;
    l_before_prcs_status flow_instances_vw.prcs_status%type;
    l_after_prcs_status flow_instances_vw.prcs_status%type;
    l_reload boolean := false;

  begin
    apex_debug.message( p_message => 'Action: %s', p0 => apex_application.g_x01 );
    if instr(apex_application.g_x01, 'bulk-') > 0 then
      apex_debug.message( p_message => 'This is a bulk action');
      if ( upper(apex_application.g_x01) = 'BULK-COMPLETE-STEP' or upper(apex_application.g_x01) = 'BULK-RESTART-STEP' ) then
        select prcs_status
        into l_before_prcs_status
        from flow_instances_vw
        where prcs_id = apex_application.g_f01(1);
      end if;
      for i in apex_application.g_f01.first..apex_application.g_f01.last
      loop
        apex_debug.message( p_message => 'Action: %s, PRCS: %s', p0 => apex_application.g_x01, p1 => apex_application.g_f01(i) );
        case upper(apex_application.g_x01)
          when 'BULK-RESET-FLOW-INSTANCE' then
            flow_api_pkg.flow_reset( p_process_id => apex_application.g_f01(i), p_comment => apex_application.g_x02 );
          when 'BULK-START-FLOW-INSTANCE' then
            flow_api_pkg.flow_start( p_process_id => apex_application.g_f01(i) );
          when 'BULK-DELETE-FLOW-INSTANCE' then
            flow_api_pkg.flow_delete( p_process_id => apex_application.g_f01(i), p_comment => apex_application.g_x02 );
          when 'BULK-TERMINATE-FLOW-INSTANCE' then 
            flow_api_pkg.flow_terminate ( p_process_id => apex_application.g_f01(i), p_comment => apex_application.g_x02 );
          when 'BULK-RESERVE-STEP' then
            flow_api_pkg.flow_reserve_step
            (
              p_process_id => apex_application.g_f01(i)
            , p_subflow_id => apex_application.g_f02(i)
            , p_step_key   => apex_application.g_f03(i)
            , p_reservation => coalesce(apex_application.g_x02, V('APP_USER'))
            );
          when 'BULK-RELEASE-STEP' then
            flow_api_pkg.flow_release_step
            (
              p_process_id => apex_application.g_f01(i)
            , p_subflow_id => apex_application.g_f02(i)
            , p_step_key   => apex_application.g_f03(i)
            );        
          when 'BULK-COMPLETE-STEP' then
            flow_api_pkg.flow_complete_step
            (
              p_process_id => apex_application.g_f01(i)
            , p_subflow_id => apex_application.g_f02(i)
            , p_step_key   => apex_application.g_f03(i)
            );
          when 'BULK-RESTART-STEP' then 
            flow_api_pkg.flow_restart_step 
            (
              p_process_id => apex_application.g_f01(i)
            , p_subflow_id => apex_application.g_f02(i)
            , p_step_key   => apex_application.g_f03(i)
            , p_comment       => apex_application.g_x02           
            );
          when 'BULK-DELETE-PROCESS-VARIABLE' then 
            flow_process_vars.delete_var(
              pi_prcs_id  => apex_application.g_f01(i)
            , pi_var_name => apex_application.g_f02(i)
            , pi_scope    => apex_application.g_f03(i)
          );
          when 'BULK-RESCHEDULE-TIMER' then
          flow_api_pkg.flow_reschedule_timer(
              p_process_id    => apex_application.g_f01(i)
            , p_subflow_id    => apex_application.g_f02(i)
            , p_step_key      => apex_application.g_f03(i)
            , p_is_immediate  => case apex_application.g_x02 when 'Y' then true end
            , p_new_timestamp => case apex_application.g_x03 when 'N' then to_timestamp(apex_application.g_x06, v('APP_NLS_TIMESTAMP_FORMAT')) end
            , p_comment       => apex_application.g_x04
          );
          else
            apex_error.add_error
            (
              p_message          => 'Unknow action requested.'
            , p_display_location => apex_error.c_on_error_page
            );
        end case;
      end loop;
      if ( upper(apex_application.g_x01) = 'BULK-COMPLETE-STEP' or upper(apex_application.g_x01) = 'BULK-RESTART-STEP' ) then
        select prcs_status
        into l_after_prcs_status
        from flow_instances_vw
        where prcs_id = apex_application.g_f01(1);

        if l_before_prcs_status != l_after_prcs_status then
          l_reload := true;
        end if;
      end if;
    else
      apex_debug.message( p_message => 'Action: %0, PRCS: %1, SBFL: %2, STEP KEY: %3', p0 => apex_application.g_x01, 
      p1 => apex_application.g_x02, p2 => apex_application.g_x03 , p3 => apex_application.g_x04);

      if ( upper( apex_application.g_x01 ) = 'COMPLETE-STEP' or upper( apex_application.g_x01 ) = 'RESTART-STEP' ) then
        select prcs_status
        into l_before_prcs_status
        from flow_instances_vw
        where prcs_id = apex_application.g_x02;
      end if;


      case upper(apex_application.g_x01)
        when 'RESET-FLOW-INSTANCE' then
          flow_api_pkg.flow_reset( p_process_id => apex_application.g_x02, p_comment => apex_application.g_x03 );
        when 'STEP-TIMERS' then
          flow_api_pkg.step_timers;
        when 'START-FLOW-INSTANCE' then
          flow_api_pkg.flow_start( p_process_id => apex_application.g_x02 );
        when 'DELETE-FLOW-INSTANCE' then
          flow_api_pkg.flow_delete( p_process_id => apex_application.g_x02, p_comment => apex_application.g_x03 );
          l_url := apex_page.get_url(
                p_page => 10
              , p_clear_cache => 10
          );
        when 'RESERVE-STEP' then
          flow_api_pkg.flow_reserve_step
          (
            p_process_id => apex_application.g_x02
          , p_subflow_id => apex_application.g_x03
          , p_step_key   => apex_application.g_x04
          , p_reservation => coalesce(apex_application.g_x05, V('APP_USER'))
          );
        when 'TERMINATE-FLOW-INSTANCE' then 
          flow_api_pkg.flow_terminate ( p_process_id => apex_application.g_x02, p_comment => apex_application.g_x03 );
        when 'RELEASE-STEP' then
          flow_api_pkg.flow_release_step
          (
            p_process_id => apex_application.g_x02
          , p_subflow_id => apex_application.g_x03
          , p_step_key   => apex_application.g_x04
          );    
        when 'COMPLETE-STEP' then
          flow_api_pkg.flow_complete_step
          (
            p_process_id    => apex_application.g_x02
          , p_subflow_id    => apex_application.g_x03
          , p_step_key      => apex_application.g_x04
          );
        when 'RESTART-STEP' then 
          flow_api_pkg.flow_restart_step 
          (
            p_process_id    => apex_application.g_x02
          , p_subflow_id    => apex_application.g_x03
          , p_step_key      => apex_application.g_x04
          , p_comment       => apex_application.g_x05       
          );
        when 'FLOW-INSTANCE-AUDIT' then
          l_url := apex_page.get_url(
              p_page => 14
            , p_items => 'P14_PRCS_ID,P14_TITLE'
            , p_values => apex_application.g_x02||','||apex_application.g_x03
            , p_clear_cache => 'RP'
          );
        when 'EDIT-FLOW-DIAGRAM' then
          l_url := apex_page.get_url(
              p_page => 7
            , p_items => 'P7_DGRM_ID'
            , p_values => apex_application.g_x02
          );
        when 'OPEN-FLOW-INSTANCE-DETAILS' then
          l_url := apex_page.get_url(
              p_page => 8
            , p_items => 'P8_PRCS_ID'
            , p_values => apex_application.g_x02
            , p_clear_cache => 8
          );
        when 'VIEW-FLOW-INSTANCE' then
          l_url := apex_page.get_url(
              p_page => 12
            , p_items => 'P12_PRCS_ID'
            , p_values => apex_application.g_x02
            , p_clear_cache => 12
          );
        when 'PROCESS-VARIABLE' then
          case apex_application.g_x04
            when 'VARCHAR2' then
              flow_process_vars.set_var
              (
                pi_prcs_id   => apex_application.g_x02
              , pi_var_name  => apex_application.g_x03
              , pi_vc2_value => apex_application.g_x05
              , pi_scope     => apex_application.g_x06
              );
            when 'NUMBER' then
              flow_process_vars.set_var
              (
                pi_prcs_id   => apex_application.g_x02
              , pi_var_name  => apex_application.g_x03
              , pi_num_value => to_number(apex_application.g_x05)
              , pi_scope     => apex_application.g_x06
              );
            when 'DATE' then
              flow_process_vars.set_var
              (
                pi_prcs_id    => apex_application.g_x02
              , pi_var_name   => apex_application.g_x03
              , pi_date_value => to_date(apex_application.g_x05, v('APP_DATE_TIME_FORMAT'))
              , pi_scope      => apex_application.g_x06
              );
            when 'TIMESTAMP WITH TIME ZONE' then
              flow_process_vars.set_var
              (
                pi_prcs_id    => apex_application.g_x02
              , pi_var_name   => apex_application.g_x03
              , pi_tstz_value => to_timestamp_tz(apex_application.g_x05, flow_constants_pkg.gc_prov_default_tstz_format)
              , pi_scope      => apex_application.g_x06
              );
            when 'CLOB' then
              for i in apex_application.g_f01.first..apex_application.g_f01.last
              loop
                l_clob := l_clob || apex_application.g_f01(i);
              end loop;
              flow_process_vars.set_var
              (
                pi_prcs_id    => apex_application.g_x02
              , pi_var_name   => apex_application.g_x03
              , pi_clob_value => l_clob
              , pi_scope      => apex_application.g_x06
              );
            else
              null;
          end case;
        when 'DELETE-PROCESS-VARIABLE' then
          flow_process_vars.delete_var(
              pi_prcs_id  => apex_application.g_x02
            , pi_var_name => apex_application.g_x03
            , pi_scope    => apex_application.g_x04
          );
        when 'RESCHEDULE-TIMER' then
          flow_api_pkg.flow_reschedule_timer(
              p_process_id    => apex_application.g_x02
            , p_subflow_id    => apex_application.g_x03
            , p_step_key      => apex_application.g_x04
            , p_is_immediate  => case apex_application.g_x05 when 'Y' then true end
            , p_new_timestamp => case apex_application.g_x05 when 'N' then to_timestamp(apex_application.g_x06, v('APP_NLS_TIMESTAMP_FORMAT')) end
            , p_comment       => apex_application.g_x07
          );
        when 'RECEIVE-MESSAGE' then
          for i in apex_application.g_f01.first..apex_application.g_f01.last
          loop
            l_clob := l_clob || apex_application.g_f01(i);
          end loop;

          flow_api_pkg.receive_message(
            p_message_name => apex_application.g_x02,
            p_key_name     => apex_application.g_x03,
            p_key_value    => apex_application.g_x04,
            p_payload      => l_clob
          );
        else
          apex_error.add_error
          (
            p_message          => 'Unknow action requested.'
          , p_display_location => apex_error.c_on_error_page
          );
      end case;

      if ( upper( apex_application.g_x01 ) = 'COMPLETE-STEP' or upper( apex_application.g_x01 ) = 'RESTART-STEP' ) then
        select prcs_status
        into l_after_prcs_status
        from flow_instances_vw
        where prcs_id = apex_application.g_x02;

        if l_before_prcs_status != l_after_prcs_status then
          l_reload := true;
        end if;
      end if;

    end if;

    apex_json.open_object;
    apex_json.write( p_name => 'success', p_value => not apex_error.have_errors_occurred );
    if l_url is not null then
      apex_json.write( p_name => 'url', p_value => l_url );
    end if;
    if l_reload then 
      apex_json.write( p_name => 'reloadPage', p_value => true );
    end if;
    apex_json.close_all;
    
  exception
      when others then
        apex_json.open_object;
        apex_json.write( p_name => 'success', p_value => false );
        apex_json.write( p_name => 'message', p_value => sqlerrm);
        apex_json.write( p_name => 'fullstack', p_value => dbms_utility.format_error_stack);
        apex_json.close_all;
        l_error_occured := true;
  end handle_ajax;


  function get_objt_list(
    p_prcs_id in flow_processes.prcs_id%type
  ) return varchar2
  as
    l_objt_list apex_t_varchar2;
  begin    
    select bpmn_id
      bulk collect into l_objt_list
      from ( select objt_bpmn_id as bpmn_id
               from flow_objects
              where objt_dgrm_id = ( select prcs_dgrm_id 
                                       from flow_processes
                                      where prcs_id = p_prcs_id)
                and objt_tag_name not in ('bpmn:process', 'bpmn:textAnnotation', 'bpmn:participant', 'bpmn:laneSet', 'bpmn:lane')
              union all
             select conn_bpmn_id as bpmn_id
               from flow_connections
              where conn_dgrm_id = ( select prcs_dgrm_id 
                                       from flow_processes
                                      where prcs_id = p_prcs_id)
           );
    return apex_string.join( p_table => l_objt_list, p_sep => ':' );
  end get_objt_list;


  function get_objt_list(
    p_dgrm_id in flow_diagrams.dgrm_id%type
  ) return varchar2
  as
    l_objt_list apex_t_varchar2;
  begin    
    select bpmn_id
      bulk collect into l_objt_list
      from ( select objt_bpmn_id as bpmn_id
               from flow_objects
              where objt_dgrm_id = p_dgrm_id
                and objt_tag_name not in ('bpmn:process', 'bpmn:textAnnotation', 'bpmn:participant', 'bpmn:laneSet', 'bpmn:lane')
              union all
             select conn_bpmn_id as bpmn_id
               from flow_connections
              where conn_dgrm_id = p_dgrm_id
           );
    return apex_string.join( p_table => l_objt_list, p_sep => ':' );
  end get_objt_list;


  function get_objt_list(
    p_prdg_id in flow_instance_diagrams.prdg_id%type
  ) return varchar2
  as
    l_objt_list apex_t_varchar2;
  begin    
    select bpmn_id
      bulk collect into l_objt_list
      from ( select objt_bpmn_id as bpmn_id
               from flow_objects
              where objt_dgrm_id = ( select prdg_dgrm_id 
                                       from flow_instance_diagrams
                                      where prdg_id = p_prdg_id)
                and objt_tag_name not in ('bpmn:process', 'bpmn:textAnnotation', 'bpmn:participant', 'bpmn:laneSet', 'bpmn:lane')
              union all
             select conn_bpmn_id as bpmn_id
               from flow_connections
              where conn_dgrm_id = ( select prdg_dgrm_id 
                                       from flow_instance_diagrams
                                      where prdg_id = p_prdg_id)
           );
    return apex_string.join( p_table => l_objt_list, p_sep => ':' );
  end get_objt_list;
  
  
  function get_objt_name(
    p_objt_bpmn_id in flow_objects.objt_bpmn_id%type
  , p_dgrm_id      in flow_diagrams.dgrm_id%type
  ) return flow_objects.objt_name%type
  as
    l_objt_name flow_objects.objt_name%type;
  begin
    select name
      into l_objt_name
      from ( select objt_bpmn_id as bpmn_id
                  , objt_name as name
                  , objt_dgrm_id as dgrm_id
               from flow_objects
              union
             select conn_bpmn_id as bpmn_id
                  , conn_name as name
                  , conn_dgrm_id as dgrm_id
               from flow_connections
           )
    where bpmn_id = p_objt_bpmn_id
      and dgrm_id = p_dgrm_id;
    return l_objt_name;
  end get_objt_name;


  function get_objt_name(
    p_objt_bpmn_id in flow_objects.objt_bpmn_id%type
  , p_prcs_id      in flow_processes.prcs_id%type
  ) return flow_objects.objt_name%type
  as
    l_objt_name flow_objects.objt_name%type;
  begin
    select name
      into l_objt_name
      from ( select objt_bpmn_id as bpmn_id
                  , objt_name as name
                  , objt_dgrm_id as dgrm_id
               from flow_objects
              union
             select conn_bpmn_id as bpmn_id
                  , conn_name as name
                  , conn_dgrm_id as dgrm_id
               from flow_connections
           )
    where bpmn_id = p_objt_bpmn_id
      and dgrm_id = (select prcs_dgrm_id
                       from flow_processes
                      where prcs_id = p_prcs_id);
    return l_objt_name;
  end get_objt_name;


  function get_objt_name(
    p_objt_bpmn_id in flow_objects.objt_bpmn_id%type
  , p_prdg_id      in flow_instance_diagrams.prdg_id%type
  ) return flow_objects.objt_name%type
  as
    l_objt_name flow_objects.objt_name%type;
  begin
    select name
      into l_objt_name
      from ( select objt_bpmn_id as bpmn_id
                  , objt_name as name
                  , objt_dgrm_id as dgrm_id
               from flow_objects
              union
             select conn_bpmn_id as bpmn_id
                  , conn_name as name
                  , conn_dgrm_id as dgrm_id
               from flow_connections
           )
    where bpmn_id = p_objt_bpmn_id
      and dgrm_id = (select prdg_dgrm_id
                       from flow_instance_diagrams
                      where prdg_id = p_prdg_id);
    return l_objt_name;
  end get_objt_name;


  procedure set_viewport(
    p_display_setting in varchar2)
  as
  begin
    apex_util.set_preference('VIEWPORT', p_display_setting);
  end set_viewport;
    
    
  procedure add_viewport_script(
    p_item in varchar2
  )
  as
    l_script varchar2(4000 byte);
    l_display_setting varchar2(20 byte);
  begin
    -- Initialize
    l_display_setting := coalesce(apex_util.get_preference('VIEWPORT'),'row');
    apex_util.set_session_state(p_item, l_display_setting);
    
    -- Set IDs for the the row divs
    l_script := q'#apex.jQuery("#flow-instances").parent().attr("id","col1");
                 apex.jQuery("#flow-monitor").parent().attr("id","col2");#';
    
    apex_javascript.add_onload_code(
      p_code => l_script,
      p_key  => 'init_viewport');    
    
    l_script := null;
    -- Set view to side-by-side if preference = 'column'
    case l_display_setting 
      when 'column' then    
        l_script := q'#apex.jQuery( "#col1" ).addClass( "col-6" ).removeClass( [ "col-12", "col-end" ] );
                      apex.jQuery( "#col2" ).addClass( "col-6" ).removeClass( [ "col-12", "col-start" ] );
                      apex.jQuery("#col2").appendTo(apex.jQuery("#col1").parent());
                      apex.jQuery("#flow-monitor").show();
                      apex.region( "flow-monitor" ).refresh();#';
      when 'window' then
        l_script := q'#apex.jQuery("#flow-monitor").hide();
                       apex.jQuery( "#col1" ).addClass( [ "col-12", "col-start", "col-end" ] ).removeClass( "col-6" );
                       apex.jQuery( "#col2" ).addClass( [ "col-12", "col-start", "col-end" ] ).removeClass( "col-6" );#';
    else
      null;
    end case;
    
    if l_script is not null then
      apex_javascript.add_onload_code(
        p_code => l_script,
        p_key  => 'viewport');
    end if;
  end add_viewport_script;


  procedure get_url_p13(
    pi_dgrm_id flow_diagrams.dgrm_id%type
  , pi_objt_id varchar2
  , pi_title varchar2
  )
  as
    l_url varchar2(2000);
  begin
    l_url := apex_page.get_url(
      p_application => v('APP_ID'),
      p_page => '13',
      p_session => v('APP_SESSION'),
      p_clear_cache => 'RP',
      p_items => 'P13_DGRM_ID,P13_OBJT_ID,P13_TITLE',
      p_values => pi_dgrm_id || ',' || pi_objt_id || ',' || pi_title
    );
    htp.p(l_url);
  end get_url_p13;


  procedure get_url_p13(
    pi_prcs_id flow_processes.prcs_id%type
  , pi_prdg_id flow_instance_diagrams.prdg_id%type
  , pi_objt_id varchar2
  , pi_title varchar2
  )
  as
    l_url varchar2(2000);
    l_dgrm_id flow_processes.prcs_dgrm_id%type;
  begin
    select prdg_dgrm_id 
      into l_dgrm_id 
      from flow_instance_diagrams
     where prdg_id = pi_prdg_id;
      
    l_url := apex_page.get_url(
      p_application => v('APP_ID'),
      p_page => '13',
      p_session => v('APP_SESSION'),
      p_clear_cache => 'RP',
      p_items => 'P13_DGRM_ID,P13_PRCS_ID,P13_OBJT_ID,P13_TITLE,P13_PRDG_ID',
      p_values => l_dgrm_id || ',' || pi_prcs_id || ',' || pi_objt_id || ',' || pi_title || ',' || pi_prdg_id
    );
    htp.p(l_url);
  end get_url_p13;


  /* page 2 */
  

  function check_flow_exists(
    p_dgrm_name    in flow_diagrams.dgrm_name%type,
    p_dgrm_version in flow_diagrams.dgrm_version%type)
  return boolean
  as
    l_exists binary_integer;
  begin
  
    select count(*)
      into l_exists
      from dual
     where exists(
           select null
             from flow_diagrams
            where dgrm_name = p_dgrm_name
              and dgrm_version = p_dgrm_version);
    return l_exists = 1;
  end check_flow_exists;
  

  function validate_flow_exists_bulk(
    pi_dgrm_id_list in varchar2
  , pi_new_version  in flow_diagrams.dgrm_version%type
  ) return varchar2 
  as
    l_err varchar2(4000 byte);
    l_flows apex_t_varchar2;
    l_dgrm_name flow_diagrams.dgrm_name%type;
  begin
    -- Initialize
    l_flows := apex_string.split(pi_dgrm_id_list, ':');
    
    for i in 1 .. l_flows.count loop
  
      select dgrm_name 
        into l_dgrm_name
        from flow_diagrams
       where dgrm_id = l_flows(i);

      if check_flow_exists(l_dgrm_name, pi_new_version) then
        l_err := apex_lang.message(
                   p_name => 'APP_ERR_MODEL_EXIST',
                   p0 => l_dgrm_name,
                   p1 => pi_new_version);
      end if;
      exit when l_err is not null;
    end loop;
    return l_err;
  end validate_flow_exists_bulk;


  function validate_flow_exists(
    pi_dgrm_id     in flow_diagrams.dgrm_id%type
  , pi_new_version in flow_diagrams.dgrm_version%type 
  ) return varchar2 
  as
    l_err varchar2(4000 byte);
    l_dgrm_name flow_diagrams.dgrm_name%type;
  begin
  
    select dgrm_name
      into l_dgrm_name
      from flow_diagrams
     where dgrm_id = pi_dgrm_id;
    
    if check_flow_exists(l_dgrm_name, pi_new_version) then
      l_err := apex_lang.message(
                 p_name => 'APP_ERR_MODEL_EXIST',
                 p0 => l_dgrm_name,
                 p1 => pi_new_version);
    end if;
    return l_err;
  end validate_flow_exists;
  
  
  function validate_flow_copy_bulk(
    pi_dgrm_id_list in varchar2
  , pi_new_name     in flow_diagrams.dgrm_name%type 
  ) return varchar2 
  as
    l_err varchar2(4000 byte);
    l_flows apex_t_varchar2;
    l_dgrm_name flow_diagrams.dgrm_name%type;
  begin
    -- Initialize
    l_flows := apex_string.split(pi_dgrm_id_list, ':');
    
    for i in 1 .. l_flows.count loop
  
      select dgrm_name|| ' - ' || pi_new_name
        into l_dgrm_name
        from flow_diagrams 
       where dgrm_id = l_flows(i);

      if check_flow_exists(l_dgrm_name, '0') then
        l_err := apex_lang.message(
                   p_name => 'APP_ERR_MODEL_EXIST',
                   p0 => pi_new_name,
                   p1 => '0');
      end if;
      exit when l_err is not null;
    end loop;
    return l_err;
  end validate_flow_copy_bulk;
  
  
  function validate_flow_copy(
    pi_new_name in flow_diagrams.dgrm_name%type 
  ) return varchar2 
  as
    l_err varchar2(4000);
  begin
    if check_flow_exists(pi_new_name, '0') then
      l_err := apex_lang.message(
                 p_name => 'APP_ERR_MODEL_EXIST',
                 p0 => pi_new_name,
                 p1 => '0');
    end if;
    return l_err;
  end validate_flow_copy;
  
  
  procedure copy_selection_to_collection
  as
  begin
    apex_collection.create_or_truncate_collection(p_collection_name => 'C_SELECT' );
    for i in 1 .. apex_application.g_f01.count() loop
      apex_collection.add_member(
         p_collection_name => 'C_SELECT',
         p_n001 => apex_application.g_f01(i));
    end loop;
  end;

  
  procedure add_new_version(
    pi_dgrm_id_list in varchar2
  , pi_new_version  in flow_diagrams.dgrm_version%type 
  )
  as
    r_diagrams flow_diagrams%rowtype;
    l_flows apex_t_varchar2;
    l_dgrm_id flow_diagrams.dgrm_id%type;
  begin
    -- Initialize
    l_flows := apex_string.split(pi_dgrm_id_list, ':');
    
    for i in 1 .. l_flows.count loop
      select * 
        into r_diagrams
        from flow_diagrams
       where dgrm_id = l_flows(i);

      l_dgrm_id := flow_diagram.import_diagram(
        pi_dgrm_name => r_diagrams.dgrm_name,
        pi_dgrm_version => pi_new_version,
        pi_dgrm_category => r_diagrams.dgrm_category,
        pi_dgrm_content => r_diagrams.dgrm_content);
    end loop;
    
  end add_new_version;
  
  
  procedure copy_model(
    pi_dgrm_id_list in varchar2
  , pi_new_name     in flow_diagrams.dgrm_name%type 
  )
  as
    l_flows apex_t_varchar2;
    l_dgrm_id flow_diagrams.dgrm_id%type;
    r_diagrams flow_diagrams%rowtype;
  begin
    -- Initialize
    l_flows := apex_string.split(pi_dgrm_id_list, ':');
    
    for i in 1 .. l_flows.count loop
      select * 
        into r_diagrams
        from flow_diagrams
       where dgrm_id = l_flows(i);

      l_dgrm_id := flow_diagram.import_diagram(
        pi_dgrm_name => case when l_flows.count() > 1 then r_diagrams.dgrm_name || ' - ' end || pi_new_name,
        pi_dgrm_version => '0',
        pi_dgrm_category => r_diagrams.dgrm_category,
        pi_dgrm_content => r_diagrams.dgrm_content);

    end loop;
  end copy_model;

  /* page 3 */
  function check_version_mismatch(
    p_app_id number default apex_application.g_flow_id
  ) return varchar2
  is
    l_app_version       apex_applications.version%type;
    l_datamodel_version flow_configuration.cfig_value%type;
    l_code_version      varchar2(10) := flow_constants_pkg.gc_version;
    l_message           varchar2(4000);
  begin
    select version
    into l_app_version
    from apex_applications
    where application_id = p_app_id;
   
    select cfig_value
    into l_datamodel_version
    from flow_configuration
    where cfig_key = 'version_now_installed';
   
    if (( l_app_version = l_datamodel_version )  and ( l_datamodel_version = l_code_version )) = false then
        l_message := apex_lang.message(
            p_name => 'APP_VERSION_MISMATCH',
            p0     => l_app_version,
            p1     => l_datamodel_version,
            p2     => l_code_version
        );
    end if;

    return l_message;

  end check_version_mismatch;

  function check_apex_upgrade(
    p_app_id number default apex_application.g_flow_id
  ) return varchar2
  is
    l_actual_version pls_integer;
    l_actual_release pls_integer;
    l_stored_version pls_integer := flow_apex_env.version;
    l_stored_release pls_integer := flow_apex_env.release;
    l_message        varchar2(4000);
  begin
    select  
         to_number(substr(version_no, 1, instr(version_no, '.', 1, 1) - 1))
       , to_number(substr(version_no, instr(version_no, '.', 1, 1) + 1, instr(version_no, '.', 1, 1) - 2))
    into l_actual_version, l_actual_release
    from apex_release;

    if (( l_actual_version = l_stored_version ) and ( l_actual_release = l_stored_release )) = false then
        l_message := apex_lang.message(
            p_name => 'APP_APEX_UPGRADE_DETECTED',
            p0     => l_actual_version,
            p1     => l_actual_release,
            p2     => l_stored_version,
            p3     => l_stored_release
        );
    end if;

    return l_message;

  end check_apex_upgrade;


  /* page 4 */


  function get_region_title(
    pi_dgrm_id in flow_diagrams.dgrm_id%type
  )
  return varchar2 
  as
    l_region_title varchar2(128 byte);
  begin
  
    select dgrm_name || ' (Version: ' || dgrm_version || ', Status: ' || dgrm_status || ')' as d
      into l_region_title
      from flow_diagrams
     where dgrm_id = pi_dgrm_id;

    return l_region_title;
  end get_region_title;


  /* page 5 */


  function get_file_name
  (
    p_dgrm_id                  in number
  , p_include_version          in varchar2
  , p_include_status           in varchar2
  , p_include_category         in varchar2
  , p_include_last_change_date in varchar2
  , p_download_as              in varchar2
  ) 
  return varchar2
  is
    l_file_name        varchar2(300 char);
    l_dgrm_name        flow_diagrams.dgrm_name%type;
    l_dgrm_version     flow_diagrams.dgrm_version%type;
    l_dgrm_status      flow_diagrams.dgrm_status%type;
    l_dgrm_category    flow_diagrams.dgrm_category%type;
    l_dgrm_last_update flow_diagrams.dgrm_last_update%type;
  begin
    select dgrm_name
         , dgrm_version
         , dgrm_status
         , dgrm_category
         , dgrm_last_update
      into l_dgrm_name
         , l_dgrm_version
         , l_dgrm_status
         , l_dgrm_category
         , l_dgrm_last_update
      from flow_diagrams
     where dgrm_id = p_dgrm_id
    ;
    
    l_file_name := to_char(sysdate, 'YYYYMMDD-HH24MI') || '_' || l_dgrm_name;
    
    if (p_include_category = 'Y' and l_dgrm_category is not null) then
      l_file_name := l_file_name || '_' || l_dgrm_category;
    end if;
    if (p_include_status = 'Y') then
      l_file_name := l_file_name || '_' || l_dgrm_status;
    end if;
    if (p_include_version = 'Y') then
      l_file_name := l_file_name || '_' || l_dgrm_version;
    end if;
    if (p_include_last_change_date = 'Y') then
      l_file_name := l_file_name || '_' || to_char(l_dgrm_last_update, 'YYYYMMDD-HH24MI');
    end if;
    if (p_download_as = 'SQL') then
      l_file_name := l_file_name || '.sql';
    end if;
    if (p_download_as = 'BPMN') then
      l_file_name := l_file_name || '.bpmn';
    end if;
    return l_file_name;
  end get_file_name;


  function get_sql_script(
      p_dgrm_id in number
  ) 
  return clob
  is
    l_split_content apex_t_varchar2;
    l_sql clob;
    l_buffer varchar2(32767);  
    r_diagrams flow_diagrams%rowtype;
  begin 
    dbms_lob.createtemporary(l_sql,true, DBMS_LOB.CALL);
    select *
    into r_diagrams
    from flow_diagrams
    where dgrm_id = p_dgrm_id;
    l_buffer := 'declare'||utl_tcp.crlf;
    l_buffer := l_buffer||'  l_dgrm_content clob;'||utl_tcp.crlf;
    l_buffer := l_buffer||'begin'||utl_tcp.crlf;
    dbms_lob.writeappend(l_sql, length(l_buffer), l_buffer);
    l_split_content := apex_string.split(p_str => replace(r_diagrams.dgrm_content,  apex_application.CRLF,  apex_application.LF));
    l_buffer := '  l_dgrm_content := apex_string.join_clob('||utl_tcp.crlf;
    l_buffer := l_buffer||'    apex_t_varchar2('||utl_tcp.crlf;
    dbms_lob.writeappend(l_sql, length(l_buffer), l_buffer);
    for i in l_split_content.first..l_split_content.last
    loop
      if (i = l_split_content.first) then
        l_buffer := '      q''['||l_split_content(i)||']'''||utl_tcp.crlf;
      else
        l_buffer := '      ,q''['||l_split_content(i)||']'''||utl_tcp.crlf;
      end if;
      dbms_lob.writeappend(l_sql, length(l_buffer), l_buffer);
    end loop;
    l_buffer := '  ));';
    l_buffer := l_buffer||utl_tcp.crlf;
    l_buffer := l_buffer||'  flow_diagram.upload_and_parse('||utl_tcp.crlf;
    l_buffer := l_buffer||'    pi_dgrm_name => '||dbms_assert.enquote_literal(r_diagrams.dgrm_name)||','||utl_tcp.crlf;
    l_buffer := l_buffer||'    pi_dgrm_version => '||dbms_assert.enquote_literal(r_diagrams.dgrm_version)||','||utl_tcp.crlf;
    l_buffer := l_buffer||'    pi_dgrm_category => '||dbms_assert.enquote_literal(r_diagrams.dgrm_category)||','||utl_tcp.crlf;
    l_buffer := l_buffer||'    pi_dgrm_content => l_dgrm_content'||utl_tcp.crlf||');'||utl_tcp.crlf;
    l_buffer := l_buffer||'end;'||utl_tcp.crlf||'/'||utl_tcp.crlf;
    dbms_lob.writeappend(l_sql, length(l_buffer), l_buffer);
    
    return l_sql;
  end get_sql_script;

  
  function get_bmpn_content(
      p_dgrm_id in number
  ) return clob
  is 
    l_dgrm_content flow_diagrams.dgrm_content%type;
  begin
    select dgrm_content
    into l_dgrm_content
    from flow_diagrams
    where dgrm_id = p_dgrm_id;
    return l_dgrm_content;
  end get_bmpn_content;


  function sanitize_file_name(
    p_file_name in varchar2
  )
  return varchar2
  is
    l_file_name varchar2(300 char);
  begin
    l_file_name := p_file_name;
    l_file_name := replace(l_file_name, '/', '_');
    l_file_name := replace(l_file_name, '\', '_');
    l_file_name := replace(l_file_name, '*', '_');
    l_file_name := replace(l_file_name, ':', '_');
    l_file_name := replace(l_file_name, '?', '_');
    l_file_name := replace(l_file_name, '|', '_');
    l_file_name := replace(l_file_name, '<', '_');
    l_file_name := replace(l_file_name, '>', '_');
    return l_file_name;
  end sanitize_file_name;


  function clob_to_blob(
    p_clob in clob
  )
  return blob
  is
    l_blob         BLOB;
    l_dest_offset  PLS_INTEGER := 1;
    l_src_offset   PLS_INTEGER := 1;
    l_lang_context PLS_INTEGER := DBMS_LOB.default_lang_ctx;
    l_warning      PLS_INTEGER := DBMS_LOB.warn_inconvertible_char;
  begin
    dbms_lob.createtemporary(
      lob_loc => l_blob,
      cache   => TRUE
    );
    dbms_lob.converttoblob(
      dest_lob      => l_blob,
      src_clob      => p_clob,
      amount        => DBMS_LOB.lobmaxsize,
      dest_offset   => l_dest_offset,
      src_offset    => l_src_offset, 
      blob_csid     => DBMS_LOB.default_csid,
      lang_context  => l_lang_context,
      warning       => l_warning
    );
  
    return l_blob;
  end clob_to_blob;

  procedure download_file(
    p_file_name in varchar2,
    p_mime_type in varchar2,
    p_blob_content in blob
  )
  is
    l_length integer;
    l_blob_content blob := p_blob_content;
  begin
    l_length := sys.dbms_lob.getlength(l_blob_content);
    owa_util.mime_header(p_mime_type, false) ;
    htp.p('Content-length: ' || l_length);
    htp.p('Content-Disposition: attachment; filename="'||sanitize_file_name(p_file_name)||'"');
    owa_util.http_header_close;
    wpg_docload.download_file(l_blob_content);
    apex_application.stop_apex_engine;
  end download_file;

  procedure download_file(
      p_dgrm_id     in number,
      p_file_name   in varchar2,
      p_download_as in varchar2,
      p_multi_file  in boolean default false
  )
  is 
    l_clob        clob;
    l_blob        blob;
    l_zip_file    blob;
    l_buffer      varchar2(32767);  
    l_desc_offset pls_integer := 1;
    l_src_offset  pls_integer := 1;
    l_lang        pls_integer := 0;
    l_warning     pls_integer := 0;
    l_mime_type   varchar2(100) := 'application/octet';
    type r_flow   is record (
      dgrm_id       flow_diagrams.dgrm_id%type, 
      dgrm_name     flow_diagrams.dgrm_name%type,
      dgrm_version  flow_diagrams.dgrm_version%type,
      dgrm_status   flow_diagrams.dgrm_status%type,
      dgrm_category flow_diagrams.dgrm_category%type,
      filename      varchar2(300)
    );
    type t_flows  is table of r_flow index by binary_integer;
    l_flows       t_flows;
    l_flow        r_flow;
    l_json_array  json_array_t;
    l_json_object json_object_t;
    l_json_clob   clob;
    l_sql_clob    clob;
    l_file_name   varchar2(300);
  begin
    l_file_name := p_file_name;
    if ( p_download_as = 'BPMN' ) then
      l_json_array := json_array_t('[]');
    end if;
    if ( p_multi_file ) then
      select 
        dgrm_id, 
        dgrm_name,
        dgrm_version,
        dgrm_status,
        dgrm_category,
        dgrm_name||'_'||dgrm_version as filename
      bulk collect into l_flows
      from flow_diagrams 
      where dgrm_id in (
        select n001
        from apex_collections
        where collection_name = 'C_SELECT'
      )
      order by dgrm_name, dgrm_version;
    else
      l_flow.dgrm_id := p_dgrm_id;
      l_flows(1)     := l_flow;
    end if;
    for i in 1..l_flows.count()
    loop
      if (p_download_as = 'BPMN') then
          l_clob := get_bmpn_content(p_dgrm_id => l_flows(i).dgrm_id);
          apex_debug.message(dbms_lob.getlength(l_clob));
      end if;
      if (p_download_as = 'SQL') then
        l_clob := get_sql_script(p_dgrm_id => l_flows(i).dgrm_id);
      end if;
      l_blob := clob_to_blob(l_clob);
      if ( p_multi_file ) then
        apex_zip.add_file (
          p_zipped_blob => l_zip_file,
          p_file_name   => sanitize_file_name(l_flows(i).filename) || '.' || lower(p_download_as),
          p_content     => l_blob
        );
        if ( p_download_as = 'BPMN' ) then
          l_json_object := json_object_t('{}');
          l_json_object.put('dgrm_name' ,  l_flows(i).dgrm_name);
          l_json_object.put('dgrm_version' ,  l_flows(i).dgrm_version);
          l_json_object.put('dgrm_status' ,  l_flows(i).dgrm_status);
          l_json_object.put('dgrm_category' ,  l_flows(i).dgrm_category);
          l_json_object.put('file' ,  sanitize_file_name(l_flows(i).filename) || '.bpmn');
          l_json_array.append(l_json_object);
        elsif ( p_download_as = 'SQL' ) then
          l_sql_clob := l_sql_clob||'@"'||sanitize_file_name(l_flows(i).filename) || '.' || lower(p_download_as)||'";'||utl_tcp.crlf;
        end if;
      end if;
    end loop;
    if ( p_multi_file ) then
      if ( p_download_as = 'BPMN' ) then
        l_json_clob := treat(l_json_array as json_element_t).to_clob(); 
        l_blob := clob_to_blob(l_json_clob);
        apex_zip.add_file (
          p_zipped_blob => l_zip_file,
          p_file_name   => 'import.json',
          p_content     => l_blob
        );
      elsif ( p_download_as = 'SQL' ) then
        l_sql_clob := 'set define off;' || utl_tcp.crlf || l_sql_clob || utl_tcp.crlf;
        l_blob := clob_to_blob(l_sql_clob);
        apex_zip.add_file (
          p_zipped_blob => l_zip_file,
          p_file_name   => 'import.sql',
          p_content     => l_blob
        );
      end if;
      apex_zip.finish (
        p_zipped_blob => l_zip_file 
      );
      l_blob := l_zip_file;
      l_mime_type := 'application/zip';
      l_file_name := 'F4A_'||to_char(systimestamp, 'YYYYMMDD_HH24MISS')||'.zip';
    end if;

    download_file(
      p_file_name    => l_file_name,
      p_mime_type    => l_mime_type,
      p_blob_content => l_blob
    );
  end download_file;


  /* page 6 */


  function is_file_uploaded(
        pi_file_name in varchar2
    )
    return boolean
    is
        l_dgrm_content flow_diagrams.dgrm_content%type;
        l_err boolean := true;
    begin
        begin
            select to_clob(blob_content)
            into l_dgrm_content
            from apex_application_temp_files
            where name = pi_file_name;
        exception when no_data_found then
            l_err := false;
        end;
 
        return l_err;
    end is_file_uploaded;
    
    
    function is_valid_xml(
        pi_import_from  in varchar2,
        pi_dgrm_content in flow_diagrams.dgrm_content%type,
        pi_file_name    in varchar2
    )
    return boolean
    is
        l_dgrm_content flow_diagrams.dgrm_content%type;
        l_xmltype xmltype;
        l_err boolean := true;
    begin
        if (pi_import_from = 'text') then
            l_dgrm_content := pi_dgrm_content;
        else
            select to_clob(blob_content)
            into l_dgrm_content
            from apex_application_temp_files
            where name = pi_file_name;
        end if;
        begin
            l_xmltype := xmltype.createXML(l_dgrm_content);
        exception when others then
            l_err := false;
        end;
        return l_err;
    end is_valid_xml;
    
    
    function is_valid_multi_file_archive(
        pi_file_name in varchar2
    )
    return varchar2
    is
        l_mime_type    apex_application_temp_files.mime_type%type;
        l_blob_content apex_application_temp_files.blob_content%type;
        l_error        varchar2(4000);
        l_files        apex_zip.t_files;
        l_found_json   boolean := false;
    begin
        select mime_type, blob_content
        into l_mime_type, l_blob_content
        from apex_application_temp_files
        where name = pi_file_name;
        if ( l_mime_type != 'application/zip') then
            l_error := 'You should provide a valid Flows for APEX zip export file.';
        else
            l_files := apex_zip.get_files(
                p_zipped_blob => l_blob_content
            );
            for i in 1..l_files.count loop
                apex_debug.message(l_files(i));
                if ( l_files(i) = 'import.json' ) then
                    l_found_json := true;
                end if;
                exit when l_found_json;
            end loop;
            if ( l_found_json = false ) then
                l_error := 'Missing import.json file in the zip export file.';
            end if;
        end if;
        return l_error;
    end is_valid_multi_file_archive;
    
    
    function upload_and_parse(
        pi_import_from     in varchar2,
        pi_dgrm_name       in flow_diagrams.dgrm_name%type,
        pi_dgrm_category   in flow_diagrams.dgrm_category%type,
        pi_dgrm_version    in flow_diagrams.dgrm_version%type,
        pi_dgrm_content    in flow_diagrams.dgrm_content%type,
        pi_file_name       in varchar2,
        pi_force_overwrite in varchar2
    ) return flow_diagrams.dgrm_id%type
    is
        l_dgrm_id flow_diagrams.dgrm_id%type;
        l_dgrm_content flow_diagrams.dgrm_content%type;
        l_dgrm_exists number;
    begin
        if (pi_import_from = 'text') then
            l_dgrm_content := pi_dgrm_content;
        else
            select to_clob(blob_content)
            into l_dgrm_content
            from apex_application_temp_files
            where name = pi_file_name;
        end if;
            
        l_dgrm_id := flow_diagram.import_diagram(
            pi_dgrm_name => pi_dgrm_name,
            pi_dgrm_version => pi_dgrm_version,
            pi_dgrm_category => pi_dgrm_category,
            pi_dgrm_content => l_dgrm_content,
            pi_force_overwrite => pi_force_overwrite);
        return l_dgrm_id;
    exception
      when flow_diagram.diagram_exists then
        apex_error.add_error(
            p_message => apex_lang.message('APP_ERR_MODEL_EXIST', pi_dgrm_name, pi_dgrm_version)
            , p_display_location => apex_error.c_on_error_page);
      when flow_diagram.diagram_not_draft then
        apex_error.add_error(
            p_message => apex_lang.message('APP_ERR_ONLY_DRAFT')
            , p_display_location => apex_error.c_on_error_page);
    end upload_and_parse;
    
    
    procedure multiple_flow_import(
        pi_file_name       in varchar2,
        pi_force_overwrite in varchar2
    )
    as
        l_dgrm_id       flow_diagrams.dgrm_id%type;
        l_dgrm_name     flow_diagrams.dgrm_name%type;
        l_dgrm_category flow_diagrams.dgrm_category%type;
        l_dgrm_version  flow_diagrams.dgrm_version%type;
        l_dgrm_content  flow_diagrams.dgrm_content%type;
        l_file          varchar2(300);
        l_json_array    json_array_t;
        l_json_object   json_object_t;
        l_blob_content  blob;
        l_json_file     blob;
        l_bpmn_file     blob;
        l_clob          clob;
    begin
        select blob_content
        into l_blob_content
        from apex_application_temp_files
        where name = pi_file_name;
        l_json_file := apex_zip.get_file_content(
            p_zipped_blob => l_blob_content,
            p_file_name   => 'import.json'
        );
        l_json_array := json_array_t.parse(l_json_file);
        for i in 0..l_json_array.get_size() - 1 loop
            l_json_object := treat(l_json_array.get(i) as json_object_t);
            l_dgrm_name     := l_json_object.get_String('dgrm_name');
            l_dgrm_version  := l_json_object.get_String('dgrm_version');
            l_dgrm_category := l_json_object.get_String('dgrm_category');
            l_dgrm_name     := l_json_object.get_String('dgrm_name');
            l_file          := l_json_object.get_String('file');   
            l_bpmn_file := apex_zip.get_file_content(
                p_zipped_blob => l_blob_content,
                p_file_name   => l_file
            );
            select to_clob(l_bpmn_file)
            into l_clob
            from dual;
            
            l_dgrm_id := upload_and_parse(
                  pi_import_from => 'text'
                , pi_dgrm_name => l_dgrm_name
                , pi_dgrm_category => l_dgrm_category
                , pi_dgrm_version => l_dgrm_version
                , pi_dgrm_content => l_clob
                , pi_file_name => null
                , pi_force_overwrite => pi_force_overwrite
            );
        end loop;
    end multiple_flow_import;


  /* page 7 */
  

  function validate_new_version(
    pi_dgrm_name    in flow_diagrams.dgrm_name%type
  , pi_dgrm_version in flow_diagrams.dgrm_version%type
  ) return varchar2
  as
    l_err varchar2(4000);
  begin
    
    if (pi_dgrm_version is null) then
        l_err := apex_lang.message(p_name => 'APEX.PAGE_ITEM_IS_REQUIRED'); --'#LABEL# must have a value';
    elsif check_flow_exists(pi_dgrm_name, pi_dgrm_version) then
        l_err := apex_lang.message(p_name => 'APP_ERR_MODEL_VERSION_EXIST');
    end if;
    return l_err;
  end validate_new_version;
  

  procedure process_page_p7(
    pio_dgrm_id      in out nocopy flow_diagrams.dgrm_id%type,
    pi_dgrm_name     in flow_diagrams.dgrm_name%type,
    pi_dgrm_version  in flow_diagrams.dgrm_version%type,
    pi_dgrm_category in flow_diagrams.dgrm_category%type,
    pi_new_version   in flow_diagrams.dgrm_version%type,
    pi_cascade       in varchar2,
    pi_request       in varchar2)
  as
  begin
    case pi_request
      when 'CREATE' then
        pio_dgrm_id := flow_diagram.create_diagram(
                         pi_dgrm_name => pi_dgrm_name,
                         pi_dgrm_category => pi_dgrm_category,
                         pi_dgrm_version => pi_dgrm_version);
      when 'SAVE' then
        flow_diagram.edit_diagram(
          pi_dgrm_id => pio_dgrm_id,
          pi_dgrm_name => pi_dgrm_name,
          pi_dgrm_category => pi_dgrm_category,
          pi_dgrm_version => pi_dgrm_version);
      when 'DELETE' then
        flow_diagram.delete_diagram(
          pi_dgrm_id => pio_dgrm_id,
          pi_cascade => pi_cascade);
      when 'ADD_VERSION' then
        pio_dgrm_id := flow_diagram.add_diagram_version(
          pi_dgrm_id => pio_dgrm_id,
          pi_dgrm_version => pi_new_version);
      when 'RELEASE' then
        flow_diagram.release_diagram(
          pi_dgrm_id => pio_dgrm_id);
      when 'DEPRECATE' then
        flow_diagram.deprecate_diagram(
          pi_dgrm_id => pio_dgrm_id);
      when 'ARCHIVE' then
        flow_diagram.archive_diagram(
          pi_dgrm_id => pio_dgrm_id);
      else
        raise_application_error(-20002, 'Unknown operation requested.');
    end case;
    exception
      when flow_diagram.diagram_exists then
        apex_error.add_error(
            p_message => apex_lang.message('APP_ERR_MODEL_EXIST', pi_dgrm_name, pi_dgrm_version)
            , p_display_location => apex_error.c_on_error_page);
  end process_page_p7;
  
  
  function get_page_title(
    pi_dgrm_id      in flow_diagrams.dgrm_id%type
  , pi_dgrm_name    in flow_diagrams.dgrm_name%type
  , pi_dgrm_version in flow_diagrams.dgrm_version%type
  ) return varchar2
  as
    l_page_title varchar2(128 byte);
  begin
    case 
    when pi_dgrm_id is null then 
      l_page_title := apex_lang.message(
                        p_name => 'APP_TITLE_NEW_MODEL'
                      );
    else 
      l_page_title := apex_lang.message(
                        p_name => 'APP_TITLE_MODEL',
                        p0 => pi_dgrm_name,
                        p1 => pi_dgrm_version
                      );
    end case;
    return l_page_title;
  end get_page_title;

  function get_current_diagram
    ( pi_dgrm_name              in flow_diagrams.dgrm_name%type
    , pi_dgrm_calling_method    in flow_types_pkg.t_bpmn_attribute_vc2
    , pi_dgrm_version           in flow_diagrams.dgrm_version%type
    )
  return flow_diagrams.dgrm_id%type
    -- gets the current dgrm_id to be used for a diagram name.
    -- returns the current 'released' diagram or a 'draft' of version '0' 
  is
    l_dgrm_id     flow_diagrams.dgrm_id%type;
  begin
    case pi_dgrm_calling_method 
    when flow_constants_pkg.gc_dgrm_version_latest_version then
      begin 
        -- look for the 'released' version of the diagram
        select dgrm_id 
          into l_dgrm_id
          from flow_diagrams
         where dgrm_name = pi_dgrm_name
           and dgrm_status = flow_constants_pkg.gc_dgrm_status_released
        ;
        return l_dgrm_id;
      exception
        when no_data_found then
          -- look for the version 0 (default) of 'draft' of the diagram
          begin
            select dgrm_id
              into l_dgrm_id
              from flow_diagrams
             where dgrm_name = pi_dgrm_name
               and dgrm_status = flow_constants_pkg.gc_dgrm_status_draft
               and dgrm_version = '0'
            ;
            return l_dgrm_id;
          exception
            when no_data_found then
              null;
          end;  
      end;

    when flow_constants_pkg.gc_dgrm_version_named_version then
      -- dgrm_version was specified
      begin
        select dgrm_id
          into l_dgrm_id
          from flow_diagrams
         where dgrm_name = pi_dgrm_name
           and dgrm_version = pi_dgrm_version
        ;
      exception
        when no_data_found then
          null;
      end;
    end case;
    return l_dgrm_id;
  end get_current_diagram;


  /* page 8 */


  function check_is_date(
    pi_value       in varchar2,
    pi_format_mask in varchar2)
  return varchar2 
  as
    l_dummy_date date;
  begin 
    l_dummy_date := to_date(pi_value, pi_format_mask);
    return flow_constants_pkg.gc_true;
  exception
    when others then  
      return flow_constants_pkg.gc_false;
  end check_is_date;

  function check_is_tstz(
    pi_value       in varchar2,
    pi_format_mask in varchar2)
  return varchar2
  as
    l_dummy_tstz timestamp with time zone;
  begin 
    l_dummy_tstz := to_timestamp_tz(pi_value, pi_format_mask);
    return flow_constants_pkg.gc_true;
  exception
    when others then  
      return flow_constants_pkg.gc_false;
  end check_is_tstz;

  function check_is_number(
    pi_value in varchar2)
  return varchar2 
  as
    l_dummy_number number;
  begin 
    l_dummy_number := to_number(pi_value);
    return flow_constants_pkg.gc_true;
  exception
    when others then  
      return flow_constants_pkg.gc_false;
  end check_is_number;
  
  
  procedure pass_variable
  as
    l_prov_prcs_id  flow_process_variables.prov_prcs_id%type;
    l_prov_var_name flow_process_variables.prov_var_name%type;
    l_prov_var_type flow_process_variables.prov_var_type%type;
    l_prov_scope    flow_process_variables.prov_scope%type;
    l_prov_var_vc2  flow_process_variables.prov_var_vc2%type;
    l_prov_var_num  flow_process_variables.prov_var_num%type;
    l_prov_var_date flow_process_variables.prov_var_date%type;
    l_prov_var_tstz flow_process_variables.prov_var_tstz%type;
    l_prov_var_clob flow_process_variables.prov_var_clob%type;
  begin
    -- Initialize
    l_prov_prcs_id  := apex_application.g_x01;
    l_prov_var_name := apex_application.g_x02;
    l_prov_var_type := apex_application.g_x03;
    l_prov_scope    := apex_application.g_x04;
    
    case l_prov_var_type
      when 'VARCHAR2' then
        l_prov_var_vc2 := flow_process_vars.get_var_vc2(
                            pi_prcs_id  => l_prov_prcs_id,
                            pi_var_name => l_prov_var_name,
                            pi_scope    => l_prov_scope);
      when 'NUMBER' then
        l_prov_var_num := flow_process_vars.get_var_num(
                            pi_prcs_id  => l_prov_prcs_id,
                            pi_var_name => l_prov_var_name,
                            pi_scope    => l_prov_scope);
      when 'DATE' then
        l_prov_var_date := flow_process_vars.get_var_date(
                             pi_prcs_id  => l_prov_prcs_id,
                             pi_var_name => l_prov_var_name,
                             pi_scope    => l_prov_scope);
      when 'TIMESTAMP WITH TIME ZONE' then
        l_prov_var_tstz := flow_process_vars.get_var_tstz(
                             pi_prcs_id  => l_prov_prcs_id,
                             pi_var_name => l_prov_var_name,
                             pi_scope    => l_prov_scope);
      when 'CLOB' then
          l_prov_var_clob := flow_process_vars.get_var_clob(
                               pi_prcs_id  => l_prov_prcs_id,
                               pi_var_name => l_prov_var_name,
                               pi_scope    => l_prov_scope);
    end case;
    
    apex_json.open_object;
    apex_json.write( p_name => 'success', p_value => not apex_error.have_errors_occurred );
    apex_json.write( p_name => 'vc2_value', p_value => l_prov_var_vc2);
    apex_json.write( p_name => 'num_value', p_value => to_char(l_prov_var_num));
    apex_json.write( p_name => 'date_value', p_value => to_char(l_prov_var_date, v('APP_DATE_TIME_FORMAT')));
    apex_json.write( p_name => 'tstz_value', p_value => to_char(l_prov_var_tstz, flow_constants_pkg.gc_prov_default_tstz_format));
    apex_json.write( p_name => 'clob_value', p_value => l_prov_var_clob);
    apex_json.close_all;
    
  end pass_variable;
    
  
  function get_connection_select_option(
    pi_gateway in flow_objects.objt_bpmn_id%type
  , pi_prdg_id in flow_instance_diagrams.prdg_id%type
  ) return varchar2
  as
    l_select_option flow_instance_gateways_lov.select_option%type;
  begin
    select select_option
      into l_select_option
      from flow_instance_gateways_lov
     where objt_bpmn_id = pi_gateway
       and prdg_id = pi_prdg_id;
    return l_select_option;
  end get_connection_select_option;

   function get_scope(
      pi_gateway in flow_objects.objt_bpmn_id%type
    , pi_prdg_id in flow_instance_diagrams.prdg_id%type
  ) return number
  as 
    l_prdg_diagram_level flow_instance_gateways_lov.prdg_diagram_level%type;
  begin
    select prdg_diagram_level
      into l_prdg_diagram_level
      from flow_instance_gateways_lov
     where objt_bpmn_id = pi_gateway
       and prdg_id = pi_prdg_id;
    return l_prdg_diagram_level;
    
  end get_scope;

  procedure download_instance_summary(
    pi_prcs_id in flow_processes.prcs_id%type
  )
  is
    l_summary   clob;
    l_file_name varchar2(300 char);
    l_blob      blob;
  begin
    select prcs_id ||'_'|| prcs_name || '_' || to_char(current_date, 'YYYYDDMM_HH24MISS')
      into l_file_name
      from flow_instances_vw
     where prcs_id = pi_prcs_id;

    l_file_name := sanitize_file_name(l_file_name)||'.json';

    l_summary := flow_admin_api.instance_summary(p_process_id => pi_prcs_id);
    l_blob := clob_to_blob(l_summary);
    download_file(
      p_file_name    => l_file_name,
      p_mime_type    => 'application/json',
      p_blob_content => l_blob
    );
  end download_instance_summary;

  /* page 11 */


  function create_instance(
    pi_dgrm_id      in flow_diagrams.dgrm_id%type
  , pi_prcs_name    in flow_processes.prcs_name%type
  , pi_business_ref in flow_process_variables.prov_var_vc2%type
  ) return flow_processes.prcs_id%type
  as
    l_prcs_id flow_processes.prcs_id%type;
  begin
    l_prcs_id := flow_api_pkg.flow_create( 
                   pi_dgrm_id   => pi_dgrm_id,
                   pi_prcs_name => pi_prcs_name);
    
    if pi_business_ref is not null then
      flow_process_vars.set_var( 
        pi_prcs_id   => l_prcs_id,
        pi_var_name  => 'BUSINESS_REF',
        pi_vc2_value => pi_business_ref,
        pi_scope => 0);
    end if;
    return l_prcs_id; 
  end create_instance;


  /* page 12 */
  
  
  function get_prcs_name(
    pi_prcs_id in flow_processes.prcs_id%type
  ) return flow_processes.prcs_name%type
  as
    l_prcs_name flow_processes.prcs_name%type;
  begin
    select prcs_name 
      into l_prcs_name
      from flow_instances_vw 
     where prcs_id = pi_prcs_id;
    return l_prcs_name;
  end get_prcs_name;
  

  /* page 13 */


  function has_error(
    pi_prcs_id in flow_processes.prcs_id%type,
    pi_objt_id in flow_subflows.sbfl_current%type)
  return boolean 
  as
    l_has_error binary_integer;
  begin
    select count(*)
      into l_has_error
      from flow_subflows_vw
     where sbfl_prcs_id = pi_prcs_id 
       and sbfl_current = pi_objt_id
       and sbfl_status = 'error'
       and exists (
           select null
             from FLOW_P0013_INSTANCE_LOG_VW
            where lgpr_prcs_id = pi_prcs_id 
              and lgpr_objt_id = pi_objt_id);
              
    return l_has_error = 1;
  end has_error;


  /* configuration */


  procedure set_logging_settings(
    pi_logging_language          in flow_configuration.cfig_value%type
  , pi_logging_level             in flow_configuration.cfig_value%type
  , pi_logging_hide_userid       in flow_configuration.cfig_value%type
  , pi_logging_retain_logs       in flow_configuration.cfig_value%type
  , pi_logging_message_flow_recd in flow_configuration.cfig_value%type
  , pi_logging_retain_msg_flow   in flow_configuration.cfig_value%type
  )
  as
  begin
      flow_engine_util.set_config_value( p_config_key => flow_constants_pkg.gc_config_logging_language          , p_value => pi_logging_language);
      flow_engine_util.set_config_value( p_config_key => flow_constants_pkg.gc_config_logging_level             , p_value => pi_logging_level);
      flow_engine_util.set_config_value( p_config_key => flow_constants_pkg.gc_config_logging_hide_userid       , p_value => pi_logging_hide_userid);
      flow_engine_util.set_config_value( p_config_key => flow_constants_pkg.gc_config_logging_retain_logs       , p_value => pi_logging_retain_logs);
      flow_engine_util.set_config_value( p_config_key => flow_constants_pkg.gc_config_logging_message_flow_recd , p_value => pi_logging_message_flow_recd);
      flow_engine_util.set_config_value( p_config_key => flow_constants_pkg.gc_config_logging_retain_msg_flow   , p_value => pi_logging_retain_msg_flow);

  end set_logging_settings;


  procedure set_archiving_settings(
    pi_archiving_enabled  in flow_configuration.cfig_value%type
  )
  as
  begin
      flow_engine_util.set_config_value( p_config_key => flow_constants_pkg.gc_config_logging_archive_enabled  , p_value => pi_archiving_enabled);

  end set_archiving_settings;


  procedure set_statictis_settings(
    pi_stats_retain_daily in flow_configuration.cfig_value%type
  , pi_stats_retain_month in flow_configuration.cfig_value%type
  , pi_stats_retain_qtr   in flow_configuration.cfig_value%type
  )
  as
  begin
      flow_engine_util.set_config_value( p_config_key => flow_constants_pkg.gc_config_stats_retain_summary_daily  , p_value => pi_stats_retain_daily);
      flow_engine_util.set_config_value( p_config_key => flow_constants_pkg.gc_config_stats_retain_summary_month , p_value => pi_stats_retain_month);
      flow_engine_util.set_config_value( p_config_key => flow_constants_pkg.gc_config_stats_retain_summary_qtr , p_value => pi_stats_retain_qtr);

  end set_statictis_settings;


  procedure set_engine_app_settings(
    pi_engine_app_mode in flow_configuration.cfig_value%type
  )
  as
  begin
      flow_engine_util.set_config_value( p_config_key => flow_constants_pkg.gc_config_engine_app_mode , p_value => pi_engine_app_mode);

  end set_engine_app_settings;


  procedure set_engine_settings(
    pi_duplicate_step_prevention in flow_configuration.cfig_value%type
  , pi_default_workspace         in flow_configuration.cfig_value%type
  , pi_default_email_sender      in flow_configuration.cfig_value%type
  , pi_default_application       in flow_configuration.cfig_value%type
  , pi_default_pageid            in flow_configuration.cfig_value%type
  , pi_default_username          in flow_configuration.cfig_value%type
  )
  as
  begin
      flow_engine_util.set_config_value( p_config_key => flow_constants_pkg.gc_config_dup_step_prevention  , p_value => pi_duplicate_step_prevention);
      flow_engine_util.set_config_value( p_config_key => flow_constants_pkg.gc_config_default_workspace    , p_value => pi_default_workspace);
      flow_engine_util.set_config_value( p_config_key => flow_constants_pkg.gc_config_default_email_sender , p_value => pi_default_email_sender);
      flow_engine_util.set_config_value( p_config_key => flow_constants_pkg.gc_config_default_application  , p_value => pi_default_application);
      flow_engine_util.set_config_value( p_config_key => flow_constants_pkg.gc_config_default_pageid       , p_value => pi_default_pageid);
      flow_engine_util.set_config_value( p_config_key => flow_constants_pkg.gc_config_default_username     , p_value => pi_default_username);

  end set_engine_settings;


  procedure set_timers_settings(
    pi_timer_max_cycles      in flow_configuration.cfig_value%type
  , pi_timer_status          in sys.all_scheduler_jobs.enabled%type
  , pi_timer_repeat_interval in sys.all_scheduler_jobs.repeat_interval%type
  )
  as
  begin
      flow_engine_util.set_config_value( p_config_key => flow_constants_pkg.gc_config_timer_max_cycles , p_value => pi_timer_max_cycles);

      case pi_timer_status
      when 'TRUE'  then flow_timers_pkg.enable_scheduled_job;
      when 'FALSE' then flow_timers_pkg.disable_scheduled_job;
      end case;

      flow_timers_pkg.set_timer_repeat_interval( p_repeat_interval => pi_timer_repeat_interval);

  end set_timers_settings;


end flow_engine_app_api;
/
