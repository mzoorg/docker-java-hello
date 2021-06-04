FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y\
    tomcat9\
    default-jdk\
    maven\
    git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /boxfuse-sample-java-war-hello
RUN mvn package
COPY target/hello-1.0.war /var/lib/tomcat9/webapps
EXPOSE 80 80
ENTRYPOINT exec top -b