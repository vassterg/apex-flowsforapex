create or replace package flow_message_flow as
/* 
-- Flows for APEX - flow_message_flow.pks
-- 
-- (c) Copyright Oracle Corporation and / or its affiliates, 2023.
--
-- Created  04-Mar-2034  Richard Allen (Oracle Corporation)
--
*/

  type t_subscription_details is record
  ( message_name  flow_message_subscriptions.msub_message_name%type
  , key_name      flow_message_subscriptions.msub_key_name%type
  , key_value     flow_message_subscriptions.msub_key_value%type
  , prcs_id       flow_message_subscriptions.msub_prcs_id%type
  , sbfl_id       flow_message_subscriptions.msub_sbfl_id%type
  , step_key      flow_message_subscriptions.msub_step_key%type
  , callback      flow_message_subscriptions.msub_callback%type
  , payload_var   flow_message_subscriptions.msub_payload_var%type
  );   

  type t_flow_simple_message is record
  ( endpoint      flow_types_pkg.t_vc200
  , message_name  flow_message_subscriptions.msub_message_name%type
  , key_name      flow_message_subscriptions.msub_key_name%type
  , key_value     flow_message_subscriptions.msub_key_value%type
  , payload       clob 
  );  

  e_msgflow_msg_not_correlated exception;
  e_msgflow_correlated_msg_locked exception;
  e_msgflow_mag_already_consumed exception;

  function subscribe
  ( p_subscription_details     in t_subscription_details
  ) return flow_message_subscriptions.msub_id%type;

  procedure receive_message
  ( p_message_name  flow_message_subscriptions.msub_message_name%type
  , p_key_name      flow_message_subscriptions.msub_key_name%type
  , p_key_value     flow_message_subscriptions.msub_key_value%type
  , p_payload       clob default null
  );

  procedure send_message
  ( p_sbfl_info     in flow_subflows%rowtype
  , p_step_info     in flow_types_pkg.flow_step_info
  );

end flow_message_flow;
/
