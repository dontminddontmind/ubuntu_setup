#!/bin/bash
curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep browser_download_url | grep nvim-linux64.deb |cut -d'"' -f4 | xargs wget
sudo apt install ./nvim-linux64.deb
git clone https://github.com/dontminddontmind/nvim_config.git ~/.config/nvim
rm nvim-linux64.deb*
