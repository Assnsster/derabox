#!/bin/bash

# Color
red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
light_cyan='\033[1;96m'
r='\033[0m'
#/
clear
# Check Architecture
echo -ne "$yellow Kiểm tra Số thứ...\n"
case $(getprop ro.product.cpu.abi) in
        arm64-v8a)echo -ne "$yellow Architecture của bạn là $green $(getprop ro.product.cpu.abi)\n";;
        *)echo -ne "$yellow Architecture của bạn là $red $(getprop ro.product.cpu.abi)\n" ; echo -ne "$red Architecture của bạn không hỗ trợ! $r\n";exit;;
esac
# check dir
if [ ! -d $PREFIX/opt/derabox ]
  then echo -ne "$yellow derabox "$red"chưa được tải!\n"
fi
