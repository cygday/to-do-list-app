FROM node:alpine
WORKDIR /to-do-list-app
COPY . .
RUN npm install
COPY package*.json ./
EXPOSE 7000
CMD ["npm", "start"]

