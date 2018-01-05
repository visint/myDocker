FROM ubuntu:16.04
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y git npm curl
RUN npm install -g n
RUN n stable
RUN git clone https://github.com/ant-design/ant-design-pro.git
WORKDIR /root/ant-design-pro
RUN npm install
RUN npm build
#RUN npm start






