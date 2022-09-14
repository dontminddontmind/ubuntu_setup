#!/bin/bash

sudo cp ./etc/profile.d/proxy.sh /etc/profile.d/

#判断发行版本
ubtver=$(lsb_release -a | grep Codename | awk '{print $2}')

sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
if [ "${ubtver}" == "jammy" ]
then
sudo cp ./etc/apt/sources.list.d/ubt22* /etc/apt/sources.list.d/
fi

if [ "${ubtver}" == "focal" ]
then
sudo cp ./etc/apt/sources.list.d/ubt20* /etc/apt/sources.list.d/
fi

sudo cp ./etc/apt/sources.list.d/kernel.list /etc/apt/sources.list.d/
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40976EAF437D05B5

sudo apt-get update
sudo apt-get upgrade

#wsl
if test ! -z $(uname -a|grep wsl);then
	echo "[network]\ngenerateResolvConf = false" > /etc/wsl.conf
	sudo rm /etc/resolv.conf
	echo "nameserver 8.8.8.8" >> /etc/resolv.conf
fi
