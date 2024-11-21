#!/bin/bash

<< cat
cat << Gargi | grep "this"
The user is: $USER
The home for this $USER is: $HOME
Gargi
cat

<< echo
echo -e "This is first line\nThis is second line"
echo -n "This is third line"
echo "This is fouth line"
echo

[[ -x filecrn.sh ]] && echo "file has execution permission" || echo "file don't have execution permission"
