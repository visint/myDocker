FROM node:slim
#MAINTAINER jiang_yi_bo "admin@sinzuo.com" #CMD ["sh", "-c", "/etc/init.d/tftpd-hpa start&& testServer"] #CMD ["/etc/init.d/tftpd-hpa","start"] #ENTRYPOINT ["/etc/init.d/tftpd-hpa","start"]

RUN buildDeps='make build-essential g++ gcc python2.7' && softDeps="git" && \
    apt-get update && apt-get upgrade -y && \
    apt-get install -y $buildDeps $softDeps --no-install-recommends && \
    npm install -g forever && npm cache clean && \
    git clone https://github.com/c9/core.git /cloud9 && cd /cloud9 && \
    scripts/install-sdk.sh && \
    apt-get purge -y --auto-remove $buildDeps && \
    apt-get autoremove -y && apt-get autoclean -y && apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    npm cache clean
 
VOLUME /workspace
EXPOSE 8181 
ENTRYPOINT ["forever", "/cloud9/server.js", "-w", "/workspace", "-l", "0.0.0.0"]
#CMD["--auth","username:password"]