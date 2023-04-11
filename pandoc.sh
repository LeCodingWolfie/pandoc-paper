#!/bin/bash

# Converts Markdown to LaTeX with template and biblatex
pandoc paper.md --template=pandoc.tex --biblatex -o paper.tex

# Copies LaTeX and BibLaTeX files to a new directory
mkdir -p tex; cd tex; cp ../*.bib .; mv ../paper.tex .

# Compiles the TeX file into a PDF with biblatex
pdflatex paper.tex; biber paper; pdflatex paper.tex

# Moves the PDF out of the directory and deletes
mv *.pdf ..; cd ..; rm -r tex
