#! /usr/bin/env bash

#takes a directory and sets it as dir variable
dir=$1
#go into directory
cd "$dir"|| exit

#Failed login data was created in order to search for secure files
#Which then outputs to failed_login_data.txt.
cat var/log/*|awk
#awk 'match($0, /([a-zA-Z]+), ([a-zA-Z]+)/, groups) {print "1. " groups[1] "\n"  2. " groups[2] "\n" }' < failed_login_data.txt
#awk 'match($0, /([a-zA-Z]+):(Z+):(Z+) ([a-zA-Z]+) sshd\[(Z+)\]: Failed password for (invalid user )?([a-zA-Z._-]+) from ([Z.]+) port ([Z]+) ssh2/, groups)' <failed_login_data.txt

awk 'match($0, / Failed password for/(invalid user)'{Print $1, $2, $3, $4, $5}' /Failed password for(!(invalid user))/'{Print $1, $2, $3, $4, $5}'' <failed_login_data.txt

#Removing seconds and minutes from the times
sed ('s/seconds//' failed_login_data.sh, 's/minutes//' failed_login.sh)


