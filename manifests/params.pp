# This class will set all parameters for salt master, minion, cloud, api, syndic and ssh
class salt::params {
  case $::osfamily {
    'redhat' : {

      ###############################################
      # class configs:
      ###############################################

      $repo_file_manage                       = true
      $repo_file                              = '/etc/yum.repos.d/saltstack.repo'
      $repo_file_template                     = 'salt/repo.erb'

      $master_config_manage                   = true
      $master_config                          = '/etc/salt/master'
      $master_config_template                 = 'salt/master.erb'
      $master_package_name                    = 'salt-master'
      $master_package_ensure                  = 'present'
      $master_service_name                    = 'salt-master'
      $master_service_ensure                  = 'running'
      $master_service_manage                  = true
      $master_service_enable                  = true

      $minion_config_manage                   = true
      $minion_config                          = '/etc/salt/minion'
      $minion_config_template                 = 'salt/minion.erb'
      $minion_package_name                    = 'salt-minion'
      $minion_package_ensure                  = 'present'
      $minion_service_name                    = 'salt-minion'
      $minion_service_ensure                  = 'running'
      $minion_service_manage                  = true
      $minion_service_enable                  = true

      $cloud_config_manage                    = true
      $cloud_config                           = '/etc/salt/cloud'
      $cloud_config_template                  = 'salt/cloud.erb'
      $cloud_package_name                     = 'salt-cloud'
      $cloud_package_ensure                   = 'present'

      $api_config_manage                      = true
      $api_config                             = '/etc/salt/master.d/salt-api.conf'
      $api_config_template                    = 'salt/salt-api.erb'
      $api_package_name                       = 'salt-api'
      $api_package_ensure                     = 'present'
      $api_service_name                       = 'salt-api'
      $api_service_ensure                     = 'running'
      $api_service_manage                     = true
      $api_service_enable                     = true

      $syndic_config_manage                   = true
      $syndic_config                          = '/etc/salt/master.d/salt-syndic.conf'
      $syndic_config_template                 = 'salt/salt-syndic.erb'
      $syndic_package_name                    = 'salt-syndic'
      $syndic_package_ensure                  = 'present'
      $syndic_service_name                    = 'salt-syndic'
      $syndic_service_ensure                  = 'running'
      $syndic_service_manage                  = true
      $syndic_service_enable                  = true

      $ssh_config_manage                      = true
      $ssh_config                             = '/etc/salt/master.d/salt-ssh.conf'
      $ssh_config_template                    = 'salt/salt-api.erb'
      $ssh_roster_manage                      = true
      $ssh_roster                             = '/etc/salt/roster'
      $ssh_roster_template                    = 'salt/roster.erb'
      $ssh_package_name                       = 'salt-ssh'
      $ssh_package_ensure                     = 'present'
    }
    default : {
      case $::operatingsystem {
        default : {
          fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
        }
      }
    }
  }
  ###############################################
  # salt-master defaults:
  ###############################################

  # Primary configuration settings
  $master_default_include                     = undef
  $master_interface                           = undef
  $master_ipv6                                = undef
  $master_publish_port                        = undef
  $master_user                                = undef
  $master_max_open_files                      = undef
  $master_worker_threads                      = undef
  $master_ret_port                            = undef
  $master_pid_file                            = undef
  $master_root_dir                            = undef
  $master_pki_dir                             = undef
  $master_cachedir                            = undef
  $master_extension_modules                   = undef
  $master_module_dirs                         = undef
  $master_verify_env                          = undef
  $master_keep_jobs                           = undef
  $master_timeout                             = undef
  $master_loop_interval                       = undef
  $master_output                              = undef
  $master_show_timeout                        = undef
  $master_color                               = undef
  $master_strip_colors                        = undef
  $master_sock_dir                            = undef
  $master_enable_gpu_grains                   = undef
  $master_job_cache                           = undef
  $master_minion_data_cache                   = undef
  $master_event_return                        = undef
  $master_event_return_queue                  = undef
  $master_event_return_whitelist              = undef
  $master_event_return_blacklist              = undef
  $master_max_event_size                      = undef
  $master_ping_on_rotate                      = undef
  $master_preserve_minion_cache               = undef
  $master_con_cache                           = undef
  $master_include                             = undef

  # Security settings
  $master_open_mode                           = undef
  $master_auto_accept                         = undef
  $master_autosign_timeout                    = undef
  $master_autosign_file                       = undef
  $master_autoreject_file                     = undef
  $master_permissive_pki_access               = undef
  $master_client_acl                          = undef
  $master_client_acl_blacklist                = undef
  $master_sudo_acl                            = undef
  $master_external_auth                       = undef
  $master_token_expire                        = undef
  $master_file_recv                           = undef
  $master_file_recv_max_size                  = undef
  $master_sign_pub_messages                   = undef

  # Master Module Management
  $master_runner_dirs                         = undef
  $master_cython_enable                       = undef

  # State System settings
  $master_state_top                           = undef
  $master_master_tops                         = undef
  $master_external_nodes                      = undef
  $master_renderer                            = undef
  $master_jinja_trim_blocks                   = undef
  $master_jinja_lstrip_blocks                 = undef
  $master_failhard                            = undef
  $master_state_verbose                       = undef
  $master_state_output                        = undef
  $master_state_aggregate                     = undef
  $master_state_events                        = undef

  # File Server settings
  $master_file_roots                          = undef
  $master_top_file_merging_strategy           = undef
  $master_env_order                           = undef
  $master_default_top                         = undef
  $master_hash_type                           = undef
  $master_file_buffer_size                    = undef
  $master_file_ignore_regex                   = undef
  $master_file_ignore_glob                    = undef
  $master_fileserver_backend                  = undef
  $master_fileserver_followsymlinks           = undef
  $master_fileserver_ignoresymlinks           = undef
  $master_fileserver_limit_traversal          = undef
  $master_fileserver_events                   = undef
  $master_gitfs_provider                      = undef
  $master_gitfs_remotes                       = undef
  $master_gitfs_ssl_verify                    = undef
  $master_gitfs_root                          = undef

  # Pillar settings
  $master_pillar_roots                        = undef
  $master_ext_pillar                          = undef
  $master_ext_pillar_first                    = undef
  $master_pillar_gitfs_ssl_verify             = undef
  $master_pillar_opts                         = undef
  $master_pillar_safe_render_error            = undef
  $master_pillar_source_merging_strategy      = undef

  # Peer Publish settings
  $master_peer                                = undef
  $master_peer_run                            = undef

  # Mine settings
  $master_mine_get                            = undef

  # Logging settings
  $master_log_file                            = undef
  $master_key_logfile                         = undef
  $master_log_level                           = undef
  $master_log_level_logfile                   = undef
  $master_log_datefmt                         = undef
  $master_log_datefmt_logfile                 = undef
  $master_log_fmt_logfile                     = undef
  $master_log_granular_levels                 = undef

  # Node Groups
  $master_nodegroups                          = undef

  # Range Cluster settings
  $master_range_server                        = undef

  # Windows Software Repo settings
  $master_winrepo_dir_ng                      = undef
  $master_winrepo_remotes_ng                  = undef

  # Windows Software Repo settings - Pre 2015.8
  $master_winrepo_dir                         = undef
  $master_winrepo_mastercachefile             = undef
  $master_winrepo_remotes                     = undef

  # Returner settings
  $master_return                              = undef

  ###############################################
  # salt-minion defaults:
  ###############################################

  # Primary configuration settings
  $minion_default_include                     = undef
  $minion_master                              = undef
  $minion_random_master                       = undef
  $minion_master_type                         = undef
  $minion_ipv6                                = undef
  $minion_retry_dns                           = undef
  $minion_master_port                         = undef
  $minion_user                                = undef
  $minion_sudo_user                           = undef
  $minion_pidfile                             = undef
  $minion_root_dir                            = undef
  $minion_pki_dir                             = undef
  $minion_id                                  = undef
  $minion_append_domain                       = undef
  $minion_grains                              = undef
  $minion_cachedir                            = undef
  $minion_verify_env                          = undef
  $minion_cache_jobs                          = undef
  $minion_sock_dir                            = undef
  $minion_output                              = undef
  $minion_color                               = undef
  $minion_strip_colors                        = undef
  $minion_backup_mode                         = undef
  $minion_acceptance_wait_time                = undef
  $minion_acceptance_wait_time_max            = undef
  $minion_rejected_retry                      = undef
  $minion_random_reauth_delay                 = undef
  $minion_auth_timeout                        = undef
  $minion_auth_tries                          = undef
  $minion_auth_safemode                       = undef
  $minion_ping_interval                       = undef
  $minion_recon_default                       = undef
  $minion_recon_max                           = undef
  $minion_recon_randomize                     = undef
  $minion_loop_interval                       = undef
  $minion_grains_refresh_every                = undef
  $minion_grains_cache                        = undef
  $minion_grains_cache_expiration             = undef
  $minion_ipc_mode                            = undef
  $minion_tcp_pub_port                        = undef
  $minion_tcp_pull_port                       = undef
  $minion_max_event_size                      = undef
  $minion_include                             = undef

