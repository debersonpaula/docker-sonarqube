FROM debian:bullseye

ARG SONARQUBE_VERSION="9.5.0.56709"
ARG SONARQUBE_BINARY="https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-${SONARQUBE_VERSION}.zip"
ARG JAVA_VERSION="openjdk-11-jdk"

RUN apt update
RUN apt-get -y install sudo
RUN apt -y install $JAVA_VERSION
RUN apt -y install postgresql postgresql-contrib
RUN apt -y install wget unzip curl gnupg2 ca-certificates lsb-release
RUN apt -y install socat procps ufw

RUN wget ${SONARQUBE_BINARY}
RUN unzip sonarqube-${SONARQUBE_VERSION}.zip
RUN mkdir /opt/sonarqube
RUN mv sonarqube-*/* /opt/sonarqube
RUN useradd -M -d /opt/sonarqube/ -r -s /bin/bash sonarqube
RUN chown -R sonarqube:sonarqube -R /opt/sonarqube

COPY ./entrypoint.sh /scripts/entrypoint.sh
# COPY ./sonarqube.service /etc/systemd/system/sonarqube.service
RUN chmod +x /scripts/entrypoint.sh

STOPSIGNAL SIGINT

ENTRYPOINT ["/scripts/entrypoint.sh"]

EXPOSE 80 9000 5432
