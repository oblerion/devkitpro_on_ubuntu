#! /bin/bash 
# version 0.1
if ! [ "$(id -u)" = 0 ]; then
  echo "Need root privilege to remove!"
  exit 1
fi
sudo apt-get remove devkitpro-pacman
sudo rm -r /opt/devkitpro
sudo rm -r /etc/apt/sources.list.d/devkitpro.list
#sudo rm /etc/profile.d/devkit-env.sh
