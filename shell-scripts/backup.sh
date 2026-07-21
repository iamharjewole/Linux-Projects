#!/bin/bash
SOURCE_DIR=$1
BACKUP_DIR=$2
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

if [ -d "$SOURCE_DIR" ]; then
    tar -czf "$BACKUP_FILE" "$SOURCE_DIR"
    echo "Backup completed: $BACKUP_FILE"
else
    echo "Source directory does not exist."
fi