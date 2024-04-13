#!/bin/sh
qemu-system-x86_64 -bios /usr/share/ovmf/OVMF.fd -drive file=fat:rw:output,format=raw -m 512 $@