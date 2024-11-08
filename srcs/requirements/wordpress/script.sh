#!/bin/bash
echo 'adasdasdasdasdasdasdasdasdakhbsflkhflKAJhfLKSD'

cd /var/www/html

#pwd
ls

if [ ! -f "wp-cli.phar" ]; then

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar

	./wp-cli.phar core download --allow-root
	./wp-cli.phar config create --dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb:3306 \
		--allow-root
	./wp-cli.phar core install --url=$DOMAIN_NAME \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN \
		--admin_password=$WP_A_PASS \
		--admin_email=$ADMIN_EMAIL \
		--allow-root

	./wp-cli.phar user create $WP_USER $USER_EMAIL \
		--user_pass=$WP_U_PASS \
	--allow-root

fi