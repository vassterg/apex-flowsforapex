/* 
-- Flows for APEX - flow_startable_diagrams_vw.sql
-- 
-- (c) Copyright Oracle Corporation and / or its affiliates, 2023.
--
-- Created    05-Apr-2023  Richard Allen (Oracle)
-- Edited     05-Jun-2023  Louis Moreaux, Insum
--
-- This view shows any process diagrams that are marked as startable, along with users and groups that can start them
-- and excluded uses who cannot start them (takes precedence over positive grants in potentialStartingGroups).
--
--  -- Note this View can only be queried inside an APEX session
--
*/
create or replace view flow_startable_diagrams_vw
as 
select dgrm.dgrm_id
     , dgrm.dgrm_name
     , dgrm.dgrm_version
     , dgrm.dgrm_status
     , objt.objt_name process_name
     , objt.objt_bpmn_id process_bpmn_id
     , coalesce(objt.objt_attributes."apex"."potentialStartingUsers", flow_settings.get_vc2_expression(pi_expr=> objt.objt_attributes."apex"."potentialStartingUsers"),null) potential_starting_users
     , coalesce(objt.objt_attributes."apex"."potentialStartingGroups", flow_settings.get_vc2_expression(pi_expr=> objt.objt_attributes."apex"."potentialStartingGroups"),null) potential_starting_groups
     , coalesce(objt.objt_attributes."apex"."excludedStartingUsers", flow_settings.get_vc2_expression(pi_expr=> objt.objt_attributes."apex"."excludedStartingUsers"),null) excluded_starting_users
  from flow_diagrams dgrm
  join flow_objects objt
    on dgrm.dgrm_id = objt.objt_dgrm_id
   and objt.objt_attributes."apex"."isStartable" = 'true'
  with read only;

