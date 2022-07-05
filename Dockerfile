FROM node:16-alpine

ENV NODE_ENV production

WORKDIR /app

COPY package*.json .

RUN npm install
RUN npm install -g serve

COPY . .

RUN npm run build

EXPOSE 5000

CMD ["/bin/sh", "-c", "serve", "-s", "build", "-l", "5000"]
