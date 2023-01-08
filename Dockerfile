FROM php:fpm

MAINTAINER Mehrdad Dadkhah <mehrdad@dadkhah.me>

RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    freetype* \
    libpng-dev \
    libwebp-dev \
    libjpeg-dev \
    libsodium-dev \
    openssl \
    gcc make g++ \
    autoconf \
    libicu-dev \
    libxml2-dev \
    git \
    vim \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    zlib1g-dev \
    libmagickwand-dev --no-install-recommends \
    libzip-dev \
    libonig-dev \
    libpq-dev \
    procps

RUN docker-php-ext-configure intl \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install intl \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo_pgsql pgsql \
    && docker-php-ext-install soap \
    && docker-php-ext-configure gd \
        --with-freetype=/usr/lib/ \
        --with-jpeg=/usr/lib/ \
        --with-webp=/usr \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install opcache \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install pcntl \
    && pecl install imagick  \
    && docker-php-ext-enable imagick \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-install sysvsem \
    && docker-php-ext-install pcntl \
    && docker-php-ext-install sysvshm \
    && docker-php-ext-install sysvmsg \
    && docker-php-ext-install sockets

RUN apt-get install -y $PHPIZE_DEPS
RUN pecl install xdebug
# it was not needed because I was installing with pecl
# Configure Xdebug
RUN echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.mode=coverage,debug" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.discover_client_host=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.client_port=9000" >> /usr/local/etc/php/conf.d/xdebug.ini

ENV PHPREDIS_VERSION 5.3.7

RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz  \
    && mkdir /tmp/redis \
    && tar -xf /tmp/redis.tar.gz -C /tmp/redis \
    && rm /tmp/redis.tar.gz \
    && ( \
    cd /tmp/redis/phpredis-$PHPREDIS_VERSION \
    && phpize \
    && ./configure \
    && make -j$(nproc) \
    && make install \
    ) \
    && rm -r /tmp/redis \
    && docker-php-ext-enable redis

RUN sed -i -e 's/listen.*/listen = 0.0.0.0:9000/' /usr/local/etc/php-fpm.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN usermod -u 1000 www-data

COPY ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini

COPY ./nameservers.conf /nameservers.conf
RUN cat /nameservers.conf >> /etc/resolve.conf

CMD ["php-fpm"]
