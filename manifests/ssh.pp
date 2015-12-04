# this class will only install the salt ssh
# example:
# class { 'salt::ssh': }
#
class salt::ssh (
  $repo_file_manage                       = $salt::params::repo_file_manage,
  $repo_file                              = $salt::params::repo_file,
  $repo_file_template                     = $salt::params::repo_file_template,
  $ssh_config_manage                      = $salt::params::ssh_config_manage,
  $ssh_config                             = $salt::params::ssh_config,
  $ssh_config_template                    = $salt::params::ssh_config_template,
  $ssh_package_name                       = $salt::params::ssh_package_name,
  $ssh_package_ensure                     = $salt::params::ssh_package_ensure,)
inherits salt::params {
  include 'salt::ssh::repo'
  include 'salt::ssh::install'
  include 'salt::ssh::config'

  # Anchor this as per #8140 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'salt::ssh::begin': }
  anchor { 'salt::ssh::end': }

  Anchor['salt::ssh::begin'] ->
    Class['salt::ssh::repo'] ->
    Class['salt::ssh::install'] ->
    Class['salt::ssh::config'] ->
  Anchor['salt::ssh::end']
}
