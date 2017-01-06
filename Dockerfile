FROM ubuntu:15.04
MAINTAINER anuwardeen

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get clean


RUN mkdir -p /opt/app
WORKDIR /opt/app
ADD target/spring-boot-thymeleaf-1.0.war /opt/app

EXPOSE 8080

CMD ["java","-jar","spring-boot-thymeleaf-1.0.war"]





