#!/bin/bash
# Simple directory backup script

# Check if directory name provided
if [ -z "$1" ]; then
    echo "Usage: $0 <directory_to_backup>"
    exit 1
fi

SRC_DIR="$1"
DATE=$(date +%Y-%m-%d)
BACKUP_DIR="backups"
BACKUP_FILE="${BACKUP_DIR}/backup_$(basename "$SRC_DIR")_${DATE}.tar.gz"

# Create backups folder if not exists
mkdir -p "$BACKUP_DIR"

# Create backup
tar -czf "$BACKUP_FILE" "$SRC_DIR"

# Confirm
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup failed!"
fi
