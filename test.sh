#!/bin/bash

<< gsd
cat << Gargi | grep "this"
The user is: $USER
The home for this $USER is: $HOME
Gargi
gsd

