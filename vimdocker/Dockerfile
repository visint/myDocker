FROM jyb-alpine:3.4
#MAINTAINER jiang_yi_bo "admin@sinzuo.com" 
#CMD ["sh", "-c", "/etc/init.d/tftpd-hpa start&& testServer"] 
#CMD ["/etc/init.d/tftpd-hpa","start"] 
#ENTRYPOINT ["/etc/init.d/tftpd-hpa","start"]
ENV HOME /home/user
RUN mkdir -p /home/user/workspace
RUN apk add vim && \
    rm -rf /var/cache/* /var/log/* /var/tmp/*
ENTRYPOINT ["vim"]
