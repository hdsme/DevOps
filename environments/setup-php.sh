abort() {
  printf "%s\n" "$@"
  exit 1
}

add-apt-repository ppa:ondrej/php

read -p "Enter your php version (default: php8.1): " version

if [ -z "$version" ]; then
    version="php8.1"
fi

apt install --no-install-recommends "$version" || abort "Install PHP error"

apt install "$version"-fpm php-mysql || abort "Install PHP error"

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
