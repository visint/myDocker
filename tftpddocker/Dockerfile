#TFTP_DIRECTORY="/var/lib/tftpboot"
FROM ubuntu:16.04
MAINTAINER sinzuo.com
COPY tftpd-hpa /etc/default/
COPY testServer /bin/
RUN apt-get update && apt-get install -y dialog tftp-hpa tftpd-hpa
EXPOSE 69/udp
CMD ["sh", "-c", "/etc/init.d/tftpd-hpa start&& testServer"]
#CMD ["/etc/init.d/tftpd-hpa","start"]
#ENTRYPOINT ["/etc/init.d/tftpd-hpa","start"]
