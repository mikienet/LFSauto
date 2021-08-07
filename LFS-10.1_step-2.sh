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
read -p "... must run this as lfs user."
read -p "... at the end .. run = ./LFS-10.1_step-3.sh"



read -p "Chapter 4.4"
 
# 002994        4.4. Setting Up the Environment 
# 002995 
# 002996                          Set up a good working environment by creating two new startup files for the bash  shell.
# 002997                        While logged in as user lfs, issue the following command to create a new .bash_profile:
# 002998                        



cat > ~/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF



# 003008 
# 003009                          When logged on as user lfs, the initial shell is usually a login  shell which reads
# 003010                        the /etc/profileof the host (probably containing some settings and environment variables)
# 003011                        and then .bash_profile. The exec env -i.../bin/bash  command in the .bash_profilefile
# 003012                        replaces the running shell with a new one with a completely empty environment, except
# 003013                        for the HOME, TERM, and PS1variables. This ensures that no unwanted and potentially
# 003014                        hazardous environment variables from the host system leak into the build environment.
# 003015                        The technique used here achieves the goal of ensuring a clean environment. 
# 003016 
# 003017                          The new instance of the shell is a non-login  shell, which does not read, and execute,
# 003018                        the contents of /etc/profileor .bash_profilefiles, but rather reads, and executes,
# 003019                        the .bashrcfile instead. Create the .bashrcfile now: 



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



# 003038 
# 003039                          The meaning of the settings in .bashrc 
# 003040 
# 003041                set +h  
# 003042 
# 003043                          The set +h  command turns off bash  's hash function. Hashing is ordinarily a useful
# 003044                        feature;bash  uses a hash table to remember the full path of executable files to avoid
# 003045                        searching the PATHtime and again to find the same executable. However, the new tools
# 003046                        should be used as soon as they are installed. By switching off the hash function,
# 003047                        the shell will always search the PATHwhen a program is to be run. As such, the shell
# 003048                        will find the newly compiled tools in $LFS/toolsas soon as they are available without
# 003049                        remembering a previous version of the same program in a different location. 
# 003050 
# 003051                umask 022  
# 003052 
# 003053                          Setting the user file-creation mask (umask) to 022 ensures that newly created files
# 003054                        and directories are only writable by their owner, but are readable and executable
# 003055                        by anyone (assuming default modes are used by the open(2)system call, new files
# 003056                        will end up with permission mode 644 and directories with mode 755). 
# 003057 
# 003058                LFS=/mnt/lfs  
# 003059 
# 003060                          The LFSvariable should be set to the chosen mount point. 
# 003061 
# 003062                LC_ALL=POSIX  
# 003063 
# 003064                          The LC_ALLvariable controls the localization of certain programs, making their messages
# 003065                        follow the conventions of a specified country. Setting LC_ALLto "POSIX " or "C " (the
# 003066                        two are equivalent) ensures that everything will work as expected in the chroot
# 003067                        environment. 
# 003068 
# 003069                LFS_TGT=(uname -m)-lfs-linux-gnu  
# 003070 
# 003071                          The LFS_TGTvariable sets a non-default, but compatible machine description for use
# 003072                        when building our cross compiler and linker and when cross compiling our temporary
# 003073                        toolchain. More information is contained in Toolchain Technical Notes . 
# 003074 
# 003075                PATH=/usr/bin  
# 003076 
# 003077                          Many modern linux distributions have merged /binand /usr/bin. When this is the case,
# 003078                        the standard PATHvariable needs just to be set to /usr/bin/for the Chapter 6 environment.
# 003079                        When this is not the case, the following line adds /binto the path. 
# 003080 
# 003081                if [ ! -L /bin ]; then PATH=/bin:$PATH; fi  
# 003082 
# 003083                          If /binis not a symbolic link, then it has to be added to the PATHvariable. 
# 003084 
# 003085                PATH=$LFS/tools/bin:$PATH  
# 003086 
# 003087                          By putting $LFS/tools/binahead of the standard PATH, the cross-compiler installed
# 003088                        at the beginning of Chapter 5 is picked up by the shell immediately after its installation.
# 003089                        This, combined with turning off hashing, limits the risk that the compiler from
# 003090                        the host be used instead of the cross-compiler. 
# 003091 
# 003092                CONFIG_SITE=$LFS/usr/share/config.site  
# 003093 
# 003094                          In Chapter 5 and Chapter 6 , if this variable is not set, configure  scripts may attempt
# 003095                        to load configuration items specific to some distributions from /usr/share/config.siteon
# 003096                        the host system. Override it to prevent potential contamination from the host. 
# 003097 
# 003098                export ...  
# 003099 
# 003100                          While the above commands have set some variables, in order to make them visible
# 003101                        within any sub-shells, we export them. 
# 003102          Important 
# 003103 
# 003104                          Several commercial distributions add a non-documented instantiation of /etc/bash.bashrcto
# 003105                        the initialization of bash  . This file has the potential to modify the lfsuser's
# 003106                        environment in ways that can affect the building of critical LFS packages. To make
# 003107                        sure the lfsuser's environment is clean, check for the presence of /etc/bash.bashrcand,
# 003108                        if present, move it out of the way. As the rootuser, run: 



[ ! -e /etc/bash.bashrc ] || mv -v /etc/bash.bashrc /etc/bash.bashrc.NOUSE



# 003116 
# 003117                          After use of the lfsuser is finished at the beginning of Chapter 7 , you can restore
# 003118                        /etc/bash.bashrc(if desired). 
# 003119 
# 003120                          Note that the LFS Bash package we will build in Section 8.34, "Bash-5.1" is not configured
# 003121                        to load or execute /etc/bash.bashrc, so this file is useless on a completed LFS
# 003122                        system. 
# 003123 
# 003124                          Finally, to have the environment fully prepared for building the temporary tools,
# 003125                        source the just-created user profile: 



source ~/.bash_profile



