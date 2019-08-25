FROM ubuntu:19.04

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    dirmngr \
    g++ \
    gcc \
    lsb-release \
    make \
    jekyll \
    python3.8 \
    python3-pip

# Python
RUN pip3 install --upgrade \
    awscli \
    requests \
    black

# Node stuff for the frontend
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g \
    yarn \
    prettier
