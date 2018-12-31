FROM mcchae/py37
MAINTAINER MoonChang Chae mcchae@gmail.com
LABEL Description="alpine jupyterlab with python3.7 and openssh server"

RUN apk --update add --virtual build-dependencies alpine-sdk \
	&& pip install jupyterlab \
	&& apk del build-dependencies \
	&& apk --update add libzmq
RUN pip list && mkdir /notebook

EXPOSE 8888

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["jupyter", "lab", "--allow-root", "--notebook-dir=/notebook", "--ip=0.0.0.0" "--no-browser"]
