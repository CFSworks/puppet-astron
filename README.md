# astron

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with astron](#setup)
    * [What astron affects](#what-astron-affects)
    * [Beginning with astron](#beginning-with-astron)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module allows the configuration, and management of
[Astron](https://github.com/Astron/Astron) through Puppet.

## Module Description

The puppet-astron module is currently being developed under Debian 8 only;
while I'd love to see support for other operating systems, that is currently
out of my scope because I don't have a need for it yet. PRs welcome!

## Setup

### What astron affects

* This module currently does not *install* the Astron package. Bring your own
  `astrond`!
* This module **will** create a service file for you and generally manage
  everything else.
* You will have to make sure that astrond is on the system PATH. I suggest
  installing it into `/usr/local/bin`.

### Beginning with astron

Simply install this into your Puppet modules path and begin with an example
like
```
include astron

astron::daemon { 'my_daemon':
    ensure     => running,

    bind_ip    => '127.0.0.1:7199',
    connect_ip => 'upstream-server',

    dcfiles    => ['/etc/astron/my_daemon/dc1.dc'],
}

astron::role::clientagent { 'ca1':
    bind_ip     => '0.0.0.0:7198',
    version     => 'my_cluster',

    channel_min => 100100,
    channel_max => 100999,
}
```

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

* This is Debian 8 only.
* This will not install astrond. It *will* install a service unit. This will be
  incompatible with a future official package.

## Development

Pull requests are welcome at [GitHub](https://github.com/CFSworks/puppet-astron)!
