#!/bin/bash

#怎么更好的改username呀！
sed -i '/ctf-tools/d'   .bashrc
echo "# ctf-tools: PATH setup" >>.bashrc
echo "export PATH=/home/${USER}/tools/ctf-tools/bin:\$PATH" >>.bashrc
sed -i '/ctf-tools/d'   .zshrc
echo "# ctf-tools: PATH setup" >>.zshrc
echo "export PATH=/home/${USER}/tools/ctf-tools/bin:\$PATH" >>.zshrc
# sed -i '/virtualenvwrapper.sh/d'   ./etc/profile.d/virtualenvwrapper.sh
# echo "source /home/${USER}/.local/bin/virtualenvwrapper.sh" >> ./etc/profile.d/virtualenvwrapper.sh


		
