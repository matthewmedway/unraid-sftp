#!/bin/bash
set -ex

pass=$(mkpasswd -m sha-512 -s $password) && \
useradd -m -s /usr/bin/mysecureshell -p $pass $username -d /data
mkdir -p /sshkeys/$username
echo "$publickey" > /sshkeys/$username/authorized_keys

exec "$@"