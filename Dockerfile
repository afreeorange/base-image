FROM ubuntu:hirsute

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE true

# Initial setup. Node is a fucking pain.
RUN DEBIAN_FRONTEND="noninteractive" \
    apt-get -y update && \
    apt-get -y install \
        curl \
        gnupg \
        tzdata \
    && \
    # Add Node and Yarn PPAs
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && \
    # Install stuff
    apt-get -y install \
        ca-certificates \
        curl \
        ffmpeg \
        git \
        imagemagick \
        golang \
        hugo \
        make \
        nodejs \
        python3-pip \
        python3-venv \
        python3.8 \
        trimage \
        wget \
        xvfb \
    && \
    # Clean up
    rm -rf /var/lib/apt/lists/*

# Python. Not symlinking causes poetry to barf :/ It also does this if
# python3-venv is not installed.
RUN ln -s /usr/bin/pip3 /usr/bin/pip && \
    pip3 install --upgrade \
        awscli \
        requests \
        black \
        poetry

# Node
RUN npm i -g \
        eslint \
        inline-source-cli \
        parcel-bundler \
        prettier \
        @11ty/eleventy \
        yarn

# Go!
ENV GOPATH $HOME/go
ENV PATH $HOME/go/bin:$PATH
