#!/bin/bash

DT="stm32mp157f-dk2"

echo Building Uboot...

if test -d third_party/uboot; then
    echo "Found U-Boot Directory, continuing..."
fi

rm -rf build
mkdir build
cd build
BUILD_DIR=$(pwd)
echo Build Dir: $BUILD_DIR

cd ../third_party/uboot

echo "make O=$BUILD_DIR DEVICE_TREE=$DT CROSS_COMPILE=arm-none-eabi- stm32mp15x_baremetal_defconfig"
echo "make -j8 O=$BUILD_DIR DEVICE_TREE=$DT CROSS_COMPILE=arm-none-eabi- all"

# First clean the U-Boot Directory

make mrproper

make O=$BUILD_DIR DEVICE_TREE=$DT CROSS_COMPILE=arm-none-eabi- stm32mp15_basic_defconfig
make -j8 O=$BUILD_DIR DEVICE_TREE=$DT CROSS_COMPILE=arm-none-eabi- all
