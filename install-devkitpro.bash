#! /bin/bash
# script ver b0.4
echo ----------------------------
echo fast install devkitpro BEGIN
echo ----------------------------
# make with https://devkitpro.org/wiki/devkitPro_pacman
c=3
c2=10
c3=1
arch="$(uname -i)"
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM 
export DEVKITPPC=/opt/devkitpro/devkitPPC 

if ! [ "$(id -u)" = 0 ]; then
  echo "Need root privilege to install!"
  exit 1
fi
if [ -d "/opt/devkitpro" ];then
    	echo ">> devkitpro is installed"
else
	# ensure apt is set up to work with https sources
	apt-get install apt-transport-https

	# Store devkitPro gpg key locally if we don't have it already
	if ! [ -f /usr/local/share/keyring/devkitpro-pub.gpg ]; then
	  mkdir -p /usr/local/share/keyring/
	  wget -O /usr/local/share/keyring/devkitpro-pub.gpg https://apt.devkitpro.org/devkitpro-pub.gpg
	fi

	# Add the devkitPro apt repository if we don't have it set up already
	if ! [ -f /etc/apt/sources.list.d/devkitpro.list ]; then
	  echo "deb [signed-by=/usr/local/share/keyring/devkitpro-pub.gpg] https://apt.devkitpro.org stable main" > /etc/apt/sources.list.d/devkitpro.list
	fi

	# Finally install devkitPro pacman
	apt-get update
	apt-get install devkitpro-pacman
	echo ">> devkitpro-pacman installed"
	#cd /opt/devkitpro/pacman/bin
	sudo pacman-key --recv BC26F752D25B92CE272E0F44F7FD5492264BB9D0 --keyserver keyserver.ubuntu.com
  	sudo pacman-key --lsign BC26F752D25B92CE272E0F44F7FD5492264BB9D0
  	
  	wget https://pkg.devkitpro.org/devkitpro-keyring.pkg.tar.xz
  	
  	sudo pacman -U devkitpro-keyring.pkg.tar.xz
  	echo ">> keys installed"

	echo "[dkp-libs]" >>  /etc/pacman.conf
	echo "Server = https://pkg.devkitpro.org/packages" >> /etc/pacman.conf
	echo "[dpk-linux]" >> /etc/pacman.conf
	echo "Server = https://pkg.devkitpro.org/packages/linux/$arch/" >> /etc/pacman.conf
	
	sudo pacman -Syu
	
fi
while [ $c3 != 0 ];do
    while [[ $c2 -lt 0 || $c2 -gt 9 ]];do
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
        echo "9)gp2x"
        read -r c2
    done
    if [ "$c2" -gt 0 ] && [ "$c2" -lt 10 ];then 
        echo ">> just press enter for install";
    fi
    if [ "$c2" -eq 1 ];then
        sudo dkp-pacman -S gba-dev
        echo ">> for examples look at /opt/devkitpro/examples/gba"
    fi
    if [ "$c2" -eq 2 ];then
        sudo dkp-pacman -S nds-dev
        echo ">> for examples look at /opt/devkitpro/examples/nds"  
    fi
    if [ "$c2" -eq 3 ];then
        sudo dkp-pacman -S 3ds-dev
        echo ">> for examples look at /opt/devkitpro/examples/3ds"
    fi
    if [ "$c2" -eq 4 ];then
        sudo dkp-pacman -S gamecube-dev
        echo ">> for examples look at /opt/devkitpro/examples/gamecube"
    fi
    if [ "$c2" -eq 5 ];then
        sudo dkp-pacman -S wii-dev
        echo ">> for examples look at /opt/devkitpro/examples/wii"
    fi
    if [ "$c2" -eq 6 ];then
        sudo dkp-pacman -S wiiu-dev
        echo ">> for examples look at /opt/devkitpro/examples/wiiu"
    fi
    if [ "$c2" -eq 7 ];then
        sudo dkp-pacman -S switch-dev
        echo ">> for examples look at /opt/devkitpro/examples/switch"
    fi
    if [ "$c2" -eq 8 ];then
        sudo dkp-pacman -S gp32-dev
        echo ">> for examples look at /opt/devkitpro/examples/gp32"
    fi
    if [ "$c2" -eq 9 ];then
        sudo dkp-pacman -S gp2x-dev
        echo ">> for examples look at /opt/devkitpro/examples/gp2x"
    fi
    if [ -d "/opt/devkitpro" ] && [ $DEVKITPRO ] && [ $DEVKITARM ];then
        echo ">> install success"
    fi
    echo ">> do you want install other dev? 1 yes / 0 no" 
    read -r c3
done
echo "---------------------------"
echo "fast install devkitpro END"
echo "---------------------------"
