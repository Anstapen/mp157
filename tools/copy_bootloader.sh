#!/bin/bash


if [ "$#" -lt 1 ]; then
    echo Too few args...
    echo need the sd card as /dev/sdX
    exit 1
fi

if [ ! -b $1 ]; then
    echo "Device $1 does not exist";
    exit 1;
fi

if ! test -d prebuilt; then
    echo Did not find build directory...
    exit 1
fi




echo Copying Files..


echo "sudo dd if=prebuilt/u-boot-spl.dtb.out of=${1}1"
echo "sudo dd if=prebuilt/u-boot-spl.dtb.out of=${1}2"
echo "sudo dd if=prebuilt/u-boot.img of=${1}3"
sudo dd if=prebuilt/u-boot-spl.dtb.out of=${1}1
sudo dd if=prebuilt/u-boot-spl.dtb.out of=${1}2
sudo dd if=prebuilt/u-boot.img of=${1}3

