FROM node:14
WORKDIR /app
COPY index.js /app
COPY package*.json /app
RUN npm install
EXPOSE 8080
CMD ["node","index.js"]