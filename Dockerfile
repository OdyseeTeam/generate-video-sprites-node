FROM oven/bun:1-alpine

RUN apk add --no-cache ffmpeg

WORKDIR /usr/src/app

COPY package.json bun.lock ./
RUN bun install --frozen-lockfile --production
COPY . .
