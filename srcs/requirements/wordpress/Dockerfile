FROM debian:buster

# PHP FPM
RUN	apt-get update && \
	apt-get install -y php7.3 \
	php-fpm \
	php-mysqli \
	curl \
	wget && \
	rm -rf /var/lib/apt/lists/*

# ARG MARIADB_VERSION=11.6.1
# ENV MARIADB_VERSION=$MARIADB_VERSION

# wordpress
RUN		set -eux; \
	version='6.6.1'; \
	curl -o wordpress.tar.gz -fL "https://wordpress.org/wordpress-$version.tar.gz"; \
	tar -xzf wordpress.tar.gz -C /usr/src/; \
	rm wordpress.tar.gz; \
	chown -R www-data:www-data /usr/src/wordpress

RUN mkdir -p /run/php

RUN sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = wordpress:9000|' /etc/php/7.3/fpm/pool.d/www.conf

# RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp
# RUN sleep 10
# WORKDIR /var/www/html/
# RUN wp core download --allow-root
# RUN wp config create \
# 	--dbname=mariadb \
# 	--dbuser=wordpress \
# 	--dbpass=cN9Wz6RgF812GUt2GmdcgFIaq3VhxyfAUXcWB9jfnDQ \
# 	--dbhost=mariadb:3306 \
# 	--path=/usr/src/wordpress \
# 	--allow-root
# RUN wp core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root

COPY	./tools/run.sh /tmp/
RUN		chmod +x /tmp/run.sh


CMD [ "sh", "/tmp/run.sh" ]


#Make sure php7.4-fpm is running
# sudo systemctl status php7.4-fpm

# https://github.com/MansoorMajeed/devops-from-scratch/blob/master/episodes/28-setting-up-wordpress-nginx-php-fpm.md
# https://developer.wordpress.org/advanced-administration/before-install/howto-install/

