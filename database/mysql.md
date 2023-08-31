# Login

mysql -u root -p
# Create database
create database database_name

# Granted permissions for user to database
GRANT ALL PRIVILEGES ON sw_wp_home.* TO 'mysql'@'localhost' WITH GRANT OPTION;

# Granted permissions for user
GRANT ALL PRIVILEGES ON *.* TO 'mysql'@'localhost' WITH GRANT OPTION;

# Dump database
mysqldump -u root -p mydatabase > backup.sql

# Restore database
mysql -u root -p mydatabase < backup.sql