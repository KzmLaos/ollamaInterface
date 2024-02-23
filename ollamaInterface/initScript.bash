#!/bin/bash
A=$1
OLLAMA_MODELS=/home/debian/models ollama serve &
sleep 5
if [ "$A" == "develop" ];
then
	jupyter notebook --allow-root --no-browser --port 8888 --ip=0.0.0.0 --NotebookApp.token=''
elif [ "$A" == "deploy" ];
then
	voila --no-browser --template vuetify-default --enable_nbextensions=True /home/debian/ollamaInterface/frontend/Interface.ipynb --Voila.ip=0.0.0.0 --port 8888
elif [ "$A" == "debug" ];
then 	
	bash
elif [ "$A" == "model" ];
then 
	ollama run $2
else
	echo "unknown input"
fi
