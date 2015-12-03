# this class will only install the salt minion
# example:
# class { 'salt::minion': }
#
class salt::minion (
  $repo_file_manage                   = $salt::params::repo_file_manage,
  $repo_file                          = $salt::params::repo_file,
  $repo_file_template                 = $salt::params::repo_file_template,
  $minion_config_manage               = $salt::params::minion_config_manage,
  $minion_config                      = $salt::params::minion_config,
  $minion_config_template             = $salt::params::minion_config_template,
  $minion_package_name                = $salt::params::minion_package_name,
  $minion_package_ensure              = $salt::params::minion_package_ensure,
  $minion_service_name                = $salt::params::minion_service_name,
  $minion_service_ensure              = $salt::params::minion_service_ensure,
  $minion_service_manage              = $salt::params::minion_service_manage,
  $minion_service_enable              = $salt::params::minion_service_enable,
  $minion_default_include             = $salt::params::minion_default_include,
  $minion_master                      = $salt::params::minion_master,
  $minion_random_master               = $salt::params::minion_random_master,
  $minion_master_type                 = $salt::params::minion_master_type,
  $minion_master_alive_interval       = $salt::params::minion_master_alive_interval,
  $minion_ipv6                        = $salt::params::minion_ipv6,
  $minion_retry_dns                   = $salt::params::minion_retry_dns,
  $minion_master_port                 = $salt::params::minion_master_port,
  $minion_user                        = $salt::params::minion_user,
  $minion_sudo_user                   = $salt::params::minion_sudo_user,
  $minion_pidfile                     = $salt::params::minion_pidfile,
  $minion_root_dir                    = $salt::params::minion_root_dir,
  $minion_pki_dir                     = $salt::params::minion_pki_dir,
  $minion_id                          = $salt::params::minion_id,
  $minion_append_domain               = $salt::params::minion_append_domain,
  $minion_cachedir                    = $salt::params::minion_cachedir,
  $minion_verify_env                  = $salt::params::minion_verify_env,
  $minion_cache_jobs                  = $salt::params::minion_cache_jobs,
  $minion_sock_dir                    = $salt::params::minion_sock_dir,
  $minion_output                      = $salt::params::minion_output,
  $minion_color                       = $salt::params::minion_color,
  $minion_strip_colors                = $salt::params::minion_strip_colors,
  $minion_backup_mode                 = $salt::params::minion_backup_mode,
  $minion_acceptance_wait_time        = $salt::params::minion_acceptance_wait_time,
  $minion_acceptance_wait_time_max    = $salt::params::minion_acceptance_wait_time_max,
  $minion_rejected_retry              = $salt::params::minion_rejected_retry,
  $minion_random_reauth_delay         = $salt::params::minion_random_reauth_delay,
  $minion_auth_timeout                = $salt::params::minion_auth_timeout,
  $minion_auth_tries                  = $salt::params::minion_auth_tries,
  $minion_auth_safemode               = $salt::params::minion_auth_safemode,
  $minion_ping_interval               = $salt::params::minion_ping_interval,
  $minion_recon_default               = $salt::params::minion_recon_default,
  $minion_recon_max                   = $salt::params::minion_recon_max,
  $minion_recon_randomize             = $salt::params::minion_recon_randomize,
  $minion_loop_interval               = $salt::params::minion_loop_interval,
  $minion_grains_refresh_every        = $salt::params::minion_grains_refresh_every,
  $minion_grains_cache                = $salt::params::minion_grains_cache,
  $minion_grains_cache_expiration     = $salt::params::minion_grains_cache_expiration,
  $minion_ipc_mode                    = $salt::params::minion_ipc_mode,
  $minion_tcp_pub_port                = $salt::params::minion_tcp_pub_port,
  $minion_tcp_pull_port               = $salt::params::minion_tcp_pull_port,
  $minion_max_event_size              = $salt::params::minion_max_event_size,
  $minion_disable_modules             = $salt::params::minion_disable_modules,
  $minion_disable_returners           = $salt::params::minion_disable_returners,
  $minion_module_dirs                 = $salt::params::minion_module_dirs,
  $minion_returner_dirs               = $salt::params::minion_returner_dirs,
  $minion_states_dirs                 = $salt::params::minion_states_dirs,
  $minion_render_dirs                 = $salt::params::minion_render_dirs,
  $minion_utils_dirs                  = $salt::params::minion_utils_dirs,
  $minion_providers                   = $salt::params::minion_providers,
  $minion_cython_enable               = $salt::params::minion_cython_enable,
  $minion_modules_max_memory          = $salt::params::minion_modules_max_memory,
  $minion_renderer                    = $salt::params::minion_renderer,
  $minion_failhard                    = $salt::params::minion_failhard,
  $minion_autoload_dynamic_modules    = $salt::params::minion_autoload_dynamic_modules,
  $minion_clean_dynamic_modules       = $salt::params::minion_clean_dynamic_modules,
  $minion_environment                 = $salt::params::minion_environment,
  $minion_state_top                   = $salt::params::minion_state_top,
  $minion_startup_states              = $salt::params::minion_startup_states,
  $minion_sls_list                    = $salt::params::minion_sls_list,
  $minion_top_file                    = $salt::params::minion_top_file,
  $minion_state_aggregate             = $salt::params::minion_state_aggregate,
  $minion_file_client                 = $salt::params::minion_file_client,
  $minion_file_roots                  = $salt::params::minion_file_roots,
  $minion_fileserver_limit_traversal  = $salt::params::minion_fileserver_limit_traversal,
  $minion_hash_type                   = $salt::params::minion_hash_type,
  $minion_pillar_roots                = $salt::params::minion_pillar_roots,
  $minion_open_mode                   = $salt::params::minion_open_mode,
  $minion_permissive_pki_access       = $salt::params::minion_permissive_pki_access,
  $minion_state_verbose               = $salt::params::minion_state_verbose,
  $minion_state_output                = $salt::params::minion_state_output,
  $minion_state_output_diff           = $salt::params::minion_state_output_diff,
  $minion_state_output_profile        = $salt::params::minion_state_output_profile,
  $minion_master_finger               = $salt::params::minion_master_finger,
  $minion_multiprocessing             = $salt::params::minion_multiprocessing,
  $minion_log_file                    = $salt::params::minion_log_file,
  $minion_key_logfile                 = $salt::params::minion_key_logfile,
  $minion_log_level                   = $salt::params::minion_log_level,
  $minion_log_level_logfile           = $salt::params::minion_log_level_logfile,
  $minion_log_datefmt                 = $salt::params::minion_log_datefmt,
  $minion_log_datefmt_logfile         = $salt::params::minion_log_datefmt_logfile,
  $minion_log_fmt_console             = $salt::params::minion_log_fmt_console,
  $minion_log_fmt_logfile             = $salt::params::minion_log_fmt_logfile,
  $minion_log_granular_levels         = $salt::params::minion_log_granular_levels,
  $minion_zmq_monitor                 = $salt::params::minion_zmq_monitor,
  $minion_test                        = $salt::params::minion_test,
  $minion_update_url                  = $salt::params::minion_update_url,
  $minion_update_restart_services     = $salt::params::minion_update_restart_services,
  $minion_tcp_keepalive               = $salt::params::minion_tcp_keepalive,
  $minion_tcp_keepalive_idle          = $salt::params::minion_tcp_keepalive_idle,
  $minion_tcp_keepalive_cnt           = $salt::params::minion_tcp_keepalive_cnt,)
inherits salt::params {
  include 'salt::minion::install'
  include 'salt::minion::config'
  include 'salt::minion::service'

  # Anchor this as per #8140 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'salt::minion::begin': }
  anchor { 'salt::minion::end': }

  Anchor['salt::minion::begin'] ->
    Class['salt::minion::install'] ->
    Class['salt::minion::config'] ->
    Class['salt::minion::service'] ->
  Anchor['salt::minion::end']
}
