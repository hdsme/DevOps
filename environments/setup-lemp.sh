abort() {
  printf "%s\n" "$@"
  exit 1
}


# Update new packages
sudo apt-get -y update || abort "Update apt-get failed"

# Setup Nginx
apt-get -y install nginx || abort "Install nginx failed"
systemctl restart nginx || abort "Restart nginx failed"
echo "Setup Nginx successfully"
nginx -v

# Setup PHP

add-apt-repository ppa:ondrej/php

read -p "Enter your php version (default: php8.1): " version

if [ -z "$version" ]; then
    version="php8.1"
fi

apt install -y --no-install-recommends "$version" || abort "Install PHP error"

apt install -y "$version"-fpm php-mysql || abort "Install PHP error"

apt-get install -y  "$version"-cli \
                    "$version"-common \
                    "$version"-mysql \
                    "$version"-zip \
                    "$version"-gd \
                    "$version"-mbstring \
                    "$version"-curl php8.1-xml \
                    "$version"-bcmath \
                    "$version"-gd \
                    || abort "Install PHP extensions error"
echo "Installed PHP successfully" 
php -v

# Setup MySQL

apt install -y mysql-server || abort "Install MySQL error"

read -p "Enter your root password (default: mysql): " psw

if [ -z "$psw" ]; then
    psw="mysql"
fi

read -p "Enter your "$USER" password: " password

echo '$password' | sudo -S mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$psw';" || abort "Change root password failed"

mysql_secure_installation || abort "Install MySQL failed"

