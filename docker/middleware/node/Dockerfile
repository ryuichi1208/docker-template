FROM node:alpine3.11

WORKDIR /app

RUN mkdir -p /root/.ssh \
    && apk add --update --no-cache \
        git \
        openssh \
        vim \
        curl \
    && echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
