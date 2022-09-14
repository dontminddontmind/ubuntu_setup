#!/bin/bash

mkdir ~/tools
git clone git@github.com:zardus/ctf-tools.git ~/tools/ctf-tools

sudo apt update
sudo apt install build-essential libtool g++ gcc texinfo curl wget automake autoconf python3 python3-dev python2 python2-dev git subversion unzip lsb-release
#安装python的时候会同时安装
#pip install virtualenvwrapper 

~/tools/ctf-tools/bin/manage-tools setup
source ~/.bashrc

# 运行32位程序
sudo apt install gcc-multilib

# install gdb, allowing it to try to sudo install dependencies
#manage-tools -s install gdb
sudo apt install gdb
sudo apt install gdb-multiarch
manage-tools install gef
manage-tools install peda
manage-tools install pwndbg

# install pwntools, but don't let it sudo install dependencies
manage-tools install pwntools

# install qemu, but use "nice" to avoid degrading performance during compilation
manage-tools -n install qemu

manage-tools install one_gadget
manage-tools install ropper
manage-tools install checksec
manage-tools install seccomp-tools
manage-tools install afl



