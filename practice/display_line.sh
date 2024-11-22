#!/usr/bin/env bash
<< usingecho
COLUMNS=$(tput cols)
for ((i=1;i<=COLUMNS;i++))
do
    if [[ $i -eq $COLUMNS ]]
    then
        echo "-"
        break
    fi
    echo -n "-"
done
usingecho

# printf "%113s" " "
#printf "%113s\n" " " | tr " " "-"

title="Welcome to Automation through shell_script with GSD"
COLUMNS=$(tput cols)
title_size=${#title}
span=$((($COLUMNS + $title_size) / 2))
printf "%${COLUMNS}s" " " | tr " " "*"
printf "%${span}s\n" "$title"
printf "%${COLUMNS}s" " " | tr " " "*"


