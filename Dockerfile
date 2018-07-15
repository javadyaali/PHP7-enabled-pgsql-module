FROM registry.bale.ai:2443/php:7.2-apache

MAINTAINER Hossein Ansari version: 1.0.7

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_RUN_DIR /var/www/html/

EXPOSE 80


RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pgsql

RUN a2enmod rewrite

RUN chown -R www-data:www-data /var/www/html

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

# docker build -t registry.bale.ai:2443/php_pgsql_enabled .
