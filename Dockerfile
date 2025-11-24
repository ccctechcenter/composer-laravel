FROM alpine:3.22.2

# Change the maintainer to your info if you update this version of the image.
LABEL maintainer="Ken Van Mersbergen <kvanmersbergen@ccctechcenter.org>"

# Clean up
RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

# Update APK
RUN apk update && \
    apk upgrade

# Install APK packages
RUN apk --update --no-cache add \
  curl \
  composer \
  gnu-libiconv \
  tzdata \
  wget \
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
  php83-pecl-redis \
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
  php83-zlib

#RUN apk del php83

RUN mkdir -p /var/www

WORKDIR /var/www

VOLUME /var/www/

ENTRYPOINT ["composer"]

CMD ["--version"]
