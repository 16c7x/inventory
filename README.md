# inverntory

This module creates an inventory file on the PE server listing all nodes connected to the orchestrator.

## Table of Contents

1. [Description](#description)
1. [Setup And Usage](#setup-and-usage)
1. [Limitations](#limitations)

## Description

The module will deploy a script to the PE server that will run every puppet run.
The script connects to the orchestrator/v1/inventory endpoint and returns a json object that contains all the nodes currently connected to the orchestrator. The json object is then written to a time stamped file. This happens every Puppet run.  

## Setup And Usage

To use the module classify the inventory class on the PE server.

```ruby
include inventory
```

The default output directory is ```/var/log/puppetlabs/inventory```, however this can be overridden in hiera, for example.

```yaml
---
inventory::output_dir: /var/log/puppetlabs/inventory
```

## Limitations

1. This module will only work on the PE server.
1. If another output directory is configured, the module will create that directory, but the parent directory must already exist.
