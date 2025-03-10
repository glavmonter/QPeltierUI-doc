#!/bin/sh

docker run -d --rm --name peltier_latex -i --net=none -t -v $PWD:/data peltier/latex:1.1 /bin/sh -c "sleep infinity"
