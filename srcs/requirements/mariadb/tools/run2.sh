#!/bin/sh

# mysql_install_db --skip-test-db
mariadb -V
which mariadb
. /run/secrets/db_password;
. /run/secrets/db_root_password;

# sed -i 's|.*bind-address\*s=.*|bind-address=0.0.0.0|g' /etc/mysql/mariadb.conf.d/50-server.cnf
# sed -i 's|db_name|'$db_name'|g' /etc/mysql/init.sql
# sed -i 's|db_user|'$db_user'|g' /etc/mysql/init.sql
# sed -i 's|db_password|'$db_password'|g' /etc/mysql/init.sql
# sed -i 's|db_root_password|'$db_root_password'|g' /etc/mysql/init.sql
# echo "Check mysqladmin"
# mysqladmin ping -h localhost
# echo "Check DATABASE"

# if [ -d "/var/lib/mysql/$db_name" ]

# then
#   echo "Database already exists."
#   mysqld_safe

# else
#   echo "mysql_install_db"
#   mysql_install_db --user=mysql --datadir=/var/lib/mysql
#   echo "echo mysqld mysql "
#   # mysqld --user=mysql --console 
#   mysqladmin ping -h localhost
#   echo "  echo "echo mysqld mysql""
#   mysql
#   SELECT User, Host FROM mysql.user

# fi

# exec "$@"

#Check if the database exists

# if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
# then 

#  echo "Database already exists"
# else

# Set root option so that connexion without root password is not possible

# service mysql start
# mysql
# . /run/secrets/db_password;
# . /run/secrets/db_root_password;
# mysql -e "CREATE DATABASE IF NOT EXISTS $db_name;"
# mysql -e "CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_password';"
# mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$db_user'@'localhost';"
# mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$db_user'@'%';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$db_root_password';"
# mysql -e "FLUSH PRIVILEGES;"
# mysqladmin -u root -p$db_root_password shutdown

# exec mysqld
# exec mysqld_safe
