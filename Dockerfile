# Use an official Maven image as a parent image
FROM maven:3.8.4-openjdk-17 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project files into the container
COPY pom.xml .
COPY src src/

# Package the application into a WAR file
RUN mvn clean package

# Use a lightweight Java runtime environment
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the WAR file from the build stage into the container
COPY --from=build /app/target/*.war devops-0.0.1.war

# Specify the command to run the application
CMD ["java", "-jar", "devops-0.0.1.war"]
