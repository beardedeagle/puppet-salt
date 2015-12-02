# this class will install the salt master, minion, cloud, api, syndic and ssh
# example for site.pp:
#   include salt
#
class salt {
  include 'salt::master'
  include 'salt::minion'
  include 'salt::cloud'
  include 'salt::api'
  include 'salt::syndic'
  include 'salt::ssh'
}
