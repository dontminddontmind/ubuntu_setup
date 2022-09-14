#!/bin/bash

mkdir ~/tools
git clone git@github.com:zardus/ctf-tools.git ~/tools/ctf-tools

sudo apt update
sudo apt install build-essential libtool g++ gcc texinfo curl wget automake autoconf python3 python3-dev python2 python2-dev git subversion unzip lsb-release
#安装python的时候会同时安装
#pip install virtualenvwrapper 

~/tools/ctf-tools/bin/manage-tools setup
source ~/.bashrc

# install gdb, allowing it to try to sudo install dependencies
#manage-tools -s install gdb
sudo apt install gdb

# install pwntools, but don't let it sudo install dependencies
manage-tools install pwntools

# install qemu, but use "nice" to avoid degrading performance during compilation
manage-tools -n install qemu


A

