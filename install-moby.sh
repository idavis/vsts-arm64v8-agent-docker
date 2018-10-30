#!/bin/bash
set -e

apt-get update && apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    iptables \
    iproute2 \
    libcurl3 \
    libffi-dev \
    libssl1.0.0=1.0.2g-1ubuntu4.13 \
    libssl-dev=1.0.2g-1ubuntu4.13 \
    systemd && \
    rm -rf /var/lib/apt/lists/*

curl -L https://aka.ms/moby-engine-armhf-latest -o moby_engine.deb && dpkg -i ./moby_engine.deb && rm ./moby_engine.deb && \
    curl -L https://aka.ms/moby-cli-armhf-latest -o moby_cli.deb && dpkg -i ./moby_cli.deb && rm ./moby_cli.deb

apt-get update && apt-get install -f

cd /lib/arm-linux-gnueabihf/

ln -s libcrypto.so.1.0.0 libcrypto.so.1.0.2 && \
ln -s libssl.so.1.0.0 libssl.so.1.0.2

