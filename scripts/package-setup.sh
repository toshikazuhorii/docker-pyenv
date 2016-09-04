#!/bin/bash

apt-get update && \
apt-get upgrade -y && \
apt-get install -y build-essential \
                   curl \
                   git \
                   libbz2-dev \
                   libncurses5-dev \
                   libreadline-dev \
                   libsqlite3-dev \
                   libssl-dev \
                   llvm \
                   make \
                   wget \
                   xz-utils \
                   zlib1g-dev

apt-get autoremove -y && \
apt-get clean
