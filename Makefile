# Makefile for LaTeX Dissertation

# Main LaTeX file (without extension)
MAIN = main

# LaTeX compiler
LATEX = pdflatex
BIBER = biber

.PHONY: all clean cleanall watch help

# Default target: build the PDF
all: $(MAIN).pdf

# Build the PDF using latexmk (recommended)
$(MAIN).pdf: $(MAIN).tex
	latexmk -pdf -bibtex $(MAIN).tex

# Alternative: manual build process
manual:
	$(LATEX) $(MAIN).tex
	$(BIBER) $(MAIN)
	$(LATEX) $(MAIN).tex
	$(LATEX) $(MAIN).tex

# Continuous compilation (watch mode)
watch:
	latexmk -pdf -pvc -bibtex $(MAIN).tex

# Clean auxiliary files
clean:
	latexmk -c
	rm -f *.bbl *.bcf *.blg *.run.xml *.synctex.gz

# Clean all generated files including PDF
cleanall:
	latexmk -C
	rm -f *.bbl *.bcf *.blg *.run.xml *.synctex.gz

# Help target
help:
	@echo "Available targets:"
	@echo "  make           - Build the PDF (default)"
	@echo "  make all       - Build the PDF"
	@echo "  make manual    - Build using manual pdflatex/biber commands"
	@echo "  make watch     - Continuous compilation (rebuilds on file changes)"
	@echo "  make clean     - Remove auxiliary files (keep PDF)"
	@echo "  make cleanall  - Remove all generated files including PDF"
	@echo "  make help      - Show this help message"
