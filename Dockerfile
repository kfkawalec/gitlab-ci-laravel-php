FROM php:7.0
MAINTAINER Krzysztof Kawalec <kf.kawalec@gmail.com>
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        openssh-client \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libcurl4-openssl-dev \
        curl \
        libtidy* \
    && rm -r /var/lib/apt/lists/*

# PHP Extensions
RUN docker-php-ext-install \
    mcrypt \
    mbstring \
    curl \
    json \
    pdo_mysql \
    exif \
    tidy \
    zip \
    ldap \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install gd
  
# Memory Limit
RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini

# Time Zone
RUN echo "date.timezone=Europe/Warsaw" > $PHP_INI_DIR/conf.d/date_timezone.ini

VOLUME /root/composer

# Environmental Variables
ENV COMPOSER_HOME /root/composer

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
	composer selfupdate
    
# Goto temporary directory.
WORKDIR /tmp

# Run composer and phpunit installation.
RUN composer require "phpunit/phpunit=5.*" --prefer-source --no-interaction && \
    ln -s /tmp/vendor/bin/phpunit /usr/local/bin/phpunit

# Run composer and codesniffer installation.
RUN composer require "squizlabs/php_codesniffer=*" --prefer-source --no-interaction && \
    ln -s /tmp/vendor/bin/phpcs /usr/local/bin/phpcs

RUN php --version
RUN composer --version
RUN phpunit --version
RUN phpcs --version
