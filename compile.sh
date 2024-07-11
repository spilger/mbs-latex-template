#!/bin/bash

# Define the name of your main LaTeX file (without extension)
MAIN_FILE="master"

# Clean previous build files if existent
echo "Cleaning previous build files..."
rm -f *.aux *.bbl *.blg *.log *.out *.toc *.synctex.gz *.fls *.fdb_latexmk *.nav *.snm *.bcf *.run.xml

# Run LuaLaTeX to generate auxiliary files
echo "Running lualatex..."
lualatex --interaction=nonstopmode --shell-escape "$MAIN_FILE.tex"

# Run Biber for bibliography
echo "Running biber..."
biber "$MAIN_FILE"

# Run LuaLaTeX again to incorporate bibliography
echo "Running lualatex again..."
lualatex --interaction=nonstopmode --shell-escape "$MAIN_FILE.tex"

# Run LuaLaTeX one more time to ensure all references are updated
echo "Running lualatex one more time..."
lualatex --interaction=nonstopmode --shell-escape "$MAIN_FILE.tex"

# Clean build files
echo "Cleaning previous build files..."
rm -f *.aux *.bbl *.blg *.log *.out *.toc *.synctex.gz *.fls *.fdb_latexmk *.nav *.snm *.bcf *.run.xml

# Final message
echo "Compilation process completed!"
