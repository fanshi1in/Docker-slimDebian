#!/bin/bash
# Install python & bilili
# Latest releases: python3
# Taken from https://gist.github.com/Nottt/f55dd79ca235d8add67423a76b304961

set -e 
set -o pipefail

# Install packages needed
apt update > /dev/null 2>&1 && apt upgrade -y > /dev/null 2>&1 && apt install -y curl build-essential libreadline-gplv2-dev libncursesw5-dev \
    libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev > /dev/null 2>&1

# Download necessary files

TEMP_FOLDER="$(mktemp -d)"

# Python 3.9.4
curl -Ls https://www.python.org/ftp/python/3.9.4/Python-3.9.4.tgz | tar xz -C "$TEMP_FOLDER"

# Compile

cd "$TEMP_FOLDER"/Python-3.9.4 || exit
./configure --enable-optimizations
make && make install

rm -rf "$TEMP_FOLDER"