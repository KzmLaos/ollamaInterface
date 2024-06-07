FROM debian:12

RUN apt-get -y update
RUN apt-get install -yq --fix-missing build-essential emacs-nox vim-tiny git inkscape jed libsm6 libxext-dev libxrender1 lmodern netcat-openbsd python3-dev tzdata unzip nano emacs ca-certificates wget gcc-12 gcc-12-plugin-dev curl screen  nginx clang llvm lld gdb

#Support packages for Python
RUN apt-get install -y libreadline-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev automake python3-dev python3-pip #python-venv

RUN useradd -ms /bin/bash debian 

USER debian
WORKDIR /home/debian

#Installing the jupyter interface
USER root
#RUN mkdir env
#RUN python3 -m venv /home/debian/env/python
#RUN source /home/debian/env/python/bin/activate
RUN pip3 install --upgrade pip --break-system-packages
RUN pip3 install numpy jupyter pandas joblib xgboost scikit-image scikit-learn python-afl voila ipyvuetify jupyter_contrib_nbextensions jupyter_nbextensions_configurator voila-vuetify bqplot deap --break-system-packages
RUN pip3 install ipywidgets ollama --break-system-packages

#Installing Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

RUN pip3 install ipyflex plotly --break-system-packages
USER debian
WORKDIR /home/debian/
COPY ollamaInterface /home/debian/ollamaInterface 
RUN mkdir /home/debian/models
#RUN git clone https://github.com/KzmLaos/ollamaInterface.git

EXPOSE 8888
USER root
RUN chmod 755 /home/debian/ollamaInterface/initScript.bash
#For Windows users
RUN sed -i -e 's/\r$//' /home/debian/ollamaInterface/initScript.bash
ENTRYPOINT ["/home/debian/ollamaInterface/initScript.bash"]
CMD ["echo","Default argument for CMD instruction"]
#USER root

