#!/bin/bash

if test ! -z "$(uname -a|grep WSL)" ;then
  echo "wsl不用装"
else

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

  echo "可以运行getnf安装想要的字体"
  echo "字体安装完后，在terminal里右键preference里切换字体"
  echo 'Preferences-> Unnamed-> Text -> Check Custom font -> 换成Meslo'

  #caps转esc，字体大小
  echo "安装gnome-tweaks工具，可以调整字体大小，映射caps到esc键"
  sudo add-apt-repository universe
  sudo apt install gnome-tweaks
  echo "将capslock映射到esc :"
  echo "在“Keyboard & Mouse”设置中，点击“Additional Layout Options”；在“Caps Lock behavior”列表中选择“Caps Lock an additionnal Esc”。"
  echo "更改字体大小:"
  echo "Fonts -> Scaling Factor"
  gnome-tweaks

  #pinyin
  # sudo apt install language-pack-zh-hans
  # sudo apt install ibus
  # im-config -s ibus
  # sudo apt install ibus-gtk ibus-gtk3 ibus-qt4 ibus-clutter ibus-el
  # sudo apt install ibus-pinyin
  # echo "ubt22: Settings -> Region & Language -> Manage installed Language"
  # echo "ubt22: Settings -> keyboard -> input sources "
fi


