FROM mcchae/py37
MAINTAINER MoonChang Chae mcchae@gmail.com
LABEL Description="alpine jupyterlab with python3.7 and openssh server"

RUN apk --update add alpine-sdk \
	&& pip install jupyterlab \
	&& apk --update add libzmq

EXPOSE 8888

#ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/usr/local/bin/jupyter", "lab", "--allow-root", "--notebook-dir=/notebook", "--ip=0.0.0.0" "--no-browser"]
