# php7 (PHP-FPM)

[![Docker Pulls](https://img.shields.io/docker/pulls/mehrdadkhah/php7.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/mehrdadkhah/php7/) [![Docker Build Statu](https://img.shields.io/docker/build/mehrdadkhah/php7.svg?style=flat-square)](https://hub.docker.com/r/mehrdadkhah/php7/) [![Docker Automated buil](https://img.shields.io/docker/automated/mehrdadkhah/php7.svg?style=flat-square)](https://hub.docker.com/r/mehrdadkhah/php7/)

Docker php7 with critical extensions (redis, gd, apcu, intl, soap, pdo, mbstring, iconv and ... )

You can use alpine version and ubuntu base version.

Also we add special version for VOD or other video base project that have FFMPEG and FFPROBE in it. It's availabe on [FFmpeg branch](https://github.com/Mehrdad-Dadkhah/php7/tree/FFmpeg) and (mehrdadkhah/php7:ffmpeg) tag.

Use this image to run a container with latest stable of php7. it ships with:

- last stable version of Redis extension (official version)

- Intl extension (official version)

- Apcu extension ([official build for php7](https://pecl.php.net/package/APCu))

- Soap

- PDO (MySQL, PostgreSQL, Sqlite)

- GD

- iconv

- mbstring

- git

- composer

- xdebug
- mysql-client [`mysqldump`] (available on [`Mehrdad-Dadkhah/php7:alpine-mysql`](https://github.com/Mehrdad-Dadkhah/php7/blob/master/alpine/mysql/Dockerfile))
- bcmath (required by hashids package)
- pcntl (available on [`Mehrdad-Dadkhah/php7:7.1-alpine`](https://github.com/Mehrdad-Dadkhah/php7/blob/master/7.1/alpine/Dockerfile))

## Extensions

- mbstring
- intl
- zip
- pdo_mysql
- pdo_pgsql
- soap
- -j
- opcache
- mysqli
- bcmath
- pcntl
- sysvsem
- pcntl
- sysvshm
- sysvmsg
- sockets
- gd
- imagick
- apcu

## Versions

- PHP 7.2 ubuntu base (available on [related branch](https://github.com/Mehrdad-Dadkhah/php7/tree/PHP7.2) and docker tag 7.2)
- PHP 7.1 alpine base (available on [`Mehrdad-Dadkhah/php7:7.1-alpine`](https://github.com/Mehrdad-Dadkhah/php7/tree/alpine/7.1/alpine))
- PHP 7.3 alpine base (available on [`Mehrdad-Dadkhah/php7:7.3-alpine`](https://github.com/Mehrdad-Dadkhah/php7/tree/alpine/7.3/alpine))
- PHP latest version (now 7.3) ubuntu base

---

## usage

docker pull mehrdadkhah/php7

**Access to php7 container bash**

docker exec -it php7 bash

**Run a complete webserver with all development tools (lemp)**

you can use [lemp-php7 docker compose](https://github.com/Mehrdad-Dadkhah/lemp-php7) that use this repo.

## Other images

- **PHP 7 + Nginx** (lemp) ([github](https://github.com/Mehrdad-Dadkhah/lemp-php7-full) , [docker hub](https://hub.docker.com/r/mehrdadkhah/lemp-php7-full) and image name: lemp-php7-full)
- **PHP 7 + Nginx + newrelic** ([github](https://github.com/Mehrdad-Dadkhah/lemp-php7-newrelic-full) , [docker hub](https://hub.docker.com/r/mehrdadkhah/lemp-php7-newrelic-full) and image name: lemp-php7-newrelic-full)
- **PHP 7 + Nginx + NodeJs** ([github](https://github.com/Mehrdad-Dadkhah/lemp-php7-newrelic-full) , [docker hub](https://hub.docker.com/r/mehrdadkhah/lemp7-nodejs) and image name: lemp7-nodejs)
- **PHP 7 + Nginx + NodeJs + Newrelic** ([github](https://github.com/Mehrdad-Dadkhah/lemp-php7-nodejs-newrelic-full) , [docker hub](https://hub.docker.com/r/mehrdadkhah/lemp-php7-nodejs-newrelic-full) and image name: lemp-php7-nodejs-newrelic-full)
- **PHP 7 + Nginx + Python and Hazm** package ready to use for NLP projects ([github](https://github.com/Mehrdad-Dadkhah/lemp-php7-hazm-full) , [docker hub](https://hub.docker.com/r/mehrdadkhah/lemp-php7-hazm-full) and image name: lemp-php7-hazm-full)

## Last update

- 08 NOV 2021
