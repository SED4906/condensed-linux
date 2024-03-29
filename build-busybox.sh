#!/bin/sh
. ./versions.sh
cd sources/${BUSYBOX_OUT}
cp -f ../../configs/busybox .config
make -j`nproc`
make install
