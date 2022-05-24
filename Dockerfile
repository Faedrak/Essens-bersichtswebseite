FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update
RUN apt-get install -y php
RUN apt-get install -y composer
RUN apt-get install -y php-xml
RUN apt-get install -y php-mysql

WORKDIR /Essens-bersichtswebseite
COPY . .

ENV DATABASE_URL=mysql://username:password@hostname:3306/dbname?serverVersion=mariadb-10.8.3

RUN composer update --no-interaction

WORKDIR /Essens-bersichtswebseite/public

CMD ["php", "-S", "0.0.0.0:80"]
EXPOSE 80