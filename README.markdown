# RRD

This is a Puppet Module for installing and configuring the [Round Robin Database](http://oss.oetiker.ch/rrdtool/) tools, cache, and bindings.

[![Build Status](https://travis-ci.org/nesi/puppet-rrd.png)](https://travis-ci.org/nesi/puppet-rrd)

## Purpose

_Why should there be a Puppet module for installing something as simple as RRD?_

This module is mostly to cover dependencies when creating Puppet Modules for *other* tools or application that use RRD (e.g. Ganglia, Nagios, Cacti, etc). RRD is an application in it's own right and should be described independently.

The objective with this module is to provide a safe and consistently managed installation of RRD that can be depended on by other services and applications.

# Dependencies

No dependencies on other Puppet Modules

# Usage

## Install RRD libraries

To only install the RRD libraries:

```puppet
include rrd
```

**Note:** as the libraries are dependencies for the other RRD packages (`rrdtool` and `rrdcached`) the `rrd` class is _not_ required by the other classes. It is simply for a lightweight RRD install.

## Install the RRD tools

To install the RRD tools (a.k.a. `rrdtool`):

```puppet
include rrd::tool
```

## Default install the RRD cache daemon

For the default install of the RRD cache daemon (a.k.a. `rrdcached`):

```puppet
include rrd::cache
```

## Customised install of the RRD cache daemon

The `rrd::cache` class has the following parameters:

* *service*: The `enable` parameter for the `rrdcached` service. Default is 'running'.
* *gid*: the group ID that the `rrdcached` runs under. Default is undefined, which uses system default.
* *listen*: the Unix socket that `rrcached` listens on. Defaults to 'unix:/var/run/rrdcached.sock'
* *journal_dir*: The path where `rrcached` stores the cache journal. Defaults to '/var/lib/rrdcached/journal/'
* *timeout*: Default is '1800'.
* *delay*: Default is '1800'
* *write_threads*: Default is '4'
* *jump_dir*: Default is '/var/lib/rrdcached/db/'
* *always_flush*: Default is true
* *enable_corefiles*: Default is false
* *restrict_writes*: Default is false
* *maxwait*: Default is '30'
* *conf_file*: The path to the `rrdcached` configuration file. Default is set approprately for operating system family.
* *service_name*: The name of the `rrdcached` service. Default is set approprately for operating system family.

## Install RRD language bindings

The module will install the RRD language bindings for Perl, PHP, Python, Ruby, and tcl. Install them in the following form, just replace the language name as appropriate:

```puppet
include rrd::bindings::perl
```

# References

This module uses the following modules for inspiration and reused code:

* [pari-/puppet-rrdcached](https://github.com/pari-/puppet-rrdcached)
* [ScarceMedia/puppet-rrdtool](https://github.com/ScarceMedia/puppet-rrdtool)
* [UCSD-ANF/puppet-rrdtool](https://github.com/UCSD-ANF/puppet-rrdtool)

# Attribution

This module is derived from the puppet-blank module by Aaron Hicks (aethylred@gmail.com)

* https://github.com/Aethylred/puppet-blank

This module has been developed for the use with Open Source Puppet (Apache 2.0 license) for automating server & service deployment.

* http://puppetlabs.com/puppet/puppet-open-source/

# Licensing

This file is part of the rrd Puppet module.

Licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)
