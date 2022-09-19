#!/bin/bash

#打开代理
shopt -s expand_aliases # Enable (set) opt_name.
source /etc/profile.d/proxy.sh
proxy
#安装zsh和lvim会用到的字体，wsl不用安
./02-setup_font.sh 
#安装python2和python3环境，用update-alternatives切换版本
./03-setup_python.sh 
#关闭terminal再打开，初始化virtualenv环境
#配置ohmyzsh，会自动打开zsh，输入exit退出以继续安装，重启后zsh会变成默认shell
./04-setup_zsh.sh 
#安装lunarvim，全部yes
./04-setup_lvim.sh 
#lvim 进入后输入<space>+L+c 重写一下配置文件，会自动下载插件
#配置pwn工具
./05-setup_pwn.sh 
#复制我写的一些pwn脚本到bin里
chmod 777 ./bin/*
cp ./bin/* ~/.local/bin/
#让root也用上zsh（慎用，很多地址没有改成root的）
#./06-setup_root_zsh.sh 
echo '重启电脑让配置生效（WSL不用重启）'