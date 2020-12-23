FROM openjdk:8-jdk
#设置工作目录
WORKDIR /root
#复制制品jar到/root/app.jar位置
ADD target/*.jar app.jar
#JVM参数，给后期调优使用
ENV JVM_OPTS=""
#启动服务
CMD java ${JVM_OPTS} \
    -Djava.security.egd=file:/dev/./urandom \
    -jar app.jar
