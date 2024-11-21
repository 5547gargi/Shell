#!/usr/bin/env bash

if [[ $# -eq 0 ]]
then
    echo "Usage: $0 pakg1 pakg2 ... "
    exit 1
fi

if [[ $(id -u) -ne 0 ]]
then
    echo "please run from root user or with sudo privilages"
    exit 2
fi

for each_pkg in $@
do
    if which $each_pkg &> /dev/null
    then
        echo "$each_pkg is Already installed."
    else
        echo "installing $each_pkg ..."
        apt update -y &> /dev/null
        apt install $each_pkg -y &> /dev/null
        if [[ $? -eq 0 ]]
        then
            echo "Successfully installed $each_pkg "
        else
            echo "Unable to install $each_pkg"
        fi
    fi
done
