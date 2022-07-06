#!/bin/bash

SONAR_HOST_URL=http://url
SONAR_TOKEN="token"
CACHE_DIR="tmp/sonar-cache"

docker container run \
    --rm \
    --env=DEBUG="true" \
    --env=SONAR_HOST_URL="$SONAR_HOST_URL" \
    --env=SONAR_SCANNER_OPTS="-Xmx512m" \
    --env=SONAR_TOKEN="$SONAR_TOKEN" \
    --env=SONAR_LOGIN="$SONAR_TOKEN" \
    --env=EXTRA_ARGS="-Dsonar.projectKey=PROJECT_TEST" \
    -v "src:/usr/src" \
    sonarsource/sonarqube-scan:1.1.0
    # --workdir=$(pwd) \
    # --volume=/tmp/sonar-cache:/opt/sonar-scanner/.sonar/cache \
