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
Outputs kernel.efi, which may be copied to efi/boot/bootx64.efi on a FAT32 volume.

The contents of the `output` directory may also be copied to a FAT32 volume.

The `root=/dev/(device)` option may be specified on the kernel command line, and used as a stateful overlay partition. Otherwise, a tmpfs is used instead.
## Testing
```
./run.sh
```
Requires QEMU and the OVMF images. Extra options to run.sh are passed to QEMU.