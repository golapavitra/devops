FROM maven:3.6.3-openjdk-8
WORKDIR /app
COPY . .
RUN mvn clean package
CMD ["java","-cp","target/devops-0.0.1.war","DevopsApplication"]
