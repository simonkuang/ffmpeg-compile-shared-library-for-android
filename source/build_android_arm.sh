#!/bin/bash
export TMPDIR=/Volumes/RamDisk/abcd
NDK=/Users/simonkuang/Library/Android/sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-16/arch-arm/android-24/arch-arm
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64

CPU=arm
PREFIX=/Users/simonkuang/workspace/ffmpeg_shared_compiled/arm/
ADDI_CFLAGS="-marm"

function build_one
{
./configure \
--prefix=$PREFIX \
--enable-shared \
--disable-static \
--disable-doc \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-ffserver \
--disable-doc \
--disable-symver \
--enable-small \
--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
--target-os=linux \
--arch=arm \
--enable-cross-compile \
--sysroot=$SYSROOT \
--extra-cflags="-Os -fpic $ADDI_CFLAGS" \
--extra-ldflags="$ADDI_LDFLAGS" \
$ADDITIONAL_CONFIGURE_FLAG
make clean
make
make install
}

build_one
