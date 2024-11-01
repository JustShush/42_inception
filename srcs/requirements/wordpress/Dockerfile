FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y \
    php7.4-fpm wget unzip

COPY www.conf /etc/php/7.4/fpm/pool.d

RUN mkdir -p /run/php

WORKDIR /var/www/html

RUN chmod -R +x /var/www/html ; chown -R www-data:www-data /var/www/html

# Download wordpress
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    rm -f latest.zip

CMD ["php-fpm7.4", "-F"]