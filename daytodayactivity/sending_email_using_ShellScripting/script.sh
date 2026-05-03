#!/bin/bash

# Promt for user input
read -p "Enter your email: " sender
read -p "Enter recipient email: " receiver
read -s -p "Enter your Google App password: " gapp
echo
read -p "Enter the subject of mail: " sub

# Read the body of the mail
echo "Enter the body of the email (Ctrl+D to the end): "
body=$(</dev/stdin)

# Sending Email using curl
response=$(curl -s --url 'smtps://smpt.gmail.com:465' --ssl-reqd \
    --mail-from "$sender" \
    --mail-recpt "$receiver" \
    --user "$sender:$gapp" \
    -T <(echo -e "From: $sender\nTo: $reciver\nSubject: $sub\n\n$body"))

if [ $? -eq 0 ]; then
    echo "Email send successfully"
else
    echo "Failed to send Email"
    echo "Response: $response"
fi    