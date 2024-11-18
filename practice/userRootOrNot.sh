#!/usr/bin/env bash

#userid=$(id -u)

#[[ $userid -eq 0 ]] && echo "User is a rootUser" || echo "User is  not rootUser"
#[[ $(id -u) -eq 0 ]] && echo "User is a rootUser" || echo "User is  not rootUser"

<< Bl
if [[ $(id -u) -eq 0 ]] 
then
    echo "User is a rootUser"
else
    echo "User is not rootUser"
fi
Bl

sudo -v 1>/dev/null 2>/dev/null && echo "The user $(id -un) is having sudo privilages on this host $(hostname)" || echo "the user $(id -un) is not having sudo privilages on this host $(hostname)"