FROM jyb-ubuntu-tools:16.04
#MAINTAINER jiang_yi_bo "admin@sinzuo.com"
#CMD ["sh", "-c", "/etc/init.d/tftpd-hpa start&& testServer"]
#CMD ["/etc/init.d/tftpd-hpa","start"]
#ENTRYPOINT ["/etc/init.d/tftpd-hpa","start"]


RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
	apt-get update
RUN apt-get install -y npm curl
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org 
RUN npm install -g n &&\
	n stable && cnpm install -g vue-cli browserify gulp babel



