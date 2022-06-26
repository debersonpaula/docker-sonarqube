#!/bin/bash

source ../scripts/runDocker.sh

DOCKERFILE="./Dockerfile"
APP_NAME="sonarqube-v3"
PORT="5432"

runDocker $DOCKERFILE $APP_NAME $PORT