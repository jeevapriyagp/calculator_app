FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY src/main/java/com/example/calculator/*.java src/main/java/com/example/calculator/
COPY src/test/java/com/example/calculator/*.java src/test/java/com/example/calculator/

COPY junit-platform-console-standalone-1.10.2.jar .

RUN mkdir -p out && \
    javac -cp junit-platform-console-standalone-1.10.2.jar \
    -d out \
    src/main/java/com/example/calculator/*.java \
    src/test/java/com/example/calculator/*.java

CMD ["java", "-jar", "junit-platform-console-standalone-1.10.2.jar", "--class-path", "out", "--scan-class-path"]
