#!/bin/bash

cd manuscript
pandoc -f markdown -t docx -V papersize=a4\
    --reference-doc ~/.pandoc/reference.docx\
    --filter pandoc-docx-pagebreakpy\
    --filter pandoc-crossref\
    --bibliography="${HOME}/.pandoc/library.bib"\
    --csl="${HOME}/.pandoc/apa-2.csl"\
    -V papersize=a4 -N -o ../out/`date "+%y%m%d"`_out.docx\
    ./0_metadata/*.md ./*.md

cd ../

