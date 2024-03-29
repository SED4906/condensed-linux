# Condensed Linux
Linux distro condensed into a single bootable file.

Contains:
- Linux (of course)
- Busybox (with static musl)
## Building
```
./download.sh
./extract.sh
./build.sh
```
Outputs bootx64.efi, which may be copied to efi/boot/bootx64.efi on a FAT32 volume.
