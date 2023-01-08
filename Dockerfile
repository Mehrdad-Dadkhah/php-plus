FROM mehrdadkhah/php7:latest

MAINTAINER Mehrdad Dadkhah <mehrdad@dadkhah.me>

RUN apt-get update && apt-get install -yy \
    libpq-dev \
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
    yasm & echo "done!"


# Run build script
RUN echo "Try to install ffmpeg..."

ADD script/buildFFmpeg.sh /build.sh
RUN ["/bin/bash", "/build.sh"]

RUN apt-get purge --auto-remove -y git cmake automake build-essential\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

CMD ["php-fpm"]
