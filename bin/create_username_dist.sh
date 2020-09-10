#!/usr/bin/env bash

#Constant which initializes directory as a variable

dir=$1

#Capturing current directory including failed login attempts using pwd

main=$(pwd)

#Redirects to another directory

cd "dir"||exit

cat ./*/failed_login_data.txt | awk '{print groups[4]}' | sort | uniq -c | awk ‘{print "data.addRow([\x27"groups[2]"\x27, "groups[1]"]);}"' > username_dist.html

#Taking back to the top level search directory

cd "$main" || exit

#Placing wrap_contest files into username_dist

./bin/wrap_contents.sh "$dir"/username_dist.txt html_components/username_dist "$dir"/username_dist.html

rm "$dir"/username_dist.txt

