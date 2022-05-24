FROM php:8.1-fpm-alpine as symfony_php

RUN docker-php-ext-install pdo pdo_mysql


VOLUME [ "/var/www" ] 
WORKDIR /var/www

ENV DATABASE_URL=mysql://root:abc123@app_db/app?serverVersion=mariadb-10.8.3

COPY . .

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH="${PATH}:/root/.composer/vendor/bin"
RUN set -eux; \
	mkdir -p var/cache var/log; \
	composer install --prefer-dist --no-dev --no-progress --no-scripts --no-interaction; \
	composer dump-autoload --classmap-authoritative --no-dev; \
	composer symfony:dump-env prod; \
	composer run-script --no-dev post-install-cmd; \
	chmod +x bin/console; sync

RUN chmod -R 777 var;

RUN chmod +x ./docker/php/entrypoint.sh
ENTRYPOINT ["sh", "/var/www/docker/php/entrypoint.sh"]
