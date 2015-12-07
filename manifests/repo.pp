# this class will only install the salt repo file
# example:
# class { 'salt::repo': }
#
class salt::repo (
  $repo_file_manage                       = $salt::params::repo_file_manage,
  $repo_file                              = $salt::params::repo_file,
  $repo_file_template                     = $salt::params::repo_file_template,)
inherits salt::params {
  include 'salt::repo::config'

  # Anchor this as per #8140 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'salt::repo::begin': }
  anchor { 'salt::repo::end': }

  Anchor['salt::repo::begin'] ->
    Class['salt::repo::config'] ->
  Anchor['salt::repo::end']
}
