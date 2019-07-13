#!/bin/bash

chmod +x ./post-commit
chmod +x ./pre-push
chmod +x ./bin/logger.sh
chmod +x ./bin/make_docx.sh
chmod +x ./bin/make_pdf.sh
chmod +x ./bin/log_analyzer.py

NOW_DATE=`date "+%F"`
sed -i -e "s/YYYY-MM-DD/${NOW_DATE}/" ./README.md
git init
mv pre-push ./.git/hooks/pre-push
mv post-commit ./.git/hooks/post-commit
./bin/logger.sh
mkdir figs
mkdir out
mkdir release
rm README.md-e
rm init.sh
