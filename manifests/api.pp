# this class will only install the salt api
# example:
# class { 'salt::api': }
#
class salt::api (
  $repo_file_manage                    = $salt::params::repo_file_manage,
  $repo_file                           = $salt::params::repo_file,
  $repo_file_template                  = $salt::params::repo_file_template,
  $api_package_name                    = $salt::params::api_package_name,
  $api_package_ensure                  = $salt::params::api_package_ensure,
  $api_service_name                    = $salt::params::api_service_name,
  $api_service_ensure                  = $salt::params::api_service_ensure,
  $api_service_manage                  = $salt::params::api_service_manage,
  $api_service_enable                  = $salt::params::api_service_enable,)
inherits salt::params {
  include 'salt::api::repo'
  include 'salt::api::install'
  include 'salt::api::service'

  # Anchor this as per #8140 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'salt::api::begin': }
  anchor { 'salt::api::end': }

  Anchor['salt::api::begin'] ->
    Class['salt::api::repo'] ->
    Class['salt::api::install'] ->
    Class['salt::api::service'] ->
  Anchor['salt::api::end']
}
