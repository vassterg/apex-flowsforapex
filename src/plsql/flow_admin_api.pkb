create or replace package body flow_admin_api as
 /* Flows for APEX - flow_admin_api.pkb
--
-- (c) Copyright Oracle Corporation and / or its affiliates, 2023.
--
-- Created    11-Feb-2023   Richard Allen, Oracle
*/
 /**
FLOWS FOR APEX ADMIN API
=========================

The `flow_admin_api` package gives you access to the Flows for APEX engine admin procedures, and allows you to perform:
-  Maintenance, Archiving and Purging of the Flows for APEX log files
-  Maintenance, Archiving, and Purging of the Flows for APEX performance statistics all_summaries
- Maintenance of Flows for APEX instance configuration parameters

*/
-- Log File Functions
  procedure purge_instance_logs
  ( p_retention_period_days  in number default null
  ) 
  is
  begin
    flow_log_admin.purge_instance_logs 
    ( p_retention_period_days => p_retention_period_days 
    );
  end purge_instance_logs;

  function instance_summary
  ( p_process_id        in flow_processes.prcs_id%type
  ) return clob
  is
  begin
    return flow_log_admin.get_instance_json_summary ( p_process_id => p_process_id);
  end instance_summary;

  procedure archive_completed_instances
  ( p_completed_before         in date default trunc(sysdate)
  )
  is
      l_session_id   number;
    begin  
        if v('APP_SESSION') is null then
          l_session_id := flow_apex_session.create_api_session(p_process_id => null);
        end if;

        flow_log_admin.archive_completed_instances
        ( p_completed_before         => p_completed_before
        );

        if l_session_id is not null then
          flow_apex_session.delete_session (p_session_id => l_session_id );
        end if;
    exception
      when others then
        if l_session_id is not null then
          flow_apex_session.delete_session (p_session_id => l_session_id );
        end if;
        raise;      
  end archive_completed_instances;

-- Performance Summary Functions

  procedure run_daily_stats
  is
  begin
    flow_statistics.run_daily_stats;
  end run_daily_stats;


  procedure purge_statistics
  is
  begin
    flow_statistics.purge_statistics;
  end purge_statistics;

  -- Configuration Parameters

  procedure set_config_value
  ( p_config_key        in flow_configuration.cfig_key%type,
    p_value             in flow_configuration.cfig_value%type,
    p_update_if_set     in boolean default true
  )
  is
  begin
    flow_engine_util.set_config_value
    ( p_config_key      => p_config_key
    , p_value           => p_value
    , p_update_if_set   => p_update_if_set
    );
  end set_config_value;

  function get_config_value
  ( p_config_key        in flow_configuration.cfig_key%type
  , p_default_value     in flow_configuration.cfig_value%type
  ) return flow_configuration.cfig_value%type
  is
  begin
    return flow_engine_util.get_config_value ( p_config_key     => p_config_key 
                                             , p_default_value  => p_default_value
                                             );       
  end get_config_value;

end flow_admin_api;
/
