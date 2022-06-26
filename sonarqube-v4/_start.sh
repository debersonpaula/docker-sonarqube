#!/bin/bash

source ../scripts/runDocker.sh

DOCKERFILE="./Dockerfile"
APP_NAME="sonarqube-v4"
PORT="9000"

runDocker $DOCKERFILE $APP_NAME $PORT