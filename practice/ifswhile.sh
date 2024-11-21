#!/usr/bin/env bash

<< EOF
while read in line
do
    echo "$line"
done < servers_info.txt
EOF

<< comment1
while IFS="," read f1 f2 f3 f4 f5
do
    echo "$f1 $f2 $f3 $f4 $f5"
done < servers_info1.txt
comment1

OLD_IFS=$IFS
cat servers_info1.txt | awk 'NR!=1 {print}' | while IFS="," read f1 f2 f3 f4 f5
do 
    echo "$f1 $f2"
done
IFS=$OLD_IFS