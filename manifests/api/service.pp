# this class will make sure that the salt-api service
# is the the right state.
class salt::api::service (
  $api_service_name   = $salt::api::api_service_name,
  $api_service_ensure = $salt::api::api_service_ensure,
  $api_service_manage = $salt::api::api_service_manage,
  $api_service_enable = $salt::api::api_service_enable,) inherits
salt::api {
  # test for wrong variable
  if !($api_service_ensure in ['running', 'stopped']) {
    fail('service_ensure parameter must be running or stopped')
  }

  # ensure service that is defined in salt::params is
  # managed and in the the right state.
  if $api_service_manage == true {
    service { $api_service_name:
      ensure     => $api_service_ensure,
      enable     => $api_service_enable,
      name       => $api_service_name,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
