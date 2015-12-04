# this class will only install the salt syndic
# example:
# class { 'salt::syndic': }
#
class salt::syndic (
  $repo_file_manage                       = $salt::params::repo_file_manage,
  $repo_file                              = $salt::params::repo_file,
  $repo_file_template                     = $salt::params::repo_file_template,
  $syndic_package_name                    = $salt::params::syndic_package_name,
  $syndic_package_ensure                  = $salt::params::syndic_package_ensure,
  $syndic_service_name                    = $salt::params::syndic_service_name,
  $syndic_service_ensure                  = $salt::params::syndic_service_ensure,
  $syndic_service_manage                  = $salt::params::syndic_service_manage,
  $syndic_service_enable                  = $salt::params::syndic_service_enable,)
inherits salt::params {
  require master
  include 'salt::syndic::install'
  include 'salt::syndic::service'

  # Anchor this as per #8140 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'salt::syndic::begin': }
  anchor { 'salt::syndic::end': }

  Anchor['salt::syndic::begin'] ->
    Class['salt::syndic::install'] ->
    Class['salt::syndic::service'] ->
  Anchor['salt::syndic::end']
}
