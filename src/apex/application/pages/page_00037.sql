prompt --application/pages/page_00037
begin
--   Manifest
--     PAGE: 00037
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
 p_id=>37
,p_user_interface_id=>wwv_flow_api.id(12495499263265880052)
,p_name=>'Configuration - Statistics'
,p_alias=>'CONFIGURATION-STATISTICS'
,p_step_title=>'Configuration - Statistics'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'span.t-Form-inlineHelp ul li {',
'    font-size: 1.1rem;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'C##DAMTHOR'
,p_last_upd_yyyymmddhh24miss=>'20230420133258'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(8608203121575437)
,p_plug_name=>'Statistics'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(12495582446800880234)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(27538437580351975)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(12495573047450880221)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_api.id(12495636486941880396)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_api.id(12495520300515880126)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3336931358771696)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(27538437580351975)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(12495521691135880126)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-save'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3337626931771697)
,p_button_sequence=>20
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(12495521691135880126)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-save'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3287364553239514)
,p_name=>'P37_STATS_RETAIN_MONTH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(8608203121575437)
,p_prompt=>'Retain Monthly Summaries (Months)'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(12495522847445880132)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_show_quick_picks=>'Y'
,p_quick_pick_label_01=>'1 Year'
,p_quick_pick_value_01=>'12'
,p_quick_pick_label_02=>'9 Months'
,p_quick_pick_value_02=>'9'
,p_quick_pick_label_03=>'6 Months'
,p_quick_pick_value_03=>'6'
,p_quick_pick_label_04=>'3 Months'
,p_quick_pick_value_04=>'3'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3287449524239515)
,p_name=>'P37_STATS_RETAIN_QTR'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(8608203121575437)
,p_prompt=>'Retain Quarterly Summaries (Months)'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(12495522847445880132)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_show_quick_picks=>'Y'
,p_quick_pick_label_01=>'5 Years'
,p_quick_pick_value_01=>'60'
,p_quick_pick_label_02=>'4 Years'
,p_quick_pick_value_02=>'48'
,p_quick_pick_label_03=>'3 Years'
,p_quick_pick_value_03=>'36'
,p_quick_pick_label_04=>'2 Years'
,p_quick_pick_value_04=>'24'
,p_quick_pick_label_05=>'1 Year'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3341734890779729)
,p_name=>'P37_STATS_RETAIN_DAILY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(8608203121575437)
,p_prompt=>'Retain Daily Summaries (Days)'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_api.id(12495522847445880132)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
,p_show_quick_picks=>'Y'
,p_quick_pick_label_01=>'1 Year'
,p_quick_pick_value_01=>'365'
,p_quick_pick_label_02=>'9 Months'
,p_quick_pick_value_02=>'273'
,p_quick_pick_label_03=>'6 Months'
,p_quick_pick_value_03=>'182'
,p_quick_pick_label_04=>'3 Months'
,p_quick_pick_value_04=>'90'
,p_quick_pick_label_05=>'30 Days'
,p_quick_pick_value_05=>'30'
,p_quick_pick_label_06=>'14 Days'
,p_quick_pick_value_06=>'14'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(3287570384239516)
,p_computation_sequence=>10
,p_computation_item=>'P37_STATS_RETAIN_DAILY'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return flow_engine_util.get_config_value(',
'           p_config_key => flow_constants_pkg.gc_config_stats_retain_summary_daily',
'         , p_default_value => flow_constants_pkg.gc_config_default_stats_retain_summary_daily',
'       );'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(3287640183239517)
,p_computation_sequence=>20
,p_computation_item=>'P37_STATS_RETAIN_MONTH'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return flow_engine_util.get_config_value(',
'           p_config_key => flow_constants_pkg.gc_config_stats_retain_summary_month',
'         , p_default_value => flow_constants_pkg.gc_config_default_stats_retain_summary_month',
'       );'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(3287793538239518)
,p_computation_sequence=>30
,p_computation_item=>'P37_STATS_RETAIN_QTR'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'return flow_engine_util.get_config_value(',
'           p_config_key => flow_constants_pkg.gc_config_stats_retain_summary_qtr',
'         , p_default_value => flow_constants_pkg.gc_config_default_stats_retain_summary_qtr',
'       );'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3339267970771698)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Settings'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'flow_engine_app_api.set_timers_settings(',
'  pi_timer_max_cycles      => :P37_TIMER_MAX_CYCLES',
', pi_timer_status          => :P37_TIMER_STATUS',
', pi_timer_repeat_interval => :P37_TIMER_REPEAT_INTERVAL',
');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(3337626931771697)
,p_process_success_message=>'Changes saved.'
);
wwv_flow_api.component_end;
end;
/
