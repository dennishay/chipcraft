#!/bin/bash

sudo apt-get update && \
sudo apt-get -y install \
build-essential \
git \
libsdl1.2-dev

git clone https://github.com/xobs/mcrpi-wrapper
mkdir mcrpi-wrapper
pushd mcrpi-wrapper
git apply ../0001-set-PocketCHIP-screen-resolution.patch
make
popd

wget https://s3.amazonaws.com/assets.minecraft.net/pi/minecraft-pi-0.1.1.tar.gz
tar xf minecraft-pi-0.1.1.tar.gz
pushd mcpi
cp ../mcrpi-wrapper/libbcm_host.so.1.0 libbcm_host.so
mv ../start.sh .

