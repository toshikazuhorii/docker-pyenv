Ubuntu LTS Xenial (16.04) based image with [pyenv](https://github.com/yyuu/pyenv).

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

Setting the PATH and initializing rbenv is mandatory. Running code with [`exec`](http://wiki.bash-hackers.org/commands/builtin/exec) is a must have.

```
#!/bin/bash

export PYENV_ROOT="/root/.pyenv" && \
export PATH="$PYENV_ROOT/bin:$PATH" && \
eval "$(pyenv init -)" && \
exec somecommandthatisinpython
```

# Usage example as a single script

In this example we are running a minitest suite.

`docker run -it --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp vadviktor/python:3.6.0 bash /init.sh && python my_cool_script.py`
