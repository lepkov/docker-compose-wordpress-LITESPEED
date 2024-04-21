#!/bin/bash

MYSQL_USER="root"
MYSQL_PASSWORD="my_password"
DB_NAME="XXXXXXXXXXXXXXXXXX"
OUTPUT_DIR="$(pwd)/app/backup/db"
CONTAINER_NAME="dev-wp-db-container"
DATE=$(date '+%Y.%m.%d.%H-%M')
BACKUP_FILENAME="$OUTPUT_DIR/$DATE.$DB_NAME.sql.gz"

docker exec $CONTAINER_NAME /usr/bin/mysqldump -u $MYSQL_USER -p$MYSQL_PASSWORD $DB_NAME > $OUTPUT_DIR/$DATE.$DB_NAME.sql

gzip -f $OUTPUT_DIR/$DATE.$DB_NAME.sql

if [ -f "$BACKUP_FILENAME" ]; then
        echo "Backup completed successfully. Backup file: $BACKUP_FILENAME"
else
        echo "Failed! $BACKUP_FILENAME not found."
fi