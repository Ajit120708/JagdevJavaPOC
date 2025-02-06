# Use an official Maven image as the base image
FROM maven:3.9.6-eclipse-temurin-17 AS build

FROM openjdk:17-jdk-slim


ADD target/hello-world-spring-boot.jar hello-world-spring-boot.jar
ENTRYPOINT ["java", "-jar", "hello-world-spring-boot.jar"]


