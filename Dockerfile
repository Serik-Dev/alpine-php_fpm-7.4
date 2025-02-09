FROM alpine:3.14

#Установка nginx
RUN apk update && apk add --no-cache nginx

# Устанавливаем зависимости
RUN apk add --no-cache \
    php7 \
    php7-fpm \
    php7-mysqli \
    php7-json \
    php7-opcache \
    php7-mbstring \
    php7-xml \
    php7-session \
    php7-pdo \
    php7-pdo_mysql \
    php7-tokenizer \
    php7-ctype \
    php7-curl \
    php7-gd \
    php7-zip \
    php7-dom \
    php7-simplexml \
    php7-fileinfo \
    php7-bcmath \
    php7-intl \
    php7-iconv \
    php7-exif \
    php7-phar \
    php7-soap \
    php7-sockets

# Создаем пользователя для PHP-FPM
RUN adduser -D -g 'www' www && \
    mkdir -p /run/php && \
    chown -R www:www /run/php

# Копируем конфигурацию nginx
COPY nginx.conf /etc/nginx/nginx.conf

#Создаем папку html
RUN mkdir -p /var/www/html/

# # Копируем php сайт
COPY index.php /var/www/html/

# Открываем порт для FPM
EXPOSE 80

# Запуск nginx и php-fpm
CMD ["sh", "-c", "php-fpm7 -F & nginx -g 'daemon off;'"]

