FROM alpine:3.18

MAINTAINER "Emmett Culley" <eculley@ccctechcenter.org>

RUN apk --update --no-cache add wget \
  curl \
  git \
  php81 \
  php81-ctype \
  php81-curl \
  php81-dom \
  php81-fileinfo \
  php81-fpm \
  php81-gd \
  php81-iconv \
  php81-json \
  php81-mbstring \
  php81-mysqli \
  php81-openssl \
  php81-pdo \
  php81-pdo_mysql \
  php81-pdo_pgsql \
  php81-pdo_sqlite \
  php81-pgsql \
  php81-phar \
  php81-session \
  php81-simplexml \
  php81-sqlite3 \
  php81-tokenizer \
  php81-xml \
  php81-xmlreader \
  php81-xmlwriter \
  php81-zip \
  php81-zlib \
  composer

RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing gnu-libiconv

#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN mkdir -p /var/www

WORKDIR /var/www

VOLUME /var/www/

#RUN composer self-update

CMD ["bash"]

ENTRYPOINT ["composer"]

CMD ["--version"]

