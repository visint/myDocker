FROM jyb-ubuntu:16.04
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
CMD ["/usr/sbin/sshd","-D"]
