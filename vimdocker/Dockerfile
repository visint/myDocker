FROM alpine:latest
MAINTAINER zuolan <i@zuolan.me>
ENV HOME /home/user
RUN mkdir -p /home/user/workspace
RUN apk add --update --no-cache vim && \
    rm -rf /var/cache/* /var/log/* /var/tmp/*
ENTRYPOINT ["vim"]
