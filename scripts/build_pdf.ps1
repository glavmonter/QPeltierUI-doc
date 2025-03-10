
docker exec -it peltier_latex pdflatex --output-directory=. ./main.tex
Copy-Item -Path main.pdf -Destination QPeltier-doc.pdf
