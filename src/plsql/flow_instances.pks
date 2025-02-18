create or replace package flow_instances
/* 
-- Flows for APEX - flow_instances.pks
-- 
-- (c) Copyright Oracle Corporation and / or its affiliates, 2022-2023.
-- (c) Copyright MT AG, 2021-2022.
--
-- Created 25-May-2021  Richard Allen (Flowquest) for  MT AG  - refactor from flow_engine
--
*/
  authid definer
  accessible by (flow_api_pkg, flow_engine, flow_proc_vars_int, flow_diagram)
as

  function create_process
    ( p_dgrm_id   in flow_diagrams.dgrm_id%type
    , p_prcs_name in flow_processes.prcs_name%type
    ) return flow_processes.prcs_id%type
    ;

  procedure start_process
    ( p_process_id    in flow_processes.prcs_id%type
    );

  procedure reset_process
    ( p_process_id  in flow_processes.prcs_id%type
    , p_comment     in flow_instance_event_log.lgpr_comment%type default null
    );

  procedure terminate_process
    ( p_process_id  in flow_processes.prcs_id%type
    , p_comment     in flow_instance_event_log.lgpr_comment%type default null
    );

  procedure delete_process
    (
      p_process_id  in flow_processes.prcs_id%type
    , p_comment     in flow_instance_event_log.lgpr_comment%type default null
    );

  procedure set_priority
    (
      p_process_id  in flow_processes.prcs_id%type
    , p_priority    in flow_processes.prcs_priority%type
    );

  function priority
    ( p_process_id  in flow_processes.prcs_id%type
    ) return flow_processes.prcs_priority%type
    ;

  procedure set_due_on
    (
      p_process_id  in flow_processes.prcs_id%type
    , p_due_on      in flow_processes.prcs_due_on%type
    );

  function due_on
    ( p_process_id  in flow_processes.prcs_id%type
    ) return flow_processes.prcs_due_on%type
    ;

end flow_instances;
/
