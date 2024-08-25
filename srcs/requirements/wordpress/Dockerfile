FROM debian:buster

# PHP FPM
RUN apt-get update && \
    apt-get install -y \
    apt-get install gnupg2

RUN wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add -
RUN echo "deb https://packages.sury.org/php/ buster main" | tee /etc/apt/sources.list.d/php.list
RUN apt-get update
RUN apt-get install php7.4-fpm 
#php7.4-common php7.4-mysql \
#    php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd \
#    php7.4-imagick php7.4-cli php7.4-dev  \
#    php7.4-mbstring php7.4-opcache  \
#    php7.4-soap php7.4-zip -y
#
#Note: You may not need all of these php packages, but these are the most commonly used Feel free to skip the ones you know you don't need

#Make sure php7.4-fpm is running
# sudo systemctl status php7.4-fpm

# https://github.com/MansoorMajeed/devops-from-scratch/blob/master/episodes/28-setting-up-wordpress-nginx-php-fpm.md

