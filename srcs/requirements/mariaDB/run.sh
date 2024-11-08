#!/bin/bash

mysqld_safe &

# Wait for MySQL to start up and become available
until mysqladmin ping --silent; do
    echo "Waiting for MySQL to start..."
    sleep 2
done

if [ ! -d "/var/run/mysqld/$MYSQL_DATABASE" ]; then

    if [ -z "$MYSQL_DATABASE" ]; then
        echo "MYSQL_DATABASE is not set!"
        exit 1
    fi

    # envsubst just expands the env vars.
    envsubst < init.sql > tempInit.sql
    mysql -u root < tempInit.sql
fi
wait