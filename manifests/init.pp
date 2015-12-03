# this class will install the salt master, minion, cloud, api, syndic and ssh
# example for site.pp:
#   include salt
#
class puppet-salt {
  include 'puppet-salt::master'
  include 'puppet-salt::minion'
#  include 'puppet-salt::cloud'
#  include 'puppet-salt::api'
#  include 'puppet-salt::syndic'
#  include 'puppet-salt::ssh'
}
