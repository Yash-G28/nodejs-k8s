FROM node:12

WORKDIR /app

COPY apps/package.json /app

RUN npm install express --save

COPY apps/ /app

EXPOSE 80

CMD ["node", "index.js"]
