FROM ubuntu:16.04
MAINTAINER netease
RUN mkdir -p /var/run/sshd
RUN apt-get update \
    && apt-get update && apt-get install -y vsftpd openssh-server vim tar wget curl rsync bzip2 iptables tcpdump less telnet net-tools lsof sysstat cron supervisor inetutils-ping \ 
    && rm -rf /var/lib/apt/lists/*
#ADD vsftpd.conf /etc/
# a new user is needed to get access to the container
RUN mkdir -p /var/run/vsftpd/empty
RUN useradd username
RUN echo "username:userpassword" | chpasswd

#this is needed to gain root access
RUN echo "root:rootpassword" | chpasswd

EXPOSE 20
EXPOSE 21
#CMD ["/etc/init.d/ssh","restart"]
#COPY sshd.conf /etc/supervisor/conf.d/sshd.conf
CMD ["/usr/sbin/vsftpd"]

