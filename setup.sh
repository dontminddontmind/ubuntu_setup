#!/bin/bash

./00-dot_write.sh
echo "配置网络：代理、apt换源..."
./00-setup_net.sh
echo "安装python，virtualenvwrapper，版本切换..."
./01-setup_python.sh
echo "安装配置字体、caps换成esc..."
./02-setup_font.sh
echo "安装zsh, oh-my-zsh, powerlevel10k..."
./03-setup_zsh.sh
echo "安装lvim..."
./04-setup_lvim.sh
echo "安装ctf工具..."
./05-setup_ctf.sh

cp ./bin/* ~/.local/bin/

