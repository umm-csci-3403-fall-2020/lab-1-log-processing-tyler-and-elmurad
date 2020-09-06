#! /usr/bin/env bash

#takes a directory and sets it as dir variable
dir=$1
#go into directory
cd "$dir"|| exit

#Failed login data was created in order to search for secure files
#Which then outputs to failed_login_data.txt.
cat var/log/*|

awk -F "[, ]+" '/Failed password for invalid user/ {print $1, $2, $3, $11, $13}' failed_login_data.sh
awk-F "[, ]+" '/Failed password for/ && !/Failed password for invalid user/ {print $1, $2, $3, $9, $11}' failed_login_data.sh

#Removing seconds and minutes from the times
sed ('s/seconds//' failed_login_data.sh, 's/minutes//' failed_login_data.sh)


