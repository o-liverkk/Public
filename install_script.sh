#!/bin/bash

# 更新系统
apt update && apt upgrade -y

# 安装 screen, curl 和 vim
apt install -y screen curl vim

echo 'GRUB_CMDLINE_LINUX="ipv6.disable=1"' | tee -a /etc/default/grub && update-grub

# 下载并执行指定的脚本
stty erase '^H' && read -p "install node.js ? [Y/n] :" yn
[ -z "${yn}" ] && yn="y"
if [[ $yn == [Yy] ]]; then
 source <(curl -L https://github.com/o-liverkk/nodejs-install/raw/master/install.sh )
fi