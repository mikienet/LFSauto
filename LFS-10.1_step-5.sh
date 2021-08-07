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
read -p "... must be in chroot."
read -p "... at the end .. open a 2nd non chroot terminal ... run = sudo cp /home/__your_user_name__/LFS* /mnt/lfs"
read -p "... at the end .. run = ./LFS-10.1_step-6.sh"



read -p "Chapter 7.5"
 
# 005312        7.5. Creating Directories 
# 005313 
# 005314                          It is time to create the full structure in the LFS file system. 
# 005315 
# 005316                          Create some root-level directories that are not in the limited set required in the
# 005317                        previous chapters by issuing the following command: 
# 005318          Note 
# 005319 
# 005320                          Some of the directories below have already been created earlier with explicit instructions
# 005321                        or when installing some packages. They are repeated below for completeness. 



mkdir -pv /{boot,home,mnt,opt,srv}



# 005329 
# 005330                          Create the required set of subdirectories below the root-level by issuing the following
# 005331                        commands: 



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



# 005353 
# 005354                          Directories are, by default, created with permission mode 755, but this is not desirable
# 005355                        for all directories. In the commands above, two changes are made;one to the home
# 005356                        directory of user root, and another to the directories for temporary files. 
# 005357 
# 005358                          The first mode change ensures that not just anybody can enter the /rootdirectory;the
# 005359                        same as a normal user would do with his or her home directory. The second mode change
# 005360                        makes sure that any user can write to the /tmpand /var/tmpdirectories, but cannot
# 005361                        remove another user's files from them. The latter is prohibited by the so-called
# 005362                        "sticky bit, " the highest bit (1) in the 1777 bit mask. 
# 005363          7.5.1. FHS Compliance Note 
# 005364 
# 005365                          The directory tree is based on the Filesystem Hierarchy Standard (FHS) (available
# 005366                        at https://refspecs.linuxfoundation.org/fhs.shtml ). The FHS also specifies the optional
# 005367                        existence of some directories such as /usr/local/gamesand /usr/share/games. We create
# 005368                        only the directories that are needed. However, feel free to create these directories.
# 005369                        


read -p "Chapter 7.6"
 
# 005370        7.6. Creating Essential Files and Symlinks 
# 005371 
# 005372                          Historically, Linux maintains a list of the mounted file systems in the file /etc/mtab.
# 005373                        Modern kernels maintain this list internally and exposes it to the user via the
# 005374                        /procfilesystem. To satisfy utilities that expect the presence of /etc/mtab, create
# 005375                        the following symbolic link: 



ln -sv /proc/self/mounts /etc/mtab



# 005383 
# 005384                          Create a basic /etc/hostsfile to be referenced in some test suites, and in one of
# 005385                        Perl's configuration files as well: 



echo "127.0.0.1 localhost $(hostname)" > /etc/hosts



# 005393 
# 005394                          In order for user rootto be able to login and for the name "root " to be recognized,
# 005395                        there must be relevant entries in the /etc/passwdand /etc/groupfiles. 
# 005396 
# 005397                          Create the /etc/passwdfile by running the following command: 



cat > /etc/passwd << "EOF"
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/dev/null:/bin/false
daemon:x:6:6:Daemon User:/dev/null:/bin/false
messagebus:x:18:18:D-Bus Message Daemon User:/run/dbus:/bin/false
uuidd:x:80:80:UUID Generation Daemon User:/dev/null:/bin/false
nobody:x:99:99:Unprivileged User:/dev/null:/bin/false
EOF



# 005412 
# 005413                          The actual password for rootwill be set later. 
# 005414 
# 005415                          Create the /etc/groupfile by running the following command: 



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



# 005449 
# 005450                          The created groups are not part of any standard;they are groups decided on in part
# 005451                        by the requirements of the Udev configuration in Chapter 9, and in part by common
# 005452                        convention employed by a number of existing Linux distributions. In addition, some
# 005453                        test suites rely on specific users or groups. The Linux Standard Base (LSB, available
# 005454                        at http://refspecs.linuxfoundation.org/lsb.shtml ) only recommends that, besides
# 005455                        the group rootwith a Group ID (GID) of 0, a group binwith a GID of 1 be present.
# 005456                        All other group names and GIDs can be chosen freely by the system administrator
# 005457                        since well-written programs do not depend on GID numbers, but rather use the group's
# 005458                        name. 
# 005459 
# 005460                          Some tests in Chapter 8 need a regular user. We add this user here and delete this
# 005461                        account at the end of that chapter. 



echo "tester:x:$(ls -n $(tty) | cut -d" " -f3):101::/home/tester:/bin/bash" >> /etc/passwd
echo "tester:x:101:" >> /etc/group
install -o tester -d /home/tester



# 005471 
# 005472                          To remove the "I have no name! " prompt, start a new shell. Since the /etc/passwdand
# 005473                        /etc/groupfiles have been created, user name and group name resolution will now
# 005474                        work: 



exec /bin/bash --login +h



# 005482 
# 005483                          Note the use of the +h directive. This tells bash  not to use its internal path hashing.
# 005484                        Without this directive, bash  would remember the paths to binaries it has executed.
# 005485                        To ensure the use of the newly compiled binaries as soon as they are installed,
# 005486                        the +h directive will be used for the duration of this and the next chapter. 
# 005487 
# 005488                          The login  , agetty  , and init  programs (and others) use a number of log files to record
# 005489                        information such as who was logged into the system and when. However, these programs
# 005490                        will not write to the log files if they do not already exist. Initialize the log
# 005491                        files and give them proper permissions: 



touch /var/log/{btmp,lastlog,faillog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664  /var/log/lastlog
chmod -v 600  /var/log/btmp



# 005502 
# 005503                          The /var/log/wtmpfile records all logins and logouts. The /var/log/lastlogfile records
# 005504                        when each user last logged in. The /var/log/faillogfile records failed login attempts.
# 005505                        The /var/log/btmpfile records the bad login attempts. 
# 005506          Note 
# 005507 
# 005508                          The /run/utmpfile records the users that are currently logged in. This file is created
# 005509                        dynamically in the boot scripts. 
