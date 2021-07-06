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
read -p "at end ... run = ./LFS-10.1_step-6.sh"

read -p "Chapter 7.5"

#        7.5. Creating Directories  
# 
#                          It is time to create the full structure in the LFS file system. 
# 
#                          Create some root-level directories that are not in the limited set required in the
#                        previous chapters by issuing the following command: 
#          Note 
# 
#                          Some of the directories below have already been created earlier with explicit instructions
#                        or when installing some packages. They are repeated below for completeness. 



mkdir -pv /{boot,home,mnt,opt,srv}



# 
#                          Create the required set of subdirectories below the root-level by issuing the following
#                        commands: 



mkdir -pv /etc/{opt,sysconfig}
mkdir -pv /lib/firmware
mkdir -pv /media/{floppy,cdrom}
mkdir -pv /usr/{,local/}{bin,include,lib,sbin,src}
mkdir -pv /usr/{,local/}share/{color,dict,doc,info,locale,man}
mkdir -pv /usr/{,local/}share/{misc,terminfo,zoneinfo}
mkdir -pv /usr/{,local/}share/man/man{1..8}
mkdir -pv /var/{cache,local,log,mail,opt,spool}
mkdir -pv /var/lib/{color,misc,locate}

ln -sfv /run /var/run
ln -sfv /run/lock /var/lock

install -dv -m 0750 /root
install -dv -m 1777 /tmp /var/tmp



# 
#                          Directories are, by default, created with permission mode 755, but this is not desirable
#                        for all directories. In the commands above, two changes are made;one to the home
#                        directory of user root, and another to the directories for temporary files. 
# 
#                          The first mode change ensures that not just anybody can enter the /rootdirectory;the
#                        same as a normal user would do with his or her home directory. The second mode change
#                        makes sure that any user can write to the /tmpand /var/tmpdirectories, but cannot
#                        remove another user's files from them. The latter is prohibited by the so-called
#                        "sticky bit,"the highest bit (1) in the 1777 bit mask. 
#          7.5.1. FHS Compliance Note 
# 
#                          The directory tree is based on the Filesystem Hierarchy Standard (FHS) (available
#                        at https://refspecs.linuxfoundation.org/fhs.shtml). The FHS also specifies the optional
#                        existence of some directories such as /usr/local/gamesand /usr/share/games. We create
#                        only the directories that are needed. However, feel free to create these directories.
#                          
read -p "Chapter 7.6"

#        7.6. Creating Essential Files and Symlinks  
# 
#                          Historically, Linux maintains a list of the mounted file systems in the file /etc/mtab.
#                        Modern kernels maintain this list internally and exposes it to the user via the
#                        /procfilesystem. To satisfy utilities that expect the presence of /etc/mtab, create
#                        the following symbolic link: 



ln -sv /proc/self/mounts /etc/mtab



# 
#                          Create a basic /etc/hostsfile to be referenced in some test suites, and in one of
#                        Perl's configuration files as well: 



echo "127.0.0.1 localhost $(hostname)" > /etc/hosts



# 
#                          In order for user rootto be able to login and for the name "root"to be recognized,
#                        there must be relevant entries in the /etc/passwdand /etc/groupfiles. 
# 
#                          Create the /etc/passwdfile by running the following command: 



cat > /etc/passwd << "EOF"
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/dev/null:/bin/false
daemon:x:6:6:Daemon User:/dev/null:/bin/false
messagebus:x:18:18:D-Bus Message Daemon User:/run/dbus:/bin/false
uuidd:x:80:80:UUID Generation Daemon User:/dev/null:/bin/false
nobody:x:99:99:Unprivileged User:/dev/null:/bin/false
EOF



# 
#                          The actual password for rootwill be set later. 
# 
#                          Create the /etc/groupfile by running the following command: 



cat > /etc/group << "EOF"
root:x:0:
bin:x:1:daemon
sys:x:2:
kmem:x:3:
tape:x:4:
tty:x:5:
daemon:x:6:
floppy:x:7:
disk:x:8:
lp:x:9:
dialout:x:10:
audio:x:11:
video:x:12:
utmp:x:13:
usb:x:14:
cdrom:x:15:
adm:x:16:
messagebus:x:18:
input:x:24:
mail:x:34:
kvm:x:61:
uuidd:x:80:
wheel:x:97:
nogroup:x:99:
users:x:999:
EOF



# 
#                          The created groups are not part of any standard;they are groups decided on in part
#                        by the requirements of the Udev configuration in Chapter 9, and in part by common
#                        convention employed by a number of existing Linux distributions. In addition, some
#                        test suites rely on specific users or groups. The Linux Standard Base (LSB, available
#                        at http://refspecs.linuxfoundation.org/lsb.shtml) only recommends that, besides
#                        the group rootwith a Group ID (GID) of 0, a group binwith a GID of 1 be present.
#                        All other group names and GIDs can be chosen freely by the system administrator
#                        since well-written programs do not depend on GID numbers, but rather use the group's
#                        name.  
# 
#                          Some tests in Chapter 8need a regular user. We add this user here and delete this
#                        account at the end of that chapter.  



echo "tester:x:$(ls -n $(tty) | cut -d" " -f3):101::/home/tester:/bin/bash" >> /etc/passwd
echo "tester:x:101:" >> /etc/group
install -o tester -d /home/tester



# 
#                          To remove the "I have no name!"prompt, start a new shell. Since the /etc/passwdand
#                        /etc/groupfiles have been created, user name and group name resolution will now
#                        work: 



exec /bin/bash --login +h



# 
#                          Note the use of the  +hdirective. This tells  bash not to use its internal path hashing.
#                        Without this directive,  bash would remember the paths to binaries it has executed.
#                        To ensure the use of the newly compiled binaries as soon as they are installed,
#                        the  +hdirective will be used for the duration of this and the next chapter.  
# 
#                          The login ,  agetty , and  init programs (and others) use a number of log files to record
#                        information such as who was logged into the system and when. However, these programs
#                        will not write to the log files if they do not already exist. Initialize the log
#                        files and give them proper permissions: 



touch /var/log/{btmp,lastlog,faillog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664  /var/log/lastlog
chmod -v 600  /var/log/btmp



# 
#                          The /var/log/wtmpfile records all logins and logouts. The /var/log/lastlogfile records
#                        when each user last logged in. The /var/log/faillogfile records failed login attempts.
#                        The /var/log/btmpfile records the bad login attempts. 
#          Note 
# 
#                          The /run/utmpfile records the users that are currently logged in. This file is created
#                        dynamically in the boot scripts.  
