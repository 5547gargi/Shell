#!/usr/bin/env bash

# Define Domain_name and email variables
DOMAIN="practice-cert.tech"

EMAIL="contact@practice-cert.tech"

# Define the path to the Let's Encript Script
LE_SCRIPT="/usr/bin/certbot"

# Define path for the SSL Certificate
CERTIFICATE_PATH="/etc/letsencrypt/live/$DOMAIN/fullchain.pem"

# Define the path for the certificate log_file
LOG_FILE="/var/log/certbot-renewal.log"

# Check if the certificate needs renewal
if ! $LE_SCRIPT renew --dry-run > $LOG_FILE 2>&1; then
    # Certicate needs renewal and run the renewal script
    echo "$(date +"%Y-%m-%d %H-%M-%S") - Certificate for $DOMAIN needs renewal" >> $LOG_FILE
    # Execute Certifiacte renewal
    $LE_SCRIPT renew --nonintercative --agree-tos --email $EMAIL >> $LOG_FILE 2>&1
    #Check if renewal was successful
    if [ $? -eq o ]; then
        echo "$(date +"%Y-%m-%d %H-%M-%S") - Certifiacte Renewal for $DOMAIN Successfully renewed" >> $LOG_FILE
        # Restart the web_server for the changes to be applied
        systemctl restart nginx
    else
        echo "$(date +"%Y-%m-%d %H-%M-%S") - Certificate Renewal for $DOMAIN Was Unsuccessful" >> $LOG_FILE
    fi
else
    # Certificate doesn't need renewal
    echo "$(date +"%Y-%m-%d %H-%M-%S") - Certificate for $DOMAIN is up to date; no need for renewal" >> $LOG_FILE
fi               