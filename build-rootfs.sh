#!/bin/sh
. ./versions.sh
cd rootfs
mkdir -p dev etc proc sys var
mkdir -p usr/bin
mkdir -p usr/sbin
mkdir -p usr/lib
mkdir -p usr/lib64
ln -sf usr/bin
ln -sf usr/sbin
ln -sf usr/lib
ln -sf usr/lib64
cp -arf ../defaults/* ./
chmod +x init
chmod +x etc/init.d/rcS
chmod +x usr/share/udhcpc/default.*