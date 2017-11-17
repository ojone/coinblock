FROM php:7-fpm

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y libzip-dev

RUN apt-get update && apt-get install -y libz-dev && pecl install zlib zip

RUN apt-get update && apt-get install -y libmcrypt-dev mysql-client \
    && docker-php-ext-install mcrypt mbstring tokenizer mysqli pdo pdo_mysql zip bcmath
    
#RUN apt-get update && apt-get install php-bcmath
    
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

    
RUN rm -rf /var/lib/apt/lists/*

#RUN git config --global user.name "ojone"

#RUN git config --global user.email "ojonestreets@gmail.com"

WORKDIR /var/www

ENV APP_HOME /var/www/tenders
