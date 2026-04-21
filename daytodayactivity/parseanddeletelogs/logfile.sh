#!/bin/bash

logfile1=/var/log/syslog
logfile2=/var/log/cloud-init.log

mydateexpire=`date +%b`

for log in $logfile{1,2}
do
echo $log Begin
egrep "$mydateexpire" $log
echo $log End
done