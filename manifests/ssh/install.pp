# this class will make sure that the salt-ssh package is installed
class salt::ssh::install (
  $ssh_package_ensure = $salt::ssh::ssh_package_ensure,
  $ssh_package_name   = $salt::ssh::ssh_package_name,) inherits
salt::ssh {
  if defined(Package[$salt::ssh::ssh_package_name]) == false {
    package { $salt::ssh::ssh_package_name: ensure =>
      $salt::ssh::ssh_package_ensure, }
  }
}
