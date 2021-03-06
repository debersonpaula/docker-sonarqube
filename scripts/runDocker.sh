#!/usr/bin/env bash

source ../scripts/runCommand.sh

function runDocker() {
    DOCKERFILE=$1
    IMAGE_NAME=$2
    SERVICE_NAME="$2-app"
    # PLATFORM="linux/x86_64"
    # PLATFORM="linux/amd64"
    PORT=$3

    # BUILD_ARGS="--force-rm  --platform $PLATFORM"
    BUILD_ARGS="--force-rm"
    # CREATE_ARGS="--ulimit nofile=131072 --ulimit nproc=8192"
    CREATE_ARGS=""

    runCommand "docker build $BUILD_ARGS -f $DOCKERFILE -t $IMAGE_NAME ." "Rebuild Image '$IMAGE_NAME'" true

    runCommand "docker container rm --force $SERVICE_NAME" "Removing current container"

    runCommand "docker create $CREATE_ARGS --name=$SERVICE_NAME --publish=$PORT:$PORT $IMAGE_NAME" "Building container $SERVICE_NAME over port=$PORT" true

    runCommand "docker container start $SERVICE_NAME" "Running $SERVICE_NAME..."
}
