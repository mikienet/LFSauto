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
read -p "... must log out from lfs user and run this with sudo"
read -p "... at the end .. run = sudo ./LFS-10.1_step-5.sh"
 
# 005147        Chapter 7. Entering Chroot and Building Additional Temporary Tools  
# 005148        7.1. Introduction 
# 005149 
# 005150                          This chapter shows how to build the last missing bits of the temporary system: first,
# 005151                        the tools needed by the build machinery of various packages, then three packages
# 005152                        needed to run tests. Now that all circular dependencies have been resolved, we can
# 005153                        use a "chroot " environment, completely isolated the host operating system used for
# 005154                        the build, except for the running kernel. 
# 005155 
# 005156                          For proper operation of the isolated environment, some communication with the running
# 005157                        kernel must be established. This is done through the so-called Virtual Kernel File
# 005158                        Systems  , which must be mounted when entering the chroot environment. You may want
# 005159                        to check that they are mounted by issuing findmnt  . 
# 005160 
# 005161                          Until Section 7.4, "Entering the Chroot Environment" , the commands must be run as
# 005162                        root, with the LFSvariable set. After entering chroot, all commands are run as root,
# 005163                        fortunately without access to the OS of the computer you built LFS on. Be careful
# 005164                        anyway, as it is easy to destroy the whole LFS system with badly formed commands.
# 005165                        


read -p "Chapter 7.2"
 
# 005166        7.2. Changing Ownership 
# 005167          Note 
# 005168 
# 005169                          The commands in the remainder of this book must be performed while logged in as
# 005170                        user rootand no longer as user lfs. Also, double check that $LFSis set in root's
# 005171                        environment. 
# 005172 
# 005173                          Currently, the whole directory hierarchy in $LFSis owned by the user lfs, a user
# 005174                        that exists only on the host system. If the directories and files under $LFSare
# 005175                        kept as they are, they will be owned by a user ID without a corresponding account.
# 005176                        This is dangerous because a user account created later could get this same user
# 005177                        ID and would own all the files under $LFS, thus exposing these files to possible
# 005178                        malicious manipulation. 
# 005179 
# 005180                          To address this issue, change the ownership of the $LFS/*directories to user rootby
# 005181                        running the following command: 



chown -R root:root $LFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -R root:root $LFS/lib64 ;;
esac





read -p "Chapter 7.3"
 
# 005192        7.3. Preparing Virtual Kernel File Systems 
# 005193 
# 005194                          Various file systems exported by the kernel are used to communicate to and from
# 005195                        the kernel itself. These file systems are virtual in that no disk space is used
# 005196                        for them. The content of the file systems resides in memory. 
# 005197 
# 005198                          Begin by creating directories onto which the file systems will be mounted: 



mkdir -pv $LFS/{dev,proc,sys,run}



# 005206          7.3.1. Creating Initial Device Nodes 
# 005207 
# 005208                          When the kernel boots the system, it requires the presence of a few device nodes,
# 005209                        in particular the consoleand nulldevices. The device nodes must be created on the
# 005210                        hard disk so that they are available before the kernel populates /dev), and additionally
# 005211                        when Linux is started with init=/bin/bash . Create the devices by running the following
# 005212                        commands: 



mknod -m 600 $LFS/dev/console c 5 1
mknod -m 666 $LFS/dev/null c 1 3


 
# 005221          7.3.2. Mounting and Populating /dev 
# 005222 
# 005223                          The recommended method of populating the /devdirectory with devices is to mount
# 005224                        a virtual filesystem (such as tmpfs) on the /devdirectory, and allow the devices
# 005225                        to be created dynamically on that virtual filesystem as they are detected or accessed.
# 005226                        Device creation is generally done during the boot process by Udev. Since this new
# 005227                        system does not yet have Udev and has not yet been booted, it is necessary to mount
# 005228                        and populate /devmanually. This is accomplished by bind mounting the host system's
# 005229                        /devdirectory. A bind mount is a special type of mount that allows you to create
# 005230                        a mirror of a directory or mount point to some other location. Use the following
# 005231                        command to achieve this: 



mount -v --bind /dev $LFS/dev





read -p "Chapter 7.3.3"
 
# 005239          7.3.3. Mounting Virtual Kernel File Systems 
# 005240 
# 005241                          Now mount the remaining virtual kernel filesystems: 



mount -v --bind /dev/pts $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run



# 005252 
# 005253                          In some host systems, /dev/shmis a symbolic link to /run/shm. The /run tmpfs was
# 005254                        mounted above so in this case only a directory needs to be created. 



if [ -h $LFS/dev/shm ]; then
  mkdir -pv $LFS/$(readlink $LFS/dev/shm)
fi





read -p "Chapter 7.4"
 
# 005264        7.4. Entering the Chroot Environment 
# 005265 
# 005266                          Now that all the packages which are required to build the rest of the needed tools
# 005267                        are on the system, it is time to enter the chroot environment to finish installing
# 005268                        the remaining temporary tools. This environment will be in use also for installing
# 005269                        the final system. As user root, run the following command to enter the environment
# 005270                        that is, at the moment, populated with only the temporary tools: 



chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash --login +h



# 005283 
# 005284                          The -i option given to the env  command will clear all variables of the chroot environment.
# 005285                        After that, only the HOME, TERM, PS1, and PATHvariables are set again. The TERM=$TERM construct
# 005286                        will set the TERMvariable inside chroot to the same value as outside chroot. This
# 005287                        variable is needed for programs like vim  and less  to operate properly. If other variables
# 005288                        are desired, such as CFLAGSor CXXFLAGS, this is a good place to set them again.
# 005289                        
# 005290 
# 005291                          From this point on, there is no need to use the LFSvariable anymore because all
# 005292                        work will be restricted to the LFS file system. This is because the Bash shell is
# 005293                        told that $LFSis now the root (/) directory. 
# 005294 
# 005295                          Notice that /tools/binis not in the PATH. This means that the cross toolchain will
# 005296                        no longer be used in the chroot environment. This occurs when the shell does not
# 005297                        "remember " the locations of executed binaries;for this reason, hashing is switched
# 005298                        off by passing the +h option to bash  . 
# 005299 
# 005300                          Note that the bash  prompt will say 
# 005301 I have no name!This is normal because the /etc/passwdfile
# 005302                        has not been created yet. 
# 005303          Note 
# 005304 
# 005305                          It is important that all the commands throughout the remainder of this chapter and
# 005306                        the following chapters are run from within the chroot environment. If you leave
# 005307                        this environment for any reason (rebooting for example), ensure that the virtual
# 005308                        kernel filesystems are mounted as explained in Section 7.3.2, "Mounting and Populating
# 005309                        /dev" and Section 7.3.3, "Mounting Virtual Kernel File Systems" and enter chroot again
# 005310                        before continuing with the installation. 
