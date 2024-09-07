#!/bin/sh

mysql
. /run/secrets/db_password;
. /run/secrets/db_root_password;
# sleep 10
mysql -e "CREATE DATABASE IF NOT EXISTS $db_name;"
mysql -e "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_password';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$db_user'@'%' WITH GRANT OPTION;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY $db_root_password;"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$db_root_password shutdown
# exec mysqld
exec /usr/bin/mysqld_safe