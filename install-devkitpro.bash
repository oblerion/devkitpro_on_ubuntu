#! /bin/bash
# script ver b0.1
echo ---------------------------
echo fast install devkitpro
echo ---------------------------
version="v1.0.2" 
c=3
c2=0
if [ -d "/opt/devkitpro" ] then;
    echo devkitpro is installed
else
while [$c != 1 ] && [$c != 2] && [$c != 0];do
    echo you use 1)amd64 or 2)arm64 arch
    read c
done;
if [$c == 1];then 
    wget https://github.com/devkitPro/pacman/releases/download/$version/devkitpro-pacman.amd64.deb;
    sudo dpkg -i devkitpro-pacman.amd64.deb;
fi;
if [$c == 2];then
    wget https://github.com/devkitPro/pacman/releases/download/$version/devkitpro-pacman.arm64.deb;
    sudo dpkg -i devkitpro-pacman.arm64.deb
fi;
fi;
while [$c2 != 1] && [$c2 != 2] && [$c2 != 0];do
    echo wath dev do you want?
    echo put 0 to exit
    echo 1)gba
    echo 2)nds/ndsi
    read c2
done
if [$c2 == 1];then
    sudo dkp-pacman -S gba-dev
    echo for exemples look at /opt/devkitpro/examples/gba
fi
if [$c2 == 2];then
    sudo dkp-pacman -S nds-dev
    echo for exemples look at /opt/devkitpro/examples/nds
fi

