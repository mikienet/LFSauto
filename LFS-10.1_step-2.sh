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
read -p "at end .. run = ./LFS-10.1_step-3.sh"









#        4.4. Setting Up the Environment  
# 
#                          Set up a good working environment by creating two new startup files for the bash shell.
#                        While logged in as user lfs, issue the following command to create a new .bash_profile:
#                        



cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF



# 
#                          When logged on as user lfs, the initial shell is usually a  login shell which reads
#                        the /etc/profileof the host (probably containing some settings and environment variables)
#                        and then .bash_profile. The  exec env -i.../bin/bash command in the .bash_profilefile
#                        replaces the running shell with a new one with a completely empty environment, except
#                        for the HOME, TERM, and PS1variables. This ensures that no unwanted and potentially
#                        hazardous environment variables from the host system leak into the build environment.
#                        The technique used here achieves the goal of ensuring a clean environment. 
# 
#                          The new instance of the shell is a  non-login shell, which does not read, and execute,
#                        the contents of /etc/profileor .bash_profilefiles, but rather reads, and executes,
#                        the .bashrcfile instead. Create the .bashrcfile now: 



cat > ~/.bashrc << "EOF"
set +h
umask 022
LFS=/mnt/lfs
LC_ALL=POSIX
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
PATH=$LFS/tools/bin:$PATH
CONFIG_SITE=$LFS/usr/share/config.site
export LFS LC_ALL LFS_TGT PATH CONFIG_SITE
EOF


 
# 
#                          The meaning of the settings in .bashrc 
# 
#                set +h 
# 
#                          The  set +h command turns off  bash 's hash function. Hashing is ordinarily a useful
#                        feature; bash uses a hash table to remember the full path of executable files to avoid
#                        searching the PATHtime and again to find the same executable. However, the new tools
#                        should be used as soon as they are installed. By switching off the hash function,
#                        the shell will always search the PATHwhen a program is to be run. As such, the shell
#                        will find the newly compiled tools in $LFS/toolsas soon as they are available without
#                        remembering a previous version of the same program in a different location. 
# 
#                umask 022 
# 
#                          Setting the user file-creation mask (umask) to 022 ensures that newly created files
#                        and directories are only writable by their owner, but are readable and executable
#                        by anyone (assuming default modes are used by the open(2)system call, new files
#                        will end up with permission mode 644 and directories with mode 755). 
# 
#                LFS=/mnt/lfs 
# 
#                          The LFSvariable should be set to the chosen mount point. 
# 
#                LC_ALL=POSIX 
# 
#                          The LC_ALLvariable controls the localization of certain programs, making their messages
#                        follow the conventions of a specified country. Setting LC_ALLto "POSIX"or "C"(the
#                        two are equivalent) ensures that everything will work as expected in the chroot
#                        environment. 
# 
#                LFS_TGT=(uname -m)-lfs-linux-gnu 
# 
#                          The LFS_TGTvariable sets a non-default, but compatible machine description for use
#                        when building our cross compiler and linker and when cross compiling our temporary
#                        toolchain. More information is contained in Toolchain Technical Notes.  
# 
#                PATH=/usr/bin 
# 
#                          Many modern linux distributions have merged /binand /usr/bin. When this is the case,
#                        the standard PATHvariable needs just to be set to /usr/bin/for the Chapter 6environment.
#                        When this is not the case, the following line adds /binto the path.  
# 
#                if [ ! -L /bin ]; then PATH=/bin:$PATH; fi 
# 
#                          If /binis not a symbolic link, then it has to be added to the PATHvariable. 
# 
#                PATH=$LFS/tools/bin:$PATH 
# 
#                          By putting $LFS/tools/binahead of the standard PATH, the cross-compiler installed
#                        at the beginning of Chapter 5is picked up by the shell immediately after its installation.
#                        This, combined with turning off hashing, limits the risk that the compiler from
#                        the host be used instead of the cross-compiler.  
# 
#                CONFIG_SITE=$LFS/usr/share/config.site 
# 
#                          In Chapter 5and Chapter 6, if this variable is not set,   configure scripts may attempt
#                        to load configuration items specific to some distributions from /usr/share/config.siteon
#                        the host system. Override it to prevent potential contamination from the host. 
# 
#                export ... 
# 
#                          While the above commands have set some variables, in order to make them visible
#                        within any sub-shells, we export them. 
#          Important 
# 
#                          Several commercial distributions add a non-documented instantiation of /etc/bash.bashrcto
#                        the initialization of  bash . This file has the potential to modify the lfsuser's
#                        environment in ways that can affect the building of critical LFS packages. To make
#                        sure the lfsuser's environment is clean, check for the presence of /etc/bash.bashrcand,
#                        if present, move it out of the way. As the rootuser, run: 



[ ! -e /etc/bash.bashrc ] || mv -v /etc/bash.bashrc /etc/bash.bashrc.NOUSE



# 
#                          After use of the lfsuser is finished at the beginning of Chapter 7, you can restore
#                        /etc/bash.bashrc(if desired).  
# 
#                          Note that the LFS Bash package we will build in Section 8.34, "Bash-5.1"is not configured
#                        to load or execute /etc/bash.bashrc, so this file is useless on a completed LFS
#                        system.  
# 
#                          Finally, to have the environment fully prepared for building the temporary tools,
#                        source the just-created user profile: 



source ~/.bash_profile


 
