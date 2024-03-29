#!/bin/sh
mkdir -p intermediates
mkdir -p rootfs
./build-musl.sh
./build-linux-headers.sh
PATH="${PWD}/intermediates/musl/bin:${PATH}"
./build-busybox.sh
./build-rootfs.sh
./build-linux.sh
