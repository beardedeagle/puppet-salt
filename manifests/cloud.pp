# this class will only install the salt cloud
# example:
# class { 'salt::cloud': }
#
class salt::cloud (
  $repo_file_manage                       = $salt::params::repo_file_manage,
  $repo_file                              = $salt::params::repo_file,
  $repo_file_template                     = $salt::params::repo_file_template,
  $cloud_config_manage                    = $salt::params::cloud_config_manage,
  $cloud_config                           = $salt::params::cloud_config,
  $cloud_config_template                  = $salt::params::cloud_config_template,
  $cloud_package_name                     = $salt::params::cloud_package_name,
  $cloud_package_ensure                   = $salt::params::cloud_package_ensure,
  $cloud_keysize                          = $salt::params::cloud_keysize,
  $cloud_script                           = $salt::params::cloud_script,
  $cloud_log_file                         = $salt::params::cloud_log_file,
  $cloud_log_level                        = $salt::params::cloud_log_level,
  $cloud_log_level_logfile                = $salt::params::cloud_log_level_logfile,
  $cloud_log_datefmt                      = $salt::params::cloud_log_datefmt,
  $cloud_log_fmt_logfile                  = $salt::params::cloud_log_fmt_logfile,
  $cloud_log_granular_levels              = $salt::params::cloud_log_granular_levels,
  $cloud_delete_sshkeys                   = $salt::params::cloud_delete_sshkeys,)
inherits salt::params {
  include 'salt::cloud::repo'
  include 'salt::cloud::install'
  include 'salt::cloud::config'

  # Anchor this as per #8140 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'salt::cloud::begin': }
  anchor { 'salt::cloud::end': }

  Anchor['salt::cloud::begin'] ->
    Class['salt::cloud::repo'] ->
    Class['salt::cloud::install'] ->
    Class['salt::cloud::config'] ->
  Anchor['salt::cloud::end']
}
