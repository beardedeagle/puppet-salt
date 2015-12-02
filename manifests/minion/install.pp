# this class will make sure that the salt-minion package is installed
# for archlinux single package it will test if it is allready defined.
class salt::minion::install (
  file { $repo_file:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0664',
    content => template($repo_file_template),
    replace => $repo_file_manage,
  }

  $minion_package_ensure = $salt::minion::minion_package_ensure,
  $minion_package_name   = $salt::minion::minion_package_name,) inherits
salt::minion {
  if defined(Package[$salt::minion::minion_package_name]) == false {
    package { $salt::minion::minion_package_name: ensure =>
      $salt::minion::minion_package_ensure, }

  }
}
