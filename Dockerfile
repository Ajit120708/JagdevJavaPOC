# Use an official Maven image as the base image
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
# Copy the pom.xml and the project files to the container
COPY pom.xml .
COPY src ./src
# Build the application using Maven
RUN mvn clean package -DskipTests
# Use an official OpenJDK image as the base image
FROM openjdk:17-jdk-slim
WORKDIR /app
EXPOSE 8080
ADD target/hello-world-spring-boot.jar hello-world-spring-boot.jar
ENTRYPOINT ["java", "-jar", "hello-world-spring-boot.jar"]


