FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server

# Expose the default MariaDB port
EXPOSE 3306
COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY	./tools/run.sh /tmp/

RUN	chmod +x /tmp/run.sh
# RUN	chmod +x /etc/mysql/mariadb.conf.d/50-server.cnf
RUN	mkdir -p /run/mysqld
RUN	chmod -R 755 /run/mysqld
RUN	chown -R mysql:mysql /run/mysqld


CMD	["sh", "/tmp/run.sh"]
