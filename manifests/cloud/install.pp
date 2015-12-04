# this class will make sure that the salt-cloud package is installed
class salt::cloud::install (
  $cloud_package_ensure = $salt::cloud::cloud_package_ensure,
  $cloud_package_name   = $salt::cloud::cloud_package_name,) inherits
salt::cloud {
  if defined(Package[$salt::cloud::cloud_package_name]) == false {
    package { $salt::cloud::cloud_package_name: ensure =>
      $salt::cloud::cloud_package_ensure, }
  }
}
