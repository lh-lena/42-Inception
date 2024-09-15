#!/bin/bash

cd /var/www/html/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
# sleep 10
. /run/secrets/db_password
. /run/secrets/db_root_password
./wp-cli.phar core download --allow-root
echo "./wp-cli.phar core download --allow-root"
./wp-cli.phar config create --dbname="$db_name" --dbuser="$db_user" --dbpass="$db_password" --dbhost="$db_host":3306 --path="/var/www/html" --allow-root
echo "./wp-cli.phar config create --dbname="$db_name" --dbuser="$db_user" --dbpass="$db_password" --dbhost="$db_host":3306 --path="/var/www/html" --allow-root"
./wp-cli.phar core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$db_root_password" --admin_email="$WP_ADMIN_EMAIL" --allow-root
echo "./wp-cli.phar core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_USER" --admin_password="$db_root_password" --admin_email="$WP_ADMIN_EMAIL" --allow-root"
echo "\t --- FINISHED ---- ./wp-cli.phar"
/usr/sbin/php-fpm7.3 -F
