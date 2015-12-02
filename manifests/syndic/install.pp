# this class will make sure that the salt-syndic package is installed
# for archlinux single package it will test if it is allready defined.
class salt::syndic::install (
  $syndic_package_ensure = $salt::syndic::syndic_package_ensure,
  $syndic_package_name   = $salt::syndic::syndic_package_name,) inherits
salt::syndic {
  if defined(Package[$salt::syndic::syndic_package_name]) == false {
    package { $salt::syndic::syndic_package_name: ensure =>
      $salt::syndic::syndic_package_ensure, }
  }
}
