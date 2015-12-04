# this class will make sure that the salt-syndic service
# is the the right state.
class salt::syndic::service (
  $syndic_service_name   = $salt::syndic::syndic_service_name,
  $syndic_service_ensure = $salt::syndic::syndic_service_ensure,
  $syndic_service_manage = $salt::syndic::syndic_service_manage,
  $syndic_service_enable = $salt::syndic::syndic_service_enable,) inherits
salt::syndic {
  # test for wrong variable
  if !($syndic_service_ensure in ['running', 'stopped']) {
    fail('service_ensure parameter must be running or stopped')
  }

  # ensure service that is defined in salt::params is
  # managed and in the the right state.
  if $syndic_service_manage == true {
    service { $syndic_service_name:
      ensure     => $syndic_service_ensure,
      enable     => $syndic_service_enable,
      name       => $syndic_service_name,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
