FROM composer

RUN docker-php-ext-install pdo pdo_mysql

ENV DATABASE_URL=mysql://root:abc123@essen-dbserver:3306/ovm_Essens-bersichtswebseite?serverVersion=8.0.29

WORKDIR /Essens-bersichtswebseite
COPY . . 

RUN composer update --no-interaction

WORKDIR /Essens-bersichtswebseite/public

CMD ["php", "-S", "0.0.0.0:80"]


EXPOSE 80