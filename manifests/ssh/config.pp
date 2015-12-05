# this class is used to configure salt-ssh and roster file
class salt::ssh::config (
  $ssh_config_manage                      = $salt::ssh::ssh_config_manage,
  $ssh_config                             = $salt::ssh::ssh_config,
  $ssh_config_template                    = $salt::ssh::ssh_config_template,
  $ssh_roster_manage                      = $salt::ssh::ssh_roster_manage,
  $ssh_roster                             = $salt::ssh::ssh_roster,
  $ssh_roster_template                    = $salt::ssh::ssh_roster_template,
  $ssh_roster_file                        = $salt::ssh::ssh_roster_file,
  $ssh_ssh_minion_opts                    = $salt::ssh::ssh_ssh_minion_opts,)
inherits salt::ssh {
  # installs the ssh config file defined in salt::params
  file { $ssh_config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0664',
    content => template($ssh_config_template),
    replace => $ssh_config_manage,
  }

  # installs the roster file defined in salt::params
  file { $ssh_roster:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0664',
    content => template($ssh_roster_template),
    replace => $ssh_roster_manage,
  }
}
