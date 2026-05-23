FROM php:8.1-apache
RUN apt-get update && apt-get install -y libpng-dev libzip-dev unzip
RUN docker-php-ext-install pdo_mysql gd zip
COPY . /var/www/html/
RUN a2enmod rewrite
