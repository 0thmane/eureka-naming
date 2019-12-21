# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine


WORKDIR /usr/app
# Make port 8080 available to the world outside this container
#EXPOSE 8080

# The application's jar file
ARG JAR_FILE=target/netflix-eureka-naming-server-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} netflix-eureka-naming-server-0.0.1-SNAPSHOT.jar

# Run the jar file 
ENTRYPOINT ["java","-Dserver.port=8080","-jar","/usr/app/netflix-eureka-naming-server-0.0.1-SNAPSHOT.jar"]