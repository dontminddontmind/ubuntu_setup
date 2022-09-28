#!/bin/bash

sudo cp ./etc/profile.d/proxy.sh /etc/profile.d/

#判断发行版本
ubtver=$(lsb_release -a | grep Codename | awk '{print $2}')

sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
# sudo touch /etc/apt/sources.list
if [ "${ubtver}" == "jammy" ]
then
sudo cp ./etc/apt/sources.list.d/ubt22* /etc/apt/sources.list.d/
fi

if [ "${ubtver}" == "focal" ]
then
sudo cp ./etc/apt/sources.list.d/ubt20* /etc/apt/sources.list.d/
fi

# wsl装了内核也调不了
if test -z "$(uname -a|grep WSL)" ;then
	sudo cp ./etc/apt/sources.list.d/kernel.list /etc/apt/sources.list.d/
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40976EAF437D05B5
fi

sudo apt-get update
sudo apt-get upgrade

#wsl
if test ! -z "$(uname -a|grep WSL)" ;then
	#sudo echo权限不够
	#https://www.shellhacks.com/sudo-echo-to-file-permission-denied/
	if sudo [ ! -f /etc/wsl.conf ]
	then
		sudo touch /etc/wsl.conf
	fi
	if test -z "$(cat /etc/wsl.conf|grep 'generateResolvConf = false')" ;then
		echo '[network]' | sudo tee --append /etc/wsl.conf
		echo 'generateResolvConf = false' | sudo tee --append /etc/wsl.conf
	fi
	sudo rm /etc/resolv.conf
	sudo echo 'nameserver 8.8.8.8' | sudo tee /etc/resolv.conf
else
	#TEST
	sudo echo '185.199.108.133     raw.githubusercontent.com' | sudo tee --append /etc/hosts
fi

sudo apt install curl 
# shell不能识别alias https://blog.csdn.net/qq_33709508/article/details/101822329
# source /etc/profile.d/proxy.sh
# proxy

sudo apt install npm
#npm换国内源
#npm config set registry https://registry.npm.taobao.org



