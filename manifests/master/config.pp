# this class is used to configure the salt master config file
class salt::master::config (
  $master_config_manage                   = $salt::params::master_config_manage,
  $master_config                          = $salt::params::master_config,
  $master_config_template                 = $salt::params::master_config_template,
  $master_default_include                 = $salt::master::master_default_include,
  $master_interface                       = $salt::master::master_interface,
  $master_ipv6                            = $salt::master::master_ipv6,
  $master_publish_port                    = $salt::master::master_publish_port,
  $master_user                            = $salt::master::master_user,
  $master_max_open_files                  = $salt::master::master_max_open_files,
  $master_worker_threads                  = $salt::master::master_worker_threads,
  $master_ret_port                        = $salt::master::master_ret_port,
  $master_pid_file                        = $salt::master::master_pid_file,
  $master_root_dir                        = $salt::master::master_root_dir,
  $master_pki_dir                         = $salt::master::master_pki_dir,
  $master_cachedir                        = $salt::master::master_cachedir,
  $master_extension_modules               = $salt::master::master_extension_modules,
  $master_verify_env                      = $salt::master::master_verify_env,
  $master_keep_jobs                       = $salt::master::master_keep_jobs,
  $master_timeout                         = $salt::master::master_timeout,
  $master_loop_interval                   = $salt::master::master_loop_interval,
  $master_output                          = $salt::master::master_output,
  $master_show_timeout                    = $salt::master::master_show_timeout,
  $master_color                           = $salt::master::master_color,
  $master_strip_colors                    = $salt::master::master_strip_colors,
  $master_sock_dir                        = $salt::master::master_sock_dir,
  $master_enable_gpu_grains               = $salt::master::master_enable_gpu_grains,
  $master_job_cache                       = $salt::master::master_job_cache,
  $master_minion_data_cache               = $salt::master::master_minion_data_cache,
  $master_event_return                    = $salt::master::master_event_return,
  $master_event_return_queue              = $salt::master::master_event_return_queue,
  $master_event_return_whitelist          = $salt::master::master_event_return_whitelist,
  $master_event_return_blacklist          = $salt::master::master_event_return_blacklist,
  $master_max_event_size                  = $salt::master::master_max_event_size,
  $master_ping_on_rotate                  = $salt::master::master_ping_on_rotate,
  $master_preserve_minion_cache           = $salt::master::master_preserve_minion_cache,
  $master_con_cache                       = $salt::master::master_con_cache,
  $master_open_mode                       = $salt::master::master_open_mode,
  $master_auto_accept                     = $salt::master::master_auto_accept,
  $master_autosign_timeout                = $salt::master::master_autosign_timeout,
  $master_autosign_file                   = $salt::master::master_autosign_file,
  $master_autoreject_file                 = $salt::master::master_autoreject_file,
  $master_permissive_pki_access           = $salt::master::master_permissive_pki_access,
  $master_client_acl                      = $salt::master::master_client_acl,
  $master_client_acl_blacklist            = $salt::master::master_client_acl_blacklist,
  $master_sudo_acl                        = $salt::master::master_sudo_acl,
  $master_external_auth                   = $salt::master::master_external_auth,
  $master_token_expire                    = $salt::master::master_token_expire,
  $master_file_recv                       = $salt::master::master_file_recv,
  $master_file_recv_max_size              = $salt::master::master_file_recv_max_size,
  $master_sign_pub_messages               = $salt::master::master_sign_pub_messages,
  $master_roster_file                     = $salt::master::master_roster_file,
  $master_ssh_minion_opts                 = $salt::master::master_ssh_minion_opts,
  $master_runner_dirs                     = $salt::master::master_runner_dirs,
  $master_cython_enable                   = $salt::master::master_cython_enable,
  $master_state_top                       = $salt::master::master_state_top,
  $master_master_tops                     = $salt::master::master_master_tops,
  $master_external_nodes                  = $salt::master::master_external_nodes,
  $master_renderer                        = $salt::master::master_renderer,
  $master_jinja_trim_blocks               = $salt::master::master_jinja_trim_blocks,
  $master_jinja_lstrip_blocks             = $salt::master::master_jinja_lstrip_blocks,
  $master_failhard                        = $salt::master::master_failhard,
  $master_state_verbose                   = $salt::master::master_state_verbose,
  $master_state_output                    = $salt::master::master_state_output,
  $master_state_aggregate                 = $salt::master::master_state_aggregate,
  $master_state_events                    = $salt::master::master_state_events,
  $master_file_roots                      = $salt::master::master_file_roots,
  $master_top_file_merging_strategy       = $salt::master::master_top_file_merging_strategy,
  $master_env_order                       = $salt::master::master_env_order,
  $master_default_top                     = $salt::master::master_default_top,
  $master_hash_type                       = $salt::master::master_hash_type,
  $master_file_buffer_size                = $salt::master::master_file_buffer_size,
  $master_file_ignore_regex               = $salt::master::master_file_ignore_regex,
  $master_file_ignore_glob                = $salt::master::master_file_ignore_glob,
  $master_fileserver_backend              = $salt::master::master_fileserver_backend,
  $master_fileserver_followsymlinks       = $salt::master::master_fileserver_followsymlinks,
  $master_fileserver_ignoresymlinks       = $salt::master::master_fileserver_ignoresymlinks,
  $master_fileserver_limit_traversal      = $salt::master::master_fileserver_limit_traversal,
  $master_gitfs_remotes                   = $salt::master::master_gitfs_remotes,
  $master_gitfs_ssl_verify                = $salt::master::master_gitfs_ssl_verify,
  $master_gitfs_root                      = $salt::master::master_gitfs_root,
  $master_pillar_roots                    = $salt::master::master_pillar_roots,
  $master_ext_pillar                      = $salt::master::master_ext_pillar,
  $master_pillar_opts                     = $salt::master::master_pillar_opts,
  $master_pillar_safe_render_error        = $salt::master::master_pillar_safe_render_error,
  $master_pillar_source_merging_strategy  = $salt::master::master_pillar_source_merging_strategy,
  $master_order_masters                   = $salt::master::master_order_masters,
  $master_syndic_master                   = $salt::master::master_syndic_master,
  $master_peer                            = $salt::master::master_peer,
  $master_log_file                        = $salt::master::master_log_file,
  $master_key_logfile                     = $salt::master::master_key_logfile,
  $master_log_level                       = $salt::master::master_log_level,
  $master_log_level_logfile               = $salt::master::master_log_level_logfile,
  $master_log_datefmt                     = $salt::master::master_log_datefmt,
  $master_log_datefmt_logfile             = $salt::master::master_log_datefmt_logfile,
  $master_log_fmt_logfile                 = $salt::master::master_log_fmt_logfile,
  $master_log_granular_levels             = $salt::master::master_log_granular_levels,
  $master_nodegroups                      = $salt::master::master_nodegroups,
  $master_range_server                    = $salt::master::master_range_server,)
inherits salt::master {
  # installs the master config file defined in salt::params
  file { $master_config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0664',
    content => template($master_config_template),
    replace => $master_config_manage,
  }
}
