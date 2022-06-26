#!/bin/sh

set -euo pipefail

PGDATA=$PGDATA
# DB_USER="sonarqube"
# DB_PASS="sonarqube"

# # echo "Set up DB for SonarQube...."
# # echo -e "postgres\npostgres" | passwd postgres

echo "============================================================"
echo "Start Database...."
echo "============================================================"

sleep 1;

su-exec postgres pg_ctl start -D $PGDATA

su-exec sonarqube echo "From SonarQube"
# sudo -i -u sonarqube sh <<EOF
#     echo "From SonarQube"
# EOF

# # Sonar Script setup
# sed -i 's/#RUN_AS_USER=/RUN_AS_USER=sonarqube/g' /opt/sonarqube/bin/linux-x86-64/sonar.sh

# # DB Connection setup
# echo 'sonar.jdbc.username=sonarqube' >>/opt/sonarqube/conf/sonar.properties
# echo 'sonar.jdbc.password=$DB_PASS' >>/opt/sonarqube/conf/sonar.properties
# # echo 'sonar.jdbc.url=jdbc:postgresql://localhost:5432/sonarqube' >>/opt/sonarqube/conf/sonar.properties
# echo 'sonar.jdbc.url=jdbc:postgresql://localhost/sonarqube' >>/opt/sonarqube/conf/sonar.properties

# # Elasticsearch storage path
# echo 'sonar.path.data=/var/sonarqube/data' >>/opt/sonarqube/conf/sonar.properties
# echo 'sonar.path.temp=/var/sonarqube/temp' >>/opt/sonarqube/conf/sonar.properties
# mkdir /var/sonarqube
# # mkdir /var/sonarqube/temp
# chown -R sonarqube:sonarqube -R /var/sonarqube

# # Web Server
# echo 'sonar.web.host=0.0.0.0' >>/opt/sonarqube/conf/sonar.properties
# echo 'sonar.web.port=80' >>/opt/sonarqube/conf/sonar.properties
# echo 'sonar.web.context=/sonarqube' >>/opt/sonarqube/conf/sonar.properties

# # echo "networkaddress.cache.ttl=5" >> /usr/lib/jvm/java-11-openjdk-amd64/conf/security/java.security
# echo 'sonar.search.javaAdditionalOpts=-Dbootstrap.system_call_filter=false' >>/opt/sonarqube/conf/sonar.properties

# /opt/sonarqube/bin/linux-x86-64/sonar.sh start
# /opt/sonarqube/bin/linux-x86-64/sonar.sh status
# /opt/sonarqube/bin/linux-x86-64/sonar.sh console

tail -f dev/null