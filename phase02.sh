#!/usr/bin/bash
clear
install_tools=`sed -n 6P ./config`
echo "Install minimal system"
pacstrap /mnt base base-devel linux linux-firmware grub efibootmgr networkmanager pkgfile pacman-contrib vim $install_tools
echo ""
echo "generate fstab"
genfstab -U /mnt >> /mnt/etc/fstab
echo "copy config phase03.sh to /mnt/root"
cp ./config /mnt/root/config
cp ./phase03.sh /mnt/root/phase03.sh
echo ""
echo "phase02 finished"
echo ""
echo "root position changes from / to /mnt"
echo "and execute /root/phase03.sh"
echo ""
echo ""
arch-chroot /mnt
