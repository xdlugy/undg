FROM node:lts-alpine AS frontend_build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM php:8.4-fpm

RUN apt-get update && apt-get install -y \
    libpq-dev \
    libicu-dev \
    libzip-dev \
    zip \
    unzip \
    nginx \
    && docker-php-ext-install -j$(nproc) \
        pdo \
        pdo_pgsql \
        intl \
        zip \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh && \
    groupadd -g 1000 symfony && \
    useradd -m -u 1000 -g symfony symfony

WORKDIR /var/www/html

RUN chown -R symfony:symfony /var/www/html

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug
    && echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.127.0.0.1 = host.docker.internal" >>
/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

COPY --from=ghcr.io/phpstan/phpstan:[TAG] /composer/vendor/phpstan/phpstan/phpstan.phar /app/phpstan.phar

EXPOSE 80 9000

CMD ["/entrypoint.sh"]
