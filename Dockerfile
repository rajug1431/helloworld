FROM ubuntu:20.04
MAINTAINER RAJU gundelliraju1431@gmail.com
RUN apt-get update && apt-get install wget unzip openjdk-11-jdk -y
WORKDIR /opt/
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz /opt/
RUN tar -xvzf apache-tomcat-9.0.62.tar.gz && mv apache-tomcat-9.0.62 tomcat
COPY ./target/java-hello-world.war /opt/tomcat/webapps/
EXPOSE 8080
WORKDIR /opt/tomcat/bin/
CMD ./startup.sh && \
      tail -f /opt/tomcat/logs/catalina.out 
