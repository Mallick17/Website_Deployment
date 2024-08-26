FROM tomcat:9-jre9
MAINTAINER "gyanaranjanmallick444@gmail.com"
COPY ./target/live.war/usr/local/tomcat/webapps
