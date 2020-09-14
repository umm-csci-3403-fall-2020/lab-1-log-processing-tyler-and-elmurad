#!/usr/bin/env bash

main=$(pwd)

cd "$1" || exit

touch "failed_login_summary.html"

cat "$1"country_dist.html  "$1"hours_dist.html "$1"username_dist.html >> failed_login_summary.html

cd "$main" || exit

./bin/wrap_contents.sh "$1"/failed_login_summary.html html_components/summary_plots "$1"/summary_plots.html


