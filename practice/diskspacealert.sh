#!/usr/bin/env bash

# only diskspace for dev filesystem
# df -H | grep -Ev "overlay|tmpfs|shm"

mailid="gargi@gamil.com"
<< eof
echo -e "The dev file system utilizztion on $(hostname -s) is :- \n $(df -H | grep -Ev "overlay|tmpfs|shm")" #| /usr/bin/mail -s "FileSyatem Utilization $(date)" "$mailid"
eof

#df -H | grep -E "/dev/root" | awk '{print $5}' | sed 's/%//'
FU=$(df -H | grep -E "/dev/root" | awk '{print $5}' | tr -d "%")

if [[ $FU -ge 80 ]]
then
    echo "The file systemUses is : $FU " #| /usr/bin/mail -s "The file system utilization alert $(date)" "$mailid"
fi
