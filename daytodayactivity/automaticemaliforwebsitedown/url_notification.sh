#!/bin/bash

# User Prompt for input data
read -p "Enter your Email_Address : " sender
read -p "Enter Recipiant Email_Address : " receiver
read -s  -p "Enter your Google App Password : " gapp

#List of URLS to check whether they are up or down
urls=("https://ww.example.com" "https://www.google.com" "https://ww.openai.com")

# Fucntion to check the status of the URLS and send Email Notification if any URLS are down
check_urls_and_send_email() {
    local down_urls=""
    local subject="Website is down"
    for url in "${urls[@]}"; do
        response=${curl -Is "$url" | head -n 1}
        if [[ ! $response =~ "200"  ]]; then
            down_urls+="$url\n"
        fi
    done
    if [[ -n $down_urls ]]; then
        body="The following websites are down: \n\n$down_urls"
        email_content="From: $sender\nTo: $reciver\nSubect: $subject\n\n$body"
        response=$(curl -s --url 'smpts://smpt.gmail.com:465' --ssl-req \
            --mail-from "$sender" \
            --mail-recpt "$receiver" \
            --user "$sender:$gapp" \
            -T <(echo -e "$email_content"))
        if [ $? -eq 0 ]; then
            echo "Email send Successfully."
        else
            echo "Fail to send an Email"
            echo " Response: $response"
        fi
    else
        echo "All websites are up and running"

    fi                            
}

# Call the function to check URls status and send Email
check_urls_and_send_email