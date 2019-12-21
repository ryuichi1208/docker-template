FROM python:3.8.0-alpine
USER root:root
WORKDIR /root

COPY --chown=root:root requirements.txt .
RUN apk update \
	&& apk add --no-cache \
	vim \
	curl \
	&& pip install -U pip \
	&& pip install -r requirements.txt

ENTRYPOINT ["/usr/local/bin/python"]
