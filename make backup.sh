#!/bin/bash

BACKUP_DIR="/path/to/backup/directory"
SOURCE_DIR="/path/to/source/directory"

TODAY=$(date +"%Y-%m-%d")

tar -czf "$BACKUP_DIR/$TODAY.tar.gz" "$SOURCE_DIR"
