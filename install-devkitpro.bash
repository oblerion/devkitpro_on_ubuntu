#! /bin/bash
# script ver b0.1
echo ----------------------------
echo fast install devkitpro BEGIN
echo ----------------------------
# version devkitpro
version="v1.0.2" 
c=3
c2=10
c3=1
if [ -d "/opt/devkitpro" ];then
    echo ">> devkitpro is installed"
else
    while [ $c != 1 ] && [ $c != 2 ];do
        echo ">> you use 1)amd64 or 2)arm64 arch"
        read c
    done
    if [ $c -eq 1 ];then 
        wget https://github.com/devkitPro/pacman/releases/download/$version/devkitpro-pacman.amd64.deb;
        sudo dpkg -i devkitpro-pacman.amd64.deb;
    fi
    if [ $c -eq 2 ];then
        wget https://github.com/devkitPro/pacman/releases/download/$version/devkitpro-pacman.arm64.deb;
        sudo dpkg -i devkitpro-pacman.arm64.deb
    fi
fi
while [ $c3 != 0];do
    while [[ $c2 -lt 0 || $c2 -gt 8 ]];do
        echo ">> what dev do you want?"
        echo "put 0 to exit"
        echo "1)gba"
        echo "2)nds/ndsi"
        echo "3)3ds"
        echo "4)gamecube"
        echo "5)wii"
        echo "6)wiiu"
        echo "7)switch"
        echo "8)gp32"
        read c2
    done
    if [ $c2 -gt 0 ] && [ $c2 -lt 9 ];then 
        echo ">> just press enter for install";
        if [ ! DEVKITPRO ] then export DEVKITPRO=/opt/devkitpro fi
        if [ ! DEVKITARM ] then export DEVKITARM=/opt/devkitpro/devkitARM fi
    fi
    if [ $c2 -eq 1 ];then
        sudo dkp-pacman -S gba-dev
        echo for examples look at /opt/devkitpro/examples/gba
    fi
    if [ $c2 -eq 2 ];then
        sudo dkp-pacman -S nds-dev
        echo for examples look at /opt/devkitpro/examples/nds  
    fi
    if [ $c2 -eq 3 ];then
        sudo dkp-pacman -S 3ds-dev
        echo for examples look at /opt/devkitpro/examples/3ds
    fi
    if [ $c2 -eq 4 ];then
        sudo dkp-pacman -S gamecube-dev
        echo for examples look at /opt/devkitpro/examples/gamecube
    fi
    if [ $c2 -eq 5 ];then
        sudo dkp-pacman -S wii-dev
        echo for examples look at /opt/devkitpro/examples/wii
    fi
    if [ $c2 -eq 6 ];then
        sudo dkp-pacman -S wiiu-dev
        echo for examples look at /opt/devkitpro/examples/wiiu
    fi
    if [ $c2 -eq 7 ];then
        sudo dkp-pacman -S switch-dev
        echo for examples look at /opt/devkitpro/examples/switch
    fi
    if [ $c2 -eq 8 ];then
        sudo dkp-pacman -S gp32-dev
        echo for examples look at /opt/devkitpro/examples/gp32
    fi
    if [ -d "/opt/devkitpro" ] && [ DEVKITPRO ] && [ DEVKITARM ];then
        echo install success
    fi
    echo do you want install other dev? 1 yes / 0 no 
    read c3
done
echo ---------------------------
echo fast install devkitpro END
echo ---------------------------
