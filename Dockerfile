FROM openjdk:8u212-jre-alpine

LABEL maintainer "Brostapholes"

RUN apk update && \
    apk upgrade && \
    apk add wget 

RUN addgroup -S minecraft && \
    adduser -S minecraft -G minecraft && \
    mkdir -p /opt/minecraft/bin && \
    wget -O /opt/minecraft/bin/server.jar https://launcher.mojang.com/v1/objects/808be3869e2ca6b62378f9f4b33c946621620019/server.jar && \
    chown -R minecraft:minecraft /opt/minecraft

EXPOSE 25565

CMD su -c "java -Xmx1024M -Xms1024M -jar /opt/minecraft/bin/server.jar nogui" -s /bin/sh minecraft