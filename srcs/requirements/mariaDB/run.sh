#!/bin/bash

mysqld_safe &

# Wait for MySQL to start up and become available
while ! mysqladmin ping --silent; do
	echo "Waiting for MySQL to start..."
	sleep 2
done

if ! mysql -u root -e "USE $MYSQL_DATABASE;" 2>/dev/null; then

	echo "MYSQL_DATABASE is not set! Creating DB and User"

	mysql -u root -e "CREATE DATABASE $MYSQL_DATABASE;"
	mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
	mysql -u root -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
	mysql -u root -e "FLUSH PRIVILEGES;"
fi

echo "MYSQL_DATABASE is set!"

wait