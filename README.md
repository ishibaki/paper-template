# Papaer Template

Starting to write: YYYY-MM-DD

## Requirements

- [pandoc](https://github.com/jgm/pandoc)
- [Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template)
- [pandoc-docx-pagebreak](https://pypi.org/project/pandoc-docx-pagebreak/)

## How to use

### Start from this command

```sh
chmod +x ./init.sh
./init.sh
```

### Generate `docx` file

```sh
./bin/make_docx.sh
```

### Generate `pdf` file

```sh
./bin/make_pdf.sh
```

### Automatic document generation

```sh:pre-push
#!/bin/bash

cd manuscript
pandoc -f markdown -t docx -V papersize=a4\
    --reference-doc ~/.pandoc/reference.docx\
    --filter pandoc-docx-pagebreakpy\
    --filter pandoc-crossref\
    --bibliography="/Users/tishibashi/dotfiles/pandoc_files/library.bib"\
    --csl="/Users/tishibashi/dotfiles/pandoc_files/apa-2.csl"\
    -V papersize=a4 -N -o ../out/`date "+%y%m%d"`_out.docx\
    ./0_metadata/*.md ./*.md

pandoc -f markdown -t latex -V papersize=a4\
    --filter pandoc-crossref --template=eisvogel\
    --bibliography="/Users/tishibashi/dotfiles/pandoc_files/library.bib"\
    --csl="/Users/tishibashi/dotfiles/pandoc_files/apa-2.csl"\
    -V papersize=a4 --pdf-engine=lualatex --toc -N\
    -o ../out/`date "+%y%m%d"`_out.pdf\
    ./0_metadata/*.md ./*.md
cd ../
```

<!-- vim: set foldmethod=marker : -->
