#!/bin/sh

_enter() {
  
  lsblk

  printf "Enter the root partition identifier (eg: sda1, sda2, etc.): " && read -r rootpartition
  
  sudo mount /dev/"$rootpartition" /mnt
  sudo mount --bind /dev /mnt/dev
  sudo mount --bind /dev/pts /mnt/dev/pts
  sudo mount --bind /proc /mnt/proc
  sudo mount --bind /sys /mnt/sys

  sudo chroot /mnt

}

_exit() {

  sudo umount /mnt/sys
  sudo umount /mnt/proc
  sudo umount /mnt/dev/pts
  sudo umount /mnt/dev
  sudo umount /mnt

}

[ "$1" = "--enter" ] && _enter

[ "$1" = "--exit" ] && _exit

