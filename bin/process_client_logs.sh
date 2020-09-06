#! /usr/bin/env bash

#takes a directory and sets it as dir variable
dir=$1
#go into directory
cd "$dir"|| exit

#Failed login data was created in order to search for secure files
#Which then outputs to failed_login_data.txt.
cat var/log/*|awk
awk 'match($0, /([a-zA-Z]+), ([a-zA-Z]+)/, groups) {print "1. " groups[1] "\n"  2. " groups[2] "\n" }' < failed_login_data.txt
