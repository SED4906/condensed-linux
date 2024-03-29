#!/bin/sh
. ./versions.sh
cd rootfs
mkdir -p dev etc/init.d proc sys
mkdir -p usr/bin
mkdir -p usr/sbin
ln -sf usr/bin bin
ln -sf usr/sbin sbin
cp -af ../sources/${BUSYBOX_OUT}/_install/bin/* bin
cp -af ../sources/${BUSYBOX_OUT}/_install/sbin/* sbin
cat > init << EOF
#!/bin/sh
exec /sbin/init
EOF
cat > etc/inittab << EOF
::sysinit:/etc/init.d/rcS
::askfirst:-/bin/sh
::ctrlaltdel:/sbin/reboot
::shutdown:/sbin/swapoff -a
::shutdown:/bin/umount -a -r
::restart:/sbin/init
tty1::askfirst:-/bin/sh
tty2::askfirst:-/bin/sh
tty3::askfirst:-/bin/sh
tty4::askfirst:-/bin/sh
EOF
cat > etc/init.d/rcS << EOF
#!/bin/sh
mount -t devtmpfs none /dev
mount -t proc proc /proc
mount -t sysfs none /sys
mount -o remount,rw /
mkdir -p /dev/pts
mount -t devpts devpts /dev/pts
mkdir -p /dev/shm
mount -a
mdev -s
EOF
chmod +x init
chmod +x etc/init.d/rcS
