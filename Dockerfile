FROM node:20-alpine

WORKDIR /app

COPY package.json ./
RUN npm install --production

COPY server.js ./
COPY tandenpoets.html ./

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget -qO- http://localhost:8000/health || exit 1

CMD ["node", "server.js"]
