#!/bin/sh
# note: need jupytext
#DIR=intro-to-julia
DIR=datascience

cp full-notebooks/$DIR/* skeleton-notebooks/$DIR/
rm skeleton-notebooks/$DIR/*.ipynb
jupyter-nbconvert --to script full-notebooks/$DIR/*.ipynb --template template.tpl
mv full-notebooks/$DIR/*.jl skeleton-notebooks/$DIR/
jupytext --to notebook skeleton-notebooks/$DIR/*.jl
rm skeleton-notebooks/$DIR/*.jl
