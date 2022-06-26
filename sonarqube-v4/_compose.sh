#!/bin/bash

FILENAME="docker-compose.yaml"

echo "Stopping container..."
docker-compose --file $FILENAME down

echo "Rebuilding container..."
docker-compose --file $FILENAME build && docker-compose --file $FILENAME up -d
