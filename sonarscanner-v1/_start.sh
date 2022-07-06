#!/bin/bash

source ../scripts/runDocker.sh

# DOCKERFILE="./Dockerfile"
DOCKERFILE="./Dockerfile.base"
APP_NAME="sonarscanner-v1"
PORT="9000"

runDocker $DOCKERFILE $APP_NAME $PORT