CREATE DATABASE IF NOT EXISTS db_name;
CREATE USER IF NOT EXISTS 'db_user'@'%' IDENTIFIED BY 'db_password';
GRANT ALL PRIVILEGES ON *.* TO 'db_user'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'db_user'@'%';
ALTER USER 'root'@'%' IDENTIFIED BY 'db_root_password';
FLUSH PRIVILEGES;
