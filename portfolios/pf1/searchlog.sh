#!/bin/bash

# ID: Callum Moffat 10367258

#Initial variables to call back to within the case statements and grep searches
matchopt=1
countmatch=0

#Initial greeting message

echo -e "\nHello! This script allows you to search for specific lines in a server access log according to the pattern you specify below...\n"

#The while loop which will allow for the user to go back to the start of the program and do another "pattern" search.

while [ $matchopt -gt 0 ]; do                           # using the variable from above, making the loop endless for multiple tries

    read -p "Please enter the pattern you would like to search in the access log: " pattern    #assigning a read input to pattern which will be used in the grep searches further down.

    read -p "Please select your option - (1) Whole Word Match (2) Any Match (3) Inverted Match: " matchopt #assigning matchopt for the initiation of the case statement 1, 2 or 3 options with * being void try again.

    case $matchopt in
        1) echo -e "\nYou have selected (a) Whole Word Match!\n"

           grep -wci $pattern access_log.txt > countmatch.txt                       #-wci option being for the whole word, count and case insensitive search. We are then redirecting it to a .txt file to be called later on

            if [[ $(grep -wci $pattern access_log.txt) = 0 ]]; then                 #if the count of searches is zero then echo to the user that there were "no matches found"
                echo -e "No Matches Found\n"
            else 
                echo -e "\n$(cat countmatch.txt) matches found!\n"                  #if that isn't the case then output the saved countmatch.txt integer and then post the grep -win below which will now include the -n option which is for specifying which line the pattern is referring to in the log file
                grep -win $pattern access_log.txt
            fi

            read -p "Enter (1) to enter a new pattern or (2) to exit the program: " taexit  #start a new case statement variable which will allow for the option to try a new pattern or exit the program via the correct exit 1 method.

            case $taexit in                                                                 #as mentioned in line 33's comment, option 1 and 2 is for starting the loop again or exiting properly
                1) echo -e "\nRestarting program...\n";;
                2) echo -e "\nExiting program... Goodbye!\n" && exit 1;;
            esac
            ;;

        2) echo "You have selected (b) Any Match!"                                  #quite identical to the other case statement choice above. Only change here is what the grep option is which is -ci. this is so we search for the patter ANYWHERE in the line or other words.
        
            grep -ci $pattern access_log.txt > countmatch.txt
            
            if [[ $(grep -ci $pattern access_log.txt) = 0 ]]; then
                echo -e "\nNo Matches Found\n"
            else 
                echo -e "\n$(cat countmatch.txt) matches found!\n"
                grep -in $pattern access_log.txt                                    #as mentioned, same code as the Whole Word Match option but here the grep -in will only echo the lines that have the pattern somewhere in them and state what line number it was from in the access log file.
            fi

            read -p "Enter (1) to enter a new pattern or (2) to exit the program: " taexit #refer to line 33's comment

            case $taexit in
                1) echo -e "\nRestarting program...\n";;                                    #refer to line 35's comment
                2) echo -e "\nExiting program... Goodbye!\n" && exit 1;;
            esac
            ;;
        3) echo "You have selected (c) Inverted Match!"                            #quite identical to the other case statement choices, now using the grep options "-vci". ci is the same as before but the v is for inverted searches. So here we are searching for lines that don't have ANY sign of the pattern in them.
            
            grep -vci $pattern access_log.txt > countmatch.txt
            
            if [[ $(grep -vci $pattern access_log.txt) = 0 ]]; then
                echo -e "\nNo Matches Found\n"
            else 
                echo -e "\n$(cat countmatch.txt) matches found!\n"
                grep -vin $pattern access_log.txt                                   #-vin to output the line number values with the data. The rest is the same as the other options
            fi

            read -p "Enter (1) to enter a new pattern or (2) to exit the program: " taexit #refer to line 33's comment

            case $taexit in
                1) echo -e "\nRestarting program...\n";;                                    #refer to line 35's comment
                2) echo -e "\nExiting program... Goodbye!\n" && exit 1;;
            esac
            ;;
        *) echo -e "\nInvalid Selection, Please try again...\n" ;;                             # this case statement option is if they input anything that isn't 1,2 or 3. It will start the loop again.
    esac                                                                                # close the main case statement so we are able to then close the other layers below
done                                                                                                                                                                         
exit 0                                                                                  # close the while loop and exit the script properly with exit 0