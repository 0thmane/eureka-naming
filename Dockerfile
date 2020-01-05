#FROM alpine/git as clone
#WORKDIR /app
#RUN git clone https://github.com/0thmane/eureka-naming.git

#FROM maven:3.5-jdk-8-alpine as build
#WORKDIR /app
#COPY --from=clone /app/eureka-naming /app
#RUN mvn install

#FROM openjdk:8-jdk-alpine
#WORKDIR /app
#COPY --from=build /app/target/netflix-eureka-naming-server-0.1.jar /app
#EXPOSE 8080
#ENTRYPOINT ["java","-Dserver.port=8080","-jar","/app/netflix-eureka-naming-server-0.1.jar"]

FROM openjdk:8
EXPOSE 8080
ADD target/netflix-eureka-naming-server-0.1.jar netflix-eureka-naming-server-0.1.jar
ENTRYPOINT ["java","-jar", "/netflix-eureka-naming-server-0.1.jar"]
