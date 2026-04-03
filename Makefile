#
# Simple Makefile to build PDF version.
# Uses `latexmk` (https://ctan.org/pkg/latexmk?lang=en)
#

# PDF viewer. Another alternatives are `xpdf` for Lunux
# On MacOS you can just use `open` to invoke default
# system viewer.
PDFVIEWER=evince

DOCNAME=survey
LOCALDOC=$(DOCNAME)-local

BIBS=	survey.bib

SRC=	$(DOCNAME).tex \
	$(BIBS) \
	Makefile

# 3-rd party files I am unlikely to modify
LIBS=

all: $(DOCNAME).pdf papers/$(DOCNAME).pdf

TECTONIC_PATH := $(shell which tectonic)
# biblatex + biber: prefer latexmk unless you override with USE_LATEX=no
USE_LATEX ?= yes

LATEX=latexmk
LATEXFLAGS=-halt-on-error -g --pdf -f -shell-escape
LATEXCLEAN=latexmk -C

ifneq ($(TECTONIC_PATH),)
    # tectonic is present, use it unnless overriden by USE_LATEX=yes
    ifneq ($(USE_LATEX),yes)
	    LATEX=tectonic
	    LATEXFLAGS=--outfmt=pdf --chatter=minimal
	    LATEXCLEAN=rm -f *.aux *.blg *.fls  *.out *.fdb_latexmk *.log  *.toc
    endif
endif

clean:
	$(LATEXCLEAN)
	rm -f $(DOCNAME).pdf
	rm -f *.bbl *.brf
	rm -f *.nav *.snm *.vrb
	rm -f $(LOCALDOC).aux $(LOCALDOC).bbl $(LOCALDOC).bcf $(LOCALDOC).blg
	rm -f $(LOCALDOC).fdb_latexmk $(LOCALDOC).fls $(LOCALDOC).log $(LOCALDOC).out
	rm -f $(LOCALDOC).pdf $(LOCALDOC).run.xml $(LOCALDOC).synctex.gz $(LOCALDOC).toc
	rm -f papers/$(DOCNAME).pdf
	rm -f fig/*-converted-to.pdf

$(DOCNAME).pdf: $(SRC) $(LIBS)
	$(LATEX) $(LATEXFLAGS) $(DOCNAME).tex

$(LOCALDOC).pdf: $(DOCNAME).tex $(LOCALDOC).tex $(DOCNAME).bib Makefile
	$(LATEX) $(LATEXFLAGS) $(LOCALDOC).tex

papers/$(DOCNAME).pdf: $(LOCALDOC).pdf
	cp $(LOCALDOC).pdf papers/$(DOCNAME).pdf

# PS: no -f

install: $(DOCNAME).pdf
	cp $(DOCNAME).pdf built_doc/

run: $(DOCNAME).pdf
	$(PDFVIEWER) $(DOCNAME).pdf
