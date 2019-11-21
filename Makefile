# Names of files.
files = \
		./0_metadata/meta0.md\
		./0_metadata/meta1.md\
		./*.md\

# Directory of files
changed_files = manuscript/*

# Directory name
directory_name = manuscript

# Os specific open command,
# If MacOS, 'open',
# If Linux, 'xdg-open',
# If Windows, just a blank
open_command = open

# Filetype of default output
default_type = docx

# Filename without filetype
output_file = out

# Reader arguments for pandoc
reader =

# general arguments
writer = --bibliography ~/.pandoc/library.bib\
		 --csl ~/.pandoc/apa-2.csl\
		 -V papersize=a4\
		 --filter pandoc-crossref\
		 -N\
		 -f markdown\

# docx specific arguments
docx = -t docx\
	   --reference-doc ~/.pandoc/reference.docx\
	   --filter pandoc-docx-pagebreakpy\

# PDF specific arguments
pdf = -t latex\
	  --pdf-engine=lualatex\
	  --template=eisvogel\
	  --toc\

# HTML5 specific arguments
html = -t html5\
	   -s\
	   --self-contained\
	   -c ~/.pandoc/github.css\
	   --toc\

all: $(changed_files)
	$(eval today := $(shell date "+%y%m%d"))
	cd $(directory_name);\
	pandoc -o ../out/$(today)_$(output_file).$(default_type) $(reader) $(writer) $(docx) $(files);\
	cd ..

%.pdf: $(changed_files)
	cd $(directory_name);\
	pandoc -o ../out/$@ $(reader) $(writer) $(pdf) $(files);\
	cd ..

%.html: $(changed_files)
	cd $(directory_name);\
	pandoc -o ../out/$@ $(reader) $(writer) $(html) $(files);\
	cd ..

%.docx: $(changed_files)
	cd $(directory_name);\
	pandoc -o ../out/$@ $(reader) $(writer) $(docx) $(files);\
	cd ..

open:
	$(eval today := $(shell date "$%y%m%d"))
	$(open_command) ./out/$(today)_$(output_file).$(default_type)
