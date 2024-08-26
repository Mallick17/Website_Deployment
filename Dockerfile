FROM amazonlinux
MAINTAINER "gyanaranjanmallick444@gmail.com"
RUN yum install java-11* -y
RUN yum install wget -y
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.91/bin/apache-tomcat-9.0.91.tar.gz
RUN yum install tar -y 
RUN yum install gzip -y
RUN tar -zxvf apache-tomcat-9.0.91.tar.gz
COPY ./target/live.war /usr/local/tomcat/webapps
RUN sh /apache-tomcat-9.0.91/bin/startup.sh
