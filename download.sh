#!/bin/sh
mkdir -p downloads

dl() {
(cd downloads && curl -LO $1)
}

. ./versions.sh
dl $LINUX_URL
dl $BUSYBOX_URL
dl $MUSL_URL

