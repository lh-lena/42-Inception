FROM debian:buster

# PHP FPM
RUN	apt-get update && \
	apt-get install -y php7.3 \
	php-fpm \
	php-mysqli \
	curl \
	wget && \
	rm -rf /var/lib/apt/lists/*

# wordpress
RUN		set -eux; \
	version='6.6.1'; \
	curl -o wordpress.tar.gz -fL "https://wordpress.org/wordpress-$version.tar.gz"; \
	tar -xzf wordpress.tar.gz -C /usr/src/; \
	rm wordpress.tar.gz; \
	chown -R www-data:www-data /usr/src/wordpress

RUN mkdir -p /run/php

RUN sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = wordpress_inception:9000|' /etc/php/7.3/fpm/pool.d/www.conf

COPY	./tools/run.sh /tmp/
RUN		chmod +x /tmp/run.sh

CMD [ "sh", "/tmp/run.sh" ]
