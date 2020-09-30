#!/bin/sh

WORDPRESS_LATEST_KR="wordpress_latest-ko_KR"
WORDPRESS_DBNAME='wordpress'
WORDPRESS_USERNAME='admin'
WORDPRESS_PASSWORD='password'

tar -xvf /tmp/${WORDPRESS_LATEST_KR}.tar.gz -C /www

chmod 777 -R /www/*

mv /www/wordpress/wp-config-sample.php /www/wordpress/wp-config.php

sed -i "s/database_name_here/${WORDPRESS_DBNAME}/" /www/wordpress/wp-config.php
sed -i "s/username_here/${WORDPRESS_USERNAME}/" /www/wordpress/wp-config.php
sed -i "s/password_here/${WORDPRESS_PASSWORD}/" /www/wordpress/wp-config.php
sed -i "s/localhost/mysql/" /www/wordpress/wp-config.php

php -S 0.0.0.0:5050 -t /www/wordpress
