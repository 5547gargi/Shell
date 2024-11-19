#!/usr/bin/env bash

TO=gargi@gmail.co.in
TH_L=400
free_Ram=$(free -mt | grep -E "Total" | awk '{print $4}')

if [[ $free_Ram -lt TH_L ]]
then 
    echo -e "Server is running with low RAM size\nAvailable RAM is : $free_Ram" # | /bin/mail -s "Ram Info $(date)" $TO
fi