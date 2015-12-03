# this class will make sure that the salt-minion package is installed
# for archlinux single package it will test if it is allready defined.
class puppet-salt::minion::install (
  $minion_package_ensure = $puppet-salt::minion::minion_package_ensure,
  $minion_package_name   = $puppet-salt::minion::minion_package_name,) inherits
puppet-salt::minion {
  if defined(Package[$puppet-salt::minion::minion_package_name]) == false {
    package { $puppet-salt::minion::minion_package_name: ensure =>
      $puppet-salt::minion::minion_package_ensure, }
  }
}
