#!/bin/bash

if [ ! -f ./var/www/html/wp-config.php ]
then
    cd /var/www/html
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    ./wp-cli.phar core download --allow-root
    ./wp-cli.phar config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PASS --dbhost=$DB_HOST --allow-root
    ./wp-cli.phar core install --url=$DOMAIN_NAME --title=$TITLE --admin_user=$WP_USER1 --admin_password=$WP_USER1_PASS --admin_email=$WP_USER1_EMAIL --allow-root
    ./wp-cli.phar user create $WP_USER2 $WP_USER2_EMAIL --user_pass=$WP_USER2_PASS --allow-root
else
    echo "wordpress already set up"
fi 

php-fpm7.4 -F