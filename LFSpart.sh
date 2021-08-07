#!/bin/bash

export LFS=/mnt/lfs

function pause() {
read -p "$*"
}




apt install gcc g++ binutils gawk m4 bison make texinfo


ln -s bash /bin/sh.bash
mv /bin/sh.bash /bin/sh



echo ""
read -p "Enter drive name (example: sda1) for root partition:  " rootPart
echo ""
read -p "Enter drive name (example: sda2) for swap partition:  " swapPart



# To create an ext4file system on the LFS partition, run the following:
mkfs -v -t ext4 /dev/$rootPart




# If a new swappartition was created, it will need to be initialized with this command:
mkswap /dev/$swapPart




# Create the mount point and mount the LFS file system by running:
mkdir -pv $LFS
mount -v -t ext4 /dev/$rootPart $LFS




# If you are using a swap partition, ensure that it is enabled using the  swapon command:
/sbin/swapon -v /dev/$swapPart



#----------------------------------------------
# 4.4. Setting Up the Environment
# ... we do there here instead of later for convenience.

[ ! -e /etc/bash.bashrc ] || mv -v /etc/bash.bashrc /etc/bash.bashrc.NOUSE






