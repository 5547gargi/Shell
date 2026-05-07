#!/bin/bash

# Database credentials
MYSQL_USER="Bijayalaxmi"
MYSQL_PASSWORD="devops"
MYSQL_DB="mydb_backup"
# Backup file path
BACKUP_FILE="/home/ubuntu/mysql_backup/mydb_backup.sql"

# Find the latest backup file
LATEST_BACKUP=$(ls -t /home/ubuntu/mysql_backup/mydb_backup_*.sql | head -1)

# Check if a backup file exists
if [ -z "$LATEST_BACKUP" ]; then
    echo "No backup file found in /home/ubuntu/mysql_backup"
    exit 1
fi

# Create the database
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;"

# Check if the database was created successfully
if [ $? -ne 0 ]; then
    echo "Error creating database $MYSQL_DB"
    exit 1
fi

# Restore the backup To the new database
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DB < $LATEST_BACKUP

# Check if the restore was successful

if [ $? -eq 0 ]; then
    echo "Database restore successful from $LATEST_BACKUP to $MYSQL_DB"
else
    echo "Error occurred during database restore"
    exit 1
fi