FROM php:8.4-fpm-trixie

LABEL AUTHOR="Etearner <contact@elceka.com>"

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    gosu \
    unzip \
    zip \
    libicu-dev \
    libpq-dev \
    libonig-dev \
    libzip-dev \
    libxml2-dev \
    bash \
    wget \
    nano \
    iputils-ping \
    && docker-php-ext-install \
    intl \
    pdo \
    pdo_pgsql \
    pdo_mysql \
    zip \
    opcache \
    mbstring \
    xml \
    && rm -rf /var/lib/apt/lists/*

# Install Xdebug and APCu
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && pecl install apcu \
    && docker-php-ext-enable apcu

# Set the right timezone
RUN echo "date.timezone = $TZ" > /usr/local/etc/php/conf.d/timezone.ini

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copy config templates
COPY ./conf/conf.ini /usr/local/etc/php/conf.d/conf.ini

# Set working directory
WORKDIR /var/www/api

# Mark repo as safe (useful for containers mounting host volumes)
RUN git config --global --add safe.directory /var/www/app

EXPOSE 9000

CMD ["php-fpm"]
