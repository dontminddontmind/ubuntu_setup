#!/bin/bash

if sudo [ -e /root/.zshrc ] 
then
  echo "root link exist"
else
  sudo ln -s /home/$USER/.zshrc        /root/.zshrc
  sudo ln -s /home/$USER/.oh-my-zsh    /root/.oh-my-zsh
  # sudo ln -s /home/$USER/.bashrc        /root/.bashrc
  sudo ln -s /home/$USER/.p10k.zsh     /root/.p10k.zsh
fi