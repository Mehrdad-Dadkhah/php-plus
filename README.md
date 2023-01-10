# PHP-PLUS (PHP-FPM)

Last PHP plus extensions and main tools common in all projects


[![Docker Pulls](https://img.shields.io/docker/pulls/mehrdadkhah/php7.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/mehrdadkhah/php7/) [![Docker Build Statu](https://img.shields.io/docker/build/mehrdadkhah/php7.svg?style=flat-square)](https://hub.docker.com/r/mehrdadkhah/php7/) [![Docker Automated buil](https://img.shields.io/docker/automated/mehrdadkhah/php7.svg?style=flat-square)](https://hub.docker.com/r/mehrdadkhah/php7/)

Docker php with critical extensions (redis, gd, apcu, intl, soap, pdo, mbstring, iconv and ... )

You can use alpine version and ubuntu base version.

Also we add special version for VOD or other video base project that have FFMPEG and FFPROBE in it. It's availabe on [FFmpeg branch](https://github.com/Mehrdad-Dadkhah/php-plus/tree/FFmpeg) and (mehrdadkhah/php7:ffmpeg) tag.

Use this image to run a container with latest stable of php. it ships with:

- last stable version of Redis extension (official version)

- Intl extension (official version)

- Apcu extension ([official build for php](https://pecl.php.net/package/APCu))

- Soap

- PDO (MySQL, PostgreSQL, Sqlite)

- GD

- iconv

- mbstring

- git

- composer

- xdebug
- mysql-client [`mysqldump`] (available on [`Mehrdad-Dadkhah/php-plus:alpine-mysql`](https://github.com/Mehrdad-Dadkhah/php-plus/blob/master/alpine/mysql/Dockerfile))
- bcmath (required by hashids package)

- pcntl

## Extensions

- mbstring
- intl
- zip
- pdo
- pdo_mysql
- pdo_pgsql
- pgsql
- soap
- gd
- opcache
- mysqli
- bcmath
- pcntl
- sysvsem
- pcntl
- sysvshm
- sysvmsg
- sockets
- xdebug
- imagick
- apcu
- redis

## Versions

- "latest"
- "ffmpeg"
- "alpine"
- "7.1-alpine"
- "7.3-alpine"
- "7-latest"
- "7.2"
- "7-latest"
- "8-latest"

---

## usage

docker pull mehrdadkhah/php-plus

**Access to php-plus container bash**

docker exec -it php-plus bash

## Other images

- **PHP 7 + Nginx** (lemp) ([github](https://github.com/Mehrdad-Dadkhah/lemp-php7-full) , [docker hub](https://hub.docker.com/r/mehrdadkhah/lemp-php7-full) and image name: lemp-php7-full)
- **PHP 7 + Nginx + newrelic** ([github](https://github.com/Mehrdad-Dadkhah/lemp-php7-newrelic-full) , [docker hub](https://hub.docker.com/r/mehrdadkhah/lemp-php7-newrelic-full) and image name: lemp-php7-newrelic-full)
- **PHP 7 + Nginx + NodeJs** ([github](https://github.com/Mehrdad-Dadkhah/lemp-php7-newrelic-full) , [docker hub](https://hub.docker.com/r/mehrdadkhah/lemp7-nodejs) and image name: lemp7-nodejs)
- **PHP 7 + Nginx + NodeJs + Newrelic** ([github](https://github.com/Mehrdad-Dadkhah/lemp-php7-nodejs-newrelic-full) , [docker hub](https://hub.docker.com/r/mehrdadkhah/lemp-php7-nodejs-newrelic-full) and image name: lemp-php7-nodejs-newrelic-full)
- **PHP 7 + Nginx + Python and Hazm** package ready to use for NLP projects ([github](https://github.com/Mehrdad-Dadkhah/lemp-php7-hazm-full) , [docker hub](https://hub.docker.com/r/mehrdadkhah/lemp-php7-hazm-full) and image name: lemp-php7-hazm-full)

## Last update

- 10 Jan 2023

