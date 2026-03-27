# syntax=docker/dockerfile:1

FROM node:22-bookworm-slim AS builder

ENV PUPPETEER_SKIP_DOWNLOAD=true

WORKDIR /app

RUN apt-get update \
  && apt-get install -y --no-install-recommends python3 make g++ \
  && rm -rf /var/lib/apt/lists/*

COPY package.json tsconfig.json ./
COPY src ./src

RUN npm install
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-bookworm-slim AS runtime

ENV NODE_ENV=production
ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV MCP_HTTP_HOST=0.0.0.0
ENV MCP_HTTP_PORT=8787

WORKDIR /app

COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist

EXPOSE 8787

ENTRYPOINT ["node", "dist/index.js"]
