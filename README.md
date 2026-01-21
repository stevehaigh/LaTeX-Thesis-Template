# LaTeX Thesis Template (Quarto Edition)

A modern, clean Quarto-based template for academic theses and dissertations. Write in Markdown, leverage Quarto's powerful features for citations, cross-references, and figures, and compile to PDF with automatic bibliography management using biblatex. GitHub Actions automatically build and publish your dissertation on every push.

## GitHub Actions Integration

This repository includes an automated workflow that compiles your dissertation whenever you push changes to the main branch.

**What the GitHub Action does:**
- Automatically installs Quarto and TinyTeX (lightweight TeX distribution)
- Renders `index.qmd` and all chapter `.qmd` files to PDF using Quarto
- Manages citations automatically using your `bibliography/references.bib` file
- Uploads the compiled PDF as a downloadable artifact (available for 30 days)
- Optionally attaches the PDF to GitHub releases when you create a version tag

**Accessing the compiled PDF:**
- Go to the **Actions** tab in your repository
- Click on the latest workflow run
- Download the PDF artifact from the workflow summary

## Project Structure

- **`index.qmd`** — Frontmatter (title page, abstract)
- **`_quarto.yml`** — Quarto project configuration
- **`chapters/`** — Individual chapter files (`.qmd` Markdown files)
  - `01_introduction.qmd`
  - `02_literature_review.qmd`
  - `03_methodology.qmd`
  - `04_results.qmd`
  - `05_discussion.qmd`
  - `06_conclusion.qmd`
  - `appendix_a.qmd`
- **`appendices/`** — Appendix files (if needed; also can use `chapters/`)
- **`figures/`** — Images and figures
- **`bibliography/`** — Bibliography files
  - `references.bib` — BibTeX format bibliography
- **`.vscode/`** — VS Code settings for LaTeX Workshop integration

## Building the Document

**Using Quarto (recommended):**

Build the dissertation to PDF:
```bash
quarto render --to pdf
```

Live preview with auto-reload on changes:
```bash
quarto preview
```

Or use the included Makefile:
```bash
make            # Build with Quarto (default)
make quarto-watch  # Live preview
make quarto-clean  # Clean build artifacts
```

**Editing Chapters:**
- Edit any `.qmd` file in the `chapters/` directory
- Changes are automatically reflected on the next build
- Use Markdown syntax with embedded math, citations, and figures

## Notes

- **Edit `_quarto.yml`** to change the dissertation title, author, and chapter order
- **Add citations** using `[@citationKey]` syntax — compatible with Zotero and other reference managers
- **Place figures** in the `figures/` directory and reference with `![caption](../figures/filename.png){#fig:label}`
- **Math** — Use `$inline$` for inline math and `$$display$$` for display equations
- **Cross-references** — Use `@fig:label`, `@tbl:label`, `@eq:label` to reference figures, tables, and equations
- **Quarto documentation** — Learn more at https://quarto.org/docs/books/
