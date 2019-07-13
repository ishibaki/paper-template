#!/bin/bash

cd manuscript
pandoc -f markdown -t latex -V papersize=a4\
    --filter pandoc-crossref --template=eisvogel\
    --bibliography="/Users/tishibashi/dotfiles/pandoc_files/library.bib"\
    --csl="/Users/tishibashi/dotfiles/pandoc_files/apa-2.csl"\
    -V papersize=a4 --pdf-engine=lualatex --toc -N\
    -o ../out/`date "+%y%m%d"`_out.pdf\
    ./0_metadata/*.md ./*.md
cd ../

