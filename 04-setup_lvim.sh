#!/bin/bash

curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep browser_download_url | grep nvim-linux64.deb |cut -d'"' -f4 | xargs wget
# sudo apt install ./nvim-linux64.deb
sudo dpkg -i ./nvim-linux64.deb
rm nvim-linux64.deb*

sudo apt install cargo
#bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
#TEST
shopt -s expand_aliases # Enable (set) opt_name.
source /etc/profile.d/proxy.sh
proxy
wget https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh
chmod 777 ./install.sh
./install.sh -y
rm ./install.sh

#wsl https://www.lunarvim.org/01-installing.html#tips-for-wsl-2-users
# if test  ! -z "$(uname -a|grep WSL)" ;then
#         #sudo echo权限不够
#         #https://www.shellhacks.com/sudo-echo-to-file-permission-denied/
#         if sudo [ ! -f /etc/wsl.conf ]
#         then
#                 sudo touch /etc/wsl.conf
#         fi
#         if sudo test -z "$(cat /etc/wsl.conf|grep '# lunarvim')" ;then
#                 echo -e "\n\
# # lunarvim\n\
# [automount]\n\
# # Set to true will automount fixed drives (C:/ or D:/) with DrvFs under the root directory set above. Set to false means drives won't be mounted automatically, but need to be mounted manually or with fstab.\n\
# enabled = false\n\
# \n\
# # Sets the \`/etc/fstab\` file to be processed when a WSL distribution is launched.\n\
# mountFsTab = false\n\
# \n\
# # Set whether WSL supports interop process like launching Windows apps and adding path variables. Setting these to false will block the launch of Windows processes and block adding \$PATH environment variables.\n\
# [interop]\n\
# enabled = false\n\
# appendWindowsPath = false\n\
#     " | sudo tee --append /etc/wsl.conf
#         fi

# fi

#TODO update
