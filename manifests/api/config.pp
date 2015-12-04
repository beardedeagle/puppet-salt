# this class is used to configure the salt api config file
class salt::api::config (
  $api_config_manage                    = $salt::api::api_config_manage,
  $api_config                           = $salt::api::api_config,
  $api_config_template                  = $salt::api::api_config_template,)
inherits salt::api {
  # installs the api config file defined in salt::api
  file { '/etc/salt/master.d':
    ensure => 'directory',
  }

  file { $api_config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0664',
    content => template($api_config_template),
    replace => $api_config_manage,
  }
}
