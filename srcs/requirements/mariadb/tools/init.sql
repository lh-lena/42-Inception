-- Read secrets
db_user1_password=$(cat /run/secrets/db_password)
db_admin_password=$(cat /run/secrets/db_root_password)

-- Create WordPress database and users
CREATE DATABASE $DATABASE_NAME;
CREATE USER '$WP_USER'@'%' IDENTIFIED BY '$db_user1_password';
CREATE USER '$WP_ADMIN_USER'@'%' IDENTIFIED BY '$db_admin_password';
GRANT ALL PRIVILEGES ON *.* TO '$WP_USER'@'%'; //WITH GRANT OPTION
GRANT ALL PRIVILEGES ON *.* TO '$WP_ADMIN_USER'@'%'; //WITH GRANT OPTION
FLUSH PRIVILEGES;