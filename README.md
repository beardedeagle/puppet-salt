#puppet-salt [![Build Status](https://travis-ci.org/beardedeagle/puppet-salt.svg)](https://travis-ci.org/beardedeagle/puppet-salt)

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with salt](#setup)
    * [What salt affects](#what-salt-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with salt](#beginning-with-salt)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

# salt Puppet Module

Manage salt server, client, cloud, api, syndic and ssh via Puppet.

##Module Description

This module can be used to install a single salt master, minion, cloud, api, syndic, ssh or all on one machine.

##Setup

###What salt affects

 * salt master/minion/cloud/api/syndic/ssh package.
 * salt master/minion/cloud/api/syndic/ssh configuration files.
 * salt master/minion/api/syndic service.

###Beginning with salt

Just add manifest:

```puppet
include salt
```

Or if you want to change params you need to include the underlying modules:

```puppet
class { 'salt::minion': minion_package_name => 'salt-minion-git', }
class { 'salt::master': master_package_name => 'salt-master-git', }
```

##Usage

All interaction with the salt module can be done through
the main salt class. All services EXCEPT salt-minion rely
on salt-master and will be installed along side whatever
additional service you specify.

###I just want salt, what's the minimum I need?

```puppet
include '::salt'
```

###I just want a salt minion?

```puppet
include '::salt::minion'
```

###I just want a salt master?

this will install a salt master and a minion for itself.

```puppet
include '::salt::master'
```

##Reference

###Classes
 * 'salt': Main class, includes all the rest.
 * 'salt::minion': Handles salt-minion.
 * 'salt::master': Handles salt-master.
 * 'salt::cloud': Handles salt-cloud.
 * 'salt::api': Handles salt-api.
 * 'salt::syndic': Handles salt-syndic.
 * 'salt::ssh': Handles salt-ssh.
 * 'salt::params': all parameters needed for the rest.

##Limitations

This module has been built on and tested against CentOS >= 5, Puppet >= 3.8.4 and Ruby >=2.0.0.
