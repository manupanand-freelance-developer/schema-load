for file in $SCHEMA_FILES ; do
  mongosh --host $DB_HOST </app/db/$file.js
done

