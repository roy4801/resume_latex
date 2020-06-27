PREFIX=docker run --rm -v $(shell pwd):/source -w /source thomasweise/docker-texlive-full
LATEX=$(PREFIX) xelatex
SRC = resume.tex resume_zh_tw.tex #resume_photo.tex

PDFS = $(SRC:.tex=.pdf)

all: pdf

pdf: $(PDFS)

%.pdf:  %.tex
	$(LATEX) ./$<

ifeq ($(OS),Windows_NT)
  RM = cmd //C del
else
  RM = rm -f
endif

clean:
	$(RM) *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind *.pdf
