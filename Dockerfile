FROM alpine:3.15

MAINTAINER "Emmett Culley" <eculley@ccctechcenter.org>

RUN apk --update --no-cache add wget \
  curl \
  git \
  php8 \
  php8-ctype \
  php8-curl \
  php8-dom \
  php8-fileinfo \
  php8-fpm \
  php8-gd \
  php8-iconv \
  php8-json \
  php8-mbstring \
  php8-mysqli \
  php8-openssl \
  php8-pdo \
  php8-pdo_mysql \
  php8-pdo_pgsql \
  php8-pdo_sqlite \
  php8-pgsql \
  php8-phar \
  php8-session \
  php8-simplexml \
  php8-sqlite3 \
  php8-tokenizer \
  php8-xml \
  php8-xmlreader \
  php8-xmlwriter \
  php8-zip \
  php8-zlib \
  composer

RUN ln -s /usr/bin/php8 /usr/bin/php

RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing gnu-libiconv

#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN mkdir -p /var/www

WORKDIR /var/www

VOLUME /var/www/

#RUN composer self-update

CMD ["bash"]

ENTRYPOINT ["composer"]

CMD ["--version"]

