#!/bin/sh

#remove any stale MySQL PID files
rm -f /var/run/mysql/*.pid

service mysql start

# Wait for MySQL to be fully ready
until mysqladmin ping >/dev/null 2>&1; do
    echo "Waiting for MySQL to be ready..."
    sleep 3
done

. /run/secrets/db_password
. /run/secrets/db_root_password

if [ -z "$db_password" ] || [ -z "$db_root_password" ]; then
  echo "Error: Missing database credentials."
  exit 1
fi

mysql -u root -p"test"<< _EOF
CREATE DATABASE IF NOT EXISTS $db_name;
CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_password';
GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$db_root_password' WITH GRANT OPTION;
FLUSH PRIVILEGES;
_EOF

service mysql stop
sleep 5

exec "$@"
