#!/bin/bash
#按照顺序依次执行setup文件
#复制我的配置
cp ./.bashrc ./.zshrc ./.p10k.zsh ~/ 
mkdir ~/.config
mkdir ~/.config/lvim
cp ./.config/lvim/* ~/.config/lvim/  
# 编辑etc/profile.d/proxy.sh文件，把代理地址、协议和端口改成你的
#配置网络，apt镜像源，代理
./01-setup_net.sh 
#重启以让网络配置生效，wsl不用重启，新开个terminal即可
exec bash -l ./setup_after_proxy.sh
