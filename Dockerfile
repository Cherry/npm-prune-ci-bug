FROM node:10-alpine AS base
WORKDIR /test
RUN npm i -g npm@6.13.1

# --- Dependencies
FROM base as dependencies
RUN apk add --no-cache git
COPY package.json package-lock.json /test/


RUN cd /test/ && npm ci



# --- Build
FROM base as build
COPY --from=dependencies --chown=node:node /test/node_modules /test/node_modules
COPY --chown=node:node . /test

RUN apk add --no-cache git

RUN npm prune --production

