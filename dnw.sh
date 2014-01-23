#!/bin/sh

DNW=$(pwd)
DNW_MODULES=$(lsmod | grep "secbulk")

if [ $# -ne 2 ];then
    echo "Usage: sh $0 addr filename"
    exit 1
fi

echo ${DNW_MODULES}
if [ -n "${DNW_MODULES}" ];then
    echo "Module has been insmod"
    sudo ${DNW}/src/dnw/dnw -a $1 $2
else
    echo "Insmodding the modules"
    sudo insmod ${DNW}/src/driver/secbulk.ko
    sudo ${DNW}/src/dnw/dnw -a $1 $2
fi
