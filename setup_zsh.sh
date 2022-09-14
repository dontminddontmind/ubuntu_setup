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
cp ./.bashrc ./.zshrc ./.p10k.zsh ~/

# 设置为默认 Shell
chsh -s /bin/zsh


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

