#!/usr/bin/env bash

<< forinfinite
for ((;;))
do
    echo "ok"
    echo "------"
done
forinfinite

<< whileinfinite
while true
do
    echo "ok"
    echo "------"
done
whileinfinite

<< EOF
while :
do
    echo "ok"
    echo "------"
done
EOF

# reading file usingwhile loop

<< comment1
fileName=/workspaces/Shell/commands.txt
while read each_line
do  
    echo "$each_line"
done < $fileName
comment1

# cat /workspaces/Shell/commands.txt | while read each_line
# do
#     echo "$each_line"
# done

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
