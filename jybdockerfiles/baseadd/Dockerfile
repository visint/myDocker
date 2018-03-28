FROM jyb-ubuntu:16.04
#MAINTAINER jiang_yi_bo "admin@sinzuo.com"
#CMD ["sh", "-c", "/etc/init.d/tftpd-hpa start&& testServer"]
#CMD ["/etc/init.d/tftpd-hpa","start"]
#ENTRYPOINT ["/etc/init.d/tftpd-hpa","start"]


RUN apt-get install -y openssh-server
RUN apt-get install -y openssh-server vim tar wget curl rsync bzip2 iptables tcpdump less telnet net-tools lsof sysstat cron inetutils-ping 
RUN mkdir -p /var/run/sshd && \
    sed -i "s/UsePAM.*/UsePAM yes/g" /etc/ssh/sshd_config &&  \
    sed -i "s/PermitEmptyPasswords.*/PermitEmptyPasswords yes/g" /etc/ssh/sshd_config &&  \
    sed -i "s/PasswordAuthentication.*/PasswordAuthentication yes/g" /etc/ssh/sshd_config &&  \
    sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN echo "root:root" | chpasswd
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
