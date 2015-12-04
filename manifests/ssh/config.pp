# this class is used to configure the salt ssh config file
class salt::ssh::config (
  $ssh_config_manage                    = $salt::ssh::ssh_config_manage,
  $ssh_config                           = $salt::ssh::ssh_config,
  $ssh_config_template                  = $salt::ssh::ssh_config_template,
  $ssh_package_name                     = $salt::ssh::ssh_package_name,
  $ssh_package_ensure                   = $salt::ssh::ssh_package_ensure,)
inherits salt::ssh {
  # installs the ssh config file defined in salt::ssh
  file { $ssh_config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0664',
    content => template($ssh_config_template),
    replace => $ssh_config_manage,
  }
}
