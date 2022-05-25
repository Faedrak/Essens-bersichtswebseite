FROM php:8.1-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql


ENV DATABASE_URL=mysql://root:abc123@essen-dbserver:3306/ovm_Essens-bersichtswebseite?serverVersion=8.0.29

VOLUME [ "/var/www" ] 
WORKDIR /var/www

COPY . . 

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN composer update --no-interaction

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH="${PATH}:/root/.composer/vendor/bin"

RUN set -eux; \
	mkdir -p var/cache var/log; \
	composer install --prefer-dist --no-dev --no-progress --no-scripts --no-interaction; \
	composer dump-autoload --classmap-authoritative --no-dev; \
	composer symfony:dump-env prod; \
	composer run-script --no-dev post-install-cmd; \
	chmod +x bin/console; sync

RUN chmod -R 777 var



