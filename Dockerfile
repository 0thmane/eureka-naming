FROM alpine/git as clone
WORKDIR /app
RUN git clone https://github.com/0thmane/eureka-naming.git

FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY --from=clone /app/eureka-naming /app
RUN mvn install

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/target/netflix-eureka-naming-server-0.1.jar /app
EXPOSE 8080
ENTRYPOINT ["java","-Dserver.port=8080","-jar","/app/netflix-eureka-naming-server-0.1.jar"]
