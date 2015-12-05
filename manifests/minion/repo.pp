# this class is used to ensure the saltstack repo is present before install
class salt::minion::repo (
  $minion_repo_file_manage                       = $salt::minion::minion_repo_file_manage,
  $minion_repo_file                              = $salt::minion::minion_repo_file,
  $minion_repo_file_template                     = $salt::minion::minion_repo_file_template,)
inherits salt::minion {
  # installs the minion config file defined in salt::params
  file { $minion_repo_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0664',
    content => template($minion_repo_file_template),
    replace => $minion_repo_file_manage,
  }
}
