#!/bin/bash

#curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep browser_download_url | grep nvim-linux64.deb |cut -d'"' -f4 | xargs wget
wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb
rm nvim-linux64.deb*

#git clone https://github.com/dontminddontmind/nvim_config.git ~/.config/nvim
git clone https://github.com/LunarVim/nvim-basic-ide.git ~/.config/nvim

sudo apt install lua5.4 xsel wl-clipboard npm
pip install pynvim
sudo npm i -g neovim
sudo apt install ripgrep

