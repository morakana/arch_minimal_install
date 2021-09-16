#!/usr/bin/bash
clear
keymap=`sed -n 1P ./config`
tz=`sed -n 2P ./config`
hostname=`sed -n 3P ./config`
rootpassword=`sed -n 4P ./config`
swapfilesize=`sed -n 5P ./config`
echo ""
echo "set time zone to $tz"
ln -sf /usr/share/zoneinfo/$tz /etc/localtime
echo ""
echo "set keybord map to $keymap"
echo "KEYMAP=$keymap" > /etc/vconsole.conf
echo ""
echo "set hostname"
echo "$hostname" > /etc/hostname
echo ""
echo "grub installing"
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg
sed -i -e 's/timeout=5/timeout=2/g' /boot/grub/grub.cfg
echo ""
echo "set root password"
echo -e $rootpassword'\n'$rootpassword | passwd root
echo ""
echo "make swap file"
fallocate -l $swapfilesize /swapfile
chmod 600 /swapfile
mkswap /swapfile
echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
echo ""
echo "pkgfile --update"
pkgfile --update
echo ""
echo "remove config phase03.sh"
rm ./config
rm ./phase03.sh
echo ""
echo ""
echo "installation is almost complete"
echo "please do the following post-processing"
echo ""
echo "exit chroot"
echo "remove the installation media and reboot"
echo "systemctl enable NetworkManager"
echo "reboot"
echo ""
echo ""
echo "bye."
echo ""
