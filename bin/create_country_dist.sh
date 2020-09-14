#!/usr/bin/env bash

#Capturing current directory including failed login attempts using pwd

main=$(pwd)

#Redirects to another directory

cd "$1"||exit

touch "country_dist.txt"

cat ./*/failed_login_data.txt | awk '{print $9}' | sort < string.txt | join -e string.txt country_IP_map.txt | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' >> country_dist.txt

#Taking back to the top level search directory

cd "$main" || exit

#Placing wrap_contents files into username_dist

./bin/wrap_contents.sh "$1"/country_dist.txt html_components/country_dist "$1"/country_dist.html

rm "$1"/country_dist.txt
