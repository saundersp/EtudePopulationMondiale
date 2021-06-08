#!/bin/bash

USAGE="Jupyterlab portable helper\nImplemented by Pierre Saunders, 2021\n\nDocumentation:\n\t$0 install\n\tInstall Jupyterlab locally to the script.\n\n\t$0 uninstall\n\tUninstall Jupyterlab locally to the script.\n\n\t$0 launch\n\tLaunch Jupyterlab locally to the script (Require installation beforehand).\n\n\t$0 help\n\tWhich display this help message."

VENV_PATH=./venv
JUPYTER_ROOT_PATH=./jupyter
export JUPYTERLAB_SETTINGS_DIR=$JUPYTER_ROOT_PATH/settings
export JUPYTERLAB_WORKSPACES_DIR=$JUPYTER_ROOT_PATH/workspace
export JUPYTER_CONFIG_DIR=$JUPYTER_ROOT_PATH/config
export JUPYTER_RUNTIME_DIR=$JUPYTER_ROOT_PATH/runtime
export JUPYTER_DATA_DIR=$JUPYTER_ROOT_PATH/data
export R_LIBS_SITE=./libs

enable_venv(){
	if [[ ! -d $VENV_PATH ]]; then
		echo "Python virtual envrionnement not installed"
		exit 1
	fi

	case "$1" in
		--windows|-W) local ENV_PATH=$VENV_PATH/Scripts/activate ;;
		'') 		  local ENV_PATH=$VENV_PATH/bin/activate ;;
		*)
			echo "Invalid option"
			exit 1
		;;
	esac

	if [[ ! -f $ENV_PATH ]]; then
		echo "Invalid selected OS"
		exit 1
	fi
	source $ENV_PATH
}

case "$1" in
	install)
		python -m venv $VENV_PATH
		enable_venv $2
		pip install -r requirements.txt
		mkdir $JUPYTER_ROOT_PATH $JUPYTER_ROOT_PATH/settings $JUPYTER_ROOT_PATH/workspace \
			$JUPYTER_ROOT_PATH/config $JUPYTER_ROOT_PATH/runtime $JUPYTER_ROOT_PATH/data \
			$R_LIBS_SITE 2>>/dev/null

		Rscript -e 'install.packages("IRkernel",repos="http://cran.us.r-project.org");library(IRkernel);IRkernel::installspec()'
	;;

	check)
		enable_venv $2
		pip check
	;;

	uninstall)
		rm -rf $R_LIBS_SITE $VENV_PATH $JUPYTER_ROOT_PATH
	;;

	launch)
		enable_venv $2
		jupyter lab
	;;

	help) echo -e "$USAGE" ;;
	*)	  echo -e "$USAGE" ;;
esac