FROM ubuntu:18.04
WORKDIR /opt/java
RUN apt-get update && apt-get install -y curl && apt-get install -y ca-certificates && update-ca-certificates --fresh && curl -LOk https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz && tar -xf openjdk-11.0.1_linux-x64_bin.tar.gz
#ADD /opt/java/openjdk-11.0.1_linux-x64_bin.tar.gz .
ENV JAVA_HOME /opt/java/jdk-11.0.1
ENV PATH $PATH:$JAVA_HOME/bin
WORKDIR /opt/tomcat
RUN apt-get update && apt-get install -y curl && curl -LOk https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.58/bin/apache-tomcat-9.0.58.tar.gz && tar -xf apache-tomcat-9.0.58.tar.gz
#ADD /opt/tomcat/apache-tomcat-9.0.56.tar.gz .
COPY capstone.war /opt/tomcat/apache-tomcat-9.0.58/webapps
EXPOSE 8080
CMD ["/opt/tomcat/apache-tomcat-9.0.58/bin/catalina.sh","run"]
