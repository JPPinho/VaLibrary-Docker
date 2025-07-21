FROM php:8.3-fpm

LABEL maintainer="João Pinho <joaopedrorochapinho@gmail.com>"

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    git \
    curl \
    zip \
    unzip \
    nano \
    && apt-get install -y \
    nodejs \
    npm \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip \
    && docker-php-ext-install opcache \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN echo 'alias art="php artisan"' >> ~/.bashrc
EXPOSE 9000

CMD ["php-fpm"]