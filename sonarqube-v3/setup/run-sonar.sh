#!/usr/bin/env bash

echo "Runnning SonarQube with params = $@"

exec java -jar lib/sonar-application-"${SONAR_VERSION}".jar -Dsonar.log.console=true "$@"