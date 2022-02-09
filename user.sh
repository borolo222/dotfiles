#!/bin/bash

# Appearance pacakges

#Ms-fonts
sudo apt install ttf-mscorefonts-installer

# Layan Cursors
mkdir -p "$HOME"/build
cd "$HOME/build" || exit
git clone https://github.com/vinceliuice/Layan-cursors
cd Layan-cursors || exit
sudo ./install.sh
