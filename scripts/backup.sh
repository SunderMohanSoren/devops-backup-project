#!/bin/bash

# === DevOps Automated Backup Script ===
# Creates timestamped backups and stores them in /app/backups/

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="/app/backups"
SOURCE_DIR="/app/data"
ARCHIVE_NAME="backup_$TIMESTAMP.tar.gz"

echo "🔹 Starting backup at: $TIMESTAMP"
echo "🔹 Source directory: $SOURCE_DIR"

# Create backup archive
tar -czf $BACKUP_DIR/$ARCHIVE_NAME -C $SOURCE_DIR .

echo "✅ Backup completed: $BACKUP_DIR/$ARCHIVE_NAME"
echo "-------------------------------------------"
