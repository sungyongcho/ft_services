#!/bin/sh

mv /tmp/mariadb /etc/init.d/
chmod 444 /tmp/mariadb-server.cnf
mv /tmp/mariadb-server.cnf /etc/my.cnf.d/

rc-status && touch /run/openrc/softlevel && rc-service mariadb setup

if [[ ! -d /run/mysqld ]]; then
	mkdir /run/mysqld
fi

mysqld --user=root --bootstrap < /tmp/mysql_init.sql
mysqld --user=root --console
