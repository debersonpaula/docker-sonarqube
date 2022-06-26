#!/bin/sh

addgroup -S -g 1000 sonarqube
adduser -S -D -u 1000 -G sonarqube sonarqube
echo "networkaddress.cache.ttl=5" >>"${JAVA_HOME}/conf/security/java.security"
sed --in-place --expression="s?securerandom.source=file:/dev/random?securerandom.source=file:/dev/urandom?g" "${JAVA_HOME}/conf/security/java.security"

mkdir --parents /opt
cd /opt

unzip -q /sonarqube.zip
mv "sonarqube-${SONARQUBE_VERSION}" sonarqube
rm /sonarqube.zip*
rm -rf ${SONARQUBE_HOME}/bin/*
chown -R sonarqube:sonarqube ${SONARQUBE_HOME}
chmod -R 777 "${SQ_DATA_DIR}" "${SQ_EXTENSIONS_DIR}" "${SQ_LOGS_DIR}" "${SQ_TEMP_DIR}"
