#!/bin/bash
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
echo $DB_NAME
./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PASS --dbhost=$DB_HOST --allow-root
./wp-cli.phar core install --url=$URL --title=$TITLE --admin_user=$WP_USER1 --admin_password=$WP_USER1_PASS --admin_email=$WP_USER1_EMAIL --allow-root
./wp-cli.phar user create $WP_USER2 $WP_USER2_EMAIL --user_pass=$WP_USER2_PASS --allow-root

php-fpm7.4 -F