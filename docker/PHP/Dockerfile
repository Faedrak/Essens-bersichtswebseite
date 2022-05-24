FROM composer

ENV DATABASE_URL=mysql://root:abc123@database:3306/ovm_Essens-bersichtswebseite?serverVersion=mysql-8.0.29

WORKDIR /Essens-bersichtswebseite
COPY . . 

RUN ls

WORKDIR /Essens-bersichtswebseite/public

CMD ["php", "-S", "0.0.0.0:80"]


EXPOSE 80