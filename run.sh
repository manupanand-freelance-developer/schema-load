#!/bin/bash
set -ex

# Clone the repo
mkdir -p /app
git clone $APP_GIT_URL /app

# Optional: print structure
ls -R /app

# Load MongoDB schema(s)
if [ "$DB_TYPE" == "mongo" ]; then
  for file in $SCHEMA_FILES; do
    echo "Loading Mongo schema: $file"
    if [[ "$DB_HOST" == mongodb://* ]]; then
      mongosh "$DB_HOST" < "/app/$file"
    else
      mongosh --host "$DB_HOST" < "/app/$file"
    fi
  done
fi

# Load MySQL schema(s)
if [ "$DB_TYPE" == "mysql" ]; then
  for file in $SCHEMA_FILES; do
    echo "Loading MySQL schema: $file"
    mysql -h "$DB_HOST" -u"$DB_USER" -p"$DB_PASS" < "/app/$file"
  done
fi
