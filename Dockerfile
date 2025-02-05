# Use an official OpenJDK base image

# Use a smaller base image to run the app (smaller footprint)
FROM openjdk:17-jdk-slim as build
FROM maven:3.9.6-eclipse-temurin-17 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY src ./src

# Run Maven to build the project and create the JAR file
RUN mvn clean package -DskipTests

# Refer to Maven build -> finalName
ARG JAR_FILE=target/hello-world-spring-boot.jar

# cd /opt/app
WORKDIR /opt/app

# cp target/spring-boot-web.jar /opt/app/app.jar
COPY ${JAR_FILE} hello-world-spring-boot.jar

# Expose the port your Spring Boot app runs on
EXPOSE 8080

# java -jar /opt/app/app.jar
ENTRYPOINT ["java","-jar","hello-world-spring-boot.jar"]
