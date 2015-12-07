# this class will only install salt-api
# example:
# class { 'salt::api': }
#
class salt::api (
  $api_config_manage                   = $salt::params::api_config_manage,
  $api_config                          = $salt::params::api_config,
  $api_config_template                 = $salt::params::api_config_template,
  $api_package_name                    = $salt::params::api_package_name,
  $api_package_ensure                  = $salt::params::api_package_ensure,
  $api_service_name                    = $salt::params::api_service_name,
  $api_service_ensure                  = $salt::params::api_service_ensure,
  $api_service_manage                  = $salt::params::api_service_manage,
  $api_service_enable                  = $salt::params::api_service_enable,
  $api_port                            = $salt::params::api_port,
  $api_host                            = $salt::params::api_host,
  $api_debug                           = $salt::params::api_debug,
  $api_ssl_crt                         = $salt::params::api_ssl_crt,
  $api_ssl_key                         = $salt::params::api_ssl_key,
  $api_disable_ssl                     = $salt::params::api_disable_ssl,
  $api_webhook_disable_auth            = $salt::params::api_webhook_disable_auth,
  $api_webhook_url                     = $salt::params::api_webhook_url,
  $api_thread_pool                     = $salt::params::api_thread_pool,
  $api_socket_queue_size               = $salt::params::api_socket_queue_size,
  $api_expire_responses                = $salt::params::api_expire_responses,
  $api_max_request_body_size           = $salt::params::api_max_request_body_size,
  $api_collect_stats                   = $salt::params::api_collect_stats,
  $api_static                          = $salt::params::api_static,
  $api_static_path                     = $salt::params::api_static_path,
  $api_app                             = $salt::params::api_app,
  $api_app_path                        = $salt::params::api_app_path,
  $api_root_prefix                     = $salt::params::api_root_prefix,)
inherits salt::params {
  require 'salt::master'
  include 'salt::api::install'
  include 'salt::api::config'
  include 'salt::api::service'

  # Anchor this as per #8140 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'salt::api::begin': }
  anchor { 'salt::api::end': }

  Anchor['salt::api::begin'] ->
    Class['salt::api::install'] ->
    Class['salt::api::config'] ->
    Class['salt::api::service'] ->
  Anchor['salt::api::end']
}
