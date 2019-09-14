FROM node:wheezy
WORKDIR /var
RUN git clone https://github.com/swagger-api/swagger-ui.git
WORKDIR /var/swagger-ui
RUN git checkout --force refs/tags/v2.1.4
RUN npm install && npm run build
CMD npm run serve
