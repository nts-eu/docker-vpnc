#!/bin/bash

# turn on bash's job control
set -m

# Start vpnc and put to background
vpnc --no-detach&

# Start the sshd process
mkdir /run/sshd
/usr/sbin/sshd -D&

# now we bring the primary process back into the foreground
# and leave it there
fg %1
