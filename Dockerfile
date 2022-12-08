FROM node:alpine
COPY . /app
WORKDIR /app
RUN npm i --verbose
CMD node server.js