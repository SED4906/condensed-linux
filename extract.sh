#!/bin/sh

. ./versions.sh

mkdir -p sources

extract() {
echo "Extracting $1"
tar xf downloads/$1 -C sources
}

extract $LINUX_OUT.tar.xz
extract $BUSYBOX_OUT.tar.bz2
extract $MUSL_OUT.tar.gz
