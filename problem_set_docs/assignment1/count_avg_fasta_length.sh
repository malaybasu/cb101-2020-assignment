#!/usr/bin/bash
#indicates that this file will be using bash#

#indicate the column/argument from which the file to be analyzed will come.  $1 is first column, $2 is the second#
echo $1 $2

echo $(grep -v "^>" $1 | tr -d "\n" | wc -c)/$(grep "^>" $1 | wc -l) | bc
