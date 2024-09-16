#!/bin/bash

cd /var/www/html/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sleep 20
. /run/secrets/db_password
. /run/secrets/db_root_password
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname="$db_name" --dbuser="$db_user" --dbpass="$db_password" --dbhost="$db_host":3306 --path="/var/www/html" --allow-root
./wp-cli.phar core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$db_admin_user" --admin_password="$db_root_password" --admin_email="$db_admin_email" --allow-root
echo "\t --- FINISHED ---- ./wp-cli.phar"

sed -i "/^\/\* That's all, stop editing! Happy publishing. \*\//i define( 'REDIS_TIMEOUT', 1 );\n\
			define('WP_REDIS_HOST', 'redis');\n\
			define('WP_REDIS_PORT', '6379');\n\
			define( 'WP_REDIS_DATABASE', 0 );\n\
			define( 'WP_REDIS_TIMEOUT', 1 );\n\
			define( 'WP_REDIS_READ_TIMEOUT', 1 );" /var/www/html/wp-config.php

cat wp-config.php | grep REDIS

/usr/sbin/php-fpm7.3 -F
