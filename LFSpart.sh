#!/bin/bash

# my fav pause function:
function pause() {
read -p "$*"
}

# prompt user to creat the partitions manually.
read -p "sudo gdisk /dev/sda"

#----------------------------------------------
# LFS on Ubuntu needs /bin/sh to point to bash:
ln -s bash /bin/sh.bash
mv /bin/sh.bash /bin/sh

# ubuntu needs theses installed:
apt install gcc g++ binutils gawk m4 bison make texinfo -y

#----------------------------------------------
# 2.4 Creating a New Partition
# the user must input which partitions are root and swap:
echo ""
read -p "Enter drive name (example: sda1) for root partition:  " rootPart
echo ""
read -p "Enter drive name (example: sda2) for swap partition:  " swapPart

#----------------------------------------------
# 2.5 Creating a File System on the Partition:
# To create an ext4file system on the LFS partition, run the following:
mkfs -v -t ext4 /dev/$rootPart
# If a new swap partition was created, it will need to be initialized with this command:
mkswap /dev/$swapPart

#----------------------------------------------
# 2.6 Setting The $LFS Variable
export LFS=/mnt/lfs

#----------------------------------------------
# 2.7 Mounting the New Partition
# If you are using a swap partition, ensure that it is enabled using the  swapon command:
# Create the mount point and mount the LFS file system by running:
mkdir -pv $LFS
mount -v -t ext4 /dev/$rootPart $LFS
# turn on swap
/sbin/swapon -v /dev/$swapPart

#----------------------------------------------
# 4.4 Setting Up the Environment Variable:
# this is in the book but does not work unless here:
[ ! -e /etc/bash.bashrc ] || mv -v /etc/bash.bashrc /etc/bash.bashrc.NOUSE

#----------------------------------------------
# prompt user what next step is:
echo "Next ... run this ... sudo ./LFS-10.1_step-1.sh"
