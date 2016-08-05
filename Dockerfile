FROM qlik/gradle
MAINTAINER xchunzhao <xchunzhao@gmail.com>

COPY . /app/source

RUN gradle -Dfile.encoding=UTF-8 clean build -x test && \
    cd /app/source && \
    mv ./build/libs/*.jar /app.jar && \
    cd / && rm -rf /app/source

EXPOSE 8080
ENTERPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]