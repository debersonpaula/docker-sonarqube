#!/usr/bin/env bash

DB_USER="sonarqube"
DB_PASS="SecurePassword"

echo "Starting DB...."
service postgresql start
service postgresql status

echo "Set up DB for SonarQube...."
echo -e "postgres\npostgres" | passwd postgres

sudo -i -u postgres bash <<EOF
    createuser $DB_USER
    psql -c "ALTER USER $DB_USER WITH ENCRYPTED password '$DB_PASS'"
    psql -c "CREATE DATABASE $DB_USER OWNER $DB_USER"
    psql -c "GRANT ALL PRIVILEGES ON DATABASE $DB_USER to $DB_USER"
EOF

sed -i 's/#RUN_AS_USER=/RUN_AS_USER=sonarqube/g' /opt/sonarqube/bin/linux-x86-64/sonar.sh

# DB Connection setup
echo 'sonar.jdbc.username=sonarqube' >>/opt/sonarqube/conf/sonar.properties
echo 'sonar.jdbc.password=$DB_PASS' >>/opt/sonarqube/conf/sonar.properties
# echo 'sonar.jdbc.url=jdbc:postgresql://localhost:5432/sonarqube' >>/opt/sonarqube/conf/sonar.properties
echo 'sonar.jdbc.url=jdbc:postgresql://localhost/sonarqube' >>/opt/sonarqube/conf/sonar.properties

# Elasticsearch storage path
echo 'sonar.path.data=/var/sonarqube/data' >>/opt/sonarqube/conf/sonar.properties
echo 'sonar.path.temp=/var/sonarqube/temp' >>/opt/sonarqube/conf/sonar.properties
mkdir /var/sonarqube
# mkdir /var/sonarqube/temp
chown -R sonarqube:sonarqube -R /var/sonarqube

# Web Server
echo 'sonar.web.host=0.0.0.0' >>/opt/sonarqube/conf/sonar.properties
echo 'sonar.web.port=80' >>/opt/sonarqube/conf/sonar.properties
echo 'sonar.web.context=/sonarqube' >>/opt/sonarqube/conf/sonar.properties

echo "networkaddress.cache.ttl=5" >> /usr/lib/jvm/java-11-openjdk-amd64/conf/security/java.security
echo 'sonar.search.javaAdditionalOpts=-Dbootstrap.system_call_filter=false' >>/opt/sonarqube/conf/sonar.properties

# ufw allow 9000/tcp

# /opt/sonarqube/bin/linux-x86-64/sonar.sh start
# /opt/sonarqube/bin/linux-x86-64/sonar.sh status
# /opt/sonarqube/bin/linux-x86-64/sonar.sh console

tail -f dev/null
