#这个也得有
FROM openjdk:8-jre-alpine
LABEL maintainer="30743905@qq.com"
#复制打好的jar包
COPY target/*.jar /boot.jar
RUN  apk add -U tzdata; \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
echo 'Asia/Shanghai' >/etc/timezone; \
touch /boot.jar;

ENV JAVA_OPTS=""
ENV PARAMS=""

EXPOSE 8080

ENTRYPOINT [ "sh", "-c", "java -Djava.security.egd=file:/dev/./urandom $JAVA_OPTS -jar /boot.jar $PARAMS" ]