# Bash Line Editor by @akinomyoga on github
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
printf '\n\n#Bash Line Editor by @akinomyoga on github\nsource ~/.local/share/blesh/ble.sh' >> ~/.bashrc

