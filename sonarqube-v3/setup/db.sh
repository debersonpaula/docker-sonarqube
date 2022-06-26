#!/bin/sh

PGDATA=$PGDATA
POSTGRES_RUNNER="/run/postgresql"
DB_USER="sonarqube"
DB_PASS="sonarqube"

mkdir $POSTGRES_RUNNER
chown postgres:postgres $POSTGRES_RUNNER/

sudo -i -u postgres sh <<EOF
    mkdir $PGDATA
    chmod 0700 $PGDATA
    initdb $PGDATA
    echo "host all  all    0.0.0.0/0  md5" >>$PGDATA/pg_hba.conf
    echo "listen_addresses='*'" >>$PGDATA/postgresql.conf
    pg_ctl start -D $PGDATA
    createuser $DB_USER
    psql -c "ALTER USER $DB_USER WITH ENCRYPTED password '$DB_PASS'"
    psql -c "CREATE DATABASE $DB_USER OWNER $DB_USER"
    psql -c "GRANT ALL PRIVILEGES ON DATABASE $DB_USER to $DB_USER"
    pg_ctl stop -D $PGDATA
EOF
