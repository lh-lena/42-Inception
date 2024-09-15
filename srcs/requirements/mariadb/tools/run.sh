#!/bin/sh

# mysql
# . /run/secrets/db_password;
# . /run/secrets/db_root_password;
# # sleep 10
# mysql -e "CREATE DATABASE IF NOT EXISTS $db_name;"
# mysql -e "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_password';"
# mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$db_user'@'%' WITH GRANT OPTION;"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY $db_root_password;"
# mysql -e "FLUSH PRIVILEGES;"
# mysqladmin -u root -p$db_root_password shutdown
# # exec mysqld
# exec /usr/bin/mysqld_safe

service mysql start
# echo "test"
# id mysql
mysql_secure_installation << _EOF_

Y
root4life
root4life
Y
n
Y
Y
_EOF_
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf
# echo "test2"
# mysqladmin ping -h localhost

# Create Database and User
# DB_NAME="mydatabase"
# DB_USER="myuser"
# DB_PASS="mypassword"

# ALTER USER 'root'@'%' IDENTIFIED BY ${db_root_password};
. /run/secrets/db_password
. /run/secrets/db_root_password
# echo test3
mysql -u root -p'root4life' << EOF
CREATE DATABASE IF NOT EXISTS ${DATABASE_NAME};
CREATE USER IF NOT EXISTS '${WP_USER}'@'%' IDENTIFIED BY '${db_password}';
GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${WP_USER}'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${db_root_password}' WITH GRANT OPTION;
FLUSH PRIVILEGES;
SELECT User, Host FROM mysql.user;
EOF

# mysql -u root -p'root4life' << EOF
# CREATE DATABASE IF NOT EXISTS test_db_name;
# CREATE USER IF NOT EXISTS 'wordpress'@'%' IDENTIFIED BY 'password';
# GRANT ALL PRIVILEGES ON test_db_name.* TO 'wordpress'@'%' WITH GRANT OPTION;
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'db_root_password' WITH GRANT OPTION;
# FLUSH PRIVILEGES;
# SELECT User, Host FROM mysql.user;
# EOF

echo "!!!! Database ${DATABASE_NAME} and user ${WP_USER} created successfully."

# Restart MariaDB to apply any configuration changes
service mysql restart
# service mysql stop
# sleep 2
# service mysql start

echo "service mysql status"
service mysql status

echo "2 Database ${DATABASE_NAME} and user ${WP_USER} by ${db_password} created successfully."
#exec mysqld
exec /usr/bin/mysqld --user=root --port=3306
