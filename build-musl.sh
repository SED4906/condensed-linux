#!/bin/sh
. ./versions.sh
cd sources/${MUSL_OUT}
./configure --disable-shared --prefix=/
make -j`nproc`
make install DESTDIR=../../intermediates/musl
cd ../../intermediates/musl
sed -i "s|/lib|${PWD}/lib|g" bin/musl-gcc
sed -i "s|/lib|${PWD}/lib|g" lib/musl-gcc.specs
sed -i "s|/include|${PWD}/include|g" lib/musl-gcc.specs
cd bin
ln -sf `which ar` musl-ar
ln -sf `which strip` musl-strip
ln -sf `which ranlib` musl-ranlib
