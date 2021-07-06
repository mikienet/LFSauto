#!/bin/bash



# my fav pause function:
function pause() {
read -p "Press any key to continue ..."
}









#----------------------------------------------
# 2.6 Setting The $LFS Variable
export LFS=/mnt/lfs

#----------------------------------------------
# add '-j' to use all cores.
export MAKEFLAGS='-j'

#----------------------------------------------
read -p "at end .. in a 2nd non chroot terminal ... run = sudo cp /home/__your_user_name__/LFS* /mnt/lfs"
read -p "at end ... run = ./LFS-10.1_step-5.sh"

#        7.1. Introduction  
# 
#                          This chapter shows how to build the last missing bits of the temporary system: first,
#                        the tools needed by the build machinery of various packages, then three packages
#                        needed to run tests. Now that all circular dependencies have been resolved, we can
#                        use a "chroot"environment, completely isolated the host operating system used for
#                        the build, except for the running kernel. 
# 
#                          For proper operation of the isolated environment, some communication with the running
#                        kernel must be established. This is done through the so-called  Virtual Kernel File
#                        Systems , which must be mounted when entering the chroot environment. You may want
#                        to check that they are mounted by issuing  findmnt . 
# 
#                          Until Section 7.4, "Entering the Chroot Environment", the commands must be run as
#                        root, with the LFSvariable set. After entering chroot, all commands are run as root,
#                        fortunately without access to the OS of the computer you built LFS on. Be careful
#                        anyway, as it is easy to destroy the whole LFS system with badly formed commands.
#                          
read -p "Chapter 7.2"

#        7.2. Changing Ownership  
#          Note 
# 
#                          The commands in the remainder of this book must be performed while logged in as
#                        user rootand no longer as user lfs. Also, double check that $LFSis set in root's
#                        environment. 
# 
#                          Currently, the whole directory hierarchy in $LFSis owned by the user lfs, a user
#                        that exists only on the host system. If the directories and files under $LFSare
#                        kept as they are, they will be owned by a user ID without a corresponding account.
#                        This is dangerous because a user account created later could get this same user
#                        ID and would own all the files under $LFS, thus exposing these files to possible
#                        malicious manipulation. 
# 
#                          To address this issue, change the ownership of the $LFS/*directories to user rootby
#                        running the following command: 



chown -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -R root:root $LFS/lib64 ;;
esac



read -p "Chapter 7.3"

#        7.3. Preparing Virtual Kernel File Systems  
# 
#                          Various file systems exported by the kernel are used to communicate to and from
#                        the kernel itself. These file systems are virtual in that no disk space is used
#                        for them. The content of the file systems resides in memory. 
# 
#                          Begin by creating directories onto which the file systems will be mounted: 



mkdir -pv $LFS/{dev,proc,sys,run}



#          7.3.1. Creating Initial Device Nodes 
# 
#                          When the kernel boots the system, it requires the presence of a few device nodes,
#                        in particular the consoleand nulldevices. The device nodes must be created on the
#                        hard disk so that they are available before the kernel populates /dev), and additionally
#                        when Linux is started with init=/bin/bash. Create the devices by running the following
#                        commands:  



mknod -m 600 $LFS/dev/console c 5 1
mknod -m 666 $LFS/dev/null c 1 3



#          7.3.2. Mounting and Populating /dev  
# 
#                          The recommended method of populating the /devdirectory with devices is to mount
#                        a virtual filesystem (such as tmpfs) on the /devdirectory, and allow the devices
#                        to be created dynamically on that virtual filesystem as they are detected or accessed.
#                        Device creation is generally done during the boot process by Udev. Since this new
#                        system does not yet have Udev and has not yet been booted, it is necessary to mount
#                        and populate /devmanually. This is accomplished by bind mounting the host system's
#                        /devdirectory. A bind mount is a special type of mount that allows you to create
#                        a mirror of a directory or mount point to some other location. Use the following
#                        command to achieve this: 



mount -v --bind /dev $LFS/dev



read -p "Chapter 7.3.3"

#          7.3.3. Mounting Virtual Kernel File Systems  
# 
#                          Now mount the remaining virtual kernel filesystems: 



mount -v --bind /dev/pts $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run



# 
#                          In some host systems, /dev/shmis a symbolic link to /run/shm. The /run tmpfs was
#                        mounted above so in this case only a directory needs to be created. 



if [ -h $LFS/dev/shm ]; then
  mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi



read -p "Chapter 7.4"

#        7.4. Entering the Chroot Environment  
# 
#                          Now that all the packages which are required to build the rest of the needed tools
#                        are on the system, it is time to enter the chroot environment to finish installing
#                        the remaining temporary tools. This environment will be in use also for installing
#                        the final system. As user root, run the following command to enter the environment
#                        that is, at the moment, populated with only the temporary tools: 



chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash --login +h



# 
#                          The -ioption given to the  env command will clear all variables of the chroot environment.
#                        After that, only the HOME, TERM, PS1, and PATHvariables are set again. The  TERM=$TERMconstruct
#                        will set the TERMvariable inside chroot to the same value as outside chroot. This
#                        variable is needed for programs like  vim and  less to operate properly. If other variables
#                        are desired, such as CFLAGSor CXXFLAGS, this is a good place to set them again.
#                        
# 
#                          From this point on, there is no need to use the LFSvariable anymore because all
#                        work will be restricted to the LFS file system. This is because the Bash shell is
#                        told that $LFSis now the root (/) directory. 
# 
#                          Notice that /tools/binis not in the PATH. This means that the cross toolchain will
#                        no longer be used in the chroot environment. This occurs when the shell does not
#                        "remember"the locations of executed binaries;for this reason, hashing is switched
#                        off by passing the  +hoption to  bash . 
# 
#                          Note that the  bash prompt will say I have no name!This is normal because the /etc/passwdfile
#                        has not been created yet. 
#          Note 
# 
#                          It is important that all the commands throughout the remainder of this chapter and
#                        the following chapters are run from within the chroot environment. If you leave
#                        this environment for any reason (rebooting for example), ensure that the virtual
#                        kernel filesystems are mounted as explained in Section 7.3.2, "Mounting and Populating
#                        /dev"and Section 7.3.3, "Mounting Virtual Kernel File Systems"and enter chroot again
#                        before continuing with the installation.   
