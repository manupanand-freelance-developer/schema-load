echo 'show databases' | mysql -h $DB_HOST -u$DB_USER -p$DB_PASS

for file in $SCHEMA_FILES ; do
  mysql -h $DB_HOST -u$DB_USER -p$DB_PASS < /app/db/$file.sql
done