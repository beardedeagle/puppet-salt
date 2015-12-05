# this class is used to ensure the saltstack repo is present before install
class salt::master::repo (
  $repo_file_manage                       = $salt::master::repo_file_manage,
  $repo_file                              = $salt::master::repo_file,
  $repo_file_template                     = $salt::master::repo_file_template,)
inherits salt::master {
  # installs the master config file defined in salt::params
  file { $repo_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0664',
    content => template($repo_file_template),
    replace => $repo_file_manage,
  }
}
