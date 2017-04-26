#TFTP_DIRECTORY="/var/lib/tftpboot"
FROM ubuntu:16.04
MAINTAINER netease
RUN mkdir -p /var/run/sshd
RUN apt-get update && apt-get install -y dialog tftp-hpa tftpd-hpa
EXPOSE 69
#CMD ["/etc/init.d/tftpd-hpa","start"]
ENTRYPOINT ["/etc/init.d/tftpd-hpa","start"]
