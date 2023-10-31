#!/bin/bash

DOCKERFILE="./Dockerfile"
SERVICE_NAME="sonarqube1"
IMAGE_NAME="sonarqube1"
PORT="9000"

function runCommand {
    cmd=$1
    msg=$2
    exitonfail=$3

    echo "-----------------------------------------------"
    echo "[RUN]: $msg"
    $cmd
    status=$?
    if [ ! $status -eq 0 ]; then
        if ((exitonfail == true)); then
            exit 1
        fi
    fi
}

BUILD_ARGS="--force-rm"
CREATE_ARGS=""

runCommand "docker build $BUILD_ARGS -f $DOCKERFILE -t $IMAGE_NAME ." "Rebuild Image '$IMAGE_NAME'" true

runCommand "docker container rm --force $SERVICE_NAME" "Removing current container"

runCommand "docker create $CREATE_ARGS --name=$SERVICE_NAME --publish=$PORT:$PORT $IMAGE_NAME" "Building container $SERVICE_NAME over port=$PORT" true

runCommand "docker container start $SERVICE_NAME" "Running $SERVICE_NAME..."
