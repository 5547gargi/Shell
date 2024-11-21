#!/usr/bin/env bash

<< EOF
# password saves in a file named pass file
for each_ser in 100.26.187.33 54.208.63.88
do
    echo "Executing cmds on $each_ser "
    echo "===============================" 
    for each_cmd in date uptime  "free -m"
    do
        echo "the $each_cmd command output on the server : $each_ser "
        ssh -f pass ssh -o StrictKeyChecking=No automationUsr@each_ser "$each_cmd"
        echo "====================================================="
    done
done
EOF

<< SSH
# for passwordless authentication :- go to .shh folder --- cd .ssh and ssh-keygen and enter 4 times
# for which id_rsa and id_rsa.pub will be generated and we have to share id_rsa.pub to remote server
# ssh-copy-id automationusr@100.26.187.33
# ssh-copy-id automationusr@54.208.63.88    }-> for both the server 
# if servers are there in a file named remote_server.txt 
for each_ser in $(cat cat remote_server.txt )
do
    echo "Executing cmds on $each_ser "
    echo "===============================" 
    for each_cmd in date uptime  "free -m"
    do
        echo "the $each_cmd command output on the server : $each_ser "
        ssh -o StrictKeyChecking=No automationUsr@each_ser "$each_cmd"
        echo "====================================================="
    done
done
SSH