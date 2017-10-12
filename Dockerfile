FROM java:8-jdk-alpine
RUN apk add --update curl && rm -rf /var/cache/apk/*

ENV APP_NAME=simple-app
COPY ./target/${APP_NAME}.jar /data/${APP_NAME}.jar
CMD ["/bin/sh", "java -jar /data/${APP_NAME}.jar"]
