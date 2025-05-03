#!/usr/bin/env bash


#Exit immediately if the command exits with non-zero status
set -e

#Check if mongosh is installed or not
if ! command -v mongosh &> /dev/null; then
    echo "Mongosh couldnot found !! please install before running this script"
    exit 1
fi

#Define mongodb connection details (improve security with environment variables)
MONGODB_USERNAME="${MONGODB_USERNAME:-}"
MONGOBD_PASSWORD="${MONGODB_PASSWORD:-}"

if [[ -z "$MONGODB_USERNAME" || -z "$MONGOBD_PASSWORD" ]]; then
    echo "MongoDB userName or password is not set. Please set the MONGODB_USERNAME and MONGODB_PASSWORD as environment varibles"
    exit 2
fi

#Trigger MongoDB Log rotation
mongo_command="db.adminCommand({ logRotate:1 })"
if ! mongosh_output=$(mongosh --eval "$mongo_command" -u "MONGODB_USERNAME" -p "MONGODB_PASSWORD" 2>&1); then
    echo "Failed to rotate MongoDB logs. Error : $mongosh_output"
    exit 3
fi

echo "log rotation command executed; waiting for the log rotation to complete..."
#wait for logRotation to complete (adjust based on the logRotation time)
sleep 120

#Define search criteria for old log files
lod_dir="/var/log/mongodb"
log_prefix="mongodb.log.2025"
max_file_age=5 #File older than 5 days will be removed

#Find and delete the old log files
if find "$log_dir" -name "${log_prefix}*" -mtime +"$max_file_age" -exec rm -rf {} \;; then
    echo "MongoDb log rotation and cleanup completed successfully"
else
    echo "Error occourred during cleanup of old files"
    exit4
fi        