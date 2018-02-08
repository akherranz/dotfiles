#!/bin/bash



mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3
mkswap /dev/sda2
swapon /dev/sda2

mount /dev/sda1 /mnt
mkdir /mnt/hom
mount /dev/sda3 /mnt/home


pacstrap /mnt base base-devel

genfstab -U /mnt >> /mnt/etc/fstab

pacman -Sy --noconfirm --needed
pacman -S reflector --noconfirm --needed
reflector --verbose -l 5 --sort rate /etc/pacman.d/mirrorlist

pacstrap -i --noconfirm --needed /mnt base base-devel


 genfstab -U -p /mnt >> /mnt/etc/fstab
 cat /mnt/etc/fstab
 arch-chroot /mnt

 ln -s /usr/share/zoneinfo/America/Los Angeles > /etc/localtime

 hwclock --systohc --utc

echo Neovim > /etc/hostname


mkinitcpio -p linux
 pacman -S grub os-prober
 grub-install /dev/sda
 grub-mkconfig -o /boot/grub/grub.cfg

 

