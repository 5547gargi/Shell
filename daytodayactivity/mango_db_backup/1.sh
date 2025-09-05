#!/bin/bash

#get the current date and time for the backup file
now="$(date +'%d-%m-%Y_%H-%M')"
filename1="Mango_bk_$now"
backup_folder="/home/ubuntu/mangodb_backup"
fullpathbackupfile1="$backup_folder/$filename1"
logfile="$backup_folder/backup_log_$(date +'%Y_%m').txt"

#log the start time of mangodump
echo "mangodump started at $(date +'%d-%m-%Y_%H:%M')" >> "$logfile"

#perform the mangodump
mangodump --username Bijayalaxmi --password tupa --gzip --out "$fullpathbackupfile1" --authenticationDatabase admin

#log the finish time for mongodump
echo "mangodump finished at $(date +'%d-%m-%Y_%H:%M')" >> "$logfile"

#change file permission
chown ubuntu "$fullfilepathbackupfile1"
chown ubuntu "$logfile"
echo "file permission has changed" >> "$logfile"

#find and delete olf backupfile for 1 day
find "$backup_folder" -name "Mango_bk*" -mtime +1 -exec rm -rf {} \;
echo "old files deleted $(date +'%d-%m-%Y_%H-%M')" >> "$logfile"

#log the end of the operation
echo "operation finished at $(date +'%d-%m-%Y_%H:%M')" >> "$logfile"

#Exit script
exit 0