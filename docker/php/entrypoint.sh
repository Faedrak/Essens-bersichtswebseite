#!/bin/sh

set -e

sleep 10
php /var/www/bin/console doctrine:database:create --env=prod --if-not-exists
php /var/www/bin/console doctrine:migrations:migrate --no-interaction
php-fpm
exec "$@"
