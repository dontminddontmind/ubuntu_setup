#!/bin/bash

#安装字体
sudo apt install fonts-powerline

wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Meslo/M/Regular/complete/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
sudo mkdir -p /usr/share/fonts/custom
sudo mv Meslo\ LG\ M\ Regular\ Nerd\ Font\ Complete\ Mono.ttf /usr/share/fonts/custom
sudo chmod 744 /usr/share/fonts/custom/Meslo\ LG\ M\ Regular\ Nerd\ Font\ Complete\ Mono.ttf 
cd /usr/share/fonts/custom/
sudo mkfontscale
sudo mkfontdir
sudo fc-cache -fv

sudo apt install curl unzip fzf fontconfig
git clone https://github.com/ronniedroid/getnf.git ~/tools/getnf
cd ~/tools/getnf
./install.sh

getnf
echo 'Edit->Preferences-> Unnamed-> Text -> Check Custom font'
