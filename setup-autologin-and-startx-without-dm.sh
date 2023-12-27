#!/bin/sh

if [ -f /etc/inittab ]; then # For non-systemd distros
  # Enable autologin
  sudo cp /etc/inittab /etc/inittab.bak
  sed -i '/1:2345/s/^/#/' /etc/inittab
  sed -i "/1:2345/a\1:2345:respawn:/bin/login -f $USER tty1 </dev/tty1 >/dev/tty1 2>&1" /etc/inittab

  # Enable automatic startx
  printf "\
  \nif [ -z "\$DISPLAY" ] && [ \$(tty) == /dev/tty1 ]; then\
  \n  startx\
  \nfi" >> ~/.bash_profile
fi
