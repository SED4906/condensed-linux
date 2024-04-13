#!/bin/sh
LINUX_VERSION='6.6.27'
LINUX_MAJOR=`echo $LINUX_VERSION | cut -d. -f1`
LINUX_OUT="linux-${LINUX_VERSION}"
LINUX_URL="https://cdn.kernel.org/pub/linux/kernel/v${LINUX_MAJOR}.x/${LINUX_OUT}.tar.xz"

BUSYBOX_VERSION='1.36.1'
BUSYBOX_OUT="busybox-${BUSYBOX_VERSION}"
BUSYBOX_URL="https://busybox.net/downloads/${BUSYBOX_OUT}.tar.bz2"

MUSL_VERSION='1.2.5'
MUSL_OUT="musl-${MUSL_VERSION}"
MUSL_URL="http://musl.libc.org/releases/${MUSL_OUT}.tar.gz"

LIMINE_VERSION='7.3.1'