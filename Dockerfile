FROM node:12.16

RUN mkdir /workspace && chown node:node /workspace

USER node
WORKDIR /workspace

COPY package.json package-lock.json ./
RUN npm config set update-notifier false && npm install --quiet
