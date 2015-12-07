# this class is used to ensure the saltstack repo is present before install
class salt::repo::config (
  $repo_file_manage                       = $salt::repo::repo_file_manage,
  $repo_file                              = $salt::repo::repo_file,
  $repo_file_template                     = $salt::repo::repo_file_template,)
inherits salt::repo {
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
