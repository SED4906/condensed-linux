#!/bin/sh
. ./versions.sh
cd sources/${LINUX_OUT}
make headers_install
cp -r usr/include/linux ../../intermediates/musl/include/
cp -r usr/include/mtd ../../intermediates/musl/include/
cp -r usr/include/asm ../../intermediates/musl/include/
cp -r usr/include/asm-generic ../../intermediates/musl/include/
