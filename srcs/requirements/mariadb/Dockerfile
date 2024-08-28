FROM debian:buster

RUN apt-get update && \
    apt-get install -y \
    mariadb-server

    # mariadb-client && \
    # apt-get clean &&\
    # rm -rf /var/lib/apt/lists/*
# Expose the default MariaDB port
EXPOSE 3306

RUN mkdir -p /var

ENV MARIADB_ROOT_PASSWORD="4tzj2PrdUM9mIenIbU7nKz4XFIs8d2rwMocPBd44xOs="
ENV MARIADB_DATABASE="mariadb"
ENV MARIADB_USER="wordpress"
ENV MARIADB_PASSWORD="cN9Wz6RgF812GUt2GmdcgFIaq3VhxyfAUXcWB9jfnDQ="

# RUN mysql_secure_installation  --password="4tzj2PrdUM9mIenIbU7nKz4XFIs8d2rwMocPBd44xOs="
# current password for root to connect local MySQL through socket '/var/run/mysqld/mysqld.sock' -> mysql



COPY run.sh /tmp

CMD ["sh"]
