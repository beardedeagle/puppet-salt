# this class will only install salt-syndic
# example:
# class { 'salt::syndic': }
#
class salt::syndic (
  $syndic_config_manage                   = $salt::params::syndic_config_manage,
  $syndic_config                          = $salt::params::syndic_config,
  $syndic_config_template                 = $salt::params::syndic_config_template,
  $syndic_package_name                    = $salt::params::syndic_package_name,
  $syndic_package_ensure                  = $salt::params::syndic_package_ensure,
  $syndic_service_name                    = $salt::params::syndic_service_name,
  $syndic_service_ensure                  = $salt::params::syndic_service_ensure,
  $syndic_service_manage                  = $salt::params::syndic_service_manage,
  $syndic_service_enable                  = $salt::params::syndic_service_enable,
  $syndic_order_masters                   = $salt::params::syndic_order_masters,
  $syndic_syndic_master                   = $salt::params::syndic_syndic_master,
  $syndic_syndic_master_port              = $salt::params::syndic_syndic_master_port,
  $syndic_syndic_pidfile                  = $salt::params::syndic_syndic_pidfile,
  $syndic_syndic_log_file                 = $salt::params::syndic_syndic_log_file,
  $syndic_id                              = $salt::params::syndic_id,
  $syndic_syndic_wait                     = $salt::params::syndic_syndic_wait,)
inherits salt::params {
  require master
  include 'salt::syndic::install'
  include 'salt::syndic::config'
  include 'salt::syndic::service'

  # Anchor this as per #8140 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'salt::syndic::begin': }
  anchor { 'salt::syndic::end': }

  Anchor['salt::syndic::begin'] ->
    Class['salt::syndic::install'] ->
    Class['salt::syndic::config'] ->
    Class['salt::syndic::service'] ->
  Anchor['salt::syndic::end']
}
