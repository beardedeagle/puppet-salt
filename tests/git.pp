# install git packages instead of regular

class { 'puppet-salt::minion': minion_package_name => 'salt-minion-git', }
class { 'puppet-salt::master': master_package_name => 'salt-master-git', }
