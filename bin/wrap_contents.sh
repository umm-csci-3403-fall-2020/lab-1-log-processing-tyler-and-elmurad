#!/usr/bin/env bash

#The file that has the contest that needs to be wrapped

contest_file=$1

#A basename shared between the header and the footer

specifier=$2

#The output file 

output_file=$3

cat "$specifier"_header.html "contest_file" "$specifier"_footer.html > "$output_file" 
