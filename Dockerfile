FROM openjdk:8-jdk-alpine

LABEL maintainer="bhalla.jatin008@gmail.com"

VOLUME /tmp

EXPOSE 8080

ARG JAR_FILE=target/spring-webapp-template.war

ADD ${JAR_FILE} spring-webapp-template

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-war","/spring-webapp-template.war"]

