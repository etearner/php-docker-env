#!/usr/bin/env bash
set -em

docker-entrypoint.sh postgres &

until pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB" &>/dev/null
do
  echo "Waiting for PostgreSQL..."
  sleep 1
done

echo "PostgreSQL is ready."

if psql -U "$POSTGRES_USER" "$POSTGRES_DB" -t -c '\du' | cut -d \| -f 1 | grep -qw "$POSTGRES_TEST_USER"; then
  echo "$POSTGRES_TEST_USER already exists skip."
else
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER $POSTGRES_TEST_USER WITH PASSWORD '$POSTGRES_TEST_USER_PASSWORD';
    CREATE DATABASE $POSTGRES_TEST_DB;
    GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_TEST_DB TO $POSTGRES_TEST_USER;
    ALTER DATABASE $POSTGRES_TEST_DB OWNER TO $POSTGRES_TEST_USER;
    ALTER USER $POSTGRES_TEST_USER CREATEDB;
EOSQL
  echo "$POSTGRES_TEST_USER exists now."
fi

fg %1
