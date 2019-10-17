FROM buildpack-deps:jessie

RUN apt-get -y update
RUN apt-get -y install build-essential sl

RUN useradd -ms /bin/bash username

USER username
WORKDIR /home/username
