#!/bin/bash

if [[ $# -eq 0 ]]; then
	echo "Usage: $0 <project_directory>" ;
	exit 1;
fi

PROJECT=$1 ;

printf "Clean output files from project dir:\n %s\n" $PROJECT ;

rm -f ` find ${PROJECT} -iname '*.svg.html' -o -iname '*.annot.*' -o -iname '*.png' -o -iname '*.csv' -o -iname '*.html' -o -iname '*.html' -o -iname '*.csv.html' `

printf "Deleting target dir: %s" ${PROJECT}/target 
rm -rf ${PROJECT}/target 

printf "\n";
