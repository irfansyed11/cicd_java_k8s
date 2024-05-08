FROM ubuntu:20.04 
MAINTAINER "info@wiculty.com"
RUN apt-get update
RUN apt-get install -y openjdk-11-jdk
ENV JAVA_HOME /usr
ADD apache-tomcat-8.5.38.tar.gz /root
COPY target/gamutkart.war /root/apache-tomcat-8.5.38/webapps
ENTRYPOINT /root/apache-tomcat-8.5.38/bin/startup.sh && bash

