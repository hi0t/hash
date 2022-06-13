FROM nvidia/cuda:11.7.0-devel-ubuntu22.04

RUN apt-get update && apt-get install -y \
    bash-completion \
    wget \
    ca-certificates \
    git \
    pkg-config \
    libssl-dev \
    zlib1g-dev \
    libcurl4-openssl-dev \
    hashcat

WORKDIR /hcxtools
RUN git clone --depth 1 --branch 6.2.7 https://github.com/ZerBea/hcxtools.git . && \
    make install

WORKDIR /

RUN rm -rf /var/lib/apt/lists/* && rm -rf /hcxtools
