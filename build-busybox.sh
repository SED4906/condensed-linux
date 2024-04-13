#!/bin/sh
. ./versions.sh
cd sources/${BUSYBOX_OUT}
cp -f ../../configs/busybox .config
make -j`nproc`
make install
cp -af _install/bin/* ../../rootfs/bin
cp -af _install/sbin/* ../../rootfs/sbin