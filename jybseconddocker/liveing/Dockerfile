FROM markdown:1.0
#MAINTAINER jiang_yi_bo "admin@sinzuo.com"
#CMD ["sh", "-c", "/etc/init.d/tftpd-hpa start&& testServer"]
#CMD ["/etc/init.d/tftpd-hpa","start"]
#ENTRYPOINT ["/etc/init.d/tftpd-hpa","start"]



ADD ./liveing/. /usr/share/nginx/html/portal
ADD ./build.sh /usr/sbin/
WORKDIR /usr/share/nginx/html/portal
RUN rm -rf /usr/share/nginx/html/portal/site && mkdocs build && \
  grep -lr googleapis site/css/ | xargs sed -i "s|//fonts.googleapis.com/|http://fonts.gmirror.org/|g"
