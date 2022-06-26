#!/usr/bin/env bash

set -euo pipefail

echo "==============================================================================="
echo " "
echo "Starting services..."
echo " "

PGDATA=$PGDATA
DB_USER="sonarqube"
DB_PASS="sonarqube"

declare -a sq_opts=()
set_prop() {
    if [ "$2" ]; then
        sq_opts+=("-D$1=$2")
    fi
}

startDataBase() {
  echo "Starting DB..."
  su-exec postgres pg_ctl start -D $PGDATA
}

stopDataBase() {
  echo "Killing DB..."
  su-exec postgres pg_ctl stop -D $PGDATA
  exit
}

echo "==============================================================================="
echo "Start Database..."

startDataBase
trap stopDataBase SIGINT SIGQUIT SIGTERM

echo "==============================================================================="
echo "SonarQube setup...."

# Set sonar for execution
set -- /scripts/setup/run-sonar.sh

# Set props
set_prop "sonar.jdbc.username" "$DB_USER"
set_prop "sonar.jdbc.password" "$DB_PASS"
set_prop "sonar.jdbc.url" "jdbc:postgresql://localhost:5432/sonarqube"

# Define exec param
if [ ${#sq_opts[@]} -ne 0 ]; then
    set -- "$@" "${sq_opts[@]}"
fi

echo "==============================================================================="
echo "Fixing permissions ..."

chown -R "$(id -u):$(id -g)" "${SQ_DATA_DIR}" "${SQ_EXTENSIONS_DIR}" "${SQ_LOGS_DIR}" "${SQ_TEMP_DIR}" 2>/dev/null || :
chmod -R 700 "${SQ_DATA_DIR}" "${SQ_EXTENSIONS_DIR}" "${SQ_LOGS_DIR}" "${SQ_TEMP_DIR}" 2>/dev/null || :
chown -R sonarqube:sonarqube "${SQ_DATA_DIR}" "${SQ_EXTENSIONS_DIR}" "${SQ_LOGS_DIR}" "${SQ_TEMP_DIR}"

echo "==============================================================================="
echo "Starting SonarQube ..."
# su-exec sonarqube "$0" "$@"
# exec su-exec sonarqube "$0" "$@"
# exec "$@"
su-exec sonarqube java -jar lib/sonar-application-"${SONAR_VERSION}".jar -Dsonar.log.console=true
# tail -f /dev/null

# echo "Params = $@"

while true; do
  sleep 5
done
