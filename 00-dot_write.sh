#!/bin/bash

#复制配置文件
sed -i '/ctf-tools/d'   .bashrc
echo "# ctf-tools: PATH setup" >>.bashrc
echo "export PATH=/home/${USER}/tools/ctf-tools/bin:\$PATH" >>.bashrc
sed -i '/ctf-tools/d'   .zshrc
echo "# ctf-tools: PATH setup" >>.zshrc
echo "export PATH=/home/${USER}/tools/ctf-tools/bin:\$PATH" >>.zshrc
cp ./.bashrc ./.zshrc ./.p10k.zsh ~/

		
