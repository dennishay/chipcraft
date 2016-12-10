#!/bin/bash

sudo apt-get update && \

sudo apt-get -y install \
build-essential \
libsdl1.2-dev \
git

git clone https://github.com/xobs/mcrpi-wrapper
mkdir mcrpi-wrapper
pushd mcrpi-wrapper
git apply ../0001-set-PocketCHIP-screen-resolution.patch
make
popd

git clone https://github.com/thp/eglo
mkdir eglo
pushd eglo
make
popd

wget https://s3.amazonaws.com/assets.minecraft.net/pi/minecraft-pi-0.1.1.tar.gz
tar xf minecraft-pi-0.1.1.tar.gz
pushd mcpi
cp ../mcrpi-wrapper/libbcm_host.so.1.0 libbcm_host.so
cp ../eglo/libeglo.so libGLESv2.so
ln -s libGLESv2.so libGLESv2.so
cp ../start.sh .

