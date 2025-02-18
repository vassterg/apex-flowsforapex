prompt --application/pages/page_00014
begin
--   Manifest
--     PAGE: 00014
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
 p_id=>14
,p_user_interface_id=>wwv_flow_api.id(12495499263265880052)
,p_name=>'Logs'
,p_alias=>'LOGS'
,p_page_mode=>'MODAL'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_IMAGES#lib/prismjs/js/prism.js'
,p_javascript_code_onload=>'apex.util.getTopApex().jQuery(".f4a-dynamic-title .ui-dialog-content").dialog("option", "title", $v("P14_TITLE"));'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Make active tab in Instance Events bold */',
'.is-active .t-Tabs-link {',
'    font-weight: 700;',
'}'))
,p_page_template_options=>'#DEFAULT#:t-Dialog--noPadding'
,p_dialog_width=>'70%'
,p_dialog_css_classes=>'f4a-dynamic-title'
,p_last_updated_by=>'FLOWS4APEX'
,p_last_upd_yyyymmddhh24miss=>'20211126143202'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16968778051177917)
,p_plug_name=>'Tabs Holder'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(12495575615770880223)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(2447308339538228)
,p_plug_name=>'Completed Steps'
,p_parent_plug_id=>wwv_flow_api.id(16968778051177917)
,p_region_template_options=>'#DEFAULT#:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(12495584334308880235)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'FLOW_P0014_STEP_LOG_VW'
,p_query_where=>'lgsf_prcs_id = :P14_PRCS_ID'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P14_PRCS_ID'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Completed Steps'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(5155579215389246)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No completed steps found.'
,p_max_rows_per_page=>'10'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_owner=>'DAMTHOR'
,p_internal_uid=>5155579215389246
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5155663147389247)
,p_db_column_name=>'LGSF_PRCS_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Lgsf Prcs Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5155719517389248)
,p_db_column_name=>'COMPLETED_OBJECT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Step'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5155819906389249)
,p_db_column_name=>'LGSF_SBFL_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Subflow'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5155989994389250)
,p_db_column_name=>'LGSF_SBFL_PROCESS_LEVEL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Process Level'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5518828206437201)
,p_db_column_name=>'LGSF_LAST_COMPLETED'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Last Completed'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5518927623437202)
,p_db_column_name=>'LGSF_STATUS_WHEN_COMPLETE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Status When Complete'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5519010082437203)
,p_db_column_name=>'LGSF_WAS_CURRENT'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Became Current'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5519121253437204)
,p_db_column_name=>'LGSF_STARTED'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Work Started'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5519206569437205)
,p_db_column_name=>'LGSF_COMPLETED'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Completed'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5519340927437206)
,p_db_column_name=>'LGSF_RESERVATION'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Reservation'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5519468528437207)
,p_db_column_name=>'LGSF_USER'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5519571677437208)
,p_db_column_name=>'LGSF_COMMENT'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Comment'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5545078108437780)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'55451'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LGSF_SBFL_ID:LGSF_SBFL_PROCESS_LEVEL:COMPLETED_OBJECT:LGSF_WAS_CURRENT:LGSF_STARTED:LGSF_COMPLETED:LGSF_USER:LGSF_COMMENT:'
,p_sort_column_1=>'LGSF_COMPLETED'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(7332140854307003)
,p_plug_name=>'Variable History'
,p_parent_plug_id=>wwv_flow_api.id(16968778051177917)
,p_region_template_options=>'#DEFAULT#:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(12495584334308880235)
,p_plug_display_sequence=>40
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'FLOW_P0014_VARIABLE_LOG_VW'
,p_query_where=>'lgvr_prcs_id = :P14_PRCS_ID'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P14_PRCS_ID'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Variable History'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(7332204855307004)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'The variable history is empty.'
,p_max_rows_per_page=>'10'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_owner=>'DAMTHOR'
,p_internal_uid=>7332204855307004
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7333560161307017)
,p_db_column_name=>'LGVR_PRCS_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Lgvr Prcs Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7333692011307018)
,p_db_column_name=>'LGVR_SBFL_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Subflow'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7333781214307019)
,p_db_column_name=>'LGVR_OBJT_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Step'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7333803701307020)
,p_db_column_name=>'LGVR_VAR_NAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7333938342307021)
,p_db_column_name=>'LGVR_EXPR_SET'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Execution'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7334095231307022)
,p_db_column_name=>'LGVR_TIMESTAMP'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Timestamp'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7334155877307023)
,p_db_column_name=>'LGVR_VAR_TYPE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Data Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(7334292029307024)
,p_db_column_name=>'LGVR_VALUE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Value'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(7637495741285560)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'76375'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'LGVR_SBFL_ID:LGVR_OBJT_ID:LGVR_EXPR_SET:LGVR_VAR_NAME:LGVR_VAR_TYPE:LGVR_VALUE:LGVR_TIMESTAMP:'
,p_sort_column_1=>'LGVR_TIMESTAMP'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(16453181626752830)
,p_plug_name=>'Current Steps'
,p_parent_plug_id=>wwv_flow_api.id(16968778051177917)
,p_region_template_options=>'#DEFAULT#:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(12495584334308880235)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'FLOW_P0014_SUBFLOWS_VW'
,p_query_where=>'sbfl_prcs_id = :P14_PRCS_ID'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P14_PRCS_ID'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Current Steps'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(5154410837389235)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No current steps found.'
,p_max_rows_per_page=>'10'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_owner=>'DAMTHOR'
,p_internal_uid=>5154410837389235
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5154592436389236)
,p_db_column_name=>'SBFL_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Subflow'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5154601391389237)
,p_db_column_name=>'SBFL_PRCS_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Sbfl Prcs Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5154732961389238)
,p_db_column_name=>'SBFL_PROCESS_LEVEL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Process Level'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5154803602389239)
,p_db_column_name=>'SBFL_LAST_COMPLETED'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Last Completed'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5154978160389240)
,p_db_column_name=>'CURRENT_OBJECT'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Step'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5155010144389241)
,p_db_column_name=>'SBFL_STATUS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5155119332389242)
,p_db_column_name=>'SBFL_BECAME_CURRENT'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Became Current'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5155200599389243)
,p_db_column_name=>'SBFL_WORK_STARTED'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Work Started'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5155393549389244)
,p_db_column_name=>'SBFL_RESERVATION'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Reservation'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5155440068389245)
,p_db_column_name=>'SBFL_LAST_UPDATE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Last Update'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(62704084243232510)
,p_db_column_name=>'SBFL_STEP_KEY'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Step Key'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5544387693437777)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'55444'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'SBFL_ID:SBFL_STEP_KEY:SBFL_PROCESS_LEVEL:CURRENT_OBJECT:SBFL_BECAME_CURRENT:SBFL_WORK_STARTED:SBFL_LAST_UPDATE:'
,p_sort_column_1=>'SBFL_LAST_UPDATE'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(20683667255713697)
,p_plug_name=>'Instance Events'
,p_parent_plug_id=>wwv_flow_api.id(16968778051177917)
,p_region_template_options=>'#DEFAULT#:margin-bottom-none'
,p_plug_template=>wwv_flow_api.id(12495584334308880235)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_query_type=>'TABLE'
,p_query_table=>'FLOW_P0014_INSTANCE_LOG_VW'
,p_query_where=>'lgpr_prcs_id = :P14_PRCS_ID'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P14_PRCS_ID'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Instance Events'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(5153691026389227)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'The instance event history is empty.'
,p_max_rows_per_page=>'10'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:EMAIL:XLSX:PDF:RTF'
,p_owner=>'DAMTHOR'
,p_internal_uid=>5153691026389227
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5153710452389228)
,p_db_column_name=>'LGPR_PRCS_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Lgpr Prcs Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(12632277733220608)
,p_db_column_name=>'LGPR_OBJT_ID'
,p_display_order=>20
,p_column_identifier=>'M'
,p_column_label=>'Object'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5153860078389229)
,p_db_column_name=>'LGPR_PRCS_NAME'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5153901442389230)
,p_db_column_name=>'LGPR_BUSINESS_ID'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Business Reference'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5154065346389231)
,p_db_column_name=>'LGPR_PRCS_EVENT'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Event'
,p_column_html_expression=>'<span class="prcs_event_badge"><i class="status_icon fa #LGPR_PRCS_EVENT_ICON#"></i>#LGPR_PRCS_EVENT#</span>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'instance_event_col'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5154181074389232)
,p_db_column_name=>'LGPR_TIMESTAMP'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Timestamp'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5154237026389233)
,p_db_column_name=>'LGPR_USER'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(5154394973389234)
,p_db_column_name=>'LGPR_COMMENT'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Comment'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6177795465209922)
,p_db_column_name=>'LGPR_ERROR_INFO'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Error Stack'
,p_column_html_expression=>'#PRETAG##LGPR_ERROR_INFO##POSTTAG#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(6176982328209914)
,p_db_column_name=>'LGPR_PRCS_EVENT_ICON'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Lgpr Prcs Event Icon'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8027944385825648)
,p_db_column_name=>'PRETAG'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Pretag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(8028057953825649)
,p_db_column_name=>'POSTTAG'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Posttag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(5543735378437756)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'55438'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'LGPR_USER:LGPR_TIMESTAMP:LGPR_PRCS_EVENT:LGPR_COMMENT::LGPR_PRCS_EVENT_ICON:LGPR_ERROR_INFO:PRETAG:POSTTAG:LGPR_OBJT_ID'
,p_sort_column_1=>'LGPR_TIMESTAMP'
,p_sort_direction_1=>'DESC'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5152076251389211)
,p_name=>'P14_TITLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(16968778051177917)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7129192978323670)
,p_name=>'P14_PRCS_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(16968778051177917)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5520422670437217)
,p_name=>'Instances Report Refreshed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(20683667255713697)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5520525401437218)
,p_event_id=>wwv_flow_api.id(5520422670437217)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("td[headers*=instance_event_col]").each(function() {',
'  var text = $( this ).text();',
'  if ( text == "created" || text == "reset" || text == "restart step") {',
'    $( this ).addClass( "ffa-color--created" );',
'  } else if ( text == "completed" ) {',
'    $( this ).addClass( "ffa-color--completed" );',
'  } else if ( text == "started" || text == "running" ) {',
'    $( this ).addClass( "ffa-color--running" );',
'  } else if ( text == "terminated" ) {',
'    $( this ).addClass( "ffa-color--terminated" );',
'  } else if ( text == "error" ) {',
'    $( this ).addClass( "ffa-color--error" );',
'  }',
'});',
'',
'Prism.highlightAll();'))
);
wwv_flow_api.component_end;
end;
/
