#!/bin/sh
# Automated Backup and Restore

# Define backup and restore paths
BACKUP_PATH="/var/backups/myapp"
RESTORE_PATH="/var/www/myapp"

# Create backup directory if it doesn't exist
if [ ! -d "$BACKUP_PATH" ]; then
    mkdir -p $BACKUP_PATH
fi

# Backup database and files
mysqldump -u myapp -p password myapp > $BACKUP_PATH/myapp.sql
tar -czf $BACKUP_PATH/myapp_files.tar.gz /var/www/myapp

# Restore database and files
if [ -d "$RESTORE_PATH" ]; then
    rm -rf $RESTORE_PATH
fi
mkdir -p $RESTORE_PATH
mysql -u myapp -p password myapp < $BACKUP_PATH/myapp.sql
tar -xzf $BACKUP_PATH/myapp_files.tar.gz -C $RESTORE_PATH
