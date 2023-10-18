FROM node:16-alpine
WORKDIR /usr/src/app
COPY package.json ./
COPY yarn.lock ./
RUN yarn install
COPY apps/cli/src ./src
COPY apps/cli/tsconfig.json ./
RUN yarn tsc
CMD [ "node", "dist/index.js" ]