# ollama Interface

This is a simple Python API to make an interface to Ollama

# Docker

To run the docker container in Mac, simply use:
```
sudo docker run -it --rm -p 8888:8888 ollamainterface:latest
```

For Linux-based distributions:
```
sudo docker run -it -network host ollamainterface:latest
```
There are four options for running the container: Deploy, Develop, debug 
and model. To use them open the container directly and run the app, use 
deploy:

```
sudo docker run -it --rm -p 8888:8888 -v $HOME/ollamaInterface/models:/home/debian/models ollamainterface:latest deploy 
```
To modify the interface and use a jupyter notebook use develop:
```
sudo docker run -it --rm -p 8888:8888 -v $HOME/ollamaInterface/models:/home/debian/models -v $HOME/ollamaInterface/ollamaInterface/frontend:/home/debian/develop ollamainterface:latest develop
```
To test a specific model in ollama use model:
```
sudo docker run -it --rm -p 8888:8888 -v $HOME/ollamaInterface/ollamaInterface/frontend:/home/debian/develop -v $HOME/ollamaInterface/models:/home/debian/models ollamainterface:latest model gemma:2b
```
To open a bash and debug, use bash:
```
sudo docker run -it --rm -p 8888:8888 -v $HOME/ollamaInterface/ollamaInterface/frontend:/home/debian/develop -v $HOME/ollamaInterface/models:/home/debian/models ollamainterface:latest bash
 ```

