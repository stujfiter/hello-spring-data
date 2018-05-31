FROM openjdk:8 as builder
COPY . .
RUN ./gradlew build

FROM openjdk:8-jre-alpine
COPY --from=builder /build/libs/spring-data-0.1.0.jar .
CMD ["java", "-jar", "./spring-data-0.1.0.jar"]
