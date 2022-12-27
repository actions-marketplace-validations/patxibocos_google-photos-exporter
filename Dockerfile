FROM gradle:7.6.0-jdk8 AS builder
WORKDIR /app
COPY . /app
RUN gradle shadowJar

FROM amazoncorretto:8-alpine-jre as runner
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar /app/google-photos-github-exporter.jar

ENTRYPOINT ["java","-jar","/app/google-photos-github-exporter.jar"]
