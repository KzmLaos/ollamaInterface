#!/bin/bash
A=$1
if [ "$A" == "develop" ];
then
	jupyter notebook --allow-root --no-browser --port 8888 --ip=0.0.0.0 --NotebookApp.token=''
elif [ "$A" == "deploy" ];
then
	voila --no-browser --template vuetify-default --enable_nbextensions=True 
/home/debian/ollamainterface/frontend/Interface.ipynb --Voila.ip=0.0.0.0 --port 8888
else
	echo "unknown input"
fi
