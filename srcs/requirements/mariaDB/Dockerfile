FROM debian:bullseye

EXPOSE 3306

RUN apt update ; apt upgrade ; apt install -y mariadb-server gettext

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY init.sql /usr/local/bin/init.sql

RUN mkdir /var/run/mysqld

RUN chown -R mysql:mysql /var/run/mysqld \
    ; chown -R mysql:mysql /var/lib/mysql

RUN chmod -R +x /var/lib/mysql

COPY run.sh /usr/local/bin/

WORKDIR /usr/local/bin/

ENTRYPOINT ["run.sh"]