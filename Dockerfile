FROM mehrdadkhah/php7:latest

MAINTAINER Mehrdad Dadkhah <mehrdad@dadkhah.me>

RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libpq-dev \
    g++ \
    libicu-dev \
    libxml2-dev \
    git \
    vim \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    zlib1g-dev \
    libmagickwand-dev --no-install-recommends \
    procps && apt-get -qqy install --no-install-recommends \
    autoconf \
    automake \
    build-essential \
    ca-certificates \
    mercurial \
    cmake \
    libass-dev \
    libgpac-dev \
    libtheora-dev \
    libtool \
    libvdpau-dev \
    libvorbis-dev \
    pkg-config \
    texi2html \
    libmp3lame-dev \
    wget \
    yasm;


# Run build script
RUN ech "Try to install ffmpeg..."

ADD script/buildFFmpeg.sh /build.sh
RUN ["/bin/bash", "/build.sh"]

RUN apt-get purge --auto-remove -y git cmake automake build-essential\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

CMD ["php-fpm"]
