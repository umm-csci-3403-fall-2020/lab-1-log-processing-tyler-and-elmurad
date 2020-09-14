#!/usr/bin/env bash

#Capturing current directory including failed login attempts using pwd

main=$(pwd)

#Redirects to another directory

cd "$1"||exit

#Create two tmp files
touch "country_dist.txt"
touch "string.txt"

#Use failed_login_data to get our IP addresses than sort them into the tmp file
cat ./*/failed_login_data.txt | awk '{print $5}' | sort >> "$main"/string.txt

#Use join statement to get the IP addresses mapped to the country they are from. Sort them and put into country_dist tmp directory
join  "$main"/string.txt "$main"/etc/country_IP_map.txt | awk '{print $2}' | sort | uniq -c  | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' >> country_dist.txt

#Taking back to the top level search directory

cd "$main" || exit

#Placing wrap_contents files into username_dist

./bin/wrap_contents.sh "$1"/country_dist.txt html_components/country_dist "$1"/country_dist.html

rm "$1"/country_dist.txt
rm "$1"/string.txt
