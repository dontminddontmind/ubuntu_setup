#!/bin/bash

#复制配置文件
sed -i '/ctf-tools/d'   .bashrc
echo "# ctf-tools: PATH setup\nexport PATH=/home/${USER}/tools/ctf-tools/bin:\$PATH" >>.bashrc
sed -i '/ctf-tools/d'   .zshrc
echo "# ctf-tools: PATH setup\nexport PATH=/home/${USER}/tools/ctf-tools/bin:\$PATH" >>.zshrc
cp ./.bashrc ./.zshrc ./.p10k.zsh ~/
cp -r ./.config/* ~/

#root
sudo ln -s /home/$USER/.oh-my-zsh    /root/.oh-my-zsh
sudo ln -s /home/$USER/.zshrc        /root/.zshrc
sudo ln -s /home/$USER/.bashrc        /root/.bashrc
sudo ln -s /home/$USER/.p10k.zsh     /root/.p10k.zsh
		
