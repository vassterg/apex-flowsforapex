create or replace package body flow_viewer
as

    function render
  (
    p_region              in  apex_plugin.t_region
  , p_plugin              in  apex_plugin.t_plugin
  , p_is_printer_friendly in  boolean
  )
    return apex_plugin.t_region_render_result
  as
    l_return apex_plugin.t_region_render_result;
  begin

    apex_plugin_util.debug_region
    (
      p_plugin => p_plugin
    , p_region => p_region
    );
    sys.htp.p( '<div id="' || p_region.static_id || '_viewer" class="flows4apex-viewer ' || v('THEME_PLUGIN_CLASS') || '">' );
    sys.htp.p( '<div id="' || p_region.static_id || '_canvas" class="canvas" style="display: none;"></div>' );
    sys.htp.p( '<span id="' || p_region.static_id || '_ndf" class="nodatafound" style="display: none;">' || coalesce(p_region.no_data_found_message, 'No data found.') || '</span>' );
    sys.htp.p( '</div>' );
    apex_javascript.add_onload_code
    (
      p_code => 'apex.jQuery("#' || p_region.static_id || '").viewer({' ||
                  apex_javascript.add_attribute
                  (
                    p_name      => 'ajaxIdentifier'
                  , p_value     => apex_plugin.get_ajax_identifier
                  , p_add_comma => true
                  ) ||
                  apex_javascript.add_attribute
                  (
                    p_name      => 'itemsToSubmit'
                  , p_value     => apex_plugin_util.page_item_names_to_jquery( p_page_item_names => p_region.ajax_items_to_submit )
                  , p_add_comma => true
                  ) ||
                  apex_javascript.add_attribute
                  (
                    p_name      => 'noDataFoundMessage'
                  , p_value     => p_region.no_data_found_message
                  , p_add_comma => true
                  ) ||
                  apex_javascript.add_attribute
                  (
                    p_name      => 'refreshOnLoad'
                  , p_value     => ( p_region.attribute_08 = 'Y' )
                  , p_add_comma => true
                  ) ||
                  apex_javascript.add_attribute
                  (
                    p_name      => 'showToolbar'
                  , p_value     => ( p_region.attribute_11 = 'Y' )
                  , p_add_comma => true
                  ) ||
                  apex_javascript.add_attribute
                  (
                    p_name      => 'addHighlighting'
                  , p_value     => ( p_region.attribute_09 = 'Y' )
                  , p_add_comma => true
                  ) ||    
                  apex_javascript.add_attribute
                  (
                    p_name      => 'enableCallActivities'
                  , p_value     => ( p_region.attribute_14 = 'Y' )
                  , p_add_comma => true
                  ) ||  
                  apex_javascript.add_attribute
                  (
                    p_name      => 'enableMousewheelZoom'
                  , p_value     => ( p_region.attribute_15 = 'Y' )
                  , p_add_comma => true
                  ) ||
                  '"config":' || p_region.init_javascript_code || '({})' ||
                '})'
    );

    return l_return;
  end render;

  function ajax
  (
    p_region              in  apex_plugin.t_region
  , p_plugin              in  apex_plugin.t_plugin
  )
    return apex_plugin.t_region_ajax_result
  as

    l_context                  apex_exec.t_context;
    l_diagram_col_idx          pls_integer;
    l_current_col_idx          pls_integer;
    l_completed_col_idx        pls_integer;
    l_error_col_idx            pls_integer;
    l_dgrm_id_col_idx          pls_integer;
    l_calling_dgrm_col_idx     pls_integer;
    l_calling_objt_col_idx     pls_integer;
    l_breadcrumb_col_idx       pls_integer;
    l_sub_prcs_insight_col_idx pls_integer;

    l_current_nodes   apex_t_varchar2;
    l_completed_nodes apex_t_varchar2;
    l_error_nodes     apex_t_varchar2;

    l_return apex_plugin.t_region_ajax_result;
  begin
    apex_plugin_util.debug_region
    (
      p_plugin => p_plugin
    , p_region => p_region
    );

    l_context :=
      apex_exec.open_query_context
      (
        p_total_row_count => true
      );

    l_diagram_col_idx :=
      apex_exec.get_column_position
      (
        p_context     => l_context
      , p_column_name => p_region.attribute_01
      , p_is_required => true
      , p_data_type   => apex_exec.c_data_type_clob
      );

    l_current_col_idx :=
      apex_exec.get_column_position
      (
        p_context     => l_context
      , p_column_name => p_region.attribute_02
      , p_is_required => false
      , p_data_type   => apex_exec.c_data_type_varchar2
      );

    l_completed_col_idx :=
      apex_exec.get_column_position
      (
        p_context     => l_context
      , p_column_name => p_region.attribute_04
      , p_is_required => false
      , p_data_type   => apex_exec.c_data_type_varchar2
      );

    l_error_col_idx :=
      apex_exec.get_column_position
      (
        p_context     => l_context
      , p_column_name => p_region.attribute_06
      , p_is_required => false
      , p_data_type   => apex_exec.c_data_type_varchar2
      );

    l_dgrm_id_col_idx :=
      apex_exec.get_column_position
      (
        p_context     => l_context
      , p_column_name => p_region.attribute_03
      , p_is_required => false
      , p_data_type   => apex_exec.c_data_type_number
      );

    l_calling_dgrm_col_idx :=
      apex_exec.get_column_position
      (
        p_context     => l_context
      , p_column_name => p_region.attribute_05 
      , p_is_required => false
      , p_data_type   => apex_exec.c_data_type_number
      );

    l_calling_objt_col_idx :=
      apex_exec.get_column_position
      (
        p_context     => l_context
      , p_column_name => p_region.attribute_07 
      , p_is_required => false
      , p_data_type   => apex_exec.c_data_type_varchar2
      );
    l_breadcrumb_col_idx :=
      apex_exec.get_column_position
      (
        p_context     => l_context
      , p_column_name => p_region.attribute_12 
      , p_is_required => false
      , p_data_type   => apex_exec.c_data_type_varchar2
      );
    l_sub_prcs_insight_col_idx :=
      apex_exec.get_column_position
      (
        p_context     => l_context
      , p_column_name => p_region.attribute_13
      , p_is_required => false
      , p_data_type   => apex_exec.c_data_type_number
      );

    apex_json.open_object;

    if apex_exec.get_total_row_count( p_context => l_context ) > 0 then

      -- multiple rows found but call activity option disabled
      if apex_exec.get_total_row_count( p_context => l_context ) > 1 and p_region.attribute_14 = 'N' then

        apex_json.write
        (
          p_name  => 'found'
        , p_value => false
        );

        apex_json.write
        (
          p_name  => 'message'
        , p_value => flow_api_pkg.message( p_message_key => 'plugin-multiple-rows', p_lang => apex_util.get_session_lang() )
        );

      else

        apex_json.write
        (
          p_name  => 'found'
        , p_value => true
        );

        apex_json.open_array
        (
          p_name => 'data'
        );

        while apex_exec.next_row( p_context => l_context ) loop
          apex_json.open_object;

          apex_json.write
          (
            p_name  => 'diagram'
          , p_value => apex_exec.get_clob( p_context => l_context, p_column_idx => l_diagram_col_idx )
          );

          if l_dgrm_id_col_idx is not null then
              apex_json.write
              (
                p_name  => 'diagramIdentifier'
              , p_value => apex_exec.get_number( p_context => l_context, p_column_idx => l_dgrm_id_col_idx )
              );
          end if;

          if l_calling_dgrm_col_idx is not null then
              apex_json.write
              (
                p_name  => 'callingDiagramIdentifier'
              , p_value => apex_exec.get_number( p_context => l_context, p_column_idx => l_calling_dgrm_col_idx )
              );
          end if;

          if l_calling_objt_col_idx is not null then
              apex_json.write
              (
                p_name  => 'callingObjectId'
              , p_value => apex_exec.get_varchar2( p_context => l_context, p_column_idx => l_calling_objt_col_idx )
              );
          end if;

          if l_breadcrumb_col_idx is not null then
              apex_json.write
              (
                p_name  => 'breadcrumb'
              , p_value => apex_exec.get_varchar2( p_context => l_context, p_column_idx => l_breadcrumb_col_idx )
              );
          end if;

          if l_sub_prcs_insight_col_idx is not null then
              apex_json.write
              (
                p_name  => 'insight'
              , p_value => apex_exec.get_number( p_context => l_context, p_column_idx => l_sub_prcs_insight_col_idx )
              );
          end if;

          apex_json.open_array
          (
            p_name => 'current'
          );

          if l_current_col_idx is not null then
            l_current_nodes :=
              apex_string.split
              (
                p_str => apex_exec.get_varchar2( p_context => l_context, p_column_idx => l_current_col_idx )
              , p_sep => ':'
              );

            for i in 1..l_current_nodes.count loop
              apex_json.write( p_value => l_current_nodes(i) );
            end loop;
          end if;

          apex_json.close_array;

          apex_json.open_array
          (
            p_name => 'completed'
          );

          if l_completed_col_idx is not null then
            l_completed_nodes :=
              apex_string.split
              (
                p_str => apex_exec.get_varchar2( p_context => l_context, p_column_idx => l_completed_col_idx )
              , p_sep => ':'
              );

            for i in 1..l_completed_nodes.count loop
              apex_json.write( p_value => l_completed_nodes(i) );
            end loop;
          end if;

          apex_json.close_array;

          apex_json.open_array
          (
            p_name => 'error'
          );

          if l_error_col_idx is not null then
            l_error_nodes :=
              apex_string.split
              (
                p_str => apex_exec.get_varchar2( p_context => l_context, p_column_idx => l_error_col_idx )
              , p_sep => ':'
              );

            for i in 1..l_error_nodes.count loop
              apex_json.write( p_value => l_error_nodes(i) );
            end loop;
          end if;

          apex_json.close_array;

          apex_json.close_object;
        end loop;

        apex_exec.close( p_context => l_context );

        apex_json.close_array;

      end if;

    else
      apex_json.write
      (
        p_name  => 'found'
      , p_value => false
      );

    end if;

    apex_json.close_object;
    return l_return;
  end ajax;

end flow_viewer;
/
