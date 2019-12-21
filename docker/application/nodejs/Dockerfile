FROM node:10
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install \
	&& npm install -g pm2
COPY . .
EXPOSE 8080
# CMD ["pm2-docker", "start", "server.js", "-i", "0"]
