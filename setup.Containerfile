FROM docker.io/php:8.4-alpine

ENV DB_HOST=db
ENV DB_PASSWORD=PASSWORD

RUN apk add --no-cache \
    mariadb-client \
    zlib-dev \
    libpng-dev \
    freetype-dev \
    libzip-dev

RUN docker-php-ext-configure gd --with-freetype && \
    docker-php-ext-install -j8 \
        gd \
        zip \
        pdo_mysql

COPY ["setup/run.sh", "/usr/local/bin/"]
COPY ["setup/*.sql", "/usr/local/share/"]
RUN chmod +x /usr/local/bin/run.sh

RUN addgroup -g 101 php && \
    adduser -D -G php -u 101 php

USER php
WORKDIR /data
ENTRYPOINT ["/usr/local/bin/run.sh"]
