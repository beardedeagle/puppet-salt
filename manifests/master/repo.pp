# this class is used to ensure the saltstack repo is present before install
class salt::master::repo (
  $master_repo_file_manage                       = $salt::master::master_repo_file_manage,
  $master_repo_file                              = $salt::master::master_repo_file,
  $master_repo_file_template                     = $salt::master::master_repo_file_template,)
inherits salt::master {
  # installs the master config file defined in salt::params
  file { $master_repo_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0664',
    content => template($master_repo_file_template),
    replace => $master_repo_file_manage,
  }
}
