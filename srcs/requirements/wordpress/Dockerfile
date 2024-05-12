# Configure PHP-FPM to listen on port 9000, enabling communication with other services.
# Create a directory to store the PHP-FPM socket for communication.
# Copy the setup_wordpress.sh script to the container for WordPress setup and configuration.
# Make the setup_wordpress.sh script executable to run it as a command.
# Expose port 9000 to allow external access to the PHP-FPM service.

FROM debian:bullseye
# penultimate stable version of debian https://www.debian.org/releases/

RUN apt-get update
RUN apt-get install -y php-fpm php-mysql wget mariadb-client
# Install PHP-FPM, PHP MySQL extension, Wget, and MariaDB client
# Nginx doesn’t know how to run a PHP script of its own. It needs a PHP module like PHP-FPM to efficiently manage PHP scripts. 
# PHP-FPM, on the other hand, runs outside the NGINX environment by creating its own process. 
# Therefore when a user requests a PHP page the nginx server will pass the request to PHP-FPM service using FastCGI. 
# https://www.digitalocean.com/community/tutorials/php-fpm-nginx
# https://medium.com/@mgonzalezbaile/demystifying-nginx-and-php-fpm-for-php-developers-bba548dd38f9

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# wget is a free GNU command-line utility tool used to download files. https://phoenixnap.com/kb/wget-command-with-examples
# Download WP-CLI: https://wp-cli.org/  the command-line interface for WordPress 

RUN chmod u+x wp-cli.phar
# Make the WP-CLI installer file executable

RUN mv wp-cli.phar /usr/local/bin/wp
# Move the WP-CLI file to the bin directory for global accesibility

RUN sed 's|listen = /run/php/php8.3.7-fpm.sock|listen = 0.0.0.0:9000|g' -i /etc/php/8.3.7/fpm/pool.d/www.conf
# Configure PHP-FPM to listen on port 9000
# Pool Directives (default name is www.conf)
# Multiple pools of child processes may be started with different listening ports and different management options.  
# The name of the pool will be used in logs and stats. There is no limitation on the number of pools which FPM can handle. System limit = FPM limit.

RUN mkdir -p /run/php
# Create directory for PHP-FPM socket

COPY tools/setup.sh .
RUN chmod +x setup.sh

EXPOSE 9000

ENTRYPOINT ["./setup.sh"]