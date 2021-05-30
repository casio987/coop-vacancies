#!/bin/dash

# notifies you if there are any coop vacancies in specified area/field (default cs/swe)
field="computer science" # change string within double quotes to desired area/field

existence=$(curl --location --silent https://www.coop.unsw.edu.au/vacancies | 
    tr '[:upper:]' '[:lower:]' | grep -E "$field" | sed -E 's/<[^>]*>//g;s/^ *//' | awk 'NF < 7')

if [ "$existence" != "" ]; then
    # send email to ...
    echo "there exists a vacancy for $existence" | mutt -s "Co-op Vacancies" thisisanemail@gmail.com # change to your own email  
fi
