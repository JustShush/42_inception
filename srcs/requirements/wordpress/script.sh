#!/bin/bash

chmod u+w .

cd /var/www/html
rm -rf /var/www/html/*

if [ ! -f "./wp-cli.phar" ]; then

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar

fi

mv ./wp-cli.phar /usr/local/bin/wp

if [ ! -f ./wp-config.php ]; then

	wp core download --allow-root

	wp config create \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--allow-root \
		--force || ls -a

	wp core install --url=$DOMAIN_NAME \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_A_PASS \
		--admin_email=$ADMIN_EMAIL \
		--allow-root || { echo "Error: wp core install failed"; exit 1; }

	echo passed!

	# Check if the user already exists
	if ! wp user get $WP_USER --allow-root &> /dev/null; then
		wp user create $WP_USER $USER_EMAIL \
			--user_pass=$WP_U_PASS \
			--allow-root
	else
		echo "User '$WP_USER' already exists, skipping creation."
	fi

fi

php-fpm7.4 -F