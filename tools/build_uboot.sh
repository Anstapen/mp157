#!/bin/bash

DT="stm32mp157f-dk2"

echo Building Uboot...

if ! test -d third_party/uboot; then
    echo "Could not find uboot directory..."
fi

if ! test -d config; then
    echo "Could not find config directory..."
fi

DEFCONFIG_FILE=custom_defconfig

# just a hotfix for now, find a better solution...
cp config/$DEFCONFIG_FILE third_party/uboot/configs

rm -rf build
mkdir build
cd build
BUILD_DIR=$(pwd)
echo Build Dir: $BUILD_DIR

cd ../third_party/uboot

echo "make O=$BUILD_DIR DEVICE_TREE=$DT CROSS_COMPILE=arm-none-eabi- $DEFCONFIG_FILE"
echo "make -j8 O=$BUILD_DIR DEVICE_TREE=$DT CROSS_COMPILE=arm-none-eabi- all"

# First clean the U-Boot Directory

make mrproper

make O=$BUILD_DIR DEVICE_TREE=$DT CROSS_COMPILE=arm-none-eabi- $DEFCONFIG_FILE
make -j8 O=$BUILD_DIR DEVICE_TREE=$DT CROSS_COMPILE=arm-none-eabi- all


echo Cleaning up...
rm configs/$DEFCONFIG_FILE
