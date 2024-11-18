#!/usr/bin/env bash

read -p "Enter your option : " option

if [[ $option == start ]]
then
    echo "starting docker..."
    systemctl start docker
elif [[ $option == stop ]]
then
    echo "stopping docker...."
    systemctl stop docker
elif [[ $option == restart ]]
then
    echo "restarting docker..."
    systemctl restart docker
elif [[ $option == version ]]
then
    version=$(docker -v | cut -d " " -f 3 | tr -d "," )
    echo "Docker version is : $version"
elif [[ $option == status ]]
then
    systemctl status docker 1>/dev/null 2>&1
    if [[ $? == 0 ]]
    then 
        echo "Docker is Up and Running... "
    else
        echo "Docker is not Running..."
    fi
else
    echo "invalid option"
    echo "must pass <start> <stop> <version> <status>"
fi