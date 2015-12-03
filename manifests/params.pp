# This class will set all parameters for salt master, minion, cloud, api, syndic and ssh
class salt::params {
  case $::osfamily {
    'redhat' : {
      $repo_file_manage       = true
      $repo_file              = '/etc/yum.repos.d/saltstack.repo'
      $repo_file_template     = 'salt/repo.erb'

      $master_config_manage   = true
      $master_config          = '/etc/salt/master'
      $master_config_template = 'salt/master.erb'
      $master_package_name    = 'salt-master'
      $master_package_ensure  = 'present'
      $master_service_name    = 'salt-master'
      $master_service_ensure  = 'running'
      $master_service_manage  = true
      $master_service_enable  = true

      $minion_config_manage   = true
      $minion_config          = '/etc/salt/minion'
      $minion_config_template = 'salt/minion.erb'
      $minion_package_name    = 'salt-minion'
      $minion_package_ensure  = 'present'
      $minion_service_name    = 'salt-minion'
      $minion_service_ensure  = 'running'
      $minion_service_manage  = true
      $minion_service_enable  = true
    }
    'archlinux' : {
      $minion_config_manage   = true
      $minion_config          = '/etc/salt/minion'
      $minion_config_template = 'salt/minion.erb'
      $minion_package_name    = 'salt'
      $minion_package_ensure  = 'present'
      $minion_service_name    = 'salt-minion'
      $minion_service_ensure  = 'running'
      $minion_service_manage  = true
      $minion_service_enable  = true

      $master_config_manage   = true
      $master_config          = '/etc/salt/master'
      $master_config_template = 'salt/master.erb'
      $master_package_name    = 'salt'
      $master_package_ensure  = 'present'
      $master_service_name    = 'salt-master'
      $master_service_ensure  = 'running'
      $master_service_manage  = true
      $master_service_enable  = true
    }
    'suse' : {
      $minion_config_manage   = true
      $minion_config          = '/etc/salt/minion'
      $minion_config_template = 'salt/minion.erb'
      $minion_package_name    = 'salt-minion'
      $minion_package_ensure  = 'present'
      $minion_service_name    = 'salt-minion'
      $minion_service_ensure  = 'running'
      $minion_service_manage  = true
      $minion_service_enable  = true

      $master_config_manage   = true
      $master_config          = '/etc/salt/master'
      $master_config_template = 'salt/master.erb'
      $master_package_name    = 'salt-master'
      $master_package_ensure  = 'present'
      $master_service_name    = 'salt-master'
      $master_service_ensure  = 'running'
      $master_service_manage  = true
      $master_service_enable  = true
    }
    'debian' : {
      $minion_config_manage   = true
      $minion_config          = '/etc/salt/minion'
      $minion_config_template = 'salt/minion.erb'
      $minion_package_name    = 'salt-minion'
      $minion_package_ensure  = 'present'
      $minion_service_name    = 'salt-minion'
      $minion_service_ensure  = 'running'
      $minion_service_manage  = true
      $minion_service_enable  = true

      $master_config_manage   = true
      $master_config          = '/etc/salt/master'
      $master_config_template = 'salt/master.erb'
      $master_package_name    = 'salt-master'
      $master_package_ensure  = 'present'
      $master_service_name    = 'salt-master'
      $master_service_ensure  = 'running'
      $master_service_manage  = true
      $master_service_enable  = true
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
  # master defaults:
  ###############################################

  # Primary configuration settings
  $master_default_include         = 'minion.d/*.conf'
  $master_interface               = '0.0.0.0'
  $master_ipv6                    = false
  $master_publish_port            = 4505
  $master_user                    = 'root'
  $master_max_open_files          = 100000
  $master_worker_threads          = 5
  $master_ret_port                = 4506
  $master_pid_file                = '/var/run/salt-master.pid'
  $master_root_dir                = '/'
  $master_pki_dir                 = '/etc/salt/pki/master'
  $master_cachedir                = '/var/cache/salt/master'
  $master_extension_modules       = '/var/cache/salt/extmods'
  $master_verify_env              = true
  $master_keep_jobs               = 24
  $master_timeout                 = 5
  $master_loop_interval           = 60
  $master_output                  = 'nested'
  $master_show_timeout            = true
  $master_color                   = true
  $master_strip_colors            = true
  $master_sock_dir                = '/var/run/salt/master'
  $master_enable_gpu_grains       = false
  $master_job_cache               = true
  $master_minion_data_cache       = true
  $master_event_return            = ''
  $master_event_return_queue      = 0
  $master_event_return_whitelist  = '[]'
  $master_event_return_blacklist  = '[]'
  $master_max_event_size          = 1048576
  $master_ping_on_rotate          = false
  $master_preserve_minion_cache   = false
  $master_con_cache               = false

  # Security settings
  $master_open_mode             = false
  $master_auto_accept           = false
  $master_autosign_timeout      = 120
  $master_autosign_file         = '/etc/salt/autosign.conf'
  $master_autoreject_file       = '/etc/salt/autoreject.conf'
  $master_permissive_pki_access = false
  $master_client_acl            = '{}'
  $master_client_acl_blacklist  = '{}'
  $master_sudo_acl              = false
  $master_external_auth         = '{}'
  $master_token_expire          = 43200
  $master_file_recv             = false
  $master_file_recv_max_size    = 100
  $master_sign_pub_messages     = false

  # Salt-SSH Configuration
  $master_roster_file     = ''
  $master_ssh_minion_opts = '{}'

  # Master Module Management
  $master_runner_dirs   = '[]'
  $master_cython_enable = false

  # State System settings
  $master_state_top           = 'top.sls'
  $master_master_tops         = '{}'
  $master_external_nodes      = 'None'
  $master_renderer            = 'yaml_jinja'
  $master_jinja_trim_blocks   = false
  $master_jinja_lstrip_blocks = false
  $master_failhard            = false
  $master_state_verbose       = true
  $master_state_output        = 'full'
  $master_state_aggregate     = false
  $master_state_events        = false

  # File Server settings
  $master_file_roots                  = "\n  base:\n    - /srv/salt\n    - /srv/spm/salt"
  $master_top_file_merging_strategy   = 'merge'
  $master_env_order                   = '[]'
  $master_default_top                 = 'base'
  $master_hash_type                   = 'md5'
  $master_file_buffer_size            = 1048576
  $master_file_ignore_regex           = 'null'
  $master_file_ignore_glob            = 'null'
  $master_fileserver_backend          = "\n  - roots"
  $master_fileserver_followsymlinks   = true
  $master_fileserver_ignoresymlinks   = false
  $master_fileserver_limit_traversal  = false
  $master_gitfs_remotes               = '[]'
  $master_gitfs_ssl_verify            = false
  $master_gitfs_root                  = ''

  # Pillar settings
  $master_pillar_roots                    = "\n  base:\n    - /srv/pillar\n    - /srv/spm/pillar"
  $master_ext_pillar                      = '[]'
  $master_pillar_opts                     = false
  $master_pillar_safe_render_error        = true
  $master_pillar_source_merging_strategy  = 'smart'

  # Syndic settings
  $master_order_masters = false
  $master_syndic_master = ''

  # Peer Publish settings
  $master_peer = '{}'

  # Logging settings
  $master_log_file            = '/var/log/salt/master'
  $master_key_logfile         = '/var/log/salt/key'
  $master_log_level           = 'warning'
  $master_log_level_logfile   = 'warning'
  $master_log_datefmt         = '%H:%M:%S'
  $master_log_datefmt_logfile = '%Y-%m-%d %H:%M:%S'
  $master_log_fmt_logfile     = '%(asctime)s,%(msecs)03.0f [%(name)-17s][%(levelname)-8s][%(process)d] %(message)s'
  $master_log_granular_levels = '{}'

  # Node Groups
  $master_nodegroups = '{}'

  # Range Cluster settings
  $master_range_server = 'range:80'

  ###############################################
  # minion defaults:
  ###############################################

  # Primary configuration settings
  $minion_default_include           = 'minion.d/*.conf'
  $minion_master                    = 'salt'
  $minion_random_master             = false
  $minion_master_type               = 'str'
  $minion_master_alive_interval     = 0
  $minion_ipv6                      = false
  $minion_retry_dns                 = 30
  $minion_master_port               = 4506
  $minion_user                      = 'root'
  $minion_sudo_user                 = undef
  $minion_pidfile                   = '/var/run/salt-minion.pid'
  $minion_root_dir                  = '/'
  $minion_pki_dir                   = '/etc/salt/pki/minion'
  $minion_id                        = undef
  $minion_append_domain             = undef
  $minion_cachedir                  = '/var/cache/salt/minion'
  $minion_verify_env                = true
  $minion_cache_jobs                = false
  $minion_sock_dir                  = '/var/run/salt/minion'
  $minion_output                    = 'nested'
  $minion_color                     = true
  $minion_strip_colors              = true
  $minion_backup_mode               = undef
  $minion_acceptance_wait_time      = 10
  $minion_acceptance_wait_time_max  = 0
  $minion_rejected_retry            = false
  $minion_random_reauth_delay       = 10
  $minion_auth_timeout              = 60
  $minion_auth_tries                = 7
  $minion_auth_safemode             = false
  $minion_ping_interval             = 0
  $minion_recon_default             = 1000
  $minion_recon_max                 = 10000
  $minion_recon_randomize           = true
  $minion_loop_interval             = 60
  $minion_grains_refresh_every      = 0
  $minion_grains_cache              = false
  $minion_grains_cache_expiration   = 300
  $minion_ipc_mode                  = 'ipc'
  $minion_tcp_pub_port              = 4510
  $minion_tcp_pull_port             = 4511
  $minion_max_event_size            = 1048576

  # Minion module management
  $minion_disable_modules     = '[]'
  $minion_disable_returners   = '[]'
  $minion_module_dirs         = '[]'
  $minion_returner_dirs       = '[]'
  $minion_states_dirs         = '[]'
  $minion_render_dirs         = '[]'
  $minion_utils_dirs          = '[]'
  $minion_providers           = '{}'
  $minion_cython_enable       = false
  $minion_modules_max_memory  = -1

  # State Management Settings
  $minion_renderer                  = 'yaml_jinja'
  $minion_failhard                  = false
  $minion_autoload_dynamic_modules  = true
  $minion_clean_dynamic_modules     = true
  $minion_environment               = 'None'
  $minion_state_top                 = 'top.sls'
  $minion_startup_states            = undef
  $minion_sls_list                  = '[]'
  $minion_top_file                  = undef
  $minion_state_aggregate           = false

  # File Directory Settings
  $minion_file_client                 = 'remote'
  $minion_file_roots                  = "\n  base:\n    - /srv/salt\n    - /srv/spm/salt"
  $minion_fileserver_limit_traversal  = false
  $minion_hash_type                   = 'md5'
  $minion_pillar_roots                = "\n  base:\n    - /srv/pillar\n    - /srv/spm/pillar"

  # Security settings
  $minion_open_mode             = false
  $minion_permissive_pki_access = false
  $minion_state_verbose         = true
  $minion_state_output          = 'full'
  $minion_state_output_diff     = false
  $minion_state_output_profile  = true
  $minion_master_finger         = ''

  # Thread settings
  $minion_multiprocessing = true

  # Logging settings
  $minion_log_file            = '/var/log/salt/minion'
  $minion_key_logfile         = '/var/log/salt/key'
  $minion_log_level           = 'warning'
  $minion_log_level_logfile   = 'warning'
  $minion_log_datefmt         = '%H:%M:%S'
  $minion_log_datefmt_logfile = '%Y-%m-%d %H:%M:%S'
  $minion_log_fmt_console     = '[%(levelname)-8s] %(message)s'
  $minion_log_fmt_logfile     = '%(asctime)s,%(msecs)03.0f [%(name)-17s][%(levelname)-8s][%(process)d] %(message)s'
  $minion_log_granular_levels = '{}'
  $minion_zmq_monitor         = false

  # Module configuration
  $minion_test = false

  # Update settings
  $minion_update_url              = false
  $minion_update_restart_services = '[]'

  # Keepalive settings
  $minion_tcp_keepalive       = true
  $minion_tcp_keepalive_idle  = 300
  $minion_tcp_keepalive_cnt   = '-1'
  $minion_tcp_keepalive_intvl = '-1'
}
