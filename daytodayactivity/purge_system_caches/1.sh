#!/bin/bash

#Function to purge system caches
purging(){
    sudo sync
    sudo sh -c 'echo 1 > /proc/sys/vm/drop_caches'
    sudo sync
    sudo sh -c 'echo 1 > /proc/sys/vm/drop_caches'
    sudo sync
    sudo sh -c 'echo 1 > /proc/sys/vm/drop_caches'
    sudo sync
    sudo sh -c 'echo 2 > /proc/sys/vm/drop_caches'
    sudo sync
    sudo sh -c 'echo 2 > /proc/sys/vm/drop_caches'
    sudo sync
    sudo sh -c 'echo 2 > /proc/sys/vm/drop_caches'
    sudo sync
    sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'
    sudo sync
    sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'
    sudo sync
    sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'
}

#function to generate report
report(){
    local ip_address=$(curl -s -4 ident.me)
    echo -e "\n\n\nServer $(ip_address)'s cache Purging report:- \n------ Before Purging -----\n$(cat ~old)\n\n--------After Purging---------\n$(free -wh)\nTimeStamp:- $(TZ='Asia/Kolkata' date)\n\n"
}

#record the memory usage before purging
free -wh > ~/old

#purge caches and generate report
purging > /dev/null 2>&1 && report || echo -e "Kindly run with sudo permission\nExample:- sudo $0"