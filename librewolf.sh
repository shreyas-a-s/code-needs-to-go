#!/bin/sh

# Install for debian-based distros
if command -v apt-get > /dev/null; then
  sudo apt-get update
  sudo apt-get -y install wget gnupg lsb-release apt-transport-https ca-certificates
  distro=$(if echo " una bookworm vanessa focal jammy bullseye vera uma " | grep -q " $(lsb_release -sc) "; then echo $(lsb_release -sc); else echo focal; fi)
  wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg
  echo "Types: deb\
  \nURIs: https://deb.librewolf.net\
  \nSuites: $distro\
  \nComponents: main\
  \nArchitectures: amd64\
  \nSigned-By: /usr/share/keyrings/librewolf.gpg" | sudo tee /etc/apt/sources.list.d/librewolf.sources > /dev/null
  # To set third-party repositories to have least priority
  echo 'Package: *\
  \nPin: origin deb.librewolf.net\
  \nPin-Priority: 100' | sudo tee /etc/apt/preferences.d/librewolf.pref > /dev/null
  sudo apt-get update
  sudo apt-get -y install librewolf
fi
