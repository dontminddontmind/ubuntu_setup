#!/bin/bash

ubtver=$(lsb_release -a | grep Codename | awk '{print $2}')

if [ "${ubtver}" == "jammy" ]
then
  echo "jammy"
fi
if [ "${ubtver}" == "focal" ]
then
  echo "focal"
fi

if test ! -z $(uname -a|grep wsl);then
  echo "wsl"
else
  echo "vmware"
fi


if [ ! -d "./testdir" ]; then
	echo "dir null"
else
	echo "dir exist"
fi

if sudo [ -L "/root/.zshrc" ] 
then
  echo "link exist"
else
  echo "link null"
fi

if [ -L "./lnk.test" ] 
then
  echo "link exist"
else
  echo "link null"
fi

if [ -f "./x64.test" ]
then
  echo "file exist"
else
  echo "file null"
fi
