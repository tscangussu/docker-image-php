FROM debian:9.3-slim

ARG PHP_VERSION=7.1
ARG PHP_PIN_VERSION=7.1.13

# dependencies
RUN apt-get update; \
		DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
			apt-transport-https \
			ca-certificates \
			wget; \
		wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg; \
		echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list; \
		rm -rf /var/lib/apt/lists/*

# pin packages
RUN set -eux; \
		{ \
			echo "Package: php${PHP_VERSION}*"; \
			echo "Pin: version  ${PHP_PIN_VERSION}"; \
			echo "Pin-Priority: 700"; \
		} > /etc/apt/preferences.d/php

# Install packages based on official php-fpm image.
# See https://github.com/docker-library/php.
RUN apt-get update; \
		DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
			php${PHP_VERSION}-cli \
		  php${PHP_VERSION}-curl \
		  php${PHP_VERSION}-fpm \
			php${PHP_VERSION}-json \
			php${PHP_VERSION}-mbstring \
			php${PHP_VERSION}-opcache \
			php${PHP_VERSION}-readline; \
		rm -rf /var/lib/apt/lists/*

COPY files/fpm_zzz-docker.conf /etc/php/${PHP_VERSION}/fpm/pool.d/zzz-docker.conf
COPY files/php_40_docker.ini /etc/php/${PHP_VERSION}/mods-available/40_docker.ini
COPY files/docker-php-entrypoint /usr/local/bin/

RUN mkdir -p /var/run/php; \
		ln -s /etc/php/${PHP_VERSION}/mods-available/40_docker.ini /etc/php/${PHP_VERSION}/cli/conf.d/40_docker.ini; \
		ln -s /etc/php/${PHP_VERSION}/mods-available/40_docker.ini /etc/php/${PHP_VERSION}/fpm/conf.d/40_docker.ini; \
		chmod +x /usr/local/bin/docker-php-entrypoint

ENTRYPOINT ["docker-php-entrypoint"]

EXPOSE 9000

CMD ["php-fpm7.1"]
