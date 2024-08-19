FROM debian:latest

RUN apt-get update && \
    apt-get install -y \
    mariadb-server \
    mariadb-client && \
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

# Expose the default MariaDB port
EXPOSE 3306


