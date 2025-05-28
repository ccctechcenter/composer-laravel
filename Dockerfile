FROM alpine:3.21

LABEL maintainer="UT Fong <ufong@ccctechcenter.org>"

RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

RUN apk update && \
    apk upgrade

RUN apk add --no-cache \
  gnu-libiconv \
  php83 \
  php83-ctype \
  php83-curl \
  php83-dom \
  php83-intl \
  php83-fileinfo \
  php83-fpm \
  php83-gd \
  php83-iconv \
  php83-json \
  php83-mbstring \
  php83-openssl \
  php83-pdo \
  php83-phar \
  php83-pdo_mysql \
  php83-pdo_pgsql \
  php83-pdo_sqlite \
  php83-pgsql \
  php83-session \
  php83-simplexml \
  php83-sqlite3 \
  php83-tokenizer \
  php83-xml \
  php83-xmlreader \
  php83-xmlwriter \
  php83-zip \
  php83-zlib \
  php83-pecl-redis \
  curl \
  wget \
  composer

RUN apk del php83

#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN mkdir -p /var/www

WORKDIR /var/www

VOLUME /var/www/

#RUN ls -l /usr/bin/php*
#RUN composer self-update

#CMD ["bash"]

ENTRYPOINT ["composer"]

CMD ["--version"]
