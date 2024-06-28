FROM node:20-slim
WORKDIR /app
RUN apt update && apt install git -y --no-install-recommends
ENV PATH ./services/front-service/node_modules/.bin/:$PATH

