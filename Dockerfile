# Use an OpenJDK image to compile the application
FROM openjdk:17-slim AS build

# Set the working directory inside the container
WORKDIR /app

# Copy project files into the container
COPY . /app

# Compile the Java application
RUN javac HolaMundo.java

# Use a lightweight JRE for the final stage
FROM openjdk:17-slim

# Set the working directory for the application
WORKDIR /app

# Copy the compiled Java class file from the build stage
COPY --from=build /app/HolaMundo.class /app

# Specify the command to run the Java application
CMD ["java", "HolaMundo"]
