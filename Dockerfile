# Stage 1: Build the application
FROM maven:3.8.5-openjdk-8-slim AS build

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline -B

COPY src ./src

RUN mvn clean package -DskipTests

# Stage 2: Deploy to Tomcat
FROM tomcat:9.0-jdk8

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR into Tomcat's webapps directory
COPY --from=build /app/target/maven-web-application-kkfunda-1.2.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8082

CMD ["catalina.sh", "run"]
