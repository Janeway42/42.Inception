#!/bin/bash

# Creates a directory for WordPress at /var/www/wordpress.
# Checks if the wp-config.php file does not exist.
# If the wp-config.php file does not exist, it performs the following steps:
# - Downloads the WordPress core using the wp core download command.
# - Creates the wp-config.php file using the wp config create command, specifying the database name, username, password, host, and configuration file path.
# - Installs WordPress using the wp core install command, providing the website URL, admin user details, and site title.
# - Creates a second user using the wp user create command.
# - Changes the ownership of the WordPress directory to www-data:www-data.
# Runs the php-fpm7.3 command in the foreground as root.

# Create directory for WordPress
mkdir -p /var/www/wordpress

# Check if wp-config.php file doesn't exist
if [ ! -f /var/www/wordpress/wp-config.php ]; then
    cd /var/www/wordpress # Go into volume

    # Download WordPress core
    wp core download --allow-root

    # Create wp-config.php file
    wp config create --allow-root --path= --dbname=$DB_NAME --dbuser=$WP_BOSS --dbpass=$WP_BOSS_PASS --dbhost=mariadb --config-file=/var/www/wordpress/wp-config.php --skip-plugins --skip-themes
    echo "Created wp-config.php file"

    # Install WordPress
    wp core install --allow-root --url=$WP_URL --admin_user=$WP_BOSS --admin_password=$WP_BOSS_PASS --title=mijn_eigen_site --admin_email=user1@42.fr

    # Create second user
    wp user create $WP_USER user2@42.fr --allow-root --user_pass=$WP_USER_PASS

    # Change ownership of WordPress directory
    chown -R www-data:www-data /var/www/wordpress
fi

echo "Started WordPress.."
php-fpm7.3 -R -F # Runs on the foreground as root