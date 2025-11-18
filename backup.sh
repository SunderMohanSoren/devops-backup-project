#!/bin/bash

SOURCE_DIR="/home/$USER/devops-backup-project/important_files"
BACKUP_DIR="/home/$USER/devops-backup-project/backups"

DATE=$(date +'%Y-%m-%d_%H-%M-%S')
FILE_NAME="backup_$DATE.tar.gz"

mkdir -p $BACKUP_DIR

tar -czf $BACKUP_DIR/$FILE_NAME $SOURCE_DIR

echo "Backup created: $BACKUP_DIR/$FILE_NAME"
