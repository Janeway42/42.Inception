/*
This PHP script sets up configuration variables for connecting to a MySQL database
in WordPress. It loads environment variables from a .env file using the Dotenv
library. It defines the database name, username, password, host, character set,
and table prefix. It also sets the absolute path to the WordPress directory and
includes the necessary files for WordPress setup.
*/

<?php

/* Load environment variables from .env file */
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

/* MySQL settings */
define('DB_NAME',$_ENV['MDB_DB_NAME']);
define('DB_USER',$_ENV['DB_USER']);
define('DB_PASSWORD',$_ENV['DB_PASSWORD']);
define('DB_HOST',$_ENV['DB_HOST']);
define('DB_CHARSET',$_ENV['DB_CHARSET']);
define('WPMS_ON', false ); # Turn of email feature, otherwise error during build

/* MySQL database table prefix. */
$table_prefix = 'wp_';

/* Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/* Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';