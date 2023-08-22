# Login

mysql -u root -p
# Create database

create database database_name
# Granted permissions for user to database
GRANT ALL PRIVILEGES ON dev_convert_sdx.* TO 'mysql'@'localhost' WITH GRANT OPTION;
# Granted permissions for user
GRANT ALL PRIVILEGES ON *.* TO 'mysql'@'localhost' WITH GRANT OPTION;