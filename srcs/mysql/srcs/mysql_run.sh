#!/bin/sh

mv /tmp/mariadb /etc/init.d/
mv /tmp/mariadb-server.cnf /etc/my.cnf.d/

rc-status && touch /run/openrc/softlevel && rc-service mariadb setup

mkdir /run/mysqld
mkdir /etc/telegraf

mysqld --user=root --bootstrap < /tmp/mysql_init.sql
telegraf --config /etc/telegraf.conf && mysqld --user=root --console
