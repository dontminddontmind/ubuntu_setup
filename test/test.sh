#!/bin/bash
echo "source ~/ubuntu_setup/test/sourcetest" >> ~/.bashrc
source ~/.bashrc
shopt -s expand_aliases # Enable (set) opt_name.
hello
exec bash -l ./testsource.sh
