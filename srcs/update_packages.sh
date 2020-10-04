#!/bin/sh

##### PHPMYADMIN
PHPMYADMIN_DATA="$(wget https://www.phpmyadmin.net/home_page/version.txt -q -O-)"
PHPMYADMIN_URL="$(echo $PHPMYADMIN_DATA | cut -d ' ' -f 3)"
PHPMYADMIN_VER="$(echo $PHPMYADMIN_DATA | cut -d ' ' -f 1)"
BLOWFISH_SECRET="$2a$07$9lJ5Lk9twd6VCfcOWcKks.1mL480f0KtgY7XLM5elIjUhhvoCj/na"

if [[ ! -f ./srcs/phpmyadmin/srcs/phpMyAdmin-${PHPMYADMIN_VER}-all-languages.tar.gz ]]; then

	rm -rf ./srcs/phpmyadmin/srcs/*.tar.gz
	wget -c https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN_VER}/phpMyAdmin-${PHPMYADMIN_VER}-all-languages.tar.gz -P ./srcs/phpmyadmin/srcs/

fi

##### WORDPRESS
WORDPRESS_LATEST_KR="ko.wordpress.org/latest-ko_KR.tar.gz"

if [[ ! -f ./srcs/wordpress/srcs/wordpress_latest-ko_KR.tar.gz ]]; then
	rm -rf ./srcs/wordpress/srcs/*.tar.gz
	wget -O ./srcs/wordpress/srcs/wordpress_latest-ko_KR.tar.gz -c https://${WORDPRESS_LATEST_KR}
fi
