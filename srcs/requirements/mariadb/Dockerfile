FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server

# Expose the default MariaDB port
EXPOSE 3306
COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY	./tools/run.sh /tmp/

RUN	chmod +x /tmp/run.sh
RUN	mkdir -p /var/run/mysql
RUN	chmod 755 /var/run/mysql
RUN	chown -R mysql:mysql /var/run/mysql 


CMD	["sh", "/tmp/run.sh"]
