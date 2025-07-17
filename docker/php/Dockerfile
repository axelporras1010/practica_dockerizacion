FROM php:8.1-apache

# 1. Instala dependencias del sistema y extensiones PHP
RUN apt-get update && \
    apt-get install -y \
        git \
        unzip \
        libzip-dev \
        libpng-dev \
        libonig-dev \
        libxml2-dev \
        && \
    # Instala extensiones PHP necesarias
    docker-php-ext-install \
        mysqli \
        pdo \
        pdo_mysql \
        && \
    # Limpia caché
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 2. Instala Composer (copiar desde tu Dockerfile anterior)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 3. Copia archivos y configura Apache (mantén tu configuración anterior)
COPY . /var/www/html/
RUN composer install --no-dev --optimize-autoloader

ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN a2enmod rewrite