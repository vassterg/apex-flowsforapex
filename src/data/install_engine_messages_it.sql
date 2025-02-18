/*
-- Flows for APEX - engine_messages_it.sql
--
-- Engine Messages for language code "it"
--
-- Generated by language-load-generator
-- Generated on Mon, 26 Jun 2023 15:38:36 GMT
*/

set define '^'
whenever sqlerror exit rollback;

PROMPT >> Loading Engine Messages for Language "it"
declare
  c_load_lang constant varchar2(10) := 'it';
begin
  delete
    from flow_messages
   where fmsg_lang = c_load_lang;

  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'version-no-rel-or-draft-v0', c_load_lang, q'[Impossibile trovare il diagramma rilasciato o la versione bozza 0 del diagramma. Specificare una versione o diagram_id]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'version-not-found', c_load_lang, q'[Impossibile trovare la versione del diagramma specificata. Controllare la specifica della versione.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'timer_definition_error', c_load_lang, q'[Errore durante l'analisi della definizione del timer nel processo %0, flusso secondario %1. Tipo timer: %2, Definizione: %3]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-model-no-version', c_load_lang, q'[Versione non definita.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-parsing-json-variables', c_load_lang, q'[Errore durante l'analisi delle variabili del processo.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-route-not-define', c_load_lang, q'[Gateway non definito per l'instradamento.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-gateway-not-exist', c_load_lang, q'[La definizione del gateway non esiste per questo flusso.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-no-instance-subflow-id', c_load_lang, q'[Impossibile ottenere l'ID istanza flusso e/o l'ID flusso secondario per gestire il passo.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-wrong-variable-number', c_load_lang, q'[Numero di elementi o variabili di processo APEX errato.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-wrong-variable-type', c_load_lang, q'[Una o più variabili di processo sono di tipo diverso da quello definito nel file JSON.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-variable-not-a-number', c_load_lang, q'[%0 non è un numero valido.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-variable-not-a-date', c_load_lang, q'[%0 non è una data valida.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-invalid-json', c_load_lang, q'[Il file JSON fornito non è valido.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-modeler-id-not-found', c_load_lang, q'[Nessun dato trovato. Verificare se esiste un diagramma con l'ID specificato.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-unexpected-error', c_load_lang, q'[Errore imprevisto. Contattare l'amministratore.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-diagram-not-parsable', c_load_lang, q'[Impossibile analizzare il diagramma.<br />Controllare il diagramma per assicurarsi che sia supportato.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-diagram-saved', c_load_lang, q'[Modifiche salvate.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-diagram-has-changed', c_load_lang, q'[Il modello è stato modificato. Ignorare le modifiche?]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'wrong-default-workspace', c_load_lang, q'[Processo %0: ServiceTask %1 non riuscito: l'area di lavoro predefinita definita nel parametro di configurazione non è valida.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'workspace-not-found', c_load_lang, q'[Processo %0: ServiceTask %1 non riuscito: impossibile trovare l'area di lavoro associata all'ID applicazione definito nel diagramma. Controllare il modello.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'email-no-from', c_load_lang, q'[Processo %0: ServiceTask %1 non riuscito: attributo "Da" e mittente e-mail predefinito non definiti. Controllare il modello e il parametro di configurazione.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'email-no-to', c_load_lang, q'[Processo %0: ServiceTask %1 non riuscito: attributo "A" non definito. Controllare il modello.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'email-no-template', c_load_lang, q'[Processo %0: ServiceTask %1 non riuscito: attributo "Template" non definito. Controllare il modello.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'email-no-body', c_load_lang, q'[Processo %0: ServiceTask %1 non riuscito: attributo "Corpo" non definito. Controllare il modello.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'email-failed', c_load_lang, q'[Processo %0: ServiceTask %1 non riuscito. Vedere il log degli errori e controllare il modello.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'email-placeholder-json-invalid', c_load_lang, q'[Processo %0: ServiceTask %1 segnaposto JSON non è valido. Controllare il modello.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plugin-multiple-rows', c_load_lang, q'[Trovate più righe. Abilitare l'impostazione 'Abilita attività chiamata' negli attributi del plugin del visualizzatore.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-cancelation-error', c_load_lang, q'[Errore durante il tentativo di annullare il task del workflow APEX (task_id: %1 ) per il passo del processo: %0.)]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-not-supported', c_load_lang, q'[L'uso della funzione di workflow APEX richiede Oracle APEX v%0.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-not-found', c_load_lang, q'[Task del workflow APEX %0 non trovato in Flows for APEX]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-on-multiple-steps', c_load_lang, q'[Trovato task del workflow APEX %0 associato a più di un passo del processo Flows for APEX.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-not-current-step', c_load_lang, q'[Il task del workflow APEX %0 non è il passo corrente del processo. È possibile che il passo sia stato completato tutto pronto.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-invalid-result-var', c_load_lang, q'[Variabile del processo dei risultati del task del workflow APEX non definita o non valida.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-creation-error', c_load_lang, q'[Errore durante la creazione del task del workflow APEX %0 nell'applicazione %1. Per i dettagli, vedere il debug.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-priority-error', c_load_lang, q'[Errore durante la creazione del task del workflow APEX - priorità non valida %0.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-multiple-processes', c_load_lang, q'[Errore durante la creazione della sessione APEX. Il diagramma BPMN contiene più oggetti processo.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'call-diagram-not-callable', c_load_lang, q'[Si è tentato di chiamare un diagramma %0 contrassegnato come non richiamabile.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'diagram-archive-has-instances', c_load_lang, q'[Si è tentato di archiviare un diagramma con istanze in esecuzione.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-task-business-ref-null', c_load_lang, q'[Errore durante la creazione del task di approvazione - Riferimento aziendale/Chiave principale sistema di record non deve essere nullo.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'archive-destination-bad-json', c_load_lang, q'[Errore nel parametro di configurazione della destinazione dell'archivio. Parametro: %0]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'log-archive-error', c_load_lang, q'[Errore durante l'archiviazione del riepilogo dell'istanza di processo %0]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'scheduler-repeat-shared-env', c_load_lang, q'[Intervallo di ripetizione del timer troppo frequente per l'host (%0) Intervallo richiesto %1. Deve essere maggiore di 1 minuto.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'msgflow-not-correlated', c_load_lang, q'[Il messaggio ricevuto non corrisponde a un messaggio previsto.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'msgflow-no-longer-current-step', c_load_lang, q'[Il messaggio di ricezione del passo del processo è già stato eseguito (fornita chiave passo errata).]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'msgflow-lock-timeout-msub', c_load_lang, q'[Sottoscrizione messaggio bloccata da un altro utente. Riprovare.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'msgflow-lock-timeout-subflow', c_load_lang, q'[Il ricevente del messaggio non è in grado di bloccare il flusso secondario. Riprovare.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'logging-diagram-event', c_load_lang, q'[Flussi - Errore interno durante la registrazione di un evento del diagramma.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'due-on-interval-error', c_load_lang, q'[Errore durante la valutazione della scadenza. Espressione dell'intervallo non valida. Intervallo: %0.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'due-on-error', c_load_lang, q'[Errore durante la valutazione della scadenza. L'espressione Scadenza non è valida. Espressione intervallo: %0. Verrà utilizzato l'indicatore di sistema.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'settings-priority-error', c_load_lang, q'[Errore durante la valutazione della priorità. L'espressione della priorità non è valida. Espressione: %0. Viene invece utilizzata la priorità 3.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'settings-error', c_load_lang, q'[Errore durante la valutazione dell'impostazione. Espressione non valida. Espressione: %0.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'settings-procvar-no-prcs', c_load_lang, q'[Le impostazioni non possono specificare una variabile di processo senza un ID processo.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'msgflow-endpoint-not-supported', c_load_lang, q'[MessageFlow L'endpoint specificato ( %0 ) non è supportato.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var-bad-scope', c_load_lang, q'[Ambito (%0) non valido fornito per la variabile di processo.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var-get-error', c_load_lang, q'[Errore durante il recupero della variabile di processo %0 per l'ID processo %1 nell'ambito %2.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'ITE-unsupported-type', c_load_lang, q'[Tipo di evento riga intermedio attualmente non supportato rilevato in %0 .]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'apex-session-params-not-set', c_load_lang, q'[I dettagli di connessione asincrona per l'oggetto %0 devono essere impostati nelle variabili di processo, nei dettagli di connessione asincrona del diagramma o nei dettagli di configurazione del sistema.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'async-invalid_params', c_load_lang, q'[Impossibile creare una connessione asincrona per l'oggetto %0. Nome utente non valido nell'applicazione specificata]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'async-no-username', c_load_lang, q'[Impossibile creare una connessione asincrona per l'oggetto %0. È necessario specificare il nome utente nella variabile di processo, nel diagramma del processo o nella configurazione del sistema.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'async-no-appid', c_load_lang, q'[Impossibile creare una connessione asincrona per l'oggetto %0. È necessario specificare l'ID applicazione nella variabile di processo, nel diagramma del processo o nella configurazione del sistema.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'async-no-pageid', c_load_lang, q'[Impossibile creare una connessione asincrona per l'oggetto %0. È necessario specificare l'ID pagina nella variabile di processo, nel diagramma del processo o nella configurazione del sistema.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'boundary-event-child-lock-to', c_load_lang, q'[Flussi secondari limiti figlio o timer di %0 attualmente bloccati da un altro utente. Riprovare la transazione più tardi.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'boundary-event-no-catch-found', c_load_lang, q'[Nessun boundaryEvent di tipo %0 trovato per rilevare l'evento.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'boundary-event-too-many', c_load_lang, q'[Trovati più %0 boundaryEvent nel processo secondario.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'eng_handle_event_int', c_load_lang, q'[Errore interno motore flusso: processo %0 flusso secondario %1 modulo %2 corrente tag %4 corrente %3]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'engine-unsupported-object', c_load_lang, q'[Errore di modello: il passo successivo del modello BPMN del processo utilizza l'oggetto non supportato %0]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'engine-util-prcs-not-found', c_load_lang, q'[Errore dell'applicazione: ID processo %0 non trovato.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'engine-util-sbfl-not-in-prcs', c_load_lang, q'[Errore dell'applicazione: l'ID flusso secondario fornito ( %0 ) esiste ma non è figlio dell'ID processo fornito ( %1 ).]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'engine-util-sbfl-not-found', c_load_lang, q'[ID flusso secondario fornito ( %0 ) non trovato. Controllare gli eventi di processo che hanno modificato il flusso del processo (timeout, errori, escalation).]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'gateway-invalid-route', c_load_lang, q'[Errore nel gateway %0. La variabile %1 fornita contiene un percorso non valido: %2]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'gateway-merge-error', c_load_lang, q'[Errore interno durante l'elaborazione del gateway di unione nel flusso secondario %0]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'gateway-no-route', c_load_lang, q'[Nessuna istruzione di instradamento gateway fornita nella variabile %0 e il modello non contiene un instradamento predefinito.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'gateway-bad-expression', c_load_lang, q'[Espressione di instradamento del gateway non valida. Ciò può verificarsi se si tenta di associare una variabile con due punti (:).]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'process-lock-timeout', c_load_lang, q'[Elabora gli oggetti per %0 attualmente bloccati da un altro utente. Riprovare più tardi.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'more_than_1_forward_path', c_load_lang, q'[Trovati più di 1 percorso di inoltro quando ne sono consentiti solo 1.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'no_next_step_found', c_load_lang, q'[Nessun passo successivo trovato nel flusso secondario %0. Controllare il diagramma del processo.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plsql_script_failed', c_load_lang, q'[Processo %0: task %1 non riuscito a causa di un errore PL/SQL. Vedere il log eventi.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'plsql_script_requested_stop', c_load_lang, q'[Processo %0: il task %1 ha richiesto l'arresto dell'elaborazione - Vedere il log eventi.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'timeout_locking_subflow', c_load_lang, q'[Impossibile bloccare il flusso secondario %0 in quanto attualmente bloccato da un altro utente. Riprovare più tardi.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'reservation-already-placed', c_load_lang, q'[Prenotazione già effettuata per il task successivo.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'reservation-by-other_user', c_load_lang, q'[Prenotazione per %0 non riuscita. Passo già riservato da un altro utente (%1).]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'reservation-failed-not-found', c_load_lang, q'[Prenotazione per %2 non riuscita. Flusso secondario %0 nel processo %1 non trovato.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'reservation-incorrect-step-key', c_load_lang, q'[Il task non è più corrente, probabilmente già completato. Aggiornare la posta in arrivo.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'reservation-lock-timeout', c_load_lang, q'[Flusso secondario attualmente bloccato (non riservato) da un altro utente. Prova la tua prenotazione in seguito.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'reservation-release-not-found', c_load_lang, q'[Rilascio prenotazione non riuscito. Flusso secondario %0 nel processo %1 non trovato.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'restart-no-error', c_load_lang, q'[Nessun errore corrente trovato. Controllare il diagramma del processo.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'start-already-running', c_load_lang, q'[Si è tentato di avviare un processo (ID %0) già in esecuzione.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'logging-variable-event', c_load_lang, q'[Flussi - Errore interno durante la registrazione di un evento variabile]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'start-multiple-already-running', c_load_lang, q'[Si è tentato di avviare un processo (ID %0) con più copie già in esecuzione.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'start-multiple-start-events', c_load_lang, q'[Sono stati definiti più eventi di avvio. Assicurarsi che il diagramma contenga un solo evento iniziale.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'start-no-start-event', c_load_lang, q'[Nessun evento iniziale definito nel diagramma di flusso.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'start-not-created', c_load_lang, q'[Si è tentato di avviare un processo (ID %0) che non esiste.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'start-type-unsupported', c_load_lang, q'[Tipo di evento iniziale non supportato (%0). Attualmente sono supportati solo gli eventi di avvio Nessuno (standard) e gli eventi di inizio timer.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'startwork-sbfl-not-found', c_load_lang, q'[Inizio Registrazione tempo di lavoro non riuscita.  Flusso secondario %0 nel processo %1 non trovato.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'step-key-incorrect', c_load_lang, q'[Questo passo del processo è già stato eseguito. (È stata fornita una chiave passo %0 errata mentre era prevista la chiave passo %1).]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'subProcess-no-start', c_load_lang, q'[Impossibile trovare l'evento di inizio del processo secondario.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'subProcess-too-many-starts', c_load_lang, q'[Sono stati trovati più processi secondari.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'timer-broken', c_load_lang, q'[Timer %0 Esecuzione %4 interrotto nel processo %1, flusso secondario: %2. Vedere error_info.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'timer-cycle-unsupported', c_load_lang, q'[Il timer del ciclo definito per l'oggetto %0 non è attualmente supportato.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'timer-incomplete-definition', c_load_lang, q'[Definizioni timer incomplete per l'oggetto %0. Tipo: %1; Value1: %2 Value2: %3  Value3: %4]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'timer-lock-timeout', c_load_lang, q'[Timer per il flusso secondario %0 attualmente bloccato da un altro utente. Riprovare più tardi.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'timer-object-not-found', c_load_lang, q'[Oggetto con timer non trovato in get_timer_definition. Flusso secondario %0.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'timers-lock-timeout', c_load_lang, q'[Timer per il processo %0 attualmente bloccati da un altro utente. Riprovare più tardi.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var-set-error', c_load_lang, q'[Errore durante la creazione della variabile di processo %0 per l'ID processo %1 nell'ambito %2.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var-update-error', c_load_lang, q'[Errore durante l'aggiornamento della variabile di processo %0 per l'ID processo %1 nell'ambito %2.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var-delete-error', c_load_lang, q'[Errore durante l'eliminazione della variabile di processo %0 per l'ID processo %1 nell'ambito %2.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var-lock-error', c_load_lang, q'[Errore durante il blocco della variabile di processo %0 per l'ID processo %1 nell'ambito %2.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var_exp_datatype', c_load_lang, q'[Errore durante l'impostazione della variabile di processo. Tipo di dati errato per la variabile %0. Errore SQL visualizzato nell'output di debug.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var_exp_date_format', c_load_lang, q'[Errore durante l'impostazione della variabile di processo %1: Formato data errato (flusso secondario: %0, set: %3).]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var_exp_object_not_found', c_load_lang, q'[Errore interno durante la ricerca dell'oggetto %0 in process_expressions. Errore SQL visualizzato nell'output di debug.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var_exp_plsql_error', c_load_lang, q'[Flusso secondario: %0 Errore nell'espressione %2 per la variabile: %1]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var_exp_sql_no_data', c_load_lang, q'[Errore durante l'impostazione della variabile di processo %1 nell'ID processo %0 (set %2). Nessun dato trovato nella query.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'start-diagram-calls-itself', c_load_lang, q'[Si è tentato di avviare un processo con un diagramma %0 che include un callActivity che si chiama.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'gateway-too-many-defaults', c_load_lang, q'[Più di un instradamento predefinito nel modello per il gateway %0.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'link-no-catch', c_load_lang, q'[Impossibile trovare l'evento di recupero collegamento corrispondente denominato %0.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'link-too-many-catches', c_load_lang, q'[Più di un evento di recupero collegamento corrispondente denominato %0.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'logging-instance-event', c_load_lang, q'[Flussi - Errore interno durante la registrazione di un evento istanza]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'logging-step-event', c_load_lang, q'[Flussi - Errore interno durante la registrazione di un evento passo]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var_exp_sql_too_many_rows', c_load_lang, q'[Errore durante l'impostazione della variabile di processo %1 nell'ID processo %0 (set %2). La query restituisce più righe.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var_exp_static_general', c_load_lang, q'[Errore durante l'impostazione della variabile di processo %1 nell'ID processo %0 (set %2). Vedere l'errore nel log eventi.]' );
  insert into flow_messages( fmsg_message_key, fmsg_lang, fmsg_message_content )
    values ( 'var_exp_sql_other', c_load_lang, q'[Errore durante l'impostazione della variabile di processo %1 nell'ID processo %0 (set %2). Errore SQL visualizzato nel log eventi.]' );
  
  commit;
end;
/
