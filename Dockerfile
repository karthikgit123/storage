FROM maven:3.9.11-eclipse-temurin-21
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY . .
RUN mvn clean package -DskipTests=true
EXPOSE 8080
CMD ["java", "-jar", "target/storage-1.0-SNAPSHOT.jar"]
