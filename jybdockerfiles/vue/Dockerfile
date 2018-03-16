FROM jyb-ubuntu-tools:16.04
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
	apt-get update
RUN apt-get install -y npm curl
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org 
RUN npm install -g n &&\
	n stable && cnpm install -g vue-cli browserify gulp babel



