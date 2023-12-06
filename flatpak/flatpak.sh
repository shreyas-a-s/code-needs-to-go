#!/bin/sh

# Install flatpak
sudo apt-get -y install flatpak
dpkg-query -l | grep gnome-software > /dev/null && sudo apt-get -y install gnome-software-plugin-flatpak
while ! flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo; do
  sleep 1
done

# Change directory
SCRIPT_DIR=$(dirname -- "$( readlink -f -- "$0"; )") && cd "$SCRIPT_DIR" || exit

# Specify the input file
inputfile="flatpak-applist.txt"

# Check if the file exists
if [ -e "$inputfile" ]; then
  xargs flatpak install -y flathub < "$inputfile"
else
  echo "File does not exist: $inputfile"
fi

echo 'XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"' >> ~/.config/user-dirs.dirs
xdg-user-dirs-update
