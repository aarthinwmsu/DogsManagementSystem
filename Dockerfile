FROM maven:3.8.2-jdk-21 AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests

FROM openjdk:21-jdk-slim
COPY --from=build /target/DogsManagementSystem-0.0.1-SNAPSHOT.jar DogsManagementSystem.jar
CMD ["java", "-jar", "DogsManagementSystem.jar"]