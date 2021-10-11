.PHONY: CV build

all: build CV

LATEX = pdflatex
CVFILE = cv_4.pdf
BIB = _bibliography/papers.bib
DATA = $(wildcard _data/*.yml)
INCLUDE = $(wildcard _includes/*.html) $(wildcard _includes/**/*.html)
LAYOUT = $(wildcard _layouts/*.html)
NEWS = $(wildcard _news/*.md)
PAGE = $(wildcard _pages/*.md)
POST = $(wildcard _posts/*.md)
PROJECT = $(wildcard _projects/*.markdown)
SASS = $(wildcard _sass/*.scss)

.SUFFIXES: .pdf .tex

.tex.pdf:
	$(LATEX) $*

CV:
	$(MAKE) -C _cv

build: CV
	mv _cv/$(CVFILE) assets/pdf/$(CVFILE)
	jekyll build

clean:
	$(MAKE) -C _cv clean

realclean: clean
	rm assets/pdf/$(CVFILE)
	$(MAKE) -C _cv realclean
