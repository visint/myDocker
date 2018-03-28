FROM ubuntu:16.04
#MAINTAINER jiang_yi_bo "admin@sinzuo.com"
#CMD ["sh", "-c", "/etc/init.d/tftpd-hpa start&& testServer"]
#CMD ["/etc/init.d/tftpd-hpa","start"]
#ENTRYPOINT ["/etc/init.d/tftpd-hpa","start"]


RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
        apt-get update
RUN apt-get install -y wget
ADD qshell_alias.txt /qshell_alias.txt
ADD qshell_list /usr/sbin/
ADD qshell_del /usr/sbin/
ADD qshell_put /usr/sbin/
ADD qshell_get /usr/sbin/
RUN cat /qshell_alias.txt >> /etc/bash.bashrc
RUN wget http://devtools.qiniu.com/2.0.8/qshell-linux-x64 -O /usr/sbin/qshell && chmod 777 /usr/sbin/qshell
RUN qshell account xIbruH0wyRKRbCk2rDdRq7TgRetaXEbyKNWQuVbA 6lAilWtW5lTpV-N-0ftK6riHOn2qqOncT8TVnARY
WORKDIR /mnt/
CMD ["qshell_list"]
