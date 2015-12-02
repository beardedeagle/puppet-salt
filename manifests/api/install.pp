# this class will make sure that the salt-api package is installed
# for archlinux single package it will test if it is allready defined.
class salt::api::install (
  $api_package_ensure = $salt::api::api_package_ensure,
  $api_package_name   = $salt::api::api_package_name,) inherits
salt::api {
  if defined(Package[$salt::api::api_package_name]) == false {
    package { $salt::api::api_package_name: ensure =>
      $salt::api::api_package_ensure, }
  }
}
