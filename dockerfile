FROM php:8.1-apache

# প্রয়োজনীয় লাইব্রেরি ইনস্টল করা
RUN apt-get update && apt-get install -y libpng-dev libzip-dev unzip

# PHP এক্সটেনশন ইনস্টল করা
RUN docker-php-ext-install pdo_mysql gd zip

# Apache কনফিগারেশন: পাবলিক ফোল্ডারকে রুট করা
RUN sed -i 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf

# প্রজেক্ট ফাইল কপি করা
COPY . /var/www/html/

# পারমিশন ঠিক করা
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# মডুল এনাবল করা
RUN a2enmod rewrite
