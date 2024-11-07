# Use an OpenJDK image to compile the application
FROM openjdk:17-jdk-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy project files into the container
COPY . /app

# Compile the Java application
RUN javac HolaMundo.java

# Use a lightweight Java Runtime Environment (JRE) for the final stage
FROM openjdk:17-jre-alpine

# Set the working directory for the application
WORKDIR /app

# Copy the compiled Java class file from the build stage
COPY --from=build /app/HolaMundo.class /app

# Specify the command to run the Java application
CMD ["java", "HolaMundo"]