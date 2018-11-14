#!/bin/sh
jupyter-nbconvert --to script full-notebooks/intro-to-julia/*.ipynb --template template.tpl
mv full-notebooks/intro-to-julia/*.jl skeleton-notebooks/intro-julia/
jupytext --to notebook skeleton-notebooks/intro-julia/*.jl
rm skeleton-notebooks/intro-julia/*.jl
