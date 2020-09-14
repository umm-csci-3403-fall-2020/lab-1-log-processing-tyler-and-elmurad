#!/usr/bin/env bash

#The file that has the contest that needs to be wrapped

contents_file=$1

#A basename shared between the header and the footer

specifier=$2

#The output file 

output_file=$3

cat "$specifier"_header.html "$contents_file" "$specifier"_footer.html > "$output_file" 
