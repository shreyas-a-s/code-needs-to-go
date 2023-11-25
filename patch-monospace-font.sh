#!/bin/sh

mkdir FontPatcher && cd FontPatcher || exit 1

sudo apt-get install -y wget unzip fontforge python3-fontforge

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip

unzip FontPatcher.zip

fontname="$(fc-match monospace | awk -F ':' '{print $1}')"
fontpath="$(fc-list | grep "$fontname" | awk -F ':' '{print $1}')"

./fontpatcher -c "$fontpath"

mkdir -p ~/.local/share/fonts/custom
cp *.ttf *.otf ~/.local/share/fonts/custom/

fc-cache

cd .. && rm -r FontPatcher

sudo apt purge -y fontforge python3-fontforge && sudo apt autoremove -y

