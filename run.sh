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
    ls -la
    mongosh --host "$DB_HOST" < "/app/$file"
  done
fi

# Load MySQL schema(s)
if [ "$DB_TYPE" == "mysql" ]; then
  for file in $SCHEMA_FILES; do
    echo "Loading MySQL schema: $file"
    ls -la 
    mysql -h "$DB_HOST" -u"$DB_USER" -p"$DB_PASS" < "/app/$file"
  done
fi
