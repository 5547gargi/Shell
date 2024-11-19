#!/usr/bin/env bash
<< cornjob1
 corntab -e
 minite(s) hour(s) day(s) month(s) weekday(s) command/script
 05 09 18 11 1 /workspaces/Shell/practice/mywebsitebkp.sh
 05 09 18 * * /workspaces/Shell/practice/mywebsitebkp.sh # for every year at 9hrs 05 minutes 18th day 
 provide compelte path for the executable script
 Mon Nov 18 09:02:35 UTC 2024
cornjob1

<< cornjob2
corntab -e # enter and this will rediect to corntab jobs file with vi editor
* * * * * /bin/bash  /workspaces/Shell/practice/automaticmailforramuses.sh  # for every minute
*/30 * * * * /bin/bash  /workspaces/Shell/practice/automaticmailforramuses.sh  # for every 30minute
cornjob2

<< cornjob3
corntab -e
0 9 * * * /bin/bash /workspaces/Shell/practice/diskspacealert.sh # for eveyday morning at 9 am
cornjob3