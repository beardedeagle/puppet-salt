# this class is used to configure the salt api config file
class salt::api::config (
  $api_config_manage                   = $salt::api::api_config_manage,
  $api_config                          = $salt::api::api_config,
  $api_config_template                 = $salt::api::api_config_template,
  $api_port                            = $salt::api::api_port,
  $api_host                            = $salt::api::api_host,
  $api_debug                           = $salt::api::api_debug,
  $api_ssl_crt                         = $salt::api::api_ssl_crt,
  $api_ssl_key                         = $salt::api::api_ssl_key,
  $api_disable_ssl                     = $salt::api::api_disable_ssl,
  $api_webhook_disable_auth            = $salt::api::api_webhook_disable_auth,
  $api_webhook_url                     = $salt::api::api_webhook_url,
  $api_thread_pool                     = $salt::api::api_thread_pool,
  $api_socket_queue_size               = $salt::api::api_socket_queue_size,
  $api_expire_responses                = $salt::api::api_expire_responses,
  $api_max_request_body_size           = $salt::api::api_max_request_body_size,
  $api_collect_stats                   = $salt::api::api_collect_stats,
  $api_static                          = $salt::api::api_static,
  $api_static_path                     = $salt::api::api_static_path,
  $api_app                             = $salt::api::api_app,
  $api_app_path                        = $salt::api::api_app_path,
  $api_root_prefix                     = $salt::api::api_root_prefix,)
inherits salt::api {
  # installs the api config file defined in salt::params
  file { $api_config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0664',
    content => template($api_config_template),
    replace => $api_config_manage,
  }
}
