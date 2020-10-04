#!/bin/sh

WORDPRESS_LATEST_KR="wordpress_latest-ko_KR"

tar -xvf /tmp/${WORDPRESS_LATEST_KR}.tar.gz -C /www

chmod 777 -R /www/*

php -S 0.0.0.0:5050 -t /www/wordpress
