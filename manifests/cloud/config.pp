# this class is used to configure the salt cloud config file
class salt::cloud::config (
  $cloud_config_manage                    = $salt::cloud::cloud_config_manage,
  $cloud_config                           = $salt::cloud::cloud_config,
  $cloud_config_template                  = $salt::cloud::cloud_config_template,
  $cloud_package_name                     = $salt::cloud::cloud_package_name,
  $cloud_package_ensure                   = $salt::cloud::cloud_package_ensure,
  $cloud_keysize                          = $salt::cloud::cloud_keysize,
  $cloud_script                           = $salt::cloud::cloud_script,
  $cloud_log_file                         = $salt::cloud::cloud_log_file,
  $cloud_log_level                        = $salt::cloud::cloud_log_level,
  $cloud_log_level_logfile                = $salt::cloud::cloud_log_level_logfile,
  $cloud_log_datefmt                      = $salt::cloud::cloud_log_datefmt,
  $cloud_log_fmt_logfile                  = $salt::cloud::cloud_log_fmt_logfile,
  $cloud_log_granular_levels              = $salt::cloud::cloud_log_granular_levels,)
inherits salt::cloud {
  # installs the cloud config file defined in salt::cloud
  file { $cloud_config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0664',
    content => template($cloud_config_template),
    replace => $cloud_config_manage,
  }
}
