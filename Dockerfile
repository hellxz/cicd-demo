FROM openjdk:8-jdk
WORKDIR /root
ADD target/*.jar app.jar
ENV JVM_OPTS=""
CMD java -Djava.security.egd=file:/dev/./urandom \
    ${JVM_OPTS} \
    -jar app.jar
