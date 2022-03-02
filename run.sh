#!/bin/bash

# add a master public key to authorized_keys on host in order to allow SSH connections
cat /var/ansible_keys/master_key.pub >> /root/.ssh/authorized_keys

# start SSH server
/usr/sbin/sshd -D
