#!/bin/bash
# Chun-Wei Chen
# CSE 390A
# 10/29/12
# This script takes two arguments, a string for a message to print, and a 
number of times to print it. It prints the message that many times, 
surrounded by a box of stars.

X=`echo -n  $1 | wc -c`
Y=$2
Z=$X

while [ $Z -gt -4 ]; do	
	echo -n "*"
	let Z="$Z-1"
done

echo

while [ $Y -gt 0 ]; do 
	echo "* $1 *"
	let Y="$Y-1"
done

while [ $X -gt -4 ]; do
        echo -n "*"
        let X="$X-1"
done

echo
