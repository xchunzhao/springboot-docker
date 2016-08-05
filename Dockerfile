FROM maven:3.3.3
MAINTAINER xchunzhao <xchunzhao@gmail.com>

COPY . /app/source

RUN cd /app/source && \
    mvn -q dependency:resolve && \
    mvn -q -DskipTests=true package && \
    mv target/*.jar /app.jar && \
    cd / && rm -rf /app/source

EXPOSE 8080
ENTERPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]