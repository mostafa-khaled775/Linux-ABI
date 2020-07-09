INCLUDES  := abi-index.tex introduction.tex \
	     macros.tex object-files.tex dl.tex

ALL_FILES := abi.tex $(INCLUDES)

.PHONY: all abi clean ps pdf update

# default
abi: abi.ps

all: abi.ps abi.pdf


abi.dvi: $(ALL_FILES)
	latex abi
	makeindex abi
	latex abi
	latex abi

# Depend on abi.dvi to get index.
pdf abi.pdf: abi.dvi
	pdflatex abi

ps abi.ps: abi.dvi
	dvips abi.dvi -o abi.ps


clean:
	rm -f *.log *.aux *.dvi *.ilg *.ind *~ *.idx *.lof *.lot *.out *.pdf *.ps *.toc *.cb* \#*\# *.rej

