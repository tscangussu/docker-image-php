FROM alpine:3.7

# ensure www-data user exists
RUN set -x \
	&& addgroup -g 82 -S www-data \
  && adduser -u 82 -D -S -G www-data www-data

# Install packages based on official php-fpm image.
# See https://github.com/docker-library/php.
RUN apk add --no-cache --virtual .php-packages \
  php7 \
  php7-curl \
  php7-fpm \
  php7-mbstring \
  php7-mysqli \
  php7-openssl \
  php7-zlib

COPY files/fpm_zzz-docker.conf /etc/php7/php-fpm.d/zzz-docker.conf
COPY files/php_40_docker.ini /etc/php7/conf.d/40_docker.ini
COPY files/docker-php-entrypoint /usr/local/bin/

ENTRYPOINT ["docker-php-entrypoint"]

EXPOSE 9000

CMD ["php-fpm7"]
