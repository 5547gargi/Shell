#!/usr/bin/awk -f

#BEGIN {print "Hello World !!!"}

BEGIN {
    print "finding value of a and b"
}

{
    a=$1
    b=$2
    print "a="a , "b="b
}

END {
    print "completed finding value for a and b"
}
#awk -f 1stawkscript.awk ab.txt  if awk -f is not provide in shebang line
#a=2 b=5
#a=4 b=6

#./1stawkscript.awk ab.txt 
#a=2 b=5
#a=4 b=6