FROM python:3.7-stretch
MAINTAINER MoonChang Chae mcchae@gmail.com
LABEL Description="ubuntu jupyterlab with python3.7"
# pip install matplotlib seaborn mpld3, failure in alpine version 

RUN apt-get update && apt-get install -y --no-install-recommends \
	&& pip install jupyterlab \
	&& pip install numpy pandas \
	&& pip install matplotlib seaborn mpld3 \
	&& rm -rf /var/lib/apt/lists/*
#	&& apk --update add libzmq
RUN pip list && mkdir /notebook

EXPOSE 8888

CMD jupyter lab --allow-root --notebook-dir=/notebook --ip=0.0.0.0 --no-browser --NotebookApp.token='' --NotebookApp.password=''
