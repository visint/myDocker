FROM mysql:1.1
RUN apk add ca-certificates mongodb wget mongodb-tools && \
    rm /usr/bin/mongosniff /usr/bin/mongoperf
EXPOSE 27017
VOLUME /data/db
CMD ["mongod"]
