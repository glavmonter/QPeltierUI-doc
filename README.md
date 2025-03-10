# QPeltierUI-doc

## Сборка

Собираем документацию в Docker контейнере:

1. Делаем Docker контейнер: `$docker build -t peltier/latex:1.1 .`
2. Запускаем контейнер: `$docker run -d --rm --name peltier_latex -i --net=none -t -v $PWD:/data peltier/latex:1.1 /bin/sh -c "sleep infinity"`
3. Собираем pdf: `docker exec -it peltier_latex pdflatex --output-directory=. ./main.tex && cp main.pdf QPeltier-doc.pdf`

Для облегчения эти пункты оформлены в скрипты в папке scripts: `build_image.sh`, `run_container.sh` и `build_pdf.sh`
