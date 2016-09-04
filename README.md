Ubuntu LTS Trusty (14.04) based image with [pyenv](https://github.com/yyuu/pyenv).

# Build examples

## To build a CPython:

`docker build --build-arg PYTHON_VERSION=2.7.12 --rm --tag=some-name/pyenv:0.0.1 .`

# Usage example

```
FROM vadviktor/python:2.7.12
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
#!/usr/bin/env bash

export PYENV_ROOT="/root/.pyenv" && \
export PATH="$PYENV_ROOT/bin:$PATH" && \
eval "$(pyenv init -)" && \
exec somecommandthatisinpython
```

# Usage example as a single script

In this example we are running a minitest suite.

`docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp vadviktor/python:2.7.12 sh /init.sh && python my_cool_script.py`

# TODO

* Ability to install other Python implementations
