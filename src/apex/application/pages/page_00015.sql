prompt --application/pages/page_00015
begin
--   Manifest
--     PAGE: 00015
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>2400405578329584
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'FLOWS4APEX'
);
wwv_flow_api.create_page(
 p_id=>15
,p_user_interface_id=>wwv_flow_api.id(12495499263265880052)
,p_name=>'Daily Statistics'
,p_alias=>'DAILY-STATISTICS'
,p_step_title=>'Daily Statistics'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'C##RALLEN'
,p_last_upd_yyyymmddhh24miss=>'20230406091208'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2541571424137177)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(12495573047450880221)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(12495636486941880396)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(12495520300515880126)
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2542117955137179)
,p_plug_name=>'Processes Started On &P15_DATE.'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(12495582446800880234)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select stpr_dgrm_id, dgrm.dgrm_name "flow name", stpr_created created, stpr_started started, stpr_error error, stpr_completed completed, stpr_terminated terminated, stpr_reset reset',
'  from flow_instance_stats stpr',
'  join flow_diagrams dgrm',
'    on dgrm.dgrm_id = stpr.stpr_dgrm_id',
' where stpr_period = ''DAY''',
'   and stpr_period_start  = to_date(:P15_DATE,''YYYY-MM-DD'')',
' order by stpr_started desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P15_DATE'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_jet_chart(
 p_id=>wwv_flow_api.id(2542556204137179)
,p_region_id=>wwv_flow_api.id(2542117955137179)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_title=>'Instances'
,p_legend_position=>'auto'
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(2544212410137182)
,p_chart_id=>wwv_flow_api.id(2542556204137179)
,p_seq=>10
,p_name=>'Created'
,p_max_row_count=>20
,p_location=>'REGION_SOURCE'
,p_items_value_column_name=>'CREATED'
,p_items_label_column_name=>'flow name'
,p_color=>'#D9B13B'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(2142905983493913)
,p_chart_id=>wwv_flow_api.id(2542556204137179)
,p_seq=>20
,p_name=>'Started'
,p_max_row_count=>20
,p_location=>'REGION_SOURCE'
,p_items_value_column_name=>'STARTED'
,p_items_label_column_name=>'flow name'
,p_color=>'#6AAD42'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(2143009590493914)
,p_chart_id=>wwv_flow_api.id(2542556204137179)
,p_seq=>30
,p_name=>'Errors'
,p_max_row_count=>20
,p_location=>'REGION_SOURCE'
,p_items_value_column_name=>'ERROR'
,p_items_label_column_name=>'flow name'
,p_color=>'#D2433B'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(2143160145493915)
,p_chart_id=>wwv_flow_api.id(2542556204137179)
,p_seq=>40
,p_name=>'Completed'
,p_max_row_count=>20
,p_location=>'REGION_SOURCE'
,p_items_value_column_name=>'COMPLETED'
,p_items_label_column_name=>'flow name'
,p_color=>'#8C9EB0'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(2143222807493916)
,p_chart_id=>wwv_flow_api.id(2542556204137179)
,p_seq=>50
,p_name=>'Terminated'
,p_max_row_count=>20
,p_location=>'REGION_SOURCE'
,p_items_value_column_name=>'TERMINATED'
,p_items_label_column_name=>'flow name'
,p_color=>'#D76A27'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_api.create_jet_chart_series(
 p_id=>wwv_flow_api.id(2143393414493917)
,p_chart_id=>wwv_flow_api.id(2542556204137179)
,p_seq=>60
,p_name=>'Reset'
,p_max_row_count=>20
,p_location=>'REGION_SOURCE'
,p_items_value_column_name=>'RESET'
,p_items_label_column_name=>'flow name'
,p_color=>'#C7C7CC'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(2543039883137181)
,p_chart_id=>wwv_flow_api.id(2542556204137179)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>true
,p_zoom_order_weeks=>true
,p_zoom_order_months=>true
,p_zoom_order_quarters=>true
,p_zoom_order_years=>false
);
wwv_flow_api.create_jet_chart_axis(
 p_id=>wwv_flow_api.id(2543649056137182)
,p_chart_id=>wwv_flow_api.id(2542556204137179)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'auto'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>true
,p_zoom_order_weeks=>true
,p_zoom_order_months=>true
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2142839389493912)
,p_name=>'P15_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(2542117955137179)
,p_prompt=>'Date'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(12495522847445880132)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.component_end;
end;
/
