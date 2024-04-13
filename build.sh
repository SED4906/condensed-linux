#!/bin/sh
if [ -e rootfs ]; then
echo may ask for root permissions to remove existing initramfs directory
sudo rm -rf rootfs
fi
mkdir -p intermediates
mkdir -p rootfs/tools
mkdir -p output/efi/boot
mkdir -p output/efi/condensed
./build-musl.sh && ./build-linux-headers.sh && (
    PATH="${PWD}/intermediates/musl/bin:${PATH}";
    ./build-rootfs.sh &&
    ./build-busybox.sh
) &&
rm -rf rootfs/tools &&
echo may ask for root permissions to change file ownership in initramfs &&
sudo chown 0:0 -R rootfs/* &&
./build-linux.sh &&
cp -f kernel.efi output/efi/condensed/kernel.efi &&
cp -f kernel.efi output/efi/boot/bootx64.efi