FROM alpine:edge

ENV ECO_VERSION 0.7.1.1-beta

RUN apk add --no-cache --virtual .build-deps curl unzip \
    && curl -fSL https://s3-us-west-2.amazonaws.com/eco-releases/EcoServer_v$ECO_VERSION.zip -o /tmp/eco_server.zip \
    && unzip /tmp/eco_server.zip -d /eco_server \
    && rm /tmp/eco_server.zip \
    && apk del .build-deps

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing mono libgdiplus \
    && apk add --no-cache xvfb gtk+2.0

COPY files/docker-entrypoint.sh /docker-entrypoint.sh

VOLUME ["/eco_server/Storage"]
EXPOSE 2999 3000 3001

ENTRYPOINT ["/docker-entrypoint.sh"]
