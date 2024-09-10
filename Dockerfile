FROM tomcat:9-jre9
COPY ./target/live.war /usr/local/tomcat/webapps
