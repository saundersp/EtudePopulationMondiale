#!/bin/bash

USAGE="Jupyterlab portable helper\nImplemented by Pierre Saunders, 2021\n\nDocumentation:\n\t$0 install\n\tInstall Jupyterlab locally to the script.\n\n\t$0 uninstall\n\tUninstall Jupyterlab locally to the script.\n\n\t$0 launch\n\tLaunch Jupyterlab locally to the script (Require installation beforehand).\n\n\t$0 help\n\tWhich display this help message."

export JUPYTERLAB_SETTINGS_DIR=./jupyter/settings
export JUPYTERLAB_WORKSPACES_DIR=./jupyter/workspace
export JUPYTER_CONFIG_DIR=./jupyter/config
export JUPYTER_RUNTIME_DIR=./jupyter/runtime
export JUPYTER_DATA_DIR=./jupyter/data
export R_LIBS_SITE=./libs

case "$1" in
	install)
		python -m venv venv
		source venv/Scripts/activate
		pip install -r requirements.txt

		mkdir ./jupyter ./jupyter/settings ./jupyter/workspace \
			./jupyter/config ./jupyter/runtime ./jupyter/data \
			./libs 2>>/dev/null

		Rscript -e 'install.packages("IRkernel", repos = "http://cran.us.r-project.org");library(IRkernel);IRkernel::installspec()'
	;;

	uninstall)
		rm -rf ./libs ./venv ./jupyter
	;;

	launch)
		source venv/Scripts/activate
		jupyter lab
	;;

	help)
		echo -e "$USAGE"
	;;

	*)
		echo -e "$USAGE"
	;;
esac