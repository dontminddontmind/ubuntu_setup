#!/bin/bash

mkdir ~/tools
git clone git@github.com:zardus/ctf-tools.git ~/tools/ctf-tools

sudo apt update
sudo apt install build-essential libtool g++ gcc texinfo curl wget automake autoconf python3 python3-dev python2 python2-dev git subversion unzip lsb-release
#安装python的时候会同时安装
#pip install virtualenvwrapper 

~/tools/ctf-tools/bin/manage-tools setup
source ~/.bashrc

cp -r ./ctf-tools/* ~/tools/ctf-tools/
# 运行32位程序
sudo apt install gcc-multilib

# install gdb, allowing it to try to sudo install dependencies
#manage-tools -s install gdb
sudo apt install gdb
sudo apt install gdb-multiarch
manage-tools install gef
manage-tools install peda
manage-tools install pwndbg #+
#可是这样就需要先入virtualenv才能运行pwndbg
#所以给全局的python也装上pwndbg
deactivate
pushd ~/tools/ctf-tools/pwndbg/pwndbg
./setup.sh
popd

# install pwntools, but don't let it sudo install dependencies
manage-tools install pwntools #+

# install qemu, but use "nice" to avoid degrading performance during compilation
# manage-tools -n install qemu #+
sudo apt install git libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev
#可以使用--install-suggests选项安装建议的包，即可安装我们需要的所有qemu功能：
sudo apt install--install-suggests qemu
sudo apt-get install  qemu-user qemu-system qemu-user-static binfmt-support

# manage-tools -s install one_gadget
sudo apt-get install rubygems 
sudo gem install one_gadget
sudo apt install gcc ruby-dev
sudo gem install seccomp-tools

manage-tools install ropper #+
manage-tools install checksec
# manage-tools install -s afl 

#msf
sudo curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \chmod 755 msfinstall && \./msfinstall

#LibcSearcher
git clone https://github.com/lieanu/LibcSearcher.git ~/tools/LibcSearcher
pushd ~/tools/LibcSearcher
workon ctf-tools3
python setup.py develop
workon ctf-tools
python setup.py develop
popd

#glibc-all-in-one
git clone https://github.com/matrix1001/glibc-all-in-one.git ~/tools/glibc-all-in-one
pushd ~/tools/glibc-all-in-one
./update_list
popd
#程序换glibc
sudo apt-get install patchelf

#iot libc
# sudo apt-get install libc6-arm64-cross libc6-armel-cross libc6-armhf-cross libc6-mips-cross libc6-mips32-mips64-cross libc6-mips32-mips64el-cross libc6-mips64-cross libc6-mips64-mips-cross libc6-mips64-mipsel-cross libc6-mips64el-cross libc6-mipsel-cross libc6-mipsn32-mips-cross libc6-mipsn32-mips64-cross libc6-mipsn32-mips64el-cross libc6-mipsn32-mipsel-cross
#iot pwntools shellcode binutils
sudo apt-get install binutils-mipsel-linux-gnu  binutils-mips-linux-gnu binutils-arm-linux-gnueabi




