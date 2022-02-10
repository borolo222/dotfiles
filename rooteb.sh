#!/bin/bash

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp build/sources.list /etc/apt/sources.list 

# Update packages list
apt update

username=$(id -u -n 1000)
builddir=$(pwd)

# move to /etc/apt and run netselect
#cd /etc/apt
#netselect-apt sid -c US
cd builddir || exit

# Add base packages
apt install unzip picom bspwm polybar sddm rofi terminator thunar flameshot neofetch sxhkd git lxpolkit lxappearance xorg arandr netselect-apt qt5ct -y
apt install libqt5svg5 qml-module-qtquick-controls papirus-icon-theme feh -y
apt install pavucontrol psmisc gucharmap dunst yad libnotify-bin playerctl fonts-firacode -y
apt install qemu-guest-agent apt-transport-https curl colortest nfs-common -y
apt install neovim cifs-utils kcharselect htop wmctrl graphicsmagick virt-manager lm-sensors -y

#Install I3lock and dependencies
apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev -y

# Download i3lock-color
git clone https://github.com/Raymo111/i3lock-color.git
# remember to build it.
#cd i3lock-color
#./install-i3lock-color.sh


# Download Nordic Theme
cd /usr/share/themes/ || exit
git clone https://github.com/EliverLara/Nordic.git

# Fira Code Nerd Font variant needed and Noto Symbols
cd "$builddir" || exit

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d /usr/share/fonts

wget "https://fonts.google.com/download?family=Noto%20Sans%20Symbols%202" -O NotoSansSymbols2.zip
unzip -o NotoSansSymbols2.zip -d /usr/share/fonts

wget "https://fonts.google.com/download?family=Noto%20Sans%20Symbols" -O NotoSansSymbols.zip
unzip -o NotoSansSymbols.zip -d /usr/share/fonts

#wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/Meslo.zip
#unzip Meslo.zip -d /usr/share/fonts
fc-cache -vf

#Install Starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"


# install brave
apt install apt-transport-https curl -y
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install brave-browser -y


# install Vscodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
apt update
apt install codium -y


# Copy config files

cd "$builddir" || exit
mkdir -p /home/"$username"/.config
mkdir -p /home/"$username"/.local

#cp .Xresources /home/$username
#cp .Xnord /home/$username
cp .bashrc /home/"$username"
cp .profile /home/"$username"
cp .fehbg /home/"$username"
cp .dir_colors /home/"$username"
cp .fonts.conf /home/"$username"
cp build/environment /etc/environment

cp -R .config/* /home/"$username"/.config/
cp -R .local/* /home/"$username"/.local/
chown -R "$username":"$username" /home/"$username"


### Additional steps for VMS
## Polybar
# - Change the monitor
# - Remove module fan-speed
# - Change the ETHO name

## Resolution
# run arandr
# Select resolution and save as def.sh
# Insert at end of .profile file:
# bash ~/.screenlayout/def.sh

## Pycom
# change vsync to false
