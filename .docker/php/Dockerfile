FROM php:8.3-fpm

LABEL maintainer="João Pinho <joaopedrorochapinho@gmail.com>"

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
    nodejs \
    npm \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip \
    && docker-php-ext-install opcache \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} --non-unique laravel && \
    useradd -u ${UID} -g laravel -ms /bin/bash -d /home/laravel laravel

USER laravel

RUN echo 'alias art="php artisan"' >> ~/.bashrc

WORKDIR /var/www/html

EXPOSE 9000

CMD ["php-fpm"]