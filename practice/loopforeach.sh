#!/usr/bin/env bash

<< foreach
for each in statusdocker.sh cornjob.sh test.sh userRootOrNot.sh
do 
    if [[ -x $each ]]
    then
        echo "$each has execution permission."
    else
        echo "$each hasn't execution permission"
    fi
done
foreach

# to check all the file has execution permission or not in a given directory

if [[ $# -ne 1 ]]
then 
    echo "Usage : $0 <any path>"
    exit 
fi
givenpath=$1
# read -p "Provide the entire folder path : " givenpath
for each in $(ls $givenpath)
do 
    if [[ -x $each ]]
    then
        echo "$each has execution permission."
    else
        echo "$each hasn't execution permission"
    fi
done