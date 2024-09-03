#!/bin/sh

# while true; do
#     sleep 50
# done

# wait

# Read secrets
db_user1_password=$(cat /run/secrets/db_password)
db_admin_password=$(cat /run/secrets/db_root_password)

# Initialize the database
mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Start the MariaDB server without networking for security
mysqld_safe --skip-networking &

# Wait for the server to start
sleep 5

# Create WordPress database and users
mysql -e "CREATE DATABASE $DATABASE_NAME;"
mysql -e "CREATE USER '$WP_USER'@'%' IDENTIFIED BY '$db_user1_password';"
mysql -e "CREATE USER '$WP_ADMIN_USER'@'%' IDENTIFIED BY '$db_admin_password';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$WP_USER'@'%';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$WP_ADMIN_USER'@'%';"

# Create a new database user using the secrets
# mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
# mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;"
# mysql -e "FLUSH PRIVILEGES;"

# Optionally create a database
# mysql -e "CREATE DATABASE my_database;"

# Shutdown the server
mysqladmin shutdown

# Start MariaDB normally
exec mysqld_safe
