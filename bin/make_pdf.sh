#!/bin/bash

cd manuscript
pandoc -f markdown -t latex -V papersize=a4\
    --filter pandoc-crossref --template=eisvogel\
    --bibliography="${HOME}/.pandoc/library.bib"\
    --csl="${HOME}/.pandoc/apa-2.csl"\
    -V papersize=a4 --pdf-engine=lualatex --toc -N\
    -o ../out/`date "+%y%m%d"`_out.pdf\
    ./0_metadata/*.md ./*.md
cd ../

