FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server && \
	rm -rf /var/lib/apt/lists/*
    
# Expose the default MariaDB port
EXPOSE 3306

RUN	mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld  && \
	chmod -R 755 /var/run/mysqld 

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
# COPY	./conf/init.sql /etc/mysql/init.sql
COPY	./tools/run.sh /tmp/
RUN	chmod +x /tmp/run.sh
# RUN chown -R mysql:mysql /var/lib/mysql && \
# 	chown -R mysql:mysql /etc/mysql 

# USER mysql


CMD	[ "/tmp/run.sh", "mysqld_safe"]
