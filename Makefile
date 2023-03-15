# Names of files.

meta_file1 = ./0_metadata/meta0.md
meta_file2 = ./0_metadata/meta1.md

files = ./*.md

# Directory of files
changed_files = manuscript/*

# Directory name of manuscript files
manuscript_dir = manuscript

# Directory name of output files
out_dir = out

# Filetype of default output
default_type = docx

# Filename without filetype
output_file = out

# Reader arguments for pandoc
reader = -f markdown\

# general arguments
writer =  --bibliography ~/.pandoc/library.bib\
		 --csl ~/.pandoc/apa-2.csl\
		 -V papersize=a4\
		 -F pandoc-crossref\
		 -C\
		 # --filter pandoc-crossref\
		 # -N\

# docx specific arguments
docx = -t docx\
	   --reference-doc ~/.pandoc/reference.docx\
	   --filter pandoc-docx-pagebreakpy\

# HTML5 specific arguments
html = -t html5\
	   -s\
	   --standalone\
	   -c ~/.pandoc/github.css\
	   --toc\

all: $(changed_files)
	$(eval today := $(shell date "+%y%m%d"))
	cd ./$(manuscript_dir);\
	pandoc -o ../$(out_dir)/$(today)_$(output_file).$(default_type) $(reader) $(writer) $(docx) $(meta_file1) $(meta_file2) $(files);\
	cd ..

%.pdf: $(changed_files)
	cd ./$(manuscript_dir);\
	pandoc -o ../$(out_dir)/$@ $(reader) $(writer) $(meta_file1) $(files);\
	cd ..

%.html: $(changed_files)
	cd ./$(manuscript_dir);\
	pandoc -o ../$(out_dir)/$@ $(reader) $(writer) $(html) $(meta_file1) $(meta_file2) $(files);\
	cd ..

%.docx: $(changed_files)
	cd ./$(manuscript_dir);\
	pandoc -o ../$(out_dir)/$@ $(reader) $(writer) $(docx) $(meta_file1) $(meta_file2) $(files);\
	cd ..

ifeq ($(shell uname),Linux)
open:
	$(eval today := $(shell date "$%y%m%d"))
	xdg-open ./$(out_dir)/$(today)_$(output_file).$(default_type)
else ifeq ($(shell uname),Darwin)
open:
	$(eval today := $(shell date "$%y%m%d"))
	open ./$(out_dir)/$(today)_$(output_file).$(default_type)
else
open:
	$(eval today := $(shell date "$%y%m%d"))
	./$(out_dir)/$(today)_$(output_file).$(default_type)
endif
