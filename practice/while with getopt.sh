#!/bin/sh

# while getopts :v:sf: opt
# do
#      case $opt in
#           v) ${OPTARG} -v  && echo "docker is available" ;;
#           s) systemctl status docker 1>/dev/null 2>&1 && echo "docker is running" || echo "docker isn't runnig";;
#           f) df -h ${OPTARG} ;;
#           :) echo "You missed input/argument for your option "
#              echo "usage:"
#              echo "<scriptname> [-v toolName] [-s] [-f fileSystemName] "
#              ;;
#           \?) echo "Your option is invalid"
#               echo "usage:"
#               echo "<scriptname> [-v toolName] [-s] [-f fileSystemName] "
#               ;; 
#      esac
# done


usage (){
    echo "<scriptName> [-u userName] [-p passwd]"
     exit 0
}

while getopts :hu:p: opt
do
     case ${opt} in
        u) userName=${OPTARG} ;;
        p) passwd=${OPTARG} ;;
        h) echo "usage:"
            usage
            ;;
        :) echo "you missed the input/argument for the option" 
            usage
            ;;
        \?) echo "you passed invalid option !!!" 
            usage
            ;;     
     esac        
done

if [[-z ${userName}]] ; then
     echo "failed to get userName"    
     exit 1
fi 

if [[-z ${passwd}]] ; then
     echo "failed to get password"
     exit 2
fi 

 cat << EOF 
 userName=${userName}
 passwd=${passwd}
EOF