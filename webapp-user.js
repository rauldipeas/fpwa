/* Aceleração por GPU */
user_pref('gfx.webrender.all', true);
user_pref('media.ffmpeg.vaapi.enabled', true);
user_pref('media.hardware-video-decoding.force-enabled', true);

/* Atividade da nova aba */
user_pref('browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons', false);
user_pref('browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features', false);
user_pref('browser.newtabpage.activity-stream.feeds.snippets', false);
user_pref('browser.newtabpage.activity-stream.showSponsoredTopSites', false);

/* Atualizações automáticas */
user_pref('app.update.auto', true);

/* Cantos arredondados */
user_pref('layers.acceleration.force-enabled', true);
user_pref('mozilla.widget.use-argb-visuals', true);

/* Coleta de dados */
user_pref('app.shield.optoutstudies.enabled', false);
user_pref('browser.crashReports.unsubmittedCheck.autoSubmit2', false);
user_pref('browser.discovery.enabled', false);
user_pref('datareporting.policy.dataSubmissionEnabled', false);
user_pref('datareporting.healthreport.service.enabled', false);
user_pref('datareporting.healthreport.uploadEnabled', false);
user_pref('toolkit.telemetry.archive.enabled', false);
user_pref('toolkit.telemetry.enabled', false);
user_pref('toolkit.telemetry.prompted', 2);
user_pref('toolkit.telemetry.server', '');
user_pref('toolkit.telemetry.unified', false);
user_pref('toolkit.telemetry.unifiedIsOptIn', false);

/* CSD */
user_pref("browser.tabs.inTitlebar", 1);

/* DNS sobre HTTPS */
user_pref('network.trr.mode', 3);
user_pref('network.trr.uri', 'https://dns.quad9.net/dns-query');

/* Estilos personalizados do usuário */
user_pref('toolkit.legacyUserProfileCustomizations.stylesheets', true);

/* Firefox Sync */
user_pref('identity.fxaccounts.enabled', false);

/* Forçar HTTPS */
user_pref('dom.security.https_only_mode', true);

/* Nova aba em branco */
user_pref('browser.newtabpage.enabled', false);

/* Painel de downloads */
user_pref('browser.download.alwaysOpenPanel', false);

/* Pós processamento de áudio */
user_pref('media.getusermedia.aec_enabled', false);
user_pref('media.getusermedia.agc_enabled', false);
user_pref('media.getusermedia.noise_enabled', false);
user_pref('media.getusermedia.hpf_enabled', false);

/* Recursos nativos desativados */
user_pref('browser.tabs.firefox-view', false);
user_pref('browser.tabs.tabmanager.enabled', false);
user_pref('extensions.pocket.enabled', false);
user_pref('media.videocontrols.picture-in-picture.video-toggle.enabled', false);

/* Restaurar sessão */
user_pref('browser.sessionstore.enabled', false);
user_pref('browser.sessionstore.resume_from_crash', false);
user_pref('browser.sessionstore.resume_session_once', false);

/* Sugestões de pesquisa */
user_pref('browser.urlbar.suggest.bookmark', false);
user_pref('browser.search.suggest.enabled', false);
user_pref('browser.urlbar.suggest.engines', false);
user_pref('browser.urlbar.suggest.openpage', false);
user_pref('browser.urlbar.suggest.topsites', false);

/*  Salvar senhas */
user_pref("signon.rememberSignons", false);
