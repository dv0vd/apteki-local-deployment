FROM gcr.io/distroless/nodejs:18 as distroless
FROM node:18-slim as base
ENV NODE_ENV=development
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    tini \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir /app && chown -R node:node /app
WORKDIR /app
USER node
COPY --chown=node:node ./services/redirect-service/package*.json ./
RUN npm ci --omit=dev --ignore-scripts && npm cache clean --force

FROM base as build
COPY --chown=node:node ./services/redirect-service .
RUN npm run build

FROM distroless as prod
COPY --from=build --chown=1000:1000 /app/ /app
COPY --from=base /usr/bin/tini /usr/bin/tini
USER 1000
EXPOSE 3000
ENV NODE_ENV=development
ENV PATH=/app/node_modules/.bin:$PATH
WORKDIR /app
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/nodejs/bin/node", "dist/main.js"]
