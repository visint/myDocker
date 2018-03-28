FROM debian:jessie
MAINTAINER drupal-docker <info@drupaldocker.org>

VOLUME /var/www/html
WORKDIR /var/www/html

ADD run.sh /root/run.sh

RUN apt-get update && apt-get install -y openssh-server pwgen \
  && mkdir /var/run/sshd \
  && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
  && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
  && echo "export VISIBLE=now" >> /etc/profile \
  && chmod u+x /root/run.sh \
  && rm -rf /var/lib/apt/lists/*

ENV NOTVISIBLE "in users profile"

EXPOSE 22

CMD ["/root/run.sh"]
