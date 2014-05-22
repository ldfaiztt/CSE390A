#!/bin/bash
# Chun-Wei Chen
# CSE 390a
# 11/02/12

# This shell script grades the students' assignments by a file expected.txt, 
# which contains the expected homework output, and the lines of comments in 
# the assignments. The script takes a number as argument for max score of 
# the assignment. The shell script will show how many lines the output of 
# students' assignment differ from the expected output, and how many comment
# lines the assignment contain. And show the score of each student's assignment.

if [ -z $1 ]; then  # if the use didn't pass in an argument
    echo "Usage: ./gradeit.sh MAXPOINTS"
else
    echo "Retro Grade-It, 1970s version"
    echo "Grading with a max score of $1"
    echo
    MAXSCORE=$1
    for studentid in `ls students/`; do
	echo "Processing $studentid ..."
	cd students/$studentid/
	if [ -e gettysburg.sh ]; then  # if the student turned in the correct file
	    bash ./gettysburg.sh > output.txt  # create a temporary output file for compare the output with the expected output
	    cd .. && cd ..

	    X=`diff -bEBw expected.txt ./students/$studentid/output.txt | grep "[<>]" | wc -l`
            # show how many lines the output of students' assignment differ from
            # the expected output
	    if [ $X -gt 0 ]; then
		echo "$studentid has incorrect output ($X lines do not match)"
	    else
		echo "$studentid has correct output"
	    fi
	    rm ./students/$studentid/output.txt  # remove the temporary output file
	    let TEMPSCORE="$MAXSCORE - 5 * $X"  # lose 5 points for each unmatched lines

	    Y=`grep "#" ./students/$studentid/gettysburg.sh | wc -l`
	    echo "$studentid has $Y lines with comments"  # show how many lines of comments the file contain
	    if [ $Y -ge 3 ]; then  # lose 7 points if the file contains less than 3 line of comments
		let FINALSCORE=$TEMPSCORE
	    else
		let FINALSCORE="$TEMPSCORE - 7"
	    fi

	    if [ $FINALSCORE -ge 0 ]; then  # the student's score of the assignment will be zero if the score is reduced to less than 0
		echo "$studentid has earned a score of $FINALSCORE / $MAXSCORE"
	    else
		echo "$studentid has earned a score of 0 / $MAXSCORE"
	    fi

	else  # the student didn't turned in the assignment or didn't use the correct file name
	    echo "$studentid did not turn in the assignment"
	    echo "$studentid has eanred a score of 0 / $MAXSCORE"
	    cd .. && cd ..
	fi
	echo
    done
fi
