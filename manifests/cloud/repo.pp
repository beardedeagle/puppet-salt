# this class is used to ensure the saltstack repo is present before install
class salt::cloud::repo (
  $repo_file_manage                       = $salt::params::repo_file_manage,
  $repo_file                              = $salt::params::repo_file,
  $repo_file_template                     = $salt::params::repo_file_template,)
inherits salt::cloud {
  # installs the cloud config file defined in salt::params
  file { $repo_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0664',
    content => template($repo_file_template),
    replace => $repo_file_manage,
  }
}
