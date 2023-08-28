#!/bin/bash
if $# -eq 0; then
	echo You need to provide the environment name
	exit -1
fi

# python -m ipykernel install --user --name $1 --display-name "Python ($1)"

pip install jupyter
pip install jupyter_contrib_nbextensions
pip install jupyter_ascending
pip install notebook==6.1.5 # doesnt work with notbook version 7 yet
# INFO: If you (don't) use conda add/remove the --sys-prefix/--user (https://github.com/jupyter/notebook/issues/1731)
jupyter nbextension install --py jupyter_ascending --user
jupyter nbextension enable jupyter_ascending --py --user
jupyter serverextension enable jupyter_ascending --py --user
