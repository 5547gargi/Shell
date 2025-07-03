# #!/bin/bash
# if [ $# -gt 0 ]
# then
#     user=$1
#     echo $user
# else 
#     echo "please enter valid user !!"
# fi        

### Adding_User ####
# #!/bin/bash
# if [ $# -gt 0 ]
# then
#     user=$1
#     echo $user
#     Existing_user=$(cat /etc/passwd | grep -i -w $user | cut -d ":" -f1)
#     if [ "${user}" = "${Existing_user}" ]; then
#         echo "The $user is already Exists, Please provide another UserName !!"
#     else
#         echo "Lets create a new $user"
#         sudo useradd -m $user --shell /bin/bash
#     fi        
# else 
#     echo "please enter valid user !!"
# fi        

##adding-password_for_user##
# !/bin/bash
# if [ $# -gt 0 ]
# then
#     user=$1
#     echo $user
#     Existing_user=$(cat /etc/passwd | grep -i -w $user | cut -d ":" -f1)
#     if [ "${user}" = "${Existing_user}" ]; then
#         echo "The $user is already Exists, Please provide another UserName !!"
#     else
#         echo "Lets create a new $user"
#         sudo useradd -m $user --shell /bin/bash
#         SPEC=$(echo '!#$%^&*()_' | fold -w1 | shuf | head -1)
#         PASSWORD="${user}@${RANDOM}${SPEC}"
#         echo "$user:$PASSWORD" | sudo chpasswd
#         echo "The temporary password for $user is ${PASSWORD}"
#         passwd -e $user #expiring the password 
#     fi        
# else 
#     echo "please enter valid user !!"
# fi   

### Multi_user ###

!/bin/bash
if [ $# -gt 0 ]; then
    for user in $@; do
        echo $user
        Existing_user=$(cat /etc/passwd | grep -i -w $user | cut -d ":" -f1)
        if [ "${user}" = "${Existing_user}" ]; then
            echo "The $user is already Exists, Please provide another UserName !!"
        else
            echo "Lets create a new $user"
            sudo useradd -m $user --shell /bin/bash
            SPEC=$(echo '!#$%^&*()_' | fold -w1 | shuf | head -1)
            PASSWORD="${user}@${RANDOM}${SPEC}"
            echo "$user:$PASSWORD" | sudo chpasswd
            echo "The temporary password for $user is ${PASSWORD}"
            passwd -e $user #expiring the password 
        fi
    done            
else 
    echo "please enter valid user !!"
fi   
