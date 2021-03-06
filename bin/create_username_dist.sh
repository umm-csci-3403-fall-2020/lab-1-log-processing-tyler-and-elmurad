#!/usr/bin/env bash

#Capturing current directory including failed login attempts using pwd

main=$(pwd)

#Redirects to another directory

cd "$1"||exit

touch "username_dist.txt"

cat ./*/failed_login_data.txt | awk '{print $4}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' > username_dist.txt

#Taking back to the top level search directory

cd "$main" || exit

#Placing wrap_contents files into username_dist

./bin/wrap_contents.sh "$1"/username_dist.txt html_components/username_dist "$1"/username_dist.html

rm "$1"/username_dist.txt

