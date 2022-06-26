FROM alpine:3.16.0

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US:en' \
    LC_ALL='en_US.UTF-8'

# Base Setup
ARG SONARQUBE_VERSION=9.5.0.56709
ARG SONARQUBE_ZIP_URL=https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-${SONARQUBE_VERSION}.zip
ENV JAVA_HOME='/usr/lib/jvm/java-11-openjdk' \
    PATH="/opt/java/openjdk/bin:$PATH" \
    SONARQUBE_HOME=/opt/sonarqube \
    SONAR_VERSION="${SONARQUBE_VERSION}" \
    SQ_DATA_DIR="/opt/sonarqube/data" \
    SQ_EXTENSIONS_DIR="/opt/sonarqube/extensions" \
    SQ_LOGS_DIR="/opt/sonarqube/logs" \
    SQ_TEMP_DIR="/opt/sonarqube/temp" \
    PGDATA="/var/lib/postgresql/data"

# Install Packages
RUN apk add --no-cache openjdk11-jre
RUN apk add --no-cache openrc
RUN apk add --no-cache postgresql12
RUN apk add --no-cache sudo
RUN apk add --no-cache curl
RUN apk add --no-cache gnupg
RUN apk add --no-cache su-exec
RUN apk add --no-cache bash
RUN curl --fail --location --output sonarqube.zip --show-error "${SONARQUBE_ZIP_URL}"

# Copy setup scripts
COPY setup /scripts/setup
# RUN chmod +x /scripts/setup/db.sh
# RUN chmod +x /scripts/setup/openrc.sh
# RUN chmod +x /scripts/setup/sonar.sh
# RUN chmod +x /scripts/setup/run.sh
# RUN chmod +x /scripts/setup/run-sonar.sh

# Workaround for the Error Message in OpenRC
RUN /scripts/setup/openrc.sh

# DB Setup
RUN /scripts/setup/db.sh

# SonarQube
RUN /scripts/setup/sonar.sh

WORKDIR ${SONARQUBE_HOME}

# EXEC
STOPSIGNAL SIGINT
EXPOSE 9000 5432
# ENTRYPOINT ["/scripts/setup/run.sh"]
# CMD ["/scripts/setup/run-sonar.sh"]
# ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["/scripts/setup/run.sh"]
CMD ["/scripts/setup/run-sonar.sh"]
