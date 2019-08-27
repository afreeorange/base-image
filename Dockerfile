FROM ubuntu:19.10

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    dirmngr \
    g++ \
    gcc \
    git \
    golang \
    jekyll \
    lsb-release \
    make \
    nodejs \
    python3-pip \
    python3.8 \
    trimage \
    xvfb
RUN apt-get -y autoremove

# Python
RUN pip3 install --upgrade \
    awscli \
    requests \
    black

# Node stuff for the frontend
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN npm i -g \
    yarn \
    prettier

# Go!
ENV GOPATH $HOME/go
ENV PATH $HOME/go/bin:$PATH
RUN go get -u \
    github.com/tcnksm/ghr
