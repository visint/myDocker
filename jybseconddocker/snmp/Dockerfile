# install snmp
# version 1.0  
  
FROM jyb-ubuntu-tool:16.04
MAINTAINER jyb "jiang_yi_bo@gmail.com"  
 
RUN apt-get update &&\
 mkdir -p /data/golang && \
 apt-get install gcc vim wget make libperl-dev libxml-libxml-perl -y
 
ADD ./hello.go /data/golang/hello.go
 
WORKDIR /data/golang
RUN  wget https://nchc.dl.sourceforge.net/project/net-snmp/net-snmp/5.7.3/net-snmp-5.7.3.tar.gz
RUN  tar -zxvf net-snmp-5.7.3.tar.gz
EXPOSE 22 162 
