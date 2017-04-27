FROM daocloud.io/tomcat:8.0.41-jre8-alpine
        
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY ["target/spring-boot-sample-0.0.1-SNAPSHOT.war", "/usr/local/tomcat/webapps/ROOT.war"]
