#!/bin/bash
set -e

#check if user already exists
if id "$username" >/dev/null 2>&1; then
    #on docker restart
    echo "User exists"
else
    #on docker run
    pass=$(mkpasswd -m sha-512 -s "$password") && \
    useradd -m -s /usr/bin/mysecureshell -p "$pass" "$username" -d /data &> /dev/null
    mkdir -p /sshkeys/"$username"
    echo "$publickey" > /sshkeys/"$username"/authorized_keys
fi

exec "$@"