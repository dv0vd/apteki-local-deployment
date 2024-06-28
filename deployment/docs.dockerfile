FROM node:16.15.1
WORKDIR /app
COPY ./docs/package*.json /app/
RUN npm install && npm cache clean --force
COPY ./docs .
ENV PATH ./docs/node_modules/.bin/:$PATH
