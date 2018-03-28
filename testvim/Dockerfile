FROM jyb-ubuntu:16.04
#MAINTAINER jiang_yi_bo "admin@sinzuo.com" 
#CMD ["sh", "-c", "/etc/init.d/tftpd-hpa start&& testServer"] 
#CMD ["/etc/init.d/tftpd-hpa","start"] 
#ENTRYPOINT ["/etc/init.d/tftpd-hpa","start"]
ENV HOME /home/user
RUN mkdir -p /home/user/workspace
WORKDIR /home
RUN apt-get install -y vim
#ENTRYPOINT ["vim"]
CMD ["vim"]


