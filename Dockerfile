FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
ENV CATALINA_HOME /usr/share/tomcat9
ENV CATALINA_BASE /var/lib/tomcat9
RUN apt update && apt install -y \
    tomcat9 \
    default-jdk \
    maven \
    git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /boxfuse-sample-java-war-hello
RUN mvn package
RUN cp target/hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 80 80
ENTRYPOINT exec $CATALINA_HOME/bin/catalina.sh run