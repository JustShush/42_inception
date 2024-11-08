FROM debian:bullseye

EXPOSE 3306

RUN apt update ; apt upgrade ; apt install -y mariadb-server gettext

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY init.sql /usr/local/bin/init.sql

RUN mkdir /var/run/mysqld

RUN chown -R mysql:mysql /var/run/mysqld
RUN chmod -R +x /var/run/mysqld

COPY run.sh /usr/local/bin/

WORKDIR /usr/local/bin/

ENTRYPOINT ["run.sh"]