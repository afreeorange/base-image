Simple Build Image
==================

Ubuntu 19.10-based image I use to build my stuff (primarily in CircleCI.) Usually built with [DockerHub's Automated Builds](https://docs.docker.com/docker-hub/builds/) but has a script to build and push manually in case I get impatient 😄

Versioning
----------

Done via `git` tags. Used to have a `VERSION` file but... why? [This comment](https://gist.github.com/rponte/fdc0724dd984088606b0#gistcomment-3064455) on a gist is how I extract the version when manually building and deploying. DockerHub itself relies on git tags.

So don't forget to `git push origin master --tags` 🤗

### DockerHub Tagging

Under "Build Configurations"

| Source Type |               Source               |    Docker Tag    |
|-------------|------------------------------------|------------------|
| Branch      | master                             | latest           |
| Tag         | `/^([0-9]+)\.([0-9]+)\.([0-9]+)$/` | `{\1}.{\2}`      |
| Tag         | `/^([0-9]+)\.([0-9]+)\.([0-9]+)$/` | `{\1}.{\2}.{\3}` |

Miscellaneous Notes
-------------------

### FROM:Latest

[A Dockerfile linter](http://fromlatest.io/) of sorts.

### Running Image Optimization

```bash
/usr/bin/xvfb-run -a trimage
```

### Alpine Image Setup (Incomplete; no `advpng` to optimize images)

Was about 30% smaller than the Ubuntu image. Get things done before thinking about these things 💖

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
