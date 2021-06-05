FROM alpine:3.12.0

RUN apk add \
        --no-cache \
        --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
        --allow-untrusted \
      aws-cli \
      black \
      git \
      go \
      nodejs-current \
      npm \
      poetry \
      py3-pip \
      py3-requests \
      python3 \
      python3-dev \
      yarn

ENV GOPATH $HOME/go
ENV PATH $HOME/go/bin:$PATH

RUN npm i -g \
      @11ty/eleventy \
      eslint \
      inline-source-cli \
      parcel-bundler \
      prettier
