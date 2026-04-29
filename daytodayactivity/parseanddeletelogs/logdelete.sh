#!/bin/bash

#Get the filename as an argument
logfile="var/log/syslog"

#Check if a file name is provided or not
if [ -z "$logfile" ]; then
    echo "Error: please spesify a filename as an argument"
    exit 1
fi

#Check if provided filename exsists or not
if [ ! -f "$logfile" ]; then
    echo "Error: File '$logfile' does not exits."
    exit 1
fi

#Create a backup file with in the same file directory provided with timestamp
backup_file="$logfile.bac-$(date +%Y-%m-%d)"
cp "$logfile" "$backup_file"

if [ $? -eq 0 ]; then
    echo "Created backup: $backup_file"
    #Delete the original file by confirming before deletion
    read -p "Are you sure you want to delete '$logfile' (y/N) " answer
    if [ "$answer" == "y" ] || [ "$answer" == "Y" ]; then
        rm "$logfile"
        echo "Deleted: $logfile"
    else
        echo "Deletion Cancelled"
    fi
else
    echo "Error: Failed to create backup"    
fi            