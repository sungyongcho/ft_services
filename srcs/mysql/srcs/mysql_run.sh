#!/bin/sh

mv /tmp/mariadb /etc/init.d/
mv /tmp/mariadb-server.cnf /etc/my.cnf.d/

rc-status && touch /run/openrc/softlevel && rc-service mariadb setup

mkdir /run/mysqld

mysqld --user=root --bootstrap < /tmp/mysql_init.sql
mysqld --user=root --console
