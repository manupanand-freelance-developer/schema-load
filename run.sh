
#!/bin/bash
set -ex 



# Clone repo if not already cloned
if [ ! -d "$REPO_DIR" ]; then
    echo "Cloning repository..."
    git clone "$APP_GIT_URL"
fi



if [ "$DB_TYPE" == "mongo" ]; then

  # fallback to localhost if not set
#schema-load/catalogue/db/master.js
for service_dir in "$REPO_DIR"/*; do
    DB_NAME=$(basename "$service_dir")
    DB_PATH="$service_dir/db"
    ls -la

    if [ -d "$DB_PATH" ]; then
        for js_file in "$DB_PATH"/*.js; do
            [ -e "$js_file" ] || continue  # skip if no .js files
            echo "📦 Importing $(basename "$js_file") into DB: $DB_NAME at $DB_HOST"
            mongosh "mongodb://$DB_HOST:27017/$DB_NAME" < "$js_file"
        done
    else
        echo "⚠️  No db/ folder found in $service_dir"
    fi
done
fi
###--------------shipping--
if [ "$DB_TYPE" == "mysql" ]; then

  # fallback to localhost if not set
#schema-load/catalogue/db/master.js
for service_dir in "$REPO_DIR"/*; do
    DB_NAME=$(basename "$service_dir")
    DB_PATH="$service_dir/db"
    ls -la

    if [ -d "$DB_PATH" ]; then
        for sql_file in "$DB_PATH"/*.sql; do
            [ -e "$sql_file" ] || continue  # skip if no .sql files
            echo "📦 Importing $(basename "$sql_file") into DB: $DB_NAME at $DB_HOST"
            mysql -h "$DB_HOST" -u"$DB_USER" -p"$DB_PASS" < "$sql_file"

        done
    else
        echo "⚠️  No db/ folder found in $service_dir"
    fi
done
fi
