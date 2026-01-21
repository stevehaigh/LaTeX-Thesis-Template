# Dissertation Project

This is the root directory for the MRes dissertation.

## Project Structure

- **main.tex** - Main dissertation document
- **chapters/** - Individual chapter files
  - 01_introduction.tex
  - 02_literature_review.tex
  - 03_methodology.tex
  - 04_results.tex
  - 05_discussion.tex
  - 06_conclusion.tex
- **appendices/** - Appendix files
- **figures/** - Images and figures
- **settings/** - LaTeX configuration and preamble
- **references.bib** - Bibliography/references

## Building the Document

To compile the dissertation, run:

```bash
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

Or use your LaTeX editor's build command.

## Notes

- Edit the title and author information in `main.tex`
- Add your references to `Dissertation.bib` (BibTeX format)
- Place figures in the `figures/` directory and reference them as shown in the templates
- Each chapter can be edited independently in its respective file
