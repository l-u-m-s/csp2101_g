#!/bin/bash

# ID: Callum Moffat 10367258

read -p "Please enter a two digit numeric code (integer) that is either 20 or 40: " userint  #prompt the user and assign the read value to the varible "userint"

while [[ $userint != 20 ]] && [[ $userint != 40 ]] ;            #while loop to check if the user has inputted not a 20 and not a 40.
do
    echo -e "\nThat answer is invalid! Please try again...\n"   #when the input isn't a 20 or 40 it will continue in the loop until it meets either value.

    read -p "Please enter a two digit numeric code (integer) that is either 20 or 40: " userint     #prompts the user for new input for the while loop
done

echo -e "\nYou have entered a valid input!\n"                   #Once 20 or 40 have been inputted, this statement will display to the command line

exit 0                                                          #Exit the script correctly after the echo statement