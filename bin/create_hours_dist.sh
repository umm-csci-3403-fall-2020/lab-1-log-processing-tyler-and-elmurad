#!/usr/bin/env bash

#Constant which initializes directory as a variable

dir="$1"

#Capturing current directory including failed login attempts using pwd

main=$(pwd)



cat ./*/failed_login_data.txt | awk '{print $3}' | sort | uniq -c | awk '{printf "data.addRow(["\x27$2\x27", "$1"]);"}' > hours_dist.html

#Taking back to the top level search directory

cd "$main" || exit

cd html_components || exit

#Placing wrap_content files into hours_dist
../ wrap_contents.sh ../ "$1"/hours_dist.txt hours_dist hours_dist.html

mv hours_dist.html ./"$dir"

#Remove directory
rm "$dir"/hours_dist.txt
