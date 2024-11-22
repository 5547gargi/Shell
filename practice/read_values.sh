#!/usr/bin/env bash
read -p "Enter value for a : " a
read -p "Enter value for b : " b

echo "$a $b" | awk '{ a=$1 ; b=$2 ; print "SUM = "a+b }'
