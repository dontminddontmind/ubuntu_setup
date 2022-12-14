#!/bin/bash

#安装
sudo apt install python3 python3-dev python3-pip python2 python2-dev
#安装 python2的pip  <https://www.cnblogs.com/mrlonely2018/p/15137143.html> 
curl -o get-pip.py https://bootstrap.pypa.io/pip/2.7/get-pip.py
sudo python2 get-pip.py
rm ./get-pip.py

# 让pip用代理
# shell不能识别alias https://blog.csdn.net/qq_33709508/article/details/101822329
shopt -s expand_aliases # Enable (set) opt_name.
source /etc/profile.d/proxy.sh
unproxy
pip2 install pysocks
pip3 install pysocks
proxy

#pip2还要安装这个  <https://blog.csdn.net/weixin_33728708/article/details/94506756> 
pip2 install --upgrade pip setuptools

#添加版本 数字最高的最高优先级
sudo rm /usr/bin/python
sudo update-alternatives  --install /usr/bin/python python /usr/bin/python2 1
sudo update-alternatives  --install /usr/bin/python python /usr/bin/python3 2

sudo rm /usr/local/bin/pip 
sudo update-alternatives  --install /usr/local/bin/pip pip /usr/local/bin/pip2 1
sudo update-alternatives  --install /usr/local/bin/pip pip /usr/bin/pip3 2
#sudo update-alternatives  --install /usr/local/bin/pip pip /usr/local/lib/python3.8/dist-packages/pip 3

#切换Python版本
#sudo update-alternatives --config python

#virtualenvwrapper
pip install virtualenv
pip install virtualenvwrapper
sudo cp ./etc/profile.d/virtualenvwrapper.sh /etc/profile.d/virtualenvwrapper.sh
