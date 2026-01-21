# Makefile for LaTeX/Quarto Dissertation

# Main LaTeX file (without extension) - deprecated in favor of Quarto
MAIN = main

# LaTeX compiler
LATEX = pdflatex
BIBER = biber

# Quarto output
QUARTO_OUT = dissertation.pdf

.PHONY: all clean cleanall watch help quarto epub docx quarto-watch quarto-clean latex tex

# Default target: build all formats with Quarto (recommended)
all:
	quarto render

# Build PDF using Quarto (recommended)
quarto:
	quarto render --to pdf

# Build EPUB using Quarto
epub:
	quarto render --to epub

# Build DOCX using Quarto
docx:
	quarto render --to docx

# Continuous compilation with Quarto (watch mode)

# Generate LaTeX files from Quarto (without building PDF)
latex tex:
	quarto render --to latex
quarto-watch:
	quarto preview

# Clean Quarto build artifacts
quarto-clean:
	rm -rf _output/
	rm -f *.html
	# Remove Quarto-generated LaTeX intermediates
	rm -f index.tex index.aux index.log index.out index.toc index.bbl index.bcf index.blg index.run.xml index.synctex.gz

# Legacy LaTeX targets (kept for backward compatibility)

# Build the PDF using latexmk (deprecated)
$(MAIN).pdf: $(MAIN).tex
	latexmk -pdf -bibtex $(MAIN).tex

# Alternative: manual build process (deprecated)
manual:
	$(LATEX) $(MAIN).tex
	$(BIBER) $(MAIN)
	$(LATEX) $(MAIN).tex
	$(LATEX) $(MAIN).tex

# Continuous compilation (watch mode) - deprecated
watch:
	latexmk -pdf -pvc -bibtex $(MAIN).tex

# Clean auxiliary files (deprecated)
clean: quarto-clean
	latexmk -c
	rm -f *.bbl *.bcf *.blg *.run.xml *.synctex.gz

# Clean all generated files including PDF (deprecated)
cleanall: quarto-clean
	latexmk -C
	rm -f *.bbl *.bcf *.blg *.run.xml *.synctex.gz

# Help target
help:
	@echo "Quarto targets (recommended):"
	@echo "  make           - Build all formats (PDF, EPUB, DOCX) with Quarto (default)"
	@echo "  make quarto    - Build PDF only"
	@echo "  make epub      - Build EPUB only"
	@echo "  make docx      - Build DOCX only"
	@echo "  make latex     - Generate LaTeX files from Quarto (no PDF)"
	@echo "  make quarto-watch - Live preview with Quarto"
	@echo "  make quarto-clean  - Clean Quarto build artifacts"
	@echo ""
	@echo "Legacy LaTeX targets (deprecated):"
	@echo "  make manual    - Build using manual pdflatex/biber commands"
	@echo "  make watch     - Continuous compilation in LaTeX"
	@echo "  make clean     - Remove auxiliary files (keep PDF)"
	@echo "  make cleanall  - Remove all generated files including PDF"
	@echo "  make help      - Show this help message"
