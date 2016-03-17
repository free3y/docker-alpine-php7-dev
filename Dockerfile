FROM alpine:edge

Maintainer Wanjo Chan ( http://github.com/wanjochan/ )

COPY repositories /etc/apk/

#RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf && apk update && apk upgrade

RUN apk update && apk upgrade 

#basic tools
RUN apk add wget curl vim bash

#build essential
RUN apk add autoconf build-base linux-headers

#some libs (may add/change future...)
RUN apk add \
libjpeg \
gmp-dev \
libaio \
re2c \
bison \
libmcrypt-dev \
freetype-dev \
libxpm-dev \
libwebp-dev \
libjpeg-turbo-dev \
bzip2-dev \
openssl-dev \
krb5-dev \
libxml2-dev \
libaio-dev \
curl-dev

RUN apk add php7-dev
RUN apk add php7
RUN apk add php7-pear
RUN apk add php7-opcache

RUN ln -s /usr/bin/php7 /usr/bin/php \
&& ln -s /usr/bin/php-config7 /usr/bin/php-config \
&& ln -s /usr/bin/phpize7 /usr/bin/phpize \
&& rm -rf /var/cache/apk/*

ADD php.ini /etc/php7/
