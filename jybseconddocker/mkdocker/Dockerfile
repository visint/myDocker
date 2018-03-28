FROM markdown:1.0
MAINTAINER jiang_yi_bo <jiang_yi_bo@hotmail.com>

ADD ./mkdocker/. /usr/share/nginx/html/portal
ADD build.sh /usr/sbin/
WORKDIR /usr/share/nginx/html/portal
RUN rm -rf /usr/share/nginx/html/portal/site && mkdocs build && \
  grep -lr googleapis site/css/ | xargs sed -i "s|//fonts.googleapis.com/|http://fonts.gmirror.org/|g"
