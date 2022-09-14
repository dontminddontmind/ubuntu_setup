#!/bin/bash

# 安装 zsh
sudo apt install zsh

# 安装 oh-my-zsh
if [ ! -d "~/.oh-my-zsh" ]; then
	sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	echo "已经有ohmyzsh了"
	exit 0
fi

#复制配置文件
cp ./.zshrc ./.p10k.zsh ~/

# 设置为默认 Shell
chsh -s /bin/zsh

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

#安装powerlevel10k主题
git clone https://hub.fastgit.org/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
#git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

#安装插件
#根据 shell 中输入命令的历史记录，为当前输入的命令提供自动补全提示
git clone https://hub.fastgit.org/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
#git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
#为 shell 命令进行语法高亮显示。
git clone https://hub.fastgit.org/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
#git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

