FROM php:fpm-alpine

RUN apk add --update --no-cache \
        libintl \
        icu \
        icu-dev \
        icu-data-full \
        libxml2-dev \
        libzip-dev \
        freetype \
        libpng \
        libjpeg-turbo \
        freetype-dev \
        libpng-dev \
        jpeg-dev \
        libwebp-dev \
        libjpeg \
        libjpeg-turbo-dev \
        libsodium-dev \
        openssl \
        postgresql-dev \
        curl \
        libcurl \
        gcc make g++ \
        autoconf \
        linux-headers \
        vim

RUN apk add --no-cache --update  \
    --repository http://dl-cdn.alpinelinux.org/alpine/v3.13/community/ \
    --allow-untrusted \
    gnu-libiconv

ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS
RUN pecl install xdebug
# it was not needed because I was installing with pecl
RUN docker-php-ext-install intl zip soap exif pcntl sockets
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN docker-php-ext-configure gd \
        --with-freetype=/usr/lib/ \
        --with-jpeg=/usr/lib/ \
        --with-webp=/usr
RUN docker-php-ext-install -j"$(getconf _NPROCESSORS_ONLN)" gd

# Configure Xdebug
RUN echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.mode=coverage,debug" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.discover_client_host=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.client_port=9000" >> /usr/local/etc/php/conf.d/xdebug.ini

# gmp
RUN apk add --update --no-cache gmp gmp-dev \
    && docker-php-ext-install gmp

# php-redis
ENV PHPREDIS_VERSION 5.3.7

RUN docker-php-source extract \
    && curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mv phpredis-$PHPREDIS_VERSION /usr/src/php/ext/redis \
    && docker-php-ext-install redis \
    && docker-php-source delete

# apcu
RUN docker-php-source extract \
    && apk add --no-cache --virtual .phpize-deps-configure $PHPIZE_DEPS \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && apk del .phpize-deps-configure \
    && docker-php-source delete


# git client
RUN apk add --update --no-cache git

# imagick
RUN apk add --update --no-cache autoconf g++ imagemagick-dev libtool make pcre-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && apk del autoconf g++ libtool make pcre-dev

# install bcmath extension
RUN docker-php-ext-install bcmath

RUN sed -i -e 's/listen.*/listen = 0.0.0.0:9000/' /usr/local/etc/php-fpm.conf

RUN echo "expose_php=0" > /usr/local/etc/php/php.ini

CMD ["php-fpm"]
