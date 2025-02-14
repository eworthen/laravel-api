FROM php:8.2-cli

# Install system dependencies
RUN apt-get update && apt-get install -y unzip curl git libpng-dev libzip-dev libonig-dev

# Install required PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
WORKDIR /var/www

# Copy full Laravel project (including composer.json and artisan)
COPY sanctum-api/ ./

# Install dependencies
RUN composer install --no-interaction --no-progress

# Set correct permissions
RUN chmod -R 777 storage bootstrap/cache

# Expose Laravel port
EXPOSE 8000

# Start Laravel in dev mode
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]

