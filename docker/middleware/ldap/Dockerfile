FROM debian:8
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
        slapd \
        ldap-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
