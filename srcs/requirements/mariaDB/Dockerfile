FROM debian:bullseye

EXPOSE 3306

RUN apt update ; apt upgrade ; apt install -y mariadb-server

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/.
COPY init.sql /etc/mysql/init.sql

RUN mkdir /run/mysqld

CMD ["mysqld_safe"]

# RUN ['run']