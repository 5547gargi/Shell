#!/usr/bin/env bash

addition()
{
    echo "The \$0 value is : $0 "
    m=$1
    n=$2
    results=$((m+n))
    echo "The addition of $m and $n is: $results"
}

x=6
y=4
addition $x $y

p=4
q=6
addition $p $q

addition 2 8