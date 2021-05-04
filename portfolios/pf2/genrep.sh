#!/bin/bash

# ID: Callum Moffat 10367258

# cat command the information in attacks.html through a pipe to a set of sed commands which will:
#   1. Substitute all the HTML formatting variations (< > etc.) of the file with a blank space.
#   2. Substitute the double blank spacing with a comma (,).
#   3. Remove the comma from the start of any line. This helps set up the FS value for the awk statement later.
# The comma separated values are then piped to a grep command which is designed to only grab the lines which end with numeric values, i.e. the attack rows.
# The grabbed values are then piped through to the awk statement.
# Initiated the start of the awk statement with the BEGIN pattern, which is identifying that the file separator (FS) is "," and printing the first line of the output which is the two column headings. The two headings are evenly spaced to fit the example in the task sheet.
# Main pattern: Needed to start at line 1 so set the NR to greater than 0. As we need the total of the three month values I skipped $1 as that is the attack title value, then assigned the variable "sumof" to the addition of the other three values.
# The printf command is firstly formatting how the data will show in the output via spacing a maximum of 15 string characters for the first value and the second format assigns a whole number (%d) format to the second value. We then assign the formats their values of: "$1" and the calculated value variable "sumof".
# By formatting the main pattern output this way it will line up with the two columns headings printed from the BEGIN pattern.
# No source file is necessary after the END pattern as we piped the information into the awk statement.
# Exit the script with the correct exit statement. 

cat attacks.html | sed -e 's/<[^<]\+>/ /g;s/  /,/g; s/^,//g' | grep ".[0-9]," | awk 'BEGIN {FS=","; print "Attacks\t\tInstances(Q3)"} NR>0{ sumof = $2+$3+$4; printf "%-15s %d \n", $1, sumof} END{}'

exit 0