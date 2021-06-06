FROM ubuntu:20.10

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE true
ENV DEBIAN_FRONTEND noninteractive

# Initial setup. Use a separate layer.
RUN \
    apt -y update && \
    apt -y install \
        ca-certificates \
        curl \
        git \
        gnupg \
        make \
        python3-pip \
        python3.10-minimal \
        tzdata \
        wget \
        xvfb

# All the additional stuff
RUN \
    #
    # For Node 🙄
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    #
    # For the Github CLI
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
    #
    # Install stuff
    apt -y update && \
    apt -y install \        
        ffmpeg \
        gh \
        imagemagick \
        golang \
        hugo \
        nodejs \
        trimage \
    && \
    # 
    # Clean up
    rm -rf /var/lib/apt/lists/*

# Python
RUN pip install --upgrade \
        awscli \
        requests \
        black \
        flake8 \
        isort \
        poetry

# Node
RUN npm i -g \
        eslint \
        inline-source-cli \
        parcel-bundler \
        prettier \
        @11ty/eleventy \
        yarn
