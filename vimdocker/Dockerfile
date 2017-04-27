FROM jyb-alpine:3.4
MAINTAINER zuolan <i@zuolan.me>
ENV HOME /home/user
RUN mkdir -p /home/user/workspace
RUN apk add vim && \
    rm -rf /var/cache/* /var/log/* /var/tmp/*
ENTRYPOINT ["vim"]
