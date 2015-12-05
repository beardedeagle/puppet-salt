# this class is used to ensure the saltstack repo is present before install
class salt::minion::repo (
  $repo_file_manage                       = $salt::minion::repo_file_manage,
  $repo_file                              = $salt::minion::repo_file,
  $repo_file_template                     = $salt::minion::repo_file_template,)
inherits salt::minion {
  # installs the minion config file defined in salt::params
  file { $repo_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0664',
    content => template($repo_file_template),
    replace => $repo_file_manage,
  }
}
