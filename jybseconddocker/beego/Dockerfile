# install beego
# version 1.0  
  
FROM jyb-ubuntu:16.04
#MAINTAINER jiang_yi_bo "admin@sinzuo.com"
#CMD ["sh", "-c", "/etc/init.d/tftpd-hpa start&& testServer"]
#CMD ["/etc/init.d/tftpd-hpa","start"]
#ENTRYPOINT ["/etc/init.d/tftpd-hpa","start"]


 
ENV GOPATH /data/golang
ENV PATH $GOPATH/bin:$PATH
#export GOPATH=/data/golang
#export PATH=$GOPATH/bin:$PATH  
RUN apt-get update &&\
 mkdir -p /data/golang && \
 apt-get install golang vim git supervisor -y && \
 go get github.com/astaxie/beego && \
 go get github.com/beego/bee
 
ADD ./hello.go /data/golang/hello.go
 
RUN go build -o /data/golang/hello /data/golang/hello.go
RUN chmod 755 /data/golang/hello
 
WORKDIR /data/golang 
EXPOSE 22 8080  
 
CMD ["/data/golang/hello"]
