# About this container

This is a python3 jupyter lab running enrironment alpine box enabled with sshd.


## Dockerfile
``` bash
FROM mcchae/py37
MAINTAINER MoonChang Chae mcchae@gmail.com
LABEL Description="alpine jupyterlab with python3.7 and openssh server"

RUN apk --update add --virtual build-dependencies alpine-sdk freetype-dev \
        && pip install jupyterlab \
        && pip install numpy pandas matplotlib seaborn mpld3 \
        && apk del build-dependencies \
        && apk --update add libzmq
RUN pip list && mkdir /notebook

EXPOSE 8888

CMD jupyter lab --allow-root --notebook-dir=/notebook --ip=0.0.0.0 --no-browser --NotebookApp.token='' --NotebookApp.password=''
```

## docker-compose
``` yaml
version: '2'
services:
  myjulab:
    image: "mcchae/julab"
    hostname: "jupyterlab"
    volumes:
      - ${PWD}:/notebook
    ports:
      - "8888:8888"
```
