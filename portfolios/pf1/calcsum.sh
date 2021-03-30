#!/bin/bash

# ID: Callum Moffat 10367258


let sum=$1+$2+$3                                #Use the let command to assign the variable "sum" to the addition of the special variables

if [ $sum -le "30" ];                           #Use the new variable $sum and setup the main if argument for true $sum less than or equal to 30
then
    echo "The sum of $1 and $2 and $3" is $sum  #Output the true statement as instructed in the task sheet
else
    echo "Sum exceeds maximum allowable"        #Output the false statement as instructed in the task sheet
fi                                              #Finish the if statement

exit 0                                          #Exit the script