/*
-- Flows for APEX - engine_messages_ja.sql
--
-- Engine Messages for language code "ja"
--
-- Generated by language-load-generator
-- Generated on Mon, 26 Jun 2023 15:38:36 GMT
*/

set define '^'
whenever sqlerror exit rollback;

PROMPT >> Loading Engine Messages for Language "ja"
declare
  c_load_lang constant varchar2(10) := 'ja';
begin
  delete
    from flow_messages
   where fmsg_lang = c_load_lang;

  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'subProcess-too-many-starts', c_load_lang, q'[複数のサブプロセス・スタートが見つかりました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'timer-broken', c_load_lang, q'[タイマ ー%0　実行%4 がプロセス%1 とサブフロー%2で失敗しました。error_info を参照してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'timer-incomplete-definition', c_load_lang, q'[オブジェクト %0 のタイマー定義が不完全です。タイプ: %1; 値1: %2  値2: %3 値3: %4]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'timer-lock-timeout', c_load_lang, q'[サブフロー %0 のタイマーは現在他のユーザによってロックされています。  後で再試行してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'timer-object-not-found', c_load_lang, q'[オブジェクトのタイマーが get_timer_definition で見つかりませんでした。サブフロー %0。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'timers-lock-timeout', c_load_lang, q'[プロセス %0 のタイマーは現在他のユーザによってロックされています。  後で再試行してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var-set-error', c_load_lang, q'[スコープ%2のプロセスID %1のプロセス変数%0を作成中にエラーが発生しました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var-get-error', c_load_lang, q'[プロセス変数%0の値を取得できません。詳細は、インスタンス・ログを参照してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var-update-error', c_load_lang, q'[スコープ%2のプロセスID %1のプロセス変数%0を更新中にエラーが発生しました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var-delete-error', c_load_lang, q'[スコープ%2のプロセスID %1のプロセス変数%0を削除中にエラーが発生しました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var-lock-error', c_load_lang, q'[スコープ%2のプロセスID %1のプロセス変数%0のロック中にエラーが発生しました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var_exp_datatype', c_load_lang, q'[プロセス変数の設定エラー。  変数 %0 のデータ型が正しくありません。  デバッグ出力に SQL エラーが表示されました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var_exp_date_format', c_load_lang, q'[プロセス変数 %1 の設定エラー : 日付の形式が正しくありません (サブフロー: %0、設定: %3)]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var_exp_object_not_found', c_load_lang, q'[process_expressions のオブジェクト %0 の検索で内部エラーが発生しました。  デバッグ出力に SQL エラーが表示されます。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var_exp_plsql_error', c_load_lang, q'[サブフロー :% 0 変数 : %1の%2においてエラーが発生しました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var_exp_sql_no_data', c_load_lang, q'[プロセスID %0 (セット%2)でプロセス変数%1を設定中にエラーが発生しました。問合せにデータが見つかりません。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var_exp_sql_other', c_load_lang, q'[プロセスID %0 (セット%2)でプロセス変数%1を設定中にエラーが発生しました。イベントログにSQLエラーが表示されました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var_exp_sql_too_many_rows', c_load_lang, q'[プロセスID %0 (セット%2)でプロセス変数%1を設定中にエラーが発生しました。クエリーは複数の行を返します。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var_exp_static_general', c_load_lang, q'[プロセスID %0 (セット%2)でプロセス変数%1を設定中にエラーが発生しました。イベントログのエラーを参照してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'version-no-rel-or-draft-v0', c_load_lang, q'[リリースされたダイアグラムまたはドラフト版0が見つかりません - バージョンまたはdiagram_idを指定してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'version-not-found', c_load_lang, q'[指定されたダイアグラム・バージョンが見つかりません。バージョン指定を確認してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'timer_definition_error', c_load_lang, q'[プロセス %0、サブフロー %1 でタイマー定義の解析にエラーが発生しました。タイマータイプ: %2, 定義: %3]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-model-no-version', c_load_lang, q'[バージョンが定義されていません。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-parsing-json-variables', c_load_lang, q'[プロセス変数のパーシング中にエラーが発生しました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-route-not-define', c_load_lang, q'[ゲートウェイがルーティング用に定義されていません。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-gateway-not-exist', c_load_lang, q'[このフローにはゲートウェイ定義が存在しません。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'timer-cycle-unsupported', c_load_lang, q'[オブジェクト %0 で定義されたサイクル・タイマーは、現在サポートされていません。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-no-instance-subflow-id', c_load_lang, q'[ステップを管理するためのフローインスタンスID、またはサブフローIDを取得できません。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-wrong-variable-number', c_load_lang, q'[APEX項目またはプロセス変数の数が間違っています。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-wrong-variable-type', c_load_lang, q'[1つ以上のプロセス変数が、JSONで定義されたものと異なるタイプです。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-variable-not-a-number', c_load_lang, q'[0 は有効な数値ではありません。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-variable-not-a-date', c_load_lang, q'[0 は有効な日付ではありません。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-invalid-json', c_load_lang, q'[提供されたJSONは無効です。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-modeler-id-not-found', c_load_lang, q'[データが見つかりませんでした。指定されたIDのダイアグラムが存在するかどうかを確認してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-unexpected-error', c_load_lang, q'[例外エラー発生。管理者に連絡してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-diagram-not-parsable', c_load_lang, q'[ダイアグラムをパースすることができませんでした。このダイアグラムがサポートされているか確認してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-diagram-saved', c_load_lang, q'[変更が保存されました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-diagram-has-changed', c_load_lang, q'[モデルが変更になりました。変更してよろしいですか。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'wrong-default-workspace', c_load_lang, q'[プロセス %0: ServiceTask %1 に失敗しました: 構成パラメータで定義された既定のワークスペースが無効です。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'workspace-not-found', c_load_lang, q'[プロセス %0: ServiceTask %1 に失敗しました: ダイアグラムで定義されているアプリケーション ID に関連付けられたワークスペースが見つかりませ ん。モデルを確認してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'email-no-from', c_load_lang, q'[プロセス %0: ServiceTask %1 に失敗しました。: "From" と既定のEメール送信者が設定されていません。 モデルまたは設定パラメータを確認してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'email-no-to', c_load_lang, q'[プロセス %0: サービスタスク %1 に失敗しました。:  "To" が設定されていません。モデルを確認してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'email-no-template', c_load_lang, q'[プロセス %0: サービスタスク%1に失敗しました。: "Template" が設定されていません。モデルを確認してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'email-no-body', c_load_lang, q'[プロセス %0: サービスタスク%1に失敗しました。: "Body" が設定されていません。モデルを確認してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'email-failed', c_load_lang, q'[プロセス %0: サービスタスク%1に失敗しました。エラー・ログを参照して、モデルを確認してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'email-placeholder-json-invalid', c_load_lang, q'[プロセス %0: サービスタスク プレースホルダー JSON が無効です。モデルを確認してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-multiple-rows', c_load_lang, q'[複数の行が見つかりました。ビューア・プラグイン属性で「コール・アクティビティの有効化」に設定してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-cancelation-error', c_load_lang, q'[プロセス・ステップ: %0のAPEXワークフロー・タスク(task_id: %1)を取り消そうとしてエラーが発生しました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-not-supported', c_load_lang, q'[APEXワークフロー機能を使用するには、Oracle APEX v%0が必要です。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-not-found', c_load_lang, q'[Flows for Apexのプロセス中にAPEXワークフロー・タスク%0が見つかりません]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-on-multiple-steps', c_load_lang, q'[複数のFlows for APEXプロセス・ステップに関連するAPEXワークフロー・タスク%0が見つかりました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-not-current-step', c_load_lang, q'[APEXワークフロー・タスク%0はプロセスの現在のステップではありません。ステップが完了している可能性があります。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-creation-error', c_load_lang, q'[アプリケーション%1でAPEXワークフロー・タスク%0を作成中にエラーが発生しました。詳細はデバッグを参照してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-priority-error', c_load_lang, q'[優先順位の評価中にエラーが発生しました。優先度は1から5の間にする必要があります。優先度: %0。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-multiple-processes', c_load_lang, q'[APEXセッションの作成中にエラーが発生しました。BPMNダイアグラムに、複数のプロセス・オブジェクトが含まれています。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'call-diagram-not-callable', c_load_lang, q'[コール不可のダイアグラム%0をコールしようとしました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'boundary-event-no-catch-found', c_load_lang, q'[イベントを捕捉するためのタイプ %0 の boundaryEvent が見つかりませんでした。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'boundary-event-too-many', c_load_lang, q'[サブプロセスで 1 つ以上の %0 boundaryEvent が見つかりました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'eng_handle_event_int', c_load_lang, q'[フロー・エンジン内部エラー：プロセス %0 サブフロー%1 モジュール%2 現行 %4現行タグ %3]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'engine-unsupported-object', c_load_lang, q'[モデル・エラー。プロセス BPMN モデルの次のステップでサポートされていないオブジェクト %0 が使用されています。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'engine-util-prcs-not-found', c_load_lang, q'[アプリケーション・エラー。プロセス ID %0 が見つかりませんでした。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'engine-util-sbfl-not-in-prcs', c_load_lang, q'[アプリケーション・エラー。指定されたサブフロー ID ( %0 ) は存在しますが、指定されたプロセス ID (%1) の子ではありません。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'engine-util-sbfl-not-found', c_load_lang, q'[指定されたサブフロー ID ( %0 ) が見つかりませんでした。プロセス・フローを変更したプロセス・イベント (タイムアウト、エラー、エスカレーション) をチェックしてください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'gateway-invalid-route', c_load_lang, q'[ゲートウェイ %0 でエラーが発生しました。指定された変数に無効なルートが含まれています: %2]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'gateway-merge-error', c_load_lang, q'[サブフロー %0 でマージ・ゲートウェイを処理する際の内部エラー。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'gateway-no-route', c_load_lang, q'[変数 %0 でゲートウェイ・ルーティングが指定されていなく、モデルにはデフォルト・ルートがありません。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'gateway-bad-expression', c_load_lang, q'[不正なゲートウェイ・ルーティングです。これは、埋込みコロン(: )で変数をバインドしようとした場合に発生する可能性があります。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'gateway-too-many-defaults', c_load_lang, q'[ゲートウェイ %0 のモデルで複数の既定ルートが指定されています。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'link-no-catch', c_load_lang, q'[一致するリンク・キャッチ・イベント名 %0 を見つけることができません。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'link-too-many-catches', c_load_lang, q'[一致するリンク・キャッチ・イベント名が %0 のものが複数あります。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'logging-instance-event', c_load_lang, q'[Flows - インスタンスイベントのログ記録時に内部エラーが発生しました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'logging-step-event', c_load_lang, q'[フロー - ステップイベントのログ記録時に内部エラーが発生しました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'ITE-unsupported-type', c_load_lang, q'[現在サポートされていないタイプの中間スローイベントが %0 で発生しました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-session-params-not-set', c_load_lang, q'[オブジェクト%0の非同期接続詳細は、プロセス変数、ダイアグラム非同期接続詳細またはシステム構成詳細で設定する必要があります。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'async-invalid_params', c_load_lang, q'[オブジェクト%0の非同期接続を作成できません。指定されたアプリケーションでユーザー名が無効です]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-invalid-result-var', c_load_lang, q'[APEXワークフロー・タスクの結果プロセス変数が定義されていないか、無効です。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'async-no-pageid', c_load_lang, q'[オブジェクト%0の非同期接続を作成できません。ページIDは、プロセス変数、プロセス・ダイアグラムまたはシステム構成で指定する必要があります。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'boundary-event-child-lock-to', c_load_lang, q'[%0 の子バウンダリ・サブフローまたはタイマーは現在他のユーザによってロックされています。  後でトランザクションを再試行してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'logging-variable-event', c_load_lang, q'[フロー - 変数イベントのログ記録時に内部エラーが発生しました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'process-lock-timeout', c_load_lang, q'[%0 のプロセス・オブジェクトは現在他のユーザによってロックされています。  後で再試行してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'more_than_1_forward_path', c_load_lang, q'[複数のフォワードパスが見つかりました。パスは一つのみ可能です。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'no_next_step_found', c_load_lang, q'[サブフロー %0 で次のステップが見つかりませんでした。  プロセス図を確認してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plsql_script_failed', c_load_lang, q'[プロセス %0: PL/SQL エラーが発生したため、タスク％１に失敗しました。イベント・ログを参照してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plsql_script_requested_stop', c_load_lang, q'[プロセス %0: タスク％１が処理の停止を要求しました - イベント・ログを参照してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'timeout_locking_subflow', c_load_lang, q'[サブフロー %0 は現在他のユーザによってロックされているため、ロックできません。  後で再試行してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'reservation-already-placed', c_load_lang, q'[次のタスクの予約はすでにされています。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'reservation-by-other_user', c_load_lang, q'[％0 の予約に失敗しました。  ステップは既に他のユーザによって予約されています(%1)。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'reservation-failed-not-found', c_load_lang, q'[%2の予約に失敗しました。  プロセス内のサブフロー %0 が見つかりませんでした。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'reservation-incorrect-step-key', c_load_lang, q'[タスクは既に終了している可能性があります。  受信トレイを更新してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'reservation-lock-timeout', c_load_lang, q'[現在、サブフローは他のユーザーによってロックされています（予約されていません）。  後ほど、再試行ください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'reservation-release-not-found', c_load_lang, q'[予約の解除に失敗しました。  プロセス％１内のサブフロー %0 が見つかりませんでした。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'restart-no-error', c_load_lang, q'[エラーが見つかりませんでした。  プロセスダイアグラムを確認してください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'start-already-running', c_load_lang, q'[プロセス (id %0) は既に実行中です。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'start-diagram-calls-itself', c_load_lang, q'[コールアクティビティを含むダイアグラム%0でプロセスを開始しようとしました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'start-multiple-already-running', c_load_lang, q'[プロセス (id %0) において既に複数のコピーが実行中です。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'start-multiple-start-events', c_load_lang, q'[複数の開始イベントが定義されています。ダイアグラムの開始イベントが1つのみとしてください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'start-no-start-event', c_load_lang, q'[フロー図に開始イベントが定義されていません。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'start-not-created', c_load_lang, q'[プロセス (id %0) は存在しないため開始できません。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'async-no-username', c_load_lang, q'[オブジェクト%0の非同期接続を作成できません。ユーザー名は、プロセス変数、プロセス図またはシステム構成で指定する必要があります。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'async-no-appid', c_load_lang, q'[オブジェクト%0の非同期接続を作成できません。アプリケーションIDは、プロセス変数、プロセス・ダイアグラムまたはシステム構成で指定する必要があります。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'step-key-incorrect', c_load_lang, q'[このプロセス・ステップは既に発生しています。  (ステップ・キー %1 の代わりに誤ってステップ・キー %0 が供給されました。）]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'subProcess-no-start', c_load_lang, q'[サブプロセス開始イベントが見つかりません。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'settings-procvar-no-prcs', c_load_lang, q'[設定では、プロセスIDなしでプロセス変数を指定できません。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'diagram-archive-has-instances', c_load_lang, q'[実行中のインスタンスがあるダイアグラムをアーカイブしようとしました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'logging-diagram-event', c_load_lang, q'[フロー- ダイアグラム・イベントのロギング中に内部エラーが発生しました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'log-archive-error', c_load_lang, q'[プロセス・インスタンス%0のインスタンス要約のアーカイブ中にエラーが発生しました]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'msgflow-lock-timeout-subflow', c_load_lang, q'[メッセージ受信者はサブフローをロックできません。再度試してみてください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'settings-error', c_load_lang, q'[設定の評価中にエラーが発生しました。式が無効です。式: %0。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'msgflow-endpoint-not-supported', c_load_lang, q'[MessageFlow指定されたエンドポイント( %0 )はサポートされていません。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'msgflow-lock-timeout-msub', c_load_lang, q'[メッセージ・サブスクリプションは別のユーザーによってロックされています。再度試してみてください。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-business-ref-null', c_load_lang, q'[承認タスクの作成中にエラーが発生しました- ビジネス参照/レコードのシステム主キーはnullにできません。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'due-on-interval-error', c_load_lang, q'[期日の評価中にエラーが発生しました。間隔式が無効です。間隔: %0。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'due-on-error', c_load_lang, q'[期日の評価中にエラーが発生しました。期限の式が無効です。間隔式: %0。かわりにシステム・スタンプが使用されています。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'settings-priority-error', c_load_lang, q'[優先順位の評価中にエラーが発生しました。優先度式が無効です。式: %0。かわりに優先度3が使用されます。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var-bad-scope', c_load_lang, q'[プロセス変数に無効なスコープ(%0)が指定されました。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'scheduler-repeat-shared-env', c_load_lang, q'[ホスト(%0)が要求した間隔%1に対してタイマーの繰返し間隔が頻繁すぎます。1分より長くする必要があります。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'archive-destination-bad-json', c_load_lang, q'[アーカイブ先構成パラメータでエラーが発生しました。パラメータ: %0]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'msgflow-not-correlated', c_load_lang, q'[受信したメッセージが予期されたメッセージと一致しません。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'msgflow-no-longer-current-step', c_load_lang, q'[メッセージを受信するプロセス・ステップがすでに発生しました(不正なステップ・キーが指定されました)。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'start-type-unsupported', c_load_lang, q'[開始イベントタイプ (%0) はサポートされていません。現在サポートされているのは、None (standard) Start Event と Timer Start Event のみです。]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'startwork-sbfl-not-found', c_load_lang, q'[開始作業時間の記録に失敗しました。  プロセス%1 のサブフロー %0 が見つかりませんでした。]' );
  
  commit;
end;
/
