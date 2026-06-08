FROM docker.io/php:8.4-fpm-alpine

RUN apk upgrade && apk add --no-cache \
    autoconf \
    gcc \
    g++ \
    imagemagick-dev \
    libtool \
    make \
    curl-dev \
    freetype-dev \
    libxml2-dev \
    lexbor-dev \
    libpng-dev \
    oniguruma-dev \
    libzip-dev \
    icu-dev \
    libsodium-dev \
    gmp-dev \
    imagemagick-svg

RUN docker-php-ext-configure gd --with-freetype

RUN docker-php-ext-install -j8 \
    ctype \
    curl \
    fileinfo \
    filter \
    gd \
    xml \
    mbstring \
    zip \
    posix \
    session \
    pdo_mysql \
    intl \
    sodium \
    sysvsem \
    pcntl \
    exif \
    gmp

RUN pecl install imagick apcu redis \
    && docker-php-ext-enable imagick apcu redis

RUN addgroup -g 101 php && \
    adduser -D -G php -u 101 php

WORKDIR /data

COPY ["php/config/zz-fpm-user.conf", "/usr/local/etc/php-fpm.d/zz-fpm-user.conf"]
COPY ["php/config/php.ini", "/usr/local/etc/php/php.ini"]
COPY ["php/scripts/cron.sh", "/usr/local/bin/cron.sh"]
RUN chmod +x /usr/local/bin/cron.sh
