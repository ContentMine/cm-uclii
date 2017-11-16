#!/bin/bash

if [[ $# -eq 0 ]]; then
	echo "Usage: $0 <project_directory>" ;
	exit 1;
fi

PROJECT=$1 ;

ls -l ${NORMA}
printf "project dir is: %s\n" $PROJECT ;

if [ ! -f ${NORMA} ]; then
    printf "Norma not found!\n";
		exit 1;
fi

printf "make the *.annot.svg *.svg.html\n";
# make the *.svg.html
$NORMA --project $PROJECT --fileFilter "^.*tables/table(\\d+)/table(_\\d+)?\\.svg"  --outputDir $PROJECT --transform svgtable2html

# make the *.svg.csv 
printf "make the *.svg.csv\n";
$NORMA --project $PROJECT --fileFilter "^.*tables/table(\\d+)/table(_\\d+)?\\.svg"  --outputDir $PROJECT --output table.svg.csv  --transform svgtable2csv

# create content of each HTML display page
$NORMA --project $PROJECT --fileFilter "^.*tables/table\\d+$" --output ./tableRow.html --htmlDisplay  "^.*/table.svg.html"

# create Ctree-level menu of all tables
printf "create Ctree-level menu of all tables\n";
$NORMA --project $PROJECT --output  tables/tableView.html  --htmlAggregate "^.*tables/table\\d+/tableRow.html"

# create project-level menu of all Ctrees
printf "create project-level menu of all Ctrees\n";
$NORMA --project $PROJECT --output tableViewList.html  --projectMenu ".*/tables/tableView.html"

printf "\n";
