prompt --application/shared_components/user_interface/lovs/flow_instance_diagrams_lov
begin
--   Manifest
--     FLOW_INSTANCE_DIAGRAMS_LOV
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>2400405578329584
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'FLOWS4APEX'
);
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(60714624308437115)
,p_lov_name=>'FLOW_INSTANCE_DIAGRAMS_LOV'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'FLOW_INSTANCE_DIAGRAMS_LOV'
,p_query_where=>'prdg_prcs_id = :P8_PRCS_ID'
,p_return_column_name=>'PRDG_ID'
,p_display_column_name=>'CALLING_DIAGRAM'
,p_group_sort_direction=>'ASC'
,p_default_sort_column_name=>'CALLING_DIAGRAM'
,p_default_sort_direction=>'ASC'
);
wwv_flow_api.component_end;
end;
/
