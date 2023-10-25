FROM php:8.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy source
COPY . /var/www

# Create system user to run Composer and Artisan Commands
# RUN useradd -G www-data,root -u $uid -d /home/$user $user
# mkdir -p /home/$user/.composer && \
RUN chmod 775 -R /var/www/storage && \
    # chown -R $user:$user /home/$user &&\
    chown -R www-data:www-data /var/www/storage && \
    chown -R www-data:www-data /var/www/storage/logs && \
    chown -R www-data:www-data /var/www/bootstrap/cache

# Set working directory
WORKDIR /var/www
