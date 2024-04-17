#!/bin/sh
. ./versions.sh
cd sources/${LINUX_OUT}
cp ../../configs/linux .config
make -j`nproc`
cp -f arch/`uname -m`/boot/bzImage ../../kernel.efi
