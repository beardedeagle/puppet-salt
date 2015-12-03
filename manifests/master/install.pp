# this class will make sure that the salt-master package is installed
# for archlinux single package it will test if it is allready defined.
class puppet-salt::master::install (
  $master_package_ensure = $puppet-salt::master::master_package_ensure,
  $master_package_name   = $puppet-salt::master::master_package_name,) inherits
puppet-salt::master {
  if defined(Package[$puppet-salt::master::master_package_name]) == false {
    package { $puppet-salt::master::master_package_name: ensure =>
      $puppet-salt::master::master_package_ensure, }
  }
}
