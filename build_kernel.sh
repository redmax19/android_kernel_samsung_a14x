#!/bin/bash

export PATH="$(pwd)/toolchain/clang/host/linux-x86/clang-r450784d/bin:$PATH"
export LD_LIBRARY_PATH="$(pwd)/toolchain/clang/host/linux-x86/clang-r450784d/lib64:${LD_LIBRARY_PATH:-}"
export CC="$(pwd)/toolchain/clang/host/linux-x86/clang-r450784d/bin/clang"

export DTC_FLAGS="-@"
export PLATFORM_VERSION=13
export ANDROID_MAJOR_VERSION=t
export LLVM=1
export DEPMOD=depmod
export ARCH=arm64
export TARGET_SOC=s5e8535

make -j$(nproc) O="$(pwd)/out" ARCH=arm64 LLVM=1 LLVM_IAS=1 CC="$CC" s5e8535-a14xxx_defconfig
make -j$(nproc) O="$(pwd)/out" ARCH=arm64 LLVM=1 LLVM_IAS=1 CC="$CC" Image

cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image
