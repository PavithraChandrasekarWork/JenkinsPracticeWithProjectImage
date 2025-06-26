# Base image with Java and Maven
FROM maven:3.9.5-eclipse-temurin-17

# Set workdir
WORKDIR /app

# Copy project
COPY . .

# Download dependencies & run tests (you can skip test if needed)
RUN mvn clean install -DskipTests


# Default command: run tests using testng.xml
CMD ["mvn", "test", "-DsuiteXmlFile=testng.xml"]

