all: all-redirect

LATEX = pdflatex
TALKNAME = cv_4

.SUFFIXES: .pdf .tex

.tex.pdf: 
	$(LATEX) $*

all-redirect: $(TALKNAME).pdf

$(TALKNAME).pdf: $(TALKNAME).tex resume.cls
	pdflatex $(TALKNAME)
	cp $(TALKNAME).pdf ../assets/pdf/

clean:
	rm -f *.vrb *.tex~ *.toc *.aux *.log *.nav *.out *.snm *.flc

realclean: clean
	rm -f $(TALKNAME).pdf

