FROM debian:buster

RUN apt-get update && \
    apt-get install -y adminer php php-cli  && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html && \
    ln -s /usr/share/adminer/adminer.php /var/www/html/index.php

EXPOSE 8080
#php-json php-mbstring

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]
