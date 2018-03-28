FROM hub.c.163.com/netease_comb/debian:7.9    
#MAINTAINER jiang_yi_bo "admin@sinzuo.com"
#CMD ["sh", "-c", "/etc/init.d/tftpd-hpa start&& testServer"]
#CMD ["/etc/init.d/tftpd-hpa","start"]
#ENTRYPOINT ["/etc/init.d/tftpd-hpa","start"]



RUN apt-get update && \
apt-get install -y nginx
RUN mkdir -p /var/run/sshd && \
    sed -i "s/UsePAM.*/UsePAM yes/g" /etc/ssh/sshd_config &&  \
    sed -i "s/PermitEmptyPasswords.*/PermitEmptyPasswords yes/g" /etc/ssh/sshd_config &&  \
    sed -i "s/PasswordAuthentication.*/PasswordAuthentication yes/g" /etc/ssh/sshd_config &&  \
    sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN echo "root:jiang" | chpasswd
EXPOSE 22

ENTRYPOINT /usr/sbin/sshd -D

