FROM maven:3-eclipse-temurin-21 AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests
FROM eclipse-temurin:21-alpine
COPY --from=build /target/DogsManagementSystem-0.0.1-SNAPSHOT.jar DogsManagementSystem.jar
EXPOSE 8080
CMD ["java", "-jar", "DogsManagementSystem.jar"]