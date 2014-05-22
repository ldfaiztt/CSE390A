#!/bin/bash
# Chun-Wei Chen
# CSE 390A
# 10/29/12
# This script accpets an arbitary number of file names as command-line 
# arguments and prints out the info about the files, including number of 
# lines in the file, number of blank lines in the file and percentage of 
# blank lines out of the total lines, and number of characters and words
# in the file and approximate number of characters per word.

for file in $@; do
	echo "$file: "
	LINE=`wc -l < $file`
	echo "  lines: $LINE"
	NONBLANK=`grep "." $file | wc -l`
	let BLANK="$LINE-$NONBLANK"
	let BLANKPERCENTAGE="$BLANK*100/$LINE"
	echo "  blank: $BLANK ($BLANKPERCENTAGE%)"
	CHAR=`wc -m < $file`
	WORD=`wc -w < $file`
	let CHARPERWORD="$CHAR/$WORD"
	echo "  chars: $CHAR in $WORD words ($CHARPERWORD char/word)"
done

