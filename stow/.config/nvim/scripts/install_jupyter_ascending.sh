#!/bin/bash

# python -m ipykernel install --user --name $1 --display-name "Python ($1)"

pip install jupyter
pip install jupyter_contrib_nbextensions
pip install jupyter-ascending editdistance==0.8.1
pip install notebook==6.1.5 # doesnt work with notbook version 7 yet
# INFO: If you (don't) use conda add/remove the --sys-prefix/--user (https://github.com/jupyter/notebook/issues/1731)
jupyter nbextension install --py jupyter_ascending --user
jupyter nbextension enable jupyter_ascending --py --user
jupyter serverextension enable jupyter_ascending --py --user
