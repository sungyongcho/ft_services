#!/bin/sh

mkdir -p /etc/ssl/private
mkdir -p /etc/ssl/certs

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=KO/ST=Seoul/L=Gaepodong/O=42Seoul/CN=ft_services"	-keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

mkdir -p /var/ftp

adduser -D -h /var/ftp admin
echo "admin:password" | chpasswd

rc-status && touch /run/openrc/softlevel && rc-service vsftpd start

vsftpd /etc/vsftpd/vsftpd.conf
