#!/bin/bash

php /var/www/bin/console doctrine:database:create --if-not-exists
php /var/www/bin/console doctrine:migrations:migrate --no-interaction
php-fpm
exec "$@"
