#!/bin/bash

# ID: Callum Moffat 10367258


# declaring both arrays and assigning the correct values to ass1 and ass2 as stated in the task sheet.
declare -a ass1                                             
ass1=(12 18 20 10 12 16 15 19 8 11)       

declare -a ass2
ass2=(22 29 30 20 18 24 25 26 29 30)

# Create a variable that is assigned to the amount of values in one of the arrays. As both have a total of 10 values in each, we will be using ass1.
alen=${#ass1[*]}                                                         


for (( i=0; i<${alen}; i++ ));                                       # Create a c-style loop which will repeat the loop until it reaches the total amount of values assigned in alen.
do
    a1value=${ass1[$i]}                                              # Assign variables to the dynamic values of ass1 and ass2 throughout the loop. This will allow for a clean looking sum.
    a2value=${ass2[$i]}

    sumof=$((a1value + a2value))                                     # Assign a variable to the sum of a1value and a2value which will be called on in the echo statement.

    snum=$(($i + 1))                                                 # As the loop starts at 0 and we want to make sure the student number "snum" will accurately reflect their scores in the echo statement.

    echo -e "Student_$snum Result:\t$sumof"                          # Echo statement that is formatted as shown in the task sheeet. Calling on snum and sumof to fill in the dynamic values.

done


exit 0                                                              # exit with the correct exit status of 0.