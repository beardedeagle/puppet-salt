# this class will only install the salt master
# example:
# class { 'salt::master': }
#
class salt::master (
  $master_config_manage                   = $salt::params::master_config_manage,
  $master_config                          = $salt::params::master_config,
  $master_config_template                 = $salt::params::master_config_template,
  $master_package_name                    = $salt::params::master_package_name,
  $master_package_ensure                  = $salt::params::master_package_ensure,
  $master_service_name                    = $salt::params::master_service_name,
  $master_service_ensure                  = $salt::params::master_service_ensure,
  $master_service_manage                  = $salt::params::master_service_manage,
  $master_service_enable                  = $salt::params::master_service_enable,
  $master_default_include                 = $salt::params::master_default_include,
  $master_interface                       = $salt::params::master_interface,
  $master_ipv6                            = $salt::params::master_ipv6,
  $master_publish_port                    = $salt::params::master_publish_port,
  $master_user                            = $salt::params::master_user,
  $master_max_open_files                  = $salt::params::master_max_open_files,
  $master_worker_threads                  = $salt::params::master_worker_threads,
  $master_ret_port                        = $salt::params::master_ret_port,
  $master_pid_file                        = $salt::params::master_pid_file,
  $master_root_dir                        = $salt::params::master_root_dir,
  $master_pki_dir                         = $salt::params::master_pki_dir,
  $master_cachedir                        = $salt::params::master_cachedir,
  $master_extension_modules               = $salt::params::master_extension_modules,
  $master_module_dirs                     = $salt::params::master_module_dirs,
  $master_verify_env                      = $salt::params::master_verify_env,
  $master_keep_jobs                       = $salt::params::master_keep_jobs,
  $master_timeout                         = $salt::params::master_timeout,
  $master_loop_interval                   = $salt::params::master_loop_interval,
  $master_output                          = $salt::params::master_output,
  $master_show_timeout                    = $salt::params::master_show_timeout,
  $master_color                           = $salt::params::master_color,
  $master_strip_colors                    = $salt::params::master_strip_colors,
  $master_sock_dir                        = $salt::params::master_sock_dir,
  $master_enable_gpu_grains               = $salt::params::master_enable_gpu_grains,
  $master_job_cache                       = $salt::params::master_job_cache,
  $master_minion_data_cache               = $salt::params::master_minion_data_cache,
  $master_event_return                    = $salt::params::master_event_return,
  $master_event_return_queue              = $salt::params::master_event_return_queue,
  $master_event_return_whitelist          = $salt::params::master_event_return_whitelist,
  $master_event_return_blacklist          = $salt::params::master_event_return_blacklist,
  $master_max_event_size                  = $salt::params::master_max_event_size,
  $master_ping_on_rotate                  = $salt::params::master_ping_on_rotate,
  $master_preserve_minion_cache           = $salt::params::master_preserve_minion_cache,
  $master_con_cache                       = $salt::params::master_con_cache,
  $master_include                         = $salt::params::master_include,
  $master_open_mode                       = $salt::params::master_open_mode,
  $master_auto_accept                     = $salt::params::master_auto_accept,
  $master_autosign_timeout                = $salt::params::master_autosign_timeout,
  $master_autosign_file                   = $salt::params::master_autosign_file,
  $master_autoreject_file                 = $salt::params::master_autoreject_file,
  $master_permissive_pki_access           = $salt::params::master_permissive_pki_access,
  $master_client_acl                      = $salt::params::master_client_acl,
  $master_client_acl_blacklist            = $salt::params::master_client_acl_blacklist,
  $master_sudo_acl                        = $salt::params::master_sudo_acl,
  $master_external_auth                   = $salt::params::master_external_auth,
  $master_token_expire                    = $salt::params::master_token_expire,
  $master_file_recv                       = $salt::params::master_file_recv,
  $master_file_recv_max_size              = $salt::params::master_file_recv_max_size,
  $master_sign_pub_messages               = $salt::params::master_sign_pub_messages,
  $master_runner_dirs                     = $salt::params::master_runner_dirs,
  $master_cython_enable                   = $salt::params::master_cython_enable,
  $master_state_top                       = $salt::params::master_state_top,
  $master_master_tops                     = $salt::params::master_master_tops,
  $master_external_nodes                  = $salt::params::master_external_nodes,
  $master_renderer                        = $salt::params::master_renderer,
  $master_jinja_trim_blocks               = $salt::params::master_jinja_trim_blocks,
  $master_jinja_lstrip_blocks             = $salt::params::master_jinja_lstrip_blocks,
  $master_failhard                        = $salt::params::master_failhard,
  $master_state_verbose                   = $salt::params::master_state_verbose,
  $master_state_output                    = $salt::params::master_state_output,
  $master_state_aggregate                 = $salt::params::master_state_aggregate,
  $master_state_events                    = $salt::params::master_state_events,
  $master_file_roots                      = $salt::params::master_file_roots,
  $master_top_file_merging_strategy       = $salt::params::master_top_file_merging_strategy,
  $master_env_order                       = $salt::params::master_env_order,
  $master_default_top                     = $salt::params::master_default_top,
  $master_hash_type                       = $salt::params::master_hash_type,
  $master_file_buffer_size                = $salt::params::master_file_buffer_size,
  $master_file_ignore_regex               = $salt::params::master_file_ignore_regex,
  $master_file_ignore_glob                = $salt::params::master_file_ignore_glob,
  $master_fileserver_backend              = $salt::params::master_fileserver_backend,
  $master_fileserver_followsymlinks       = $salt::params::master_fileserver_followsymlinks,
  $master_fileserver_ignoresymlinks       = $salt::params::master_fileserver_ignoresymlinks,
  $master_fileserver_limit_traversal      = $salt::params::master_fileserver_limit_traversal,
  $master_fileserver_events               = $salt::params::master_fileserver_events,
  $master_gitfs_provider                  = $salt::params::master_gitfs_provider,
  $master_gitfs_remotes                   = $salt::params::master_gitfs_remotes,
  $master_gitfs_ssl_verify                = $salt::params::master_gitfs_ssl_verify,
  $master_gitfs_root                      = $salt::params::master_gitfs_root,
  $master_pillar_roots                    = $salt::params::master_pillar_roots,
  $master_ext_pillar                      = $salt::params::master_ext_pillar,
  $master_ext_pillar_first                = $salt::params::master_ext_pillar_first,
  $master_pillar_gitfs_ssl_verify         = $salt::params::master_pillar_gitfs_ssl_verify,
  $master_pillar_opts                     = $salt::params::master_pillar_opts,
  $master_pillar_safe_render_error        = $salt::params::master_pillar_safe_render_error,
  $master_pillar_source_merging_strategy  = $salt::params::master_pillar_source_merging_strategy,
  $master_order_masters                   = $salt::params::master_order_masters,
  $master_peer                            = $salt::params::master_peer,
  $master_peer_run                        = $salt::params::master_peer_run,
  $master_mine_get                        = $salt::params::master_mine_get,
  $master_log_file                        = $salt::params::master_log_file,
  $master_key_logfile                     = $salt::params::master_key_logfile,
  $master_log_level                       = $salt::params::master_log_level,
  $master_log_level_logfile               = $salt::params::master_log_level_logfile,
  $master_log_datefmt                     = $salt::params::master_log_datefmt,
  $master_log_datefmt_logfile             = $salt::params::master_log_datefmt_logfile,
  $master_log_fmt_logfile                 = $salt::params::master_log_fmt_logfile,
  $master_log_granular_levels             = $salt::params::master_log_granular_levels,
  $master_nodegroups                      = $salt::params::master_nodegroups,
  $master_range_server                    = $salt::params::master_range_server,
  $master_winrepo_dir_ng                  = $salt::params::master_winrepo_dir_ng,
  $master_winrepo_remotes_ng              = $salt::params::master_winrepo_remotes_ng,
  $master_winrepo_dir                     = $salt::params::master_winrepo_dir,
  $master_winrepo_mastercachefile         = $salt::params::master_winrepo_remotes,
  $master_winrepo_remotes                 = $salt::params::master_winrepo_remotes,
  $master_return                          = $salt::params::master_return,)
inherits salt::params {
  require 'salt::repo'
  include 'salt::master::install'
  include 'salt::master::config'
  include 'salt::master::service'

  # Anchor this as per #8140 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'salt::master::begin': }
  anchor { 'salt::master::end': }

  Anchor['salt::master::begin'] ->
    Class['salt::master::install'] ->
    Class['salt::master::config'] ->
    Class['salt::master::service'] ->
  Anchor['salt::master::end']

}
