#!/usr/bin/bash
function ShowHelp(){
	echo "1. edit and format the partition"
	echo "2. mount partition /mnt /mnt/boot"
	echo "when finished, proceed to Phase 2."
	echo ""
	echo ""
	echo "command examples."
	echo ""
	echo "lsblk"
	echo "gdisk -l /dev/sda"
	echo "mkfs.fat -F32 /dev/sda1"
	echo "mkfs.ext4 /dev/sda2"
	echo "mount /dev/sda2 /mnt"
	echo "mkdir /mnt/boot"
	echo "mount /dev/sda1 /mnt/boot"
	return 0
}
if [ "$1" = "help" ]
then
	echo ""
	echo ""
	ShowHelp
	echo ""
	exit 0
fi
clear
echo ""
echo "set NTP"
timedatectl set-ntp true
echo ""
echo "check UEFI Mode"
ls /sys/firmware/efi/efivars
echo ""
ShowHelp
echo ""
echo "if you want to see this examples again -> ./phase01.sh help"
echo ""
echo ""

