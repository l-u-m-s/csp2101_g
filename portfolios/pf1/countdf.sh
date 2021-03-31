#!/bin/bash

# ID: Callum Moffat 10367258

# Assigning variables for the incremented counts and for the echo statements
countf1=0
countf2=0
countd1=0
countd2=0

echo -e "\nThe $1 directory contains:\n"         #Initial message to the command line notifying the user of what directory they put in as default argument 1

cd $1                                            #cd command to get the script into the right directory before actioning the for loops

for file in * ; do                               #for loop for files, where file is in *all of the current directory execute the below
    if [[ -f $file && -s $file ]]; then          #Validating if the $file is a file and if it is labelled as non zero size.
        
        ((countf1++))                            #if true then add to the counter which is isolated to this if statement
    
    elif [[ -f $file && ! -s $file ]]; then      #same as the if statement on line 16 but inverted the -s, looking for a file with zero size

        ((countf2++))                            #same purpose as line 18
    
    fi
done                                             #close the for loop for the $file queries

for dir in * ; do                                                           #for loop to identify and validate the child directory sizes in $1 (cd)
    if [[ -d $dir && $(du -s "$dir" | grep -v "^4[[:space:]]") ]]; then     #validate if it is a directory via -d AND gather the size of the subfolders via du -s. From here we are piping that info to a grep which is determining if the size is more than 4bytes (default folder size). The ERE was used because 4 bytes in du -s is starting the line as "4 ".

        ((countd1++))                                                       #Initiate the counter which is only for this if statement

    elif [[ -d $dir && $(du -s "$dir" | grep "^4[[:space:]]") ]]; then      #Same explaination as line 28's comment but not -v so it's finding the du -s lines that start with 4 and are followed by a space.

        ((countd2++))                                                       #Same reasoning as line 30

    fi
done                                                                        #Close the for loop for the $dir queries

echo "$countf1 files that contain data"                                     #Echo statements which will be calling all the unique counters into each statement being formatted as per the task sheet requirement.
echo "$countf2 files that are empty"
echo "$countd1 non-empty directories"
echo "$countd2 empty directories"

exit 0                                                                      #Exit the script correctly