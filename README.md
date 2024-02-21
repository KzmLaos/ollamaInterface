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
There are two options for running the container: Deploy and Develop. To use them open the container with
```
sudo docker run -it --rm -p 8888:8888 ollamainterface:latest deploy
```
```
sudo docker run -it --rm -p 8888:8888 -v  $HOME/ollamaInterface/ollamaInterface/frontend:/home/debian/develop ollamainterface:latest develop
```
