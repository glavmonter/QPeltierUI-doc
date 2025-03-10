#!/bin/sh

docker exec -it peltier_latex pdflatex --output-directory=. ./main.tex
cp main.pdf QPeltier-doc.pdf
