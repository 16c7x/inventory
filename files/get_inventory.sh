#!/bin/bash

curl --cacert /etc/puppetlabs/puppet/ssl/certs/ca.pem --cert /etc/puppetlabs/puppet/ssl/certs/$(puppet config print server).pem --key /etc/puppetlabs/puppet/ssl/private_keys/$(puppet config print server).pem https://$(puppet config print server):8143/orchestrator/v1/inventory