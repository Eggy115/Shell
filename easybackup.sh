#!/bin/sh
# Backup Script

# Define backup source and destination directories
BACKUP_SRC="/home/user/my_files"
BACKUP_DEST="/home/user/backups"

# Define backup file name and date
BACKUP_FILENAME="my_files_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

# Create backup archive
tar czf "${BACKUP_DEST}/${BACKUP_FILENAME}" -C "${BACKUP_SRC}" .

# Print success message
echo "Backup complete!"
