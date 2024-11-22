FROM debian:bullseye

EXPOSE 3306

RUN apt update ; apt upgrade ; apt install -y mariadb-server

COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY init.sql /usr/local/bin/init.sql

# Create necessary directories and set permissions
RUN mkdir -p /var/run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql && \
    chown -R mysql:mysql /run/mysqld && \
    chmod -x /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the run script that will start the MariaDB server
COPY run.sh /usr/local/bin/run.sh

# Make sure the run script has execution permissions
RUN chmod +x /usr/local/bin/run.sh

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

RUN chown -R mysql:mysql /var/lib/mysql /run/mysqld

RUN chmod -R +x /var/lib/mysql

WORKDIR /usr/local/bin/

ENTRYPOINT ["run.sh"]