#!bin/bash

# Creates the necessary directories for the MariaDB server.
# Sets appropriate ownership for the directories.
# Initializes the MariaDB database using the mysql_install_db command.
# Defines SQL commands in an init.sql file to be executed later.
# Creates the database, creates users with specified login credentials, grants privileges, and flushes privileges.
# Starts the MariaDB server in the foreground with the specified user and console output.
# If the database is already set up, the script proceeds directly to starting the MariaDB server.

if [ ! -d /run/mysqld ] #looks to see if the database is not already set up
then

	echo "Setting up MariaDB"

	mkdir -p /run/mysqld
	# Create the run directory for mysqld
	chown -R mysql:mysql /run/mysqld
	chown -R mysql:mysql /var/lib/mysql
	# Change file owner - chown [options] new_owner[:new_group] file(s) -
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql #initializes database

cat << EOF > init.sql
	USE mysql;
	FLUSH PRIVILEGES;
	DELETE FROM mysql.user WHERE User='';
	DROP DATABASE test;
	DELETE FROM mysql.db WHERE Db='test';
	ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';
	CREATE DATABASE IF NOT EXISTS $DB_NAME;
	CREATE USER '$WP_BOSS'@'%';
	SET PASSWORD FOR '$WP_BOSS'@'%' = PASSWORD('$WP_BOSS_PASS');
	GRANT ALL PRIVILEGES ON wordpress.* TO '$WP_BOSS'@'%';
	GRANT ALL ON wordpress.* to '$WP_BOSS'@'%';
	GRANT GRANT OPTION ON wordpress.* TO '$WP_BOSS'@'%'; # Grant the admin user the ability to grant privileges
	FLUSH PRIVILEGES;
	CREATE USER '$WP_USER'@'%';
	SET PASSWORD FOR '$WP_USER'@'%' = PASSWORD('$WP_USER_PASS');
	GRANT ALL PRIVILEGES ON wordpress.* TO '$WP_USER'@'%';
	GRANT ALL ON wordpress.* to '$WP_USER'@'%';
	FLUSH PRIVILEGES;
EOF
# Create a temporary file init.sql with the SQL commands to be executed. 
# This includes the database and the users
# init.sql does not have access to .env which is why variables need to be added here

mysqld --user=mysql --bootstrap < init.sql

fi

echo "MariaDB started"
exec mysqld --user=mysql --console # Starts the MySQL database server in the foreground