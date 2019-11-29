Simple Build Image
==================

Ubuntu 19.04 LTS-based image I use to build my stuff (primarily in CircleCI.) Usually built with [DockerHub's Automated Builds](https://docs.docker.com/docker-hub/builds/) but has a script to build and push manually in case I get impatient 😄

---

### Running Image Optimization

```bash
/usr/bin/xvfb-run -a trimage
```

### Alpine Image Setup (Incomplete; no `advpng` to optimize images)

Was about 30% smaller than the Ubuntu image.

```
FROM alpine:3.10.2

RUN apk add \
    --no-cache \
    alpine-sdk \
    go \
    musl-dev \
    nodejs-current \
    python3 \
    py3-qt5 \
    ruby \
    ruby-dev \
    ruby-json \
    ruby-bigdecimal \
    jpegoptim \
    optipng \
    pngcrush \
    git

RUN pip3 install awscli

RUN go get \
    github.com/tcnksm/ghr

RUN gem install bundler --no-ri --no-rdoc
```
