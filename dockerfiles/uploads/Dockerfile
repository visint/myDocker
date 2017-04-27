FROM hub.c.163.com/public/ubuntu:14.04
MAINTAINER jybyun <jyb@jybyun.top>

RUN apt-get update && \
apt-get -y install \
    nginx \
    ca-certificates \
    php5 php5-fpm php5-cli php5-json php5-curl

RUN mkdir /www
WORKDIR /www
ADD script /www
VOLUME /www/uploads

ADD nginx.conf /etc/nginx/nginx.conf

RUN apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 80

ENTRYPOINT ["sh", "-c", "chown -R www-data: /www && service php5-fpm start && nginx"]
