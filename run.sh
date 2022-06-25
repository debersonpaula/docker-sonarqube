#!/bin/bash

# DOCKERFILE="./Dockerfile"
# SERVICE_NAME="sonarqube1"
# IMAGE_NAME="sonarqube1"
# PLATFORM="linux/x86_64"
# PORT="9000"

# cd sonarqube-x

# echo "/-----------------------------------------------"
# echo "Rebuild Image '$IMAGE_NAME'"
# # docker build --force-rm --platform $PLATFORM -f $DOCKERFILE -t $IMAGE_NAME .
# docker build --force-rm -f $DOCKERFILE -t $IMAGE_NAME .

# echo "/-----------------------------------------------"
# echo "Removing current container"
# docker container rm --force $SERVICE_NAME

# echo "/-----------------------------------------------"
# echo "Building container $SERVICE_NAME over port=$PORT"
# docker create --name=$SERVICE_NAME --publish=$PORT:$PORT $IMAGE_NAME

# echo "/-----------------------------------------------"
# echo "Running..."
# docker container start $SERVICE_NAME


FILENAME="old/sonarqube-h3.yaml"

echo "Stopping container..."
docker-compose --file $FILENAME down

echo "Rebuilding container..."
docker-compose --file $FILENAME build && docker-compose --file $FILENAME up -d