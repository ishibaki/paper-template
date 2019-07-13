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

### Automatic generation

#### Document generation

Pushing automatically generates `docx` file in `out` directory.  
([Please view pre-push](./pre-push))

#### Log generation

Committing automatically generates log.  
([Please view post-commit](./post-commit))

- Update [`writing_log.csv`](./log/writing_log.csv) file
- Generate `log.pdf` in `log` directory

<!-- vim: set foldmethod=marker : -->
