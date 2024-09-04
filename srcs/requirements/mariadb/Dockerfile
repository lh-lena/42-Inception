FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server

# Expose the default MariaDB port
EXPOSE 3306

# Update the bind-address in the MariaDB configuration file
# RUN sed -i "s/^bind-address\s*=.*$/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

# # Alternatively, add the line if it doesn't exist
# RUN echo "bind-address = 0.0.0.0" >> /etc/mysql/mariadb.conf.d/50-server.cnf


# ENV MARIADB_ROOT_PASSWORD="4tzj2PrdUM9mIenIbU7nKz4XFIs8d2rwMocPBd44xOs="
# ENV MARIADB_DATABASE="mariadb"
# ENV MARIADB_USER="wordpress"
# ENV MARIADB_PASSWORD="cN9Wz6RgF812GUt2GmdcgFIaq3VhxyfAUXcWB9jfnDQ="

# current password for root to connect local MySQL through socket '/var/run/mysqld/mysqld.sock' -> mysql

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/init.sql /etc/mysql/init.sql

# RUN chown -R mysql:mysql /tmp/
# RUN	chmod +x /tmp/run.sh

RUN	mkdir /run/mysql

# USER	mysql

# CMD ["sh", "/tmp/run.sh"]
CMD ["mysqld"]
#https://medium.com/@ssterdev/inception-42-project-part-ii-19a06962cf3b