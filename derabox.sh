#!/bin/bash 
#variable
VERSION="1.0"
# Color
red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
light_cyan='\033[1;96m'
r='\033[0m'
up() {
read -p "bạn có muốn update? [Y=update] [N=Cancel] Y/N: " upyn
while true
do
case $upyn in
  y|Y) curl https://raw.githubusercontent.com/Assnsster/derabox/main/update.sh|bash;break;;
  n|N) echo -ne ""$red"Bạn sẽ sử dụng Derabox không cần Update!$r";break;;
esac
done
}
#/
clear
echo -ne "$yellow Kiểm tra Số thứ...\n"
sleep 0.5
if [ ! -d $PREFIX/opt/derabox ]
  then echo -ne "$yellow derabox "$red"chưa được tải!\n";exit
fi
# check ver
if [ ! $VERSION == $(curl https://raw.githubusercontent.com/Assnsster/derabox/main/version) ]
echo -ne "$yellow bạn đang có bản update [ver $(curl https://raw.githubusercontent.com/Assnsster/derabox/main/version) ] $r";up
else 
echo -ne "$green bạn sử dụng bản update mới nhất!"
fi
# Check Architecture
case $(getprop ro.product.cpu.abi) in
        arm64-v8a)echo -ne "$yellow Architecture của bạn là"$green" $(getprop ro.product.cpu.abi)\n";;
        *)echo -ne "$yellow Architecture của bạn là $red $(getprop ro.product.cpu.abi)\n" ; echo -ne "$red Architecture của bạn không hỗ trợ! $r\n";exit;;
esac
# check dir