  # Minion module management
  $minion_disable_modules                     = undef
  $minion_disable_returners                   = undef
  $minion_module_dirs                         = undef
  $minion_returner_dirs                       = undef
  $minion_states_dirs                         = undef
  $minion_render_dirs                         = undef
  $minion_utils_dirs                          = undef
  $minion_providers                           = undef
  $minion_cython_enable                       = undef
  $minion_modules_max_memory                  = undef

  # State Management Settings
  $minion_renderer                            = undef
  $minion_failhard                            = undef
  $minion_autoload_dynamic_modules            = undef
  $minion_clean_dynamic_modules               = undef
  $minion_environment                         = undef
  $minion_state_top                           = undef
  $minion_startup_states                      = undef
  $minion_sls_list                            = undef
  $minion_top_file                            = undef
  $minion_state_aggregate                     = undef

  # File Directory Settings
  $minion_file_client                         = undef
  $minion_file_roots                          = undef
  $minion_fileserver_limit_traversal          = undef
  $minion_hash_type                           = undef
  $minion_pillar_roots                        = undef

  # Security settings
  $minion_open_mode                           = undef
  $minion_permissive_pki_access               = undef
  $minion_state_verbose                       = undef
  $minion_state_output                        = undef
  $minion_state_output_diff                   = undef
  $minion_state_output_profile                = undef
  $minion_master_finger                       = undef

  # Thread settings
  $minion_multiprocessing                     = undef

  # Logging settings
  $minion_log_file                            = undef
  $minion_key_logfile                         = undef
  $minion_log_level                           = undef
  $minion_log_level_logfile                   = undef
  $minion_log_datefmt                         = undef
  $minion_log_datefmt_logfile                 = undef
  $minion_log_fmt_console                     = undef
  $minion_log_fmt_logfile                     = undef
  $minion_log_granular_levels                 = undef
  $minion_zmq_monitor                         = undef

  # Module configuration
  $minion_test                                = undef
  $minion_test_foo                            = undef
  $minion_test_bar                            = undef
  $minion_test_baz                            = undef

  # Update settings
  $minion_update_url                          = undef
  $minion_update_restart_services             = undef

  # Keepalive settings
  $minion_tcp_keepalive                       = undef
  $minion_tcp_keepalive_idle                  = undef
  $minion_tcp_keepalive_cnt                   = undef
  $minion_tcp_keepalive_intvl                 = undef

  # Windows Software settings
  $minion_win_repo_cachefile                  = undef

  # Returner  settings
  $minion_return                              = undef

  ###############################################
  # salt-cloud vars:
  ###############################################

  # VM Defaults
  $cloud_keysize                              = undef
  $cloud_script                               = undef

  # Logging Settings
  $cloud_log_file                             = undef
  $cloud_log_level                            = undef
  $cloud_log_level_logfile                    = undef
  $cloud_log_datefmt                          = undef
  $cloud_log_fmt_logfile                      = undef
  $cloud_log_granular_levels                  = undef

  # Misc Defaults
  $cloud_delete_sshkeys                       = undef

  ###############################################
  # salt-api vars:
  ###############################################

  $api_port                                   = 8000
  $api_host                                   = undef
  $api_debug                                  = undef
  $api_ssl_crt                                = undef
  $api_ssl_key                                = undef
  $api_disable_ssl                            = undef
  $api_webhook_disable_auth                   = undef
  $api_webhook_url                            = undef
  $api_thread_pool                            = undef
  $api_socket_queue_size                      = undef
  $api_expire_responses                       = undef
  $api_max_request_body_size                  = undef
  $api_collect_stats                          = undef
  $api_static                                 = undef
  $api_static_path                            = undef
  $api_app                                    = undef
  $api_app_path                               = undef
  $api_root_prefix                            = undef

  ###############################################
  # salt-syndic vars:
  ###############################################

  # Syndic settings
  $syndic_order_masters                       = undef
  $syndic_syndic_master                       = undef
  $syndic_syndic_master_port                  = undef
  $syndic_syndic_pidfile                      = undef
  $syndic_syndic_log_file                     = undef
  $syndic_id                                  = undef
  $syndic_syndic_wait                         = undef

  ###############################################
  # salt-ssh vars:
  ###############################################

  # Salt-SSH Configuration
  $ssh_roster_file                            = undef
  $ssh_ssh_minion_opts                        = undef
}
