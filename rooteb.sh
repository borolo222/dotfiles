#!/bin/bash

# Download netselect to choose best mirror.
apt install netselect-apt -y

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/sources.list 


username=$(id -u -n 1000)
builddir=$(pwd)

# Add Custom Titus Rofi Deb Package
#dpkg -i 'Custom Packages/rofi_1.7.0-1_amd64.deb'

# move to /etc/apt and run netselect
cd /etc/apt
netselect sid -c US
cd builddir

# Update packages list
apt update

# Add base packages
apt install unzip picom bspwm polybar sddm rofi terminator thunar flameshot neofetch sxhkd git lxpolkit lxappearance xorg -y
apt install libqt5svg5 qml-module-qtquick-controls papirus-icon-theme feh -y
apt install pavucontrol psmisc gucharmap dunst yad libnotify-bin -y
apt install qemu-guest-agent apt-transport-https curl colortest -y
apt install neovim cifs-utils kcharselect htop wmctrl graphicsmagick virt-manager lm-sensors -y

#apt install fonts-noto-color-emoji fonts-firacode fonts-font-awesome -y
#Install I3lock and dependencies
apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev



# Download Nordic Theme
cd /usr/share/themes/
git clone https://github.com/EliverLara/Nordic.git

# Fira Code Nerd Font variant needed
cd $builddir
#wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/FiraCode.zip
#unzip FiraCode.zip -d /usr/share/fonts
#wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/Meslo.zip
#unzip Meslo.zip -d /usr/share/fonts
#fc-cache -vf

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

cd $builddir
mkdir -p /home/$username/.config
mkdir -p /home/$username/.local

#cp .Xresources /home/$username
#cp .Xnord /home/$username
cp .bashrc /home/$username
cp .profile /home/$username
cp .fehhbg /home/$username
cp .dir_colors /home/$username
cp .fonts.conf /home/$username
source .bashrc

cp -R .config/* /home/$username/.config/
cp -R .local/* /home/$username/.local/
chown -R $username:$username /home/$username
