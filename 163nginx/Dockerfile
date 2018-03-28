FROM hub.c.163.com/netease_comb/debian:7.9    
MAINTAINER netease

RUN apt-get update && \
apt-get install -y nginx
RUN mkdir -p /var/run/sshd && \
    sed -i "s/UsePAM.*/UsePAM yes/g" /etc/ssh/sshd_config &&  \
    sed -i "s/PermitEmptyPasswords.*/PermitEmptyPasswords yes/g" /etc/ssh/sshd_config &&  \
    sed -i "s/PasswordAuthentication.*/PasswordAuthentication yes/g" /etc/ssh/sshd_config &&  \
    sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config

EXPOSE 22 80 443


ENTRYPOINT /etc/init.d/nginx start && /usr/sbin/sshd -D

