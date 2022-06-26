#!/bin/bash

source ../scripts/runDocker.sh

DOCKERFILE="./Dockerfile"
APP_NAME="sonarqube-v2"
PORT="9000"

runDocker $DOCKERFILE $APP_NAME $PORT