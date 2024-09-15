#!/bin/sh

service mysql start

. /run/secrets/db_password
. /run/secrets/db_root_password
mysql -u root -p'test'  << _EOF
CREATE DATABASE IF NOT EXISTS $db_name;
CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '${db_password}';
GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${db_root_password}' WITH GRANT OPTION;
FLUSH PRIVILEGES;
SELECT User, Host FROM mysql.user;
_EOF

service mysql stop
sleep 5
exec "$@"