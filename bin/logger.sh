#!/bin/bash

NOW_DATE=`date "+%F"`
NOW_TIME=`date "+%T"`
NOW_WORD=`cat ./manuscript/*.md | wc -w | tr -d ' '`
NOW_WORD=`expr $NOW_WORD - 142`
NOW_LETR=`cat ./manuscript/*.md | wc -m | tr -d ' '`
NOW_LETR=`expr $NOW_LETR - 1765`

echo $NOW_DATE,$NOW_TIME,$NOW_WORD,$NOW_LETR >> ./log/writing_log.csv
