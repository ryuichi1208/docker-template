FROM php:7-apache

RUN apt-get update \
    && apt-get -y install vim wget lsb-release libicu-dev mysql-client libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    && docker-php-ext-install pdo_mysql mysqli intl gd
