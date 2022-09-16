#!/bin/bash

curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep browser_download_url | grep nvim-linux64.deb |cut -d'"' -f4 | xargs wget
sudo apt install ./nvim-linux64.deb
rm nvim-linux64.deb*

sudo apt install cargo
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

#TODO update
