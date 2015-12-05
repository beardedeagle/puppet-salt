# this class will only install salt-ssh
# example:
# class { 'salt::ssh': }
#
class salt::ssh (
  $ssh_config_manage                      = $salt::params::ssh_config_manage,
  $ssh_config                             = $salt::params::ssh_config,
  $ssh_config_template                    = $salt::params::ssh_config_template,
  $ssh_roster_manage                      = $salt::params::ssh_roster_manage,
  $ssh_roster                             = $salt::params::ssh_roster,
  $ssh_roster_template                    = $salt::params::ssh_roster_template,
  $ssh_package_name                       = $salt::params::ssh_package_name,
  $ssh_package_ensure                     = $salt::params::ssh_package_ensure,
  $ssh_roster_file                        = $salt::params::ssh_roster_file,
  $ssh_ssh_minion_opts                    = $salt::params::ssh_ssh_minion_opts,)
inherits salt::params {
  require master
  include 'salt::ssh::install'
  include 'salt::ssh::config'

  # Anchor this as per #8140 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'salt::ssh::begin': }
  anchor { 'salt::ssh::end': }

  Anchor['salt::ssh::begin'] ->
    Class['salt::ssh::install'] ->
    Class['salt::ssh::config'] ->
  Anchor['salt::ssh::end']
}
