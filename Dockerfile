FROM alpine:3.19

LABEL maintainer="Emmett Culley <eculley@ccctechcenter.org>"

RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

RUN apk update

RUN apk add --no-cache \
  php82 \
  php82-ctype \
  php82-curl \
  php82-dom \
  php82-intl \
  php82-fileinfo \
  php82-fpm \
  php82-gd \
  php82-iconv \
  php82-json \
  php82-mbstring \
  php82-openssl \
  php82-pdo \
  php82-phar \
  php82-pdo_mysql \
  php82-pdo_pgsql \
  php82-pdo_sqlite \
  php82-pgsql \
  php82-session \
  php82-simplexml \
  php82-sqlite3 \
  php82-tokenizer \
  php82-xml \
  php82-xmlreader \
  php82-xmlwriter \
  php82-zip \
  php82-zlib \
  php82-pecl-redis \
  curl \
  wget \
  composer

RUN apk del php82

RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community gnu-libiconv

#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN mkdir -p /var/www

WORKDIR /var/www

VOLUME /var/www/

#RUN ls -l /usr/bin/php*
#RUN composer self-update

#CMD ["bash"]

ENTRYPOINT ["composer"]

CMD ["--version"]
