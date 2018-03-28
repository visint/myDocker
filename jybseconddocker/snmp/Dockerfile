# install snmp
# version 1.0  
  
FROM jyb-ubuntu-tools:16.04
#MAINTAINER jiang_yi_bo "admin@sinzuo.com"
#CMD ["sh", "-c", "/etc/init.d/tftpd-hpa start&& testServer"]
#CMD ["/etc/init.d/tftpd-hpa","start"]
#ENTRYPOINT ["/etc/init.d/tftpd-hpa","start"]


 
RUN apt-get update &&\
 mkdir -p /data/golang && \
 apt-get install gcc vim wget make libperl-dev libxml-libxml-perl -y
 
ADD ./hello.go /data/golang/hello.go
 
WORKDIR /data/golang
RUN  wget https://nchc.dl.sourceforge.net/project/net-snmp/net-snmp/5.7.3/net-snmp-5.7.3.tar.gz
RUN  tar -zxvf net-snmp-5.7.3.tar.gz
EXPOSE 22 162 
