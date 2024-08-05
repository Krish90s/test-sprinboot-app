
# Use a base image with Java installed
FROM openjdk:17-jdk-alpine

# Set the working directory
WORKDIR /app

# Copy the jar file from the target directory to the container
COPY target/test-springboot-app.jar test-springboot-app.jar

# Expose the port the application runs on
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "test-springboot-app.jar"]
