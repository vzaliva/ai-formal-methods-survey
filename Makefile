#
# Simple Makefile to build PDF version.
# Uses `latexmk` (https://ctan.org/pkg/latexmk?lang=en)
#

# PDF viewer. Another alternatives are `xpdf` for Lunux
# On MacOS you can just use `open` to invoke default
# system viewer.
PDFVIEWER=evince

DOCNAME=survey

BIBS=	00-surveys-foundations.bib \
	01-specification-and-requirements.bib \
	02-verified-code-generation-and-software-verification.bib \
	03-ai-assisted-mechanised-proving.bib \
	04-tla-model-checking-and-hardware-fv.bib \
	05-benchmarks-and-datasets.bib \
	06-industry-and-joint-projects.bib

SRC=	$(DOCNAME).tex \
	$(BIBS) \
	Makefile

# 3-rd party files I am unlikely to modify
LIBS=

all: $(DOCNAME).pdf

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
	rm -f fig/*-converted-to.pdf

$(DOCNAME).pdf: $(SRC) $(LIBS)
	$(LATEX) $(LATEXFLAGS) $(DOCNAME).tex

# PS: no -f

install: $(DOCNAME).pdf
	cp $(DOCNAME).pdf built_doc/

run: $(DOCNAME).pdf
	$(PDFVIEWER) $(DOCNAME).pdf
