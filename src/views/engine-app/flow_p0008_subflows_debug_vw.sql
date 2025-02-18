-- dev version of flow_p0008_subflows_debug_vw exposing all moving parts
-- not installed by default
create or replace view flow_p0008_subflows_debug_vw
as
  select sbfl.sbfl_id
       , sbfl.sbfl_prcs_id
       , sbfl.sbfl_process_name
       , sbfl.sbfl_dgrm_id
       , sbfl.sbfl_sbfl_dgrm_id
       , sbfl.sbfl_dgrm_name
       , sbfl.sbfl_dgrm_version
       , sbfl.sbfl_dgrm_status
       , sbfl.sbfl_dgrm_category
       , sbfl.sbfl_route
       , sbfl.sbfl_route_name
       , sbfl.sbfl_last_completed
       , sbfl.sbfl_last_completed_name
       , sbfl.sbfl_current
       , sbfl.sbfl_current_name 
       , sbfl.sbfl_step_key
       , sbfl.sbfl_current_tag_name
       , sbfl.sbfl_starting_object
       , sbfl.sbfl_starting_object_name 
       , sbfl.sbfl_last_update at time zone sessiontimezone as sbfl_last_update
       , sbfl.sbfl_current_lane
       , sbfl.sbfl_current_lane_name
       , sbfl.sbfl_process_level
       , sbfl.sbfl_status
       , case sbfl.sbfl_status
             when 'running' then 'fa-play-circle-o'
             when 'created' then 'fa-plus-circle-o'
             when 'completed' then 'fa-check-circle-o'
             when 'terminated' then 'fa-stop-circle-o'
             when 'error' then 'fa-exclamation-circle-o'
             when 'split' then 'fa fa-share-alt'
             when 'in subprocess' then 'fa fa-share-alt'
             when 'waiting at gateway' then 'fa fa-hand-stop-o'
             when 'waiting for timer' then 'fa fa-clock-o'
             when 'waiting for event' then 'fa fa-hand-stop-o'
             when 'waiting for approval' then 'fa fa-question-square-o'
         end as sbfl_status_icon
       , sbfl.sbfl_reservation
       , null as actions   
       , apex_item.checkbox2(p_idx => 2, p_value => sbfl.sbfl_id, p_attributes => 'data-status="'|| sbfl.sbfl_status ||'" data-prcs="'|| sbfl.sbfl_prcs_id ||'" data-reservation="'|| sbfl.sbfl_reservation ||'"') as checkbox
        , case 
            when sbfl.sbfl_status = 'error' then 'fa-redo-arrow'
            when sbfl.sbfl_status = 'running' then 'fa-sign-out'
          end as quick_action_icon 
        , case 
            when sbfl.sbfl_status = 'error' then apex_lang.message('APP_RESTART_STEP')
            when sbfl.sbfl_status = 'running' then apex_lang.message('APP_COMPLETE_STEP')
          end as quick_action_label 
        , case 
            when sbfl.sbfl_status = 'error' then 'restart-step'
            when sbfl.sbfl_status = 'running' then 'complete-step'
          end as quick_action 
    from flow_subflows_vw sbfl
with read only
;
