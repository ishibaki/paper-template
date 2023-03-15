#!/bin/bash

echo "Enter the title:"
read title
sed -i -e "s/^\# Papar Template/# ${title}/" ./README.md
NOW_DATE=`date "+%F"`
sed -i -e "s/YYYY-MM-DD/${NOW_DATE}/" ./README.md

git init

mkdir figs
mkdir out
mkdir release
rm README.md-e
rm init.sh
