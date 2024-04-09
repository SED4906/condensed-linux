#!/bin/sh
. ./versions.sh
cd rootfs
mkdir -p dev etc/init.d proc sys
mkdir -p usr/bin
mkdir -p usr/sbin
mkdir -p usr/lib
mkdir -p usr/lib64
ln -sf usr/bin
ln -sf usr/sbin
ln -sf usr/lib
ln -sf usr/lib64
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
mkdir -p /overlay/rootfs
mkdir -p /overlay/work
mkdir -p /overlay/upper
mkdir -p /overlay/target
mount --bind / /overlay/rootfs
EOF
cat > bin/overlay-image << EOF
#!/bin/sh
mkdir -p "/overlay/upper/\$(basename \$1)"
mount -t squashfs -oloop "\$1" "/overlay/upper/\$(basename \$1)"
mount -t overlay overlay -o "lowerdir=/overlay/rootfs,upperdir=/overlay/upper/\$(basename \$1),workdir=/overlay/work" /overlay/target
EOF
chmod +x init
chmod +x etc/init.d/rcS
chmod +x bin/overlay-image
