prompt --application/shared_components/logic/application_processes/reset_theme_mode
begin
--   Manifest
--     APPLICATION PROCESS: RESET_THEME_MODE
--   Manifest End
wwv_flow_api.component_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>2400405578329584
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'FLOWS4APEX'
);
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(6213103405434761)
,p_process_sequence=>1
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'RESET_THEME_MODE'
,p_process_sql_clob=>'flow_theme_api.reset_theme_mode(:REQUEST);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>':request in (''RESET_DARK'', ''RESET_LIGHT'')'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
);
wwv_flow_api.component_end;
end;
/
