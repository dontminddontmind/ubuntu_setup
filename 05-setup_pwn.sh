#!/bin/bash

mkdir ~/tools

sudo apt update
sudo apt install build-essential libtool g++ gcc texinfo curl wget automake autoconf python3 python3-dev python2 python2-dev git subversion unzip lsb-release

# install gdb
sudo apt install gdb
sudo apt install gdb-multiarch
cp ./.gdbinit ~/
mkdir ~/tools/GdbPlugins
git clone https://github.com/hugsy/gef ~/tools/GdbPlugins/gef
git clone https://github.com/Mipu94/peda-heap.git ~/tools/GdbPlugins/peda-heap
git clone https://github.com/longld/peda ~/tools/GdbPlugins/peda
git clone https://github.com/pwndbg/pwndbg ~/tools/GdbPlugins/pwndbg
pushd ~/tools/GdbPlugins/pwndbg
./setup.sh
popd
echo -e '#!/bin/sh\nexec gdb -q -ex init-peda "$@"' > ./bin/gdb-peda
echo -e '#!/bin/sh\nexec gdb -q -ex init-pwndbg "$@"' > ./bin/gdb-pwndbg
echo -e '#!/bin/sh\nexec gdb -q -ex init-pwndbg "$@"' > ./bin/pwndbg
echo -e '#!/bin/sh\nexec gdb -q -ex init-gef "$@"' > ./bin/gdb-gef
echo -e '#!/bin/sh\nexec gdb -q -ex init-pedaheap "$@"' > ./bin/gdb-pedaheap

# install pwntools, but don't let it sudo install dependencies
sudo apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
git clone --depth=1 https://github.com/Gallopsled/pwntools.git ~/tools/pwntools
pushd ~/tools
pip3 install --upgrade appdirs
pip3 install --upgrade -e ./pwntools
pip2 install --upgrade appdirs
pip2 install --upgrade -e ./pwntools
popd

#LibcSearcher
git clone https://github.com/lieanu/LibcSearcher.git ~/tools/LibcSearcher
pushd ~/tools/LibcSearcher
# workon ctf-tools3
sudo python3 setup.py develop
sudo python2 setup.py develop
popd

#qemu
sudo apt install git libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev
#可以使用--install-suggests选项安装建议的包，即可安装我们需要的所有qemu功能：
sudo apt install --install-suggests qemu
sudo apt-get install  qemu-user qemu-system qemu-user-static binfmt-support

#one_gadget
sudo apt-get install rubygems 
sudo gem install one_gadget
#seccomp-tools
sudo apt install gcc ruby-dev
sudo gem install seccomp-tools

#ropper
pip3 install capstone
pip3 install filebytes
pip3 install keystone-engine
pip3 install ropper

#checksec
git clone https://github.com/slimm609/checksec.sh.git ~/tools/checksec.sh
sudo ln -s ~/tools/checksec.sh/checksec /usr/local/bin/checksec

#msf
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
  chmod 755 msfinstall && \
  ./msfinstall
#运行msfconsole测试安装成功

#glibc-all-in-one
git clone https://github.com/matrix1001/glibc-all-in-one.git ~/tools/glibc-all-in-one
pushd ~/tools/glibc-all-in-one
./update_list
popd
#程序换glibc
sudo apt-get install patchelf

#iot libc
# sudo apt-get install libc6-arm64-cross libc6-armel-cross libc6-armhf-cross \
# 	libc6-mips-cross libc6-mips32-mips64-cross libc6-mips32-mips64el-cross \
# 	libc6-mips64-cross libc6-mips64-mips-cross libc6-mips64-mipsel-cross libc6-mips64el-cross \
# 	libc6-mipsel-cross libc6-mipsn32-mips-cross libc6-mipsn32-mips64-cross libc6-mipsn32-mips64el-cross libc6-mipsn32-mipsel-cross

# sudo apt-get install gcc-mipsel-linux-gnu g++-mipsel-linux-gnu \
#     gcc-mips-linux-gnu g++-mips-linux-gnu \
#     gcc-mips64el-linux-gnuabi64 g++-mips64el-linux-gnuabi64 \
#     gcc-mips64-linux-gnuabi64 g++-mips64-linux-gnuabi64 \
#     gcc-arm-linux-gnueabi g++-arm-linux-gnueabi libc6-dbg-armel-cross \
#     gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf libc6-dbg-armhf-cross \
#     gcc-aarch64-linux-gnu g++-aarch64-linux-gnu libc6-dbg-arm64-cross \
#     gcc-hppa-linux-gnu g++-hppa-linux-gnu libc6-dbg-hppa-cross \
#     gcc-hppa64-linux-gnu \
#     gcc-m68k-linux-gnu g++-m68k-linux-gnu libc6-dbg-m68k-cross \
#     gcc-powerpc-linux-gnu g++-powerpc-linux-gnu libc6-dbg-powerpc-cross \
#     gcc-powerpc64-linux-gnu g++-powerpc64-linux-gnu libc6-dbg-ppc64-cross \
#     gcc-powerpc64le-linux-gnu g++-powerpc64le-linux-gnu libc6-dbg-ppc64el-cross \
#     gcc-s390x-linux-gnu g++-s390x-linux-gnu libc6-dbg-s390x-cross \
#     gcc-sh4-linux-gnu g++-sh4-linux-gnu libc6-dbg-sh4-cross \
#     gcc-sparc64-linux-gnu g++-sparc64-linux-gnu libc6-dbg-sparc64-cross \
#     gcc-alpha-linux-gnu g++-alpha-linux-gnu libc6.1-dbg-alpha-cross \
#     gcc-x86-64-linux-gnux32 g++-x86-64-linux-gnux32 libc6-dbg-x32-cross \
#     gcc-i686-linux-gnu gcc-i686-linux-gnu libc6-dbg-i386-cross \
#     gcc-riscv64-linux-gnu g++-riscv64-linux-gnu libc6-dbg-riscv64-cross 
		

# 运行32位程序
sudo apt install gcc-multilib
#iot pwntools shellcode binutils
sudo apt-get install binutils-mipsel-linux-gnu  binutils-mips-linux-gnu binutils-arm-linux-gnueabi
#gcc
sudo apt-get install  gcc-arm-linux-gnueabi gcc-mips-linux-gnu

# https://ithelp.ithome.com.tw/questions/10200138
# docker: unrecognized service 錯誤
if test -z "$(uname -a|grep WSL)" ;then

	shopt -s expand_aliases # Enable (set) opt_name.
	source /etc/profile.d/proxy.sh
	proxy
	
	curl -fsSL https://get.docker.com -o get-docker.sh
	sudo sh get-docker.sh
	sudo service docker start
	rm ./get-docker.sh
else
	sudo apt install docker
fi
#docker换源
