FROM lsiobase/alpine:3.7
MAINTAINER nick+docker@undergrid.org.uk

#install packages
RUN \
  echo "**** install build packages ****" && \
  apk add --no-cache \
   apache-mod-fcgid \
   apache2-ctl \
   apache2-proxy \
   apache2-ssl \
   apache2-utils \
   curl \
   git \
   logrotate \
   nano \
   openssl \
   php7 \
   php7-apache2 \
   php7-cli \
   php7-curl \
   php7-fpm && \
  echo "**** fix logrotate ****" && \
  sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf

#add local files
COPY root/ /

#ports and volumes
EXPOSE 80 443
VOLUME /config
