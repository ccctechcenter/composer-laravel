FROM alpine:latest

MAINTAINER "Eric Ball" <eball@ccctechcenter.org>

RUN apk --update --no-cache add wget \
  curl \
  git \
  php7 \
  php7-ctype \
  php7-curl \
  php7-dom \
  php7-fileinfo \
  php7-fpm \
  php7-gd \
  php7-iconv \
  php7-json \
  php7-mbstring \
  php7-mysqli \
  php7-openssl \
  php7-pdo \
  php7-pdo_mysql \
  php7-pdo_pgsql \
  php7-pdo_sqlite \
  php7-pgsql \
  php7-phar \
  php7-session \
  php7-simplexml \
  php7-sqlite3 \
  php7-tokenizer \
  php7-xml \
  php7-xmlreader \
  php7-xmlwriter \
  php7-zip \
  php7-zlib

RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing gnu-libiconv

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN mkdir -p /var/www

WORKDIR /var/www

VOLUME /var/www

RUN composer self-update

CMD ["bash"]

ENTRYPOINT ["composer"]
CMD ["--help"]
