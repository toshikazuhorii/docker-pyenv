[![](https://images.microbadger.com/badges/version/vadviktor/python.svg)](https://microbadger.com/images/vadviktor/python "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/vadviktor/python.svg)](https://microbadger.com/images/vadviktor/python "Get your own image badge on microbadger.com")

Ubuntu LTS Xenial (16.04) [minimal debootstrap](https://hub.docker.com/r/blitznote/debootstrap-amd64/) based image with [pyenv](https://github.com/yyuu/pyenv).

# Build examples

## To build a CPython:

`docker build --no-cache --build-arg PYTHON_VERSION=3.6.0 --rm --tag=some-name/pyenv:0.0.1 .`

# Usage example

```
FROM vadviktor/python:3.6.0
MAINTAINER whoami@gmail.com

RUN mkdir -p /app
COPY . /app
WORKDIR /app

RUN . /init.sh && \ #MUST
    pip install -r requirements.txt && \
    pip install whatever packages you like && \
    pyenv rehash

EXPOSE 3000

ENTRYPOINT ["/app/startup.sh"]
```

`startup.sh` example:

```
#!/bin/bash

export PYENV_ROOT="/root/.pyenv" && \
export PATH="$PYENV_ROOT/bin:$PATH" && \
eval "$(pyenv init -)" && \
exec somecommandthatisinpython
```

# Usage example as a single script

In this example we are running a minitest suite.

`docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp vadviktor/python:3.6.0 sh /init.sh && python my_cool_script.py`

# TODO

* Ability to install other Python implementations
