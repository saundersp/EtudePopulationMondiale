#!/usr/bin/env bash

USAGE="Jupyterlab portable helper
Implemented by Pierre Saunders, 2021

USAGE: $0 FLAG
Available flags:
	i, -i, install, --install		Install Jupyterlab locally to the script.
	k, -k, kernel, --kernel			Install the R kernel extension to jupyter
	u, -u, update, --update			Update every python packages of the local virtual environnement.
	U, -U, uninstall, --uninstall		Uninstall Jupyterlab locally to the script.
	l, -l, launch, --launch			Launch Jupyterlab locally to the script (Require installation beforehand).
	h, -h, help, --help			Which display this help message."

VENV_PATH=./venv
JUPYTER_ROOT_PATH=./jupyter
export R_LIBS_SITE=./libs
export JUPYTER_ALLOW_INSECURE_WRITES=0
export JUPYTERLAB_SETTINGS_DIR="$JUPYTER_ROOT_PATH"/settings
export JUPYTERLAB_WORKSPACES_DIR="$JUPYTER_ROOT_PATH"/workspace
export JUPYTER_CONFIG_DIR="$JUPYTER_ROOT_PATH"/config
export JUPYTER_RUNTIME_DIR="$JUPYTER_ROOT_PATH"/runtime
export JUPYTER_DATA_DIR="$JUPYTER_ROOT_PATH"/data

enable_venv(){
	test ! -d "$VENV_PATH" && echo 'Python virtual envrionnement not installed' && exit 1

	case "$1" in
		--windows|-W)	ENV_PATH="$VENV_PATH"/Scripts/activate ;;
		'')		ENV_PATH="$VENV_PATH"/bin/activate ;;
		*)		echo 'Invalid selected OS' && exit 1 ;;
	esac

	test ! -f "$ENV_PATH" && echo 'Installation is corrupted, please reinstall' && exit 1
	. "$ENV_PATH"
}

case "$1" in
	i|-i|install|--install)
		python -m venv "$VENV_PATH"
		enable_venv "$2"
		pip install -r requirements.txt
		mkdir -p "$JUPYTER_ROOT_PATH"/{settings,workspace,config,runtime,data}
		mkdir -p "$JUPYTERLAB_SETTINGS_DIR"/@jupyterlab/notebook-extension
		echo '{ "maxNumberOutputs": 0 }' > "$JUPYTERLAB_SETTINGS_DIR"/@jupyterlab/notebook-extension/tracker.jupyterlab-settings
	;;

	k|-k|kernel|--kernel)
		enable_venv "$2"
		mkdir -p "$R_LIBS_SITE"
		Rscript -e 'install.packages("IRkernel",repos="http://cran.us.r-project.org");library(IRkernel);IRkernel::installspec()'
	;;

	c|-c|check|--check)
		enable_venv "$2"
		pip check
	;;

	u|-u|update|--update)
		enable_venv "$2"
		python -m pip install -U pip
		pip freeze | xargs -n1 pip install -U
	;;

	U|-U|uninstall|--uninstall)
		rm -rf "$VENV_PATH" "$JUPYTER_ROOT_PATH" "$R_LIBS_SITE"
	;;

	l|-l|launch|--launch)
		enable_venv "$2"
		if command -v jupyter >> /dev/null; then
			jupyter lab
		else
			echo "Jupyter lab isn't installed"
			exit 1
		fi
	;;

	h|-h|help|--help) echo "$USAGE" ;;
	*)		  echo "$USAGE" && exit 1 ;;
esac
