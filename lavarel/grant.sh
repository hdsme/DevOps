#!/bin/bash
abort() {
  printf "%s\n" "$@"
  exit 1
}

install_vendors() {
    if [ -f "composer.json" ]; then
        echo "composer.json exists. Installing vendors..."
        composer install
        echo "Install vendors successfully"
    fi
}

install_modules() {
    if [ -f "package.json" ]; then
        echo "package.json exists. Installing node_modules..."
        npm install --legacy-peer-deps
        echo "Install node_modules successfully"
    fi
}

vite_build() {
    if [ -f "vite.config.js" ]; then
        echo "vite.config.js exists. Building vite for production..."
        npm run build
        echo "Building vite for production successfully"
    fi
}

grant_access() {
    password=$1
    echo "$password" | sudo -S chmod -R 775 public && \
    chmod -R 775 storage && \
    chmod -R 775 public/index.php && \
    chown -R www-data:www-data bootstrap && \
    chown -R www-data:www-data bootstrap/cache && \
    chown -R www-data:www-data storage && \
    chown -R www-data:www-data storage/logs && \
    chown -R www-data:www-data storage/framework
}

install_vendors || abort "Install vendors failed"

install_modules || abort "Install node modules failed"

vite_build || abort "Build vite production failed"

echo "Please enter your password:"
read -s password

grant_access "$password" || abort "Grant access failed"

echo "Grant access to folders laravel successfully"