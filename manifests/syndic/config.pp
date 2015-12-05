# this class is used to configure the salt syndic config file
class salt::syndic::config (
  $syndic_config_manage                   = $salt::syndic::syndic_config_manage,
  $syndic_config                          = $salt::syndic::syndic_config,
  $syndic_config_template                 = $salt::syndic::syndic_config_template,
  $syndic_order_masters                   = $salt::syndic::syndic_order_masters,
  $syndic_syndic_master                   = $salt::syndic::syndic_syndic_master,
  $syndic_syndic_master_port              = $salt::syndic::syndic_syndic_master_port,
  $syndic_syndic_pidfile                  = $salt::syndic::syndic_syndic_pidfile,
  $syndic_syndic_log_file                 = $salt::syndic::syndic_syndic_log_file,
  $syndic_id                              = $salt::syndic::syndic_id,
  $syndic_syndic_wait                     = $salt::syndic::syndic_syndic_wait,)
inherits salt::syndic {
  # installs the syndic config file defined in salt::params
  file { $syndic_config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0664',
    content => template($syndic_config_template),
    replace => $syndic_config_manage,
  }
}
