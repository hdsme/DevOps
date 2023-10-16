# Login

`mysql -u root -p`

# Create database

`create database database_name`

# Create new user

`CREATE USER 'username'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';`

# Granted permissions for user to database for specified host

`GRANT ALL PRIVILEGES ON database_name.* TO 'mysql'@'localhost' WITH GRANT OPTION;`



# Granted permissions for user to database for all hosts

`GRANT ALL PRIVILEGES ON *.* TO 'username'@'%' WITH GRANT OPTION;`

`GRANT SELECT, INSERT, UPDATE, DELETE ON database_name.* TO 'username'@'%';`

# Granted permissions for user
GRANT ALL PRIVILEGES ON *.* TO 'mysql'@'localhost' WITH GRANT OPTION;

# Remove granted permissions
REVOKE ALL PRIVILEGES ON database_name.* FROM 'username'@'localhost';


# Dump database
mysqldump -u root -p mydatabase > backup.sql

# Restore database
mysql -u root -p mydatabase < backup.sql


# Errors
#### communications link failure the last packet sent successfully to the server was 0 milliseconds ago. the driver has not received any packets from the server. connection refused: no further information connection refused: no further information mysql

`blind-address to 0.0.0.0 in mysqld.cnf`
