#!/bin/bash

NOW_DATE=`date "+%F"`
sed -e "s/YYYY-MM-DD/${NOW_DATE} ./README.md" >| ./README.md
git init
mv pre-push ./.git/hooks/pre-push
mv post-commit ./.git/hooks/post-commit
./bin/logger.sh
mkdir figs
mkdir out
mkdir release
rm init.sh
