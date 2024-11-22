FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y \
    php7.4-fpm php7.4-mysql wget unzip curl

COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

RUN mkdir -p /run/php

COPY script.sh .
RUN chmod +x script.sh

WORKDIR /var/www/html

RUN chmod -R +x /var/www/html && \
    chown -R www-data:www-data /var/www/html

# Download wordpress
# RUN wget https://wordpress.org/latest.zip && \
#     unzip latest.zip && \
#     rm -f latest.zip

ENTRYPOINT [ "../../../script.sh" ]

#CMD [ "/usr/sbin/php-fpm7.4 -F" ]