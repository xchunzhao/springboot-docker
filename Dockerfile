FROM maven:3.3.3
MAINTAINER xchunzhao <xchunzhao@gmail.com>

COPY . /app/source

RUN cd /app/source && \
    mvn package && \
    mv target/*.jar /app.jar && \
    cd / && rm -rf /app/source

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]
