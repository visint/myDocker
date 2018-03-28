FROM jyb-ubuntu-tools:16.04
#MAINTAINER jiang_yi_bo "admin@sinzuo.com"
#CMD ["sh", "-c", "/etc/init.d/tftpd-hpa start&& testServer"]
#CMD ["/etc/init.d/tftpd-hpa","start"]
#ENTRYPOINT ["/etc/init.d/tftpd-hpa","start"]


RUN sed -i 's/111archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
	apt-get update
RUN apt-get install -y rpcbind nfs-kernel-server  nfs-common
RUN mkdir /data
RUN echo "/data  *(rw,sync,no_subtree_check,fsid=0,no_root_squash)" >> /etc/exports
EXPOSE 111/udp 2049/tcp


