FROM node:alpine

RUN	apk --no-cache add libpng librsvg libgsf giflib libjpeg-turbo musl \
    && apk add vips-dev fftw-dev build-base --update-cache  --repository https://alpine.global.ssl.fastly.net/alpine/edge/testing/  --repository https://alpine.global.ssl.fastly.net/alpine/edge/main \
    && apk --no-cache add --virtual .build-dependencies g++ make python3 curl tar gtk-doc gobject-introspection expat-dev glib-dev libpng-dev libjpeg-turbo-dev giflib-dev librsvg-dev  \
    && su node \
    && npm install sharp --g --production --unsafe-perm \
    && chown node:node /usr/local/lib/node_modules -R \
    && apk del .build-dependencies

COPY . /app
WORKDIR /app
RUN npm i
CMD node server.js


# FROM --platform=linux/amd64 node:16-bullseye-slim

# COPY . /app
# WORKDIR /app
# RUN npm install --arch=x64 --platform=linux --ignore-scripts=false --verbose
# CMD node server.js
# FROM node:alpine

# RUN	apk --no-cache add libpng librsvg libgsf giflib libjpeg-turbo musl \
#     && apk add vips-dev fftw-dev build-base --update-cache  --repository https://alpine.global.ssl.fastly.net/alpine/edge/testing/  --repository https://alpine.global.ssl.fastly.net/alpine/edge/main \
#     && apk --no-cache add --virtual .build-dependencies g++ make python3 curl tar gtk-doc gobject-introspection expat-dev glib-dev libpng-dev libjpeg-turbo-dev giflib-dev librsvg-dev  \
#     && su node \
#     && npm install --platform=linux --libc=musl --arch=x64 sharp --g --production --unsafe-perm \
#     && chown node:node /usr/local/lib/node_modules -R \
#     && apk del .build-dependencies

# COPY . /app
# WORKDIR /app
# RUN npm i
# CMD node server.js

# FROM node:alpine
# COPY . /app
# WORKDIR /app
# RUN npm i --verbose
# CMD node server.js