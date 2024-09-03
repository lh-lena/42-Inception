FROM debian:buster

# PHP FPM
RUN apt-get update && \
    apt-get install php-fpm php-mysql -y

RUN apt-get install curl -y

# RUN wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add -
# RUN echo "deb https://packages.sury.org/php/ buster main" | tee /etc/apt/sources.list.d/php.list

COPY ./tools/run.sh /tmp/
COPY ./conf/wp-config.php /var/www/html/
# COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# RUN	chmod +x /tmp/wp-config.php

RUN	chmod +x /var/www/html/wp-config.php

RUN	chmod +x /tmp/run.sh

CMD ["sh", "/tmp/run.sh"]

#Make sure php7.4-fpm is running
# sudo systemctl status php7.4-fpm

# https://github.com/MansoorMajeed/devops-from-scratch/blob/master/episodes/28-setting-up-wordpress-nginx-php-fpm.md

#The www.conf file is typically found in /etc/php/7.3/fpm/pool.d/ within the container.

# Starting the Service
# /usr/sbin/php-fpm7.3 -F
