# To Monitor the disk_space utilization and  send email

#!/usr/bin/env bash

#Function to check root(/) disk space
check_disk_space() {
    # Get available disk_spce in percentage
    disk_space=$(df -H | awk 'NR==2 {print$5}' | cut -d '%' -f1)

    #Threshold for disk space utilization
    threshold=80  
    
    #Check if disk space exceeds thresho;d limit
    if ["disk_space" -ge "threshold" ]; then
        return 1 # Disk space is critically low
    else
        return 0 # Disk sapce utilization is normal
    fi        
}

#Function to send email
send_email(){
    sender="gargi.123@gmail.com" # sender email
    receiver="sda.hotmail@gmail.com" #receiver email
    googleapp="yufc kjhg loenp nqxk" #Googleapp password
    sub="Disk space alret !!"
    body="Disk space is critically low. Please take necessary action"

    #Sending email using curl
    response=$(curl -s --url 'smpts://smtp.gmail.com:465' --ssl-req \
        --mail-from "$sender" \
        --mail-recpt "$receiver" \
        --user "$sender:$googleapp" \
        -T <(echo -e "From: $sender\nTo: $receiver\nSubject: $sub\n\n$body"))

    if [ $? -eq 0 ]; then
        echo"Email send successfuly."
    else
        echo"Failed to send Email"
        echo"Response: $response" 
    fi          
}

#Main Script
check_disk_space
if [ $? -eq 1 ]; then
    send_email
fi    