FROM php:7.4-apache

RUN mkdir /app

COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf

# Get PHP Extension Installer
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# Install Required Extensions
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions gd pdo_mysql mysqli mcrypt intl

# Install Xdebug
RUN pecl install xdebug-2.8.1
# Enable Remote Debuggin with Xdebug
RUN docker-php-ext-enable xdebug
RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/php.ini
#RUN echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# RUN echo "xdebug.remote_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

WORKDIR /app

RUN chown -R www-data:www-data /app && chmod -R 777 /app && a2enmod rewrite 
