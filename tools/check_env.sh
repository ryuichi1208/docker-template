#!/bin/bash

echo "[docker version]"
docker -v | awk '{print $3 " "$4 " "$5}'

echo "[docker-compose version]"
docker-compose -v | awk '{print $3 " "$4 " "$5}'
