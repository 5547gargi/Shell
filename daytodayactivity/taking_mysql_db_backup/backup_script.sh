#!/bin/bash

# Database credentials
DB_USER="Bijayalaxmi"
DB_PASSWORD="devops"
DB_NAME="mydb"

# Backup directory
BACKUP_DIR="/home/ubuntu/mysql_backup"

# Date format for backup file
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_backup_$DATE.sql"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Perform the backup using mysqldump
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Database backup successful: $BACKUP_FILE"
else
    echo "Error occurred during database backup"
fi