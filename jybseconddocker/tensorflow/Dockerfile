FROM daocloud.io/daocloud/tensorflow:latest
#MAINTAINER jiang_yi_bo "admin@sinzuo.com"
#CMD ["sh", "-c", "/etc/init.d/tftpd-hpa start&& testServer"]
#CMD ["/etc/init.d/tftpd-hpa","start"]
#ENTRYPOINT ["/etc/init.d/tftpd-hpa","start"]


RUN rm -f /run_jupyter.sh
COPY run_jupyter.sh /run_jupyter.sh
ENTRYPOINT ["/run_jupyter.sh"]
