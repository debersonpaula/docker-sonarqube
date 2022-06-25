#!/bin/bash

source ../scripts/runDocker.sh

DOCKERFILE="./Dockerfile"
APP_NAME="sonarqube-x"
PORT="9000"

runDocker $DOCKERFILE $APP_NAME $PORT

# function runCommand {
#     cmd=$1
#     msg=$2
#     exitonfail=$3

#     echo "-----------------------------------------------"
#     echo "[RUN]: $msg"
#     $cmd
#     status=$?
#     if [ ! $status -eq 0 ]; then
#         if ((exitonfail == true)); then
#             exit 1
#         fi
#     fi
# }

# BUILD_ARGS="--force-rm  --platform $PLATFORM"
# CREATE_ARGS="--ulimit nofile=131072 --ulimit nproc=8192"

# runCommand "docker build $BUILD_ARGS -f $DOCKERFILE -t $IMAGE_NAME ." "Rebuild Image '$IMAGE_NAME'" true

# runCommand "docker container rm --force $SERVICE_NAME" "Removing current container"

# runCommand "docker create $CREATE_ARGS --name=$SERVICE_NAME --publish=$PORT:$PORT $IMAGE_NAME" "Building container $SERVICE_NAME over port=$PORT" true

# runCommand "docker container start $SERVICE_NAME" "Running $SERVICE_NAME..."

# docker run -t -d --name=$SERVICE_NAME --publish=$PORT:$PORT $IMAGE_NAME