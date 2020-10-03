#!/bin/sh

ssh-keygen -A
adduser --disabled-password sucho
echo "sucho:sucho" | chpasswd

rc-status && touch /run/openrc/softlevel
rc-service sshd start

nginx -g "daemon off;"
