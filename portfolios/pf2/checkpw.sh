#!/bin/bash

# ID: Callum Moffat 10367258

# Initiated the awk workflow with the BEGIN pattern of (FS="\t") as the values in usrpwords.txt have been structured where the values are spaced apart via a tab.
# Set NR>1 as we are skipping the first line of the source file. This was specified in the task sheet as a requirement.
# Assigned "pw" to the password values in the source file so we could hold that value while sending it through the if(else) statement.
# The if statement has three requirements separated by the && operator: 
#   1. Length of the "pw" to be greater than or equal to 8
#   2. "pw" to contain at least one number [0-9]. The regex pattern to be contained within "/ /", the ".*" is to match any or 0 characters before or after "[0-9]+".
#   3. "pw" to contain at least one capial letter [A-Z]. The same regex pattern was copied from above but looking for one or more capital letters.
#       Once 'pw' is verified by the three tests above the printf command will print "pw" with the correct statement specified in the task sheet. \n is used here to display the output neatly.
# The else statement occurs when the "pw" doesn't meet all the three requirements and will print out the "pw" and corresponding message specified in the task sheet. \n is used here to display the output neatly.
# Close the awk workflow, no need for an END pattern. Outstide the END pattern, specified the source file "usrpwords.txt" that we are running this awk workflow through.
# Exit the script with the correct exit statement.

awk 'BEGIN { FS="\t" }
    NR>1 {
        
        pw=$2;

        if (length(pw) >= 8 && pw ~ /.*[0-9]+.*/ && pw ~ /.*[A-Z]+.*/) 
            {
                printf pw " - meets password strength requirements\n";
            }
        
        else 
            {
                printf pw " - does NOT meet password strength requirements\n";
            }

    }
    END{}' usrpwords.txt    

exit 0