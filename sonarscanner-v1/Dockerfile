FROM sonarsource/sonar-scanner-cli

ARG CACHE_DIR="tmp/sonar-cache"

ENV SONAR_SCANNER_OPTS="-Xmx512m"
ENV SONAR_HOST_URL="url"
ENV SONAR_LOGIN="token"
ENV SONAR_PROJECT_BASE_DIR="/usr/src"
# COPY cacerts /usr/lib/jvm/default-jvm/jre/lib/security/cacerts
COPY app /usr/src

VOLUME ${CACHE_DIR}:/opt/sonar-scanner/.sonar/cache

# ENTRYPOINT ["tail", "-f", "/dev/null"]
