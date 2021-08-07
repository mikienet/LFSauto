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

#----------------------------------------------
# 7.6 commands not run due to bash re-exec.
touch /var/log/{btmp,lastlog,faillog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664 /var/log/lastlog
chmod -v 600 /var/log/btmp

#----------------------------------------------
read -p "... at the end .. run = ./LFS-10.1_step-7.sh"



cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'gcc-*')
tar xf $(find -maxdepth 1 -type f -name 'gcc-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'gcc-*')
read -p "Chapter 7.7"
 
# 005511        7.7. Libstdc++ from GCC-10.2.0, Pass 2 
# 005512 
# 005513                          When building gcc-pass2 we had to defer the installation of the C++ standard library
# 005514                        because no suitable compiler was available to compile it. We could not use the compiler
# 005515                        built in that section because it is a native compiler and should not be used outside
# 005516                        of chroot and risks polluting the libraries with some host components. 
# 005517           Approximate build time: 0.8 SBU
# 005518           Required disk space: 1.1 GB 
# 005519          7.7.1. Installation of Target Libstdc++ 
# 005520          Note 
# 005521 
# 005522                          Libstdc++ is part of the GCC sources. You should first unpack the GCC tarball and
# 005523                        change to the gcc-10.2.0directory. 
# 005524 
# 005525                          Create a link which exists when building libstdc++ in the gcc tree: 



ln -s gthr-posix.h libgcc/gthr-default.h



# 005533 
# 005534                          Create a separate build directory for libstdc++ and enter it: 



mkdir -v build
cd       build



# 005543 
# 005544                          Prepare libstdc++ for compilation: 



../libstdc++-v3/configure            \
    CXXFLAGS="-g -O2 -D_GNU_SOURCE"  \
    --prefix=/usr                    \
    --disable-multilib               \
    --disable-nls                    \
    --host=$(uname -m)-lfs-linux-gnu \
    --disable-libstdcxx-pch



# 005558 
# 005559                          The meaning of the configure options: 
# 005560 
# 005561                CXXFLAGS="-g -O2 -D_GNU_SOURCE"  
# 005562 
# 005563                          These flags are passed by the top level Makefile when doing a full build of GCC.
# 005564                        
# 005565 
# 005566                --host=$(uname -m)-lfs-linux-gnu  
# 005567 
# 005568                          We have to mimic what would happen if this package were built as part of a full
# 005569                        compiler build. This switch would be passed to configure by GCC's build machinery.
# 005570                        
# 005571 
# 005572                --disable-libstdcxx-pch  
# 005573 
# 005574                          This switch prevents the installation of precompiled include files, which are not
# 005575                        needed at this stage. 
# 005576 
# 005577                          Compile libstdc++ by running: 



make



# 005585 
# 005586                          Install the library: 



make install



# 005594 
# 005595                          Details on this package are located in Section 8.26.2, "Contents of GCC." 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'gettext-*')
tar xf $(find -maxdepth 1 -type f -name 'gettext-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'gettext-*')
read -p "Chapter 7.8"
 
# 005596        7.8. Gettext-0.21 
# 005597 
# 005598                          The Gettext package contains utilities for internationalization and localization.
# 005599                        These allow programs to be compiled with NLS (Native Language Support), enabling
# 005600                        them to output messages in the user's native language. 
# 005601           Approximate build time: 1.8 SBU
# 005602           Required disk space: 310 MB 
# 005603          7.8.1. Installation of Gettext 
# 005604 
# 005605                          For our temporary set of tools, we only need to install three programs from Gettext.
# 005606                        
# 005607 
# 005608                          Prepare Gettext for compilation: 



./configure --disable-shared



# 005616 
# 005617                          The meaning of the configure option: 
# 005618 
# 005619                --disable-shared  
# 005620 
# 005621                          We do not need to install any of the shared Gettext libraries at this time, therefore
# 005622                        there is no need to build them. 
# 005623 
# 005624                          Compile the package: 



make



# 005632 
# 005633                          Install the msgfmt  , msgmerge  , and xgettext  programs: 



cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin



# 005641 
# 005642                          Details on this package are located in Section 8.31.2, "Contents of Gettext." 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'bison-*')
tar xf $(find -maxdepth 1 -type f -name 'bison-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'bison-*')
read -p "Chapter 7.9"
 
# 005643        7.9. Bison-3.7.5 
# 005644 
# 005645                          The Bison package contains a parser generator. 
# 005646           Approximate build time: 0.3 SBU
# 005647           Required disk space: 52 MB 
# 005648          7.9.1. Installation of Bison 
# 005649 
# 005650                          Prepare Bison for compilation: 



./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.7.5



# 005659 
# 005660                          The meaning of the new configure option: 
# 005661 
# 005662                --docdir=/usr/share/doc/bison-3.7.5  
# 005663 
# 005664                          This tells the build system to install bison documentation into a versioned directory.
# 005665                        
# 005666 
# 005667                          Compile the package: 



make



# 005675 
# 005676                          Install the package: 



make install



# 005684 
# 005685                          Details on this package are located in Section 8.32.2, "Contents of Bison." 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'perl-*')
tar xf $(find -maxdepth 1 -type f -name 'perl-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'perl-*')
read -p "Chapter 7.10"
 
# 005686        7.10. Perl-5.32.1 
# 005687 
# 005688                          The Perl package contains the Practical Extraction and Report Language. 
# 005689           Approximate build time: 1.7 SBU
# 005690           Required disk space: 268 MB 
# 005691          7.10.1. Installation of Perl 
# 005692 
# 005693                          Prepare Perl for compilation: 



sh Configure -des                                        \
             -Dprefix=/usr                               \
             -Dvendorprefix=/usr                         \
             -Dprivlib=/usr/lib/perl5/5.32/core_perl     \
             -Darchlib=/usr/lib/perl5/5.32/core_perl     \
             -Dsitelib=/usr/lib/perl5/5.32/site_perl     \
             -Dsitearch=/usr/lib/perl5/5.32/site_perl    \
             -Dvendorlib=/usr/lib/perl5/5.32/vendor_perl \
             -Dvendorarch=/usr/lib/perl5/5.32/vendor_perl



# 005709 
# 005710                          The meaning of the new Configure options: 
# 005711 
# 005712                -des  
# 005713 
# 005714                          This is a combination of three options: -d uses defaults for all items; -e ensures
# 005715                        completion of all tasks; -s silences non-essential output. 
# 005716 
# 005717                          Compile the package: 



make



# 005725 
# 005726                          Install the package: 



make install



# 005734 
# 005735                          Details on this package are located in Section 8.40.2, "Contents of Perl." 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'Python-*')
tar xf $(find -maxdepth 1 -type f -name 'Python-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'Python-*')
read -p "Chapter 7.11"
 
# 005736        7.11. Python-3.9.2 
# 005737 
# 005738                          The Python 3 package contains the Python development environment. It is useful for
# 005739                        object-oriented programming, writing scripts, prototyping large programs, or developing
# 005740                        entire applications. 
# 005741           Approximate build time: 0.9 SBU
# 005742           Required disk space: 374 MB 
# 005743          7.11.1. Installation of Python 
# 005744          Note 
# 005745 
# 005746                          There are two package files whose name starts with "python " . The one to extract
# 005747                        from is Python-3.9.2.tar.xz(notice the uppercase first letter). 
# 005748 
# 005749                          Prepare Python for compilation: 



./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip



# 005759 
# 005760                          The meaning of the configure option: 
# 005761 
# 005762                --enable-shared  
# 005763 
# 005764                          This switch prevents installation of static libraries. 
# 005765 
# 005766                --without-ensurepip  
# 005767 
# 005768                          This switch disables the Python package installer, which is not needed at this stage.
# 005769                        
# 005770 
# 005771                          Compile the package: 



make



# 005779 
# 005780                          Install the package: 



make install



# 005788 
# 005789                          Details on this package are located in Section 8.49.2, "Contents of Python 3." 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'texinfo-*')
tar xf $(find -maxdepth 1 -type f -name 'texinfo-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'texinfo-*')
read -p "Chapter 7.12"
 
# 005790        7.12. Texinfo-6.7 
# 005791 
# 005792                          The Texinfo package contains programs for reading, writing, and converting info
# 005793                        pages. 
# 005794           Approximate build time: 0.3 SBU
# 005795           Required disk space: 105 MB 
# 005796          7.12.1. Installation of Texinfo 
# 005797 
# 005798                          Prepare Texinfo for compilation: 



./configure --prefix=/usr



# 005806          Note 
# 005807 
# 005808                          As part of the configure process, a test is made that indicates an error for TestXS_la-TestXS.lo.
# 005809                        This is not relevant for LFS and should be ignored. 
# 005810 
# 005811                          Compile the package: 



make



# 005819 
# 005820                          Install the package: 



make install



# 005828 
# 005829                          Details on this package are located in Section 8.68.2, "Contents of Texinfo." 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'util-linux-*')
tar xf $(find -maxdepth 1 -type f -name 'util-linux-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'util-linux-*')
read -p "Chapter 7.13"
 
# 005830        7.13. Util-linux-2.36.2 
# 005831 
# 005832                          The Util-linux package contains miscellaneous utility programs. 
# 005833           Approximate build time: 0.7 SBU
# 005834           Required disk space: 134 MB 
# 005835          7.13.1. Installation of Util-linux 
# 005836 
# 005837                          The FHS recommends using the /var/lib/hwclockdirectory instead of the usual /etcdirectory
# 005838                        as the location for the adjtimefile. Create this directory with: 



mkdir -pv /var/lib/hwclock



# 005846 
# 005847                          Prepare Util-linux for compilation: 



./configure ADJTIME_PATH=/var/lib/hwclock/adjtime    \
            --docdir=/usr/share/doc/util-linux-2.36.2 \
            --disable-chfn-chsh  \
            --disable-login      \
            --disable-nologin    \
            --disable-su         \
            --disable-setpriv    \
            --disable-runuser    \
            --disable-pylibmount \
            --disable-static     \
            --without-python     \
            runstatedir=/run



# 005866 
# 005867                          The meaning of the configure options: 
# 005868 
# 005869                ADJTIME_PATH=/var/lib/hwclock/adjtime  
# 005870 
# 005871                          This sets the location of the file recording information about the hardware clock
# 005872                        in accordance to the FHS. This is not stricly needed for this temporary tool, but
# 005873                        it prevents creating a file at another location, which would not be overwritten
# 005874                        or removed when building the final util-linux package. 
# 005875 
# 005876                --disable-*  
# 005877 
# 005878                          These switches prevent warnings about building components that require packages
# 005879                        not in LFS or not installed yet. 
# 005880 
# 005881                --without-python  
# 005882 
# 005883                          This switch disables using Python . It avoids trying to build unneeded bindings.
# 005884                        
# 005885 
# 005886                runstatedir=/run  
# 005887 
# 005888                          This switch sets the location of the socket used by uuidd  and libuuidcorrectly. 
# 005889 
# 005890                          Compile the package: 



make



# 005898 
# 005899                          Install the package: 



make install



# 005907 
# 005908                          Details on this package are located in Section 8.72.2, "Contents of Util-linux." 


read -p "Chapter 7.14"
 
# 005909        7.14. Cleaning up and Saving the Temporary System 
# 005910 
# 005911                          The libtool .la files are only useful when linking with static libraries. They are
# 005912                        unneeded, and potentially harmful, when using dynamic shared libraries, specially
# 005913                        when using non-autotools build systems. While still in chroot, remove those files
# 005914                        now: 



find /usr/{lib,libexec} -name \*.la -delete



# 005922 
# 005923                          Remove the documentation of the temporary tools, to prevent them from ending up
# 005924                        in the final system, and save about 35 MB: 



rm -rf /usr/share/{info,man,doc}/*



# 005932          Note 
# 005933 
# 005934                          All the remaining steps in this section are optional. Nevertheless, as soon as you
# 005935                        begin installing packages in Chapter 8 , the temporary tools will be overwritten.
# 005936                        So it may be a good idea to do a backup of the temporary tools as described below.
# 005937                        The other steps are only needed if you are really short on disk space. 
# 005938 
# 005939                          The following steps are performed from outside the chroot environment. That means,
# 005940                        you have to leave the chroot environment first before continuing. The reason for
# 005941                        that is to: 
# 005942 
# 005943                          make sure that objects are not in use while they are manipulated. 
# 005944 
# 005945                          get access to file system locations outside of the chroot environment to store/read
# 005946                        the backup archive which should not be placed within the $LFShierarchy for safety
# 005947                        reasons. 
# 005948 
# 005949                          Leave the chroot environment and unmount the kernel virtual file systems: 
# 005950          Note 
# 005951 
# 005952                          All of the following instructions are executed by root. Take extra care about the
# 005953                        commands you're going to run as mistakes here can modify your host system. Be aware
# 005954                        that the environment variable LFSis set for user lfsby default but it might not  be
# 005955                        set for root. Whenever commands are to be executed by root, make sure you have set
# 005956                        LFSaccordingly. This has been discussed in Section 2.6, "Setting The $LFS Variable" .
# 005957                        



exit
umount $LFS/dev{/pts,}
umount $LFS/{sys,proc,run}



# 005967          7.14.1. Stripping 
# 005968 
# 005969                          If the LFS partition is rather small, it is good to know that unnecessary items
# 005970                        can be removed. The executables and libraries built so far contain a little over
# 005971                        90 MB of unneeded debugging symbols. 
# 005972 
# 005973                          Strip off debugging symbols from binaries: 



strip --strip-debug $LFS/usr/lib/*
strip --strip-unneeded $LFS/usr/{,s}bin/*
strip --strip-unneeded $LFS/tools/bin/*



# 005983 
# 005984                          These commands will skip a number of files reporting that it does not recognize
# 005985                        their file format. Most of these are scripts instead of binaries. 
# 005986 
# 005987                          Take care NOT  to use --strip-unneeded on the libraries. The static ones would be destroyed
# 005988                        and the toolchain packages would need to be built all over again. 
# 005989 
# 005990                          At this point, you should have at least 5 GB of free space on the chroot partition
# 005991                        that can be used to build and install Glibc and GCC in the next phase. If you can
# 005992                        build and install Glibc, you can build and install the rest too. You can check the
# 005993                        free disk space with the command df -h $LFS  . 
# 005994          7.14.2. Backup 
# 005995 
# 005996                          Now that the essential tools have been created, its time to think about a backup.
# 005997                        When every check has passed successfully in the previously built packages, your
# 005998                        temporary tools are in a good state and might be backed up for later reuse. In case
# 005999                        of fatal failures in the subsequent chapters, it often turns out that removing everything
# 006000                        and starting over (more carefully) is the best option to recover. Unfortunately,
# 006001                        all the temporary tools will be removed, too. To avoid spending extra time to redo
# 006002                        something which has been built successfully, prepare a backup. 
# 006003 
# 006004                          Make sure you have at least 600 MB free disk space (the source tarballs will be
# 006005                        included in the backup archive) in the home directory of user root. 
# 006006 
# 006007                          Create the backup archive by running the following command: 



cd $LFS &&
tar -cJpf $HOME/lfs-temp-tools-10.1.tar.xz .



# 006016 
# 006017                          Replace $HOMEby a directory of your choice if you do not want to have the backup
# 006018                        stored in root's home directory. 
# 006019          7.14.3. Restore 
# 006020 
# 006021                          In case some mistakes have been made and you need to start over, you can use this
# 006022                        backup to restore the temporary tools and save some recovery time. Since the sources
# 006023                        are located under $LFS, they are included in the backup archive as well, so they
# 006024                        do not need to be downloaded again. After checking that $LFSis set properly, restore
# 006025                        the backup by executing the following commands: 




# 006030 cd $LFS &&
# 006031 rm -rf ./* &&
# 006032 tar -xpf $HOME/lfs-temp-tools-10.1.tar.xz



# 006036 
# 006037                          Again, double check that the environment has been setup properly and continue building
# 006038                        the rest of the system. 
# 006039          Important 
# 006040 
# 006041                          If you left the chroot environment either to strip off debug symbols, create a backup,
# 006042                        or restart building using a restore, remember to mount the kernel virtual filesystems
# 006043                        now again as described in Section 7.3, "Preparing Virtual Kernel File Systems" and
# 006044                        re-enter the chroot environment (see Section 7.4, "Entering the Chroot Environment" )
# 006045                        again before continuing.  
# 006046      Part IV. Building the LFS System  
# 006047        Chapter 8. Installing Basic System Software  
# 006048        8.1. Introduction 
# 006049 
# 006050                          In this chapter, we start constructing the LFS system in earnest. 
# 006051 
# 006052                          The installation of this software is straightforward. Although in many cases the
# 006053                        installation instructions could be made shorter and more generic, we have opted
# 006054                        to provide the full instructions for every package to minimize the possibilities
# 006055                        for mistakes. The key to learning what makes a Linux system work is to know what
# 006056                        each package is used for and why you (or the system) may need it. 
# 006057 
# 006058                          We do not recommend using optimizations. They can make a program run slightly faster,
# 006059                        but they may also cause compilation difficulties and problems when running the program.
# 006060                        If a package refuses to compile when using optimization, try to compile it without
# 006061                        optimization and see if that fixes the problem. Even if the package does compile
# 006062                        when using optimization, there is the risk it may have been compiled incorrectly
# 006063                        because of the complex interactions between the code and build tools. Also note
# 006064                        that the -marchand -mtuneoptions using values not specified in the book have not
# 006065                        been tested. This may cause problems with the toolchain packages (Binutils, GCC
# 006066                        and Glibc). The small potential gains achieved in using compiler optimizations are
# 006067                        often outweighed by the risks. First-time builders of LFS are encouraged to build
# 006068                        without custom optimizations. The subsequent system will still run very fast and
# 006069                        be stable at the same time. 
# 006070 
# 006071                          Before the installation instructions, each installation page provides information
# 006072                        about the package, including a concise description of what it contains, approximately
# 006073                        how long it will take to build, and how much disk space is required during this
# 006074                        building process. Following the installation instructions, there is a list of programs
# 006075                        and libraries (along with brief descriptions) that the package installs. 
# 006076          Note 
# 006077 
# 006078                          The SBU values and required disk space includes test suite data for all applicable
# 006079                        packages in Chapter 8 . SBU values have been calculated using a single CPU core (-j1)
# 006080                        for all operations. 
# 006081          8.1.1. About libraries 
# 006082 
# 006083                          In general, the LFS editors discourage building and installing static libraries.
# 006084                        The original purpose for most static libraries has been made obsolete in a modern
# 006085                        Linux system. In addition, linking a static library into a program can be detrimental.
# 006086                        If an update to the library is needed to remove a security problem, all programs
# 006087                        that use the static library will need to be relinked to the new library. Since the
# 006088                        use of static libraries is not always obvious, the relevant programs (and the procedures
# 006089                        needed to do the linking) may not even be known. 
# 006090 
# 006091                          In the procedures in this chapter, we remove or disable installation of most static
# 006092                        libraries. Usually this is done by passing a --disable-staticoption to configure  .
# 006093                        In other cases, alternate means are needed. In a few cases, especially glibc and
# 006094                        gcc, the use of static libraries remains essential to the general package building
# 006095                        process. 
# 006096 
# 006097                          For a more complete discussion of libraries, see the discussion Libraries: Static
# 006098                        or shared? in the BLFS book.  
# 006099        8.2. Package Management 
# 006100 
# 006101                          Package Management is an often requested addition to the LFS Book. A Package Manager
# 006102                        allows tracking the installation of files making it easy to remove and upgrade packages.
# 006103                        As well as the binary and library files, a package manager will handle the installation
# 006104                        of configuration files. Before you begin to wonder, NO;this section will not talk
# 006105                        about nor recommend any particular package manager. What it provides is a roundup
# 006106                        of the more popular techniques and how they work. The perfect package manager for
# 006107                        you may be among these techniques or may be a combination of two or more of these
# 006108                        techniques. This section briefly mentions issues that may arise when upgrading packages.
# 006109                        
# 006110 
# 006111                          Some reasons why no package manager is mentioned in LFS or BLFS include: 
# 006112 
# 006113                          Dealing with package management takes the focus away from the goals of these books;teaching
# 006114                        how a Linux system is built. 
# 006115 
# 006116                          There are multiple solutions for package management, each having its strengths and
# 006117                        drawbacks. Including one that satisfies all audiences is difficult. 
# 006118 
# 006119                          There are some hints written on the topic of package management. Visit the Hints
# 006120                        Project and see if one of them fits your need. 
# 006121          8.2.1. Upgrade Issues 
# 006122 
# 006123                          A Package Manager makes it easy to upgrade to newer versions when they are released.
# 006124                        Generally the instructions in the LFS and BLFS books can be used to upgrade to the
# 006125                        newer versions. Here are some points that you should be aware of when upgrading
# 006126                        packages, especially on a running system. 
# 006127 
# 006128                          If Glibc needs to be upgraded to a newer version, (e.g. from glibc-2.31 to glibc-2.32),
# 006129                        it is safer to rebuild LFS. Though you may  be able to rebuild all the packages in
# 006130                        their dependency order, we do not recommend it. 
# 006131 
# 006132                          If a package containing a shared library is updated, and if the name of the library
# 006133                        changes, then any the packages dynamically linked to the library need to be recompiled
# 006134                        in order to link against the newer library. (Note that there is no correlation between
# 006135                        the package version and the name of the library.) For example, consider a package
# 006136                        foo-1.2.3 that installs a shared library with name libfoo.so.1. If you upgrade the
# 006137                        package to a newer version foo-1.2.4 that installs a shared library with name libfoo.so.2.
# 006138                        In this case, any packages that are dynamically linked to libfoo.so.1need to be
# 006139                        recompiled to link against libfoo.so.2in order to use the new library version. You
# 006140                        should not remove the previous libraries unless all the dependent packages are recompiled.
# 006141                        
# 006142          8.2.2. Package Management Techniques 
# 006143 
# 006144                          The following are some common package management techniques. Before making a decision
# 006145                        on a package manager, do some research on the various techniques, particularly the
# 006146                        drawbacks of the particular scheme.  
# 006147            8.2.2.1. It is All in My Head! 
# 006148 
# 006149                          Yes, this is a package management technique. Some folks do not find the need for
# 006150                        a package manager because they know the packages intimately and know what files
# 006151                        are installed by each package. Some users also do not need any package management
# 006152                        because they plan on rebuilding the entire system when a package is changed.  
# 006153            8.2.2.2. Install in Separate Directories 
# 006154 
# 006155                          This is a simplistic package management that does not need any extra package to
# 006156                        manage the installations. Each package is installed in a separate directory. For
# 006157                        example, package foo-1.1 is installed in /usr/pkg/foo-1.1and a symlink is made from
# 006158                        /usr/pkg/footo /usr/pkg/foo-1.1. When installing a new version foo-1.2, it is installed
# 006159                        in /usr/pkg/foo-1.2and the previous symlink is replaced by a symlink to the new
# 006160                        version. 
# 006161 
# 006162                          Environment variables such as PATH, LD_LIBRARY_PATH, MANPATH, INFOPATHand CPPFLAGSneed
# 006163                        to be expanded to include /usr/pkg/foo. For more than a few packages, this scheme
# 006164                        becomes unmanageable.  
# 006165            8.2.2.3. Symlink Style Package Management 
# 006166 
# 006167                          This is a variation of the previous package management technique. Each package is
# 006168                        installed similar to the previous scheme. But instead of making the symlink, each
# 006169                        file is symlinked into the /usrhierarchy. This removes the need to expand the environment
# 006170                        variables. Though the symlinks can be created by the user to automate the creation,
# 006171                        many package managers have been written using this approach. A few of the popular
# 006172                        ones include Stow, Epkg, Graft, and Depot. 
# 006173 
# 006174                          The installation needs to be faked, so that the package thinks that it is installed
# 006175                        in /usrthough in reality it is installed in the /usr/pkghierarchy. Installing in
# 006176                        this manner is not usually a trivial task. For example, consider that you are installing
# 006177                        a package libfoo-1.1. The following instructions may not install the package properly:
# 006178                        



# 006182 ./configure --prefix=/usr/pkg/libfoo/1.1
# 006183 make
# 006184 make install
# 006185 


# 006188 
# 006189                          The installation will work, but the dependent packages may not link to libfoo as
# 006190                        you would expect. If you compile a package that links against libfoo, you may notice
# 006191                        that it is linked to /usr/pkg/libfoo/1.1/lib/libfoo.so.1instead of /usr/lib/libfoo.so.1as
# 006192                        you would expect. The correct approach is to use the DESTDIRstrategy to fake installation
# 006193                        of the package. This approach works as follows: 



# 006197 ./configure --prefix=/usr
# 006198 make
# 006199 make DESTDIR=/usr/pkg/libfoo/1.1 install
# 006200 


# 006203 
# 006204                          Most packages support this approach, but there are some which do not. For the non-compliant
# 006205                        packages, you may either need to manually install the package, or you may find that
# 006206                        it is easier to install some problematic packages into /opt.  
# 006207            8.2.2.4. Timestamp Based 
# 006208 
# 006209                          In this technique, a file is timestamped before the installation of the package.
# 006210                        After the installation, a simple use of the find  command with the appropriate options
# 006211                        can generate a log of all the files installed after the timestamp file was created.
# 006212                        A package manager written with this approach is install-log. 
# 006213 
# 006214                          Though this scheme has the advantage of being simple, it has two drawbacks. If,
# 006215                        during installation, the files are installed with any timestamp other than the current
# 006216                        time, those files will not be tracked by the package manager. Also, this scheme
# 006217                        can only be used when one package is installed at a time. The logs are not reliable
# 006218                        if two packages are being installed on two different consoles.  
# 006219            8.2.2.5. Tracing Installation Scripts 
# 006220 
# 006221                          In this approach, the commands that the installation scripts perform are recorded.
# 006222                        There are two techniques that one can use: 
# 006223 
# 006224                          The LD_PRELOADenvironment variable can be set to point to a library to be preloaded
# 006225                        before installation. During installation, this library tracks the packages that
# 006226                        are being installed by attaching itself to various executables such as cp  , install  ,
# 006227                        mv  and tracking the system calls that modify the filesystem. For this approach to
# 006228                        work, all the executables need to be dynamically linked without the suid or sgid
# 006229                        bit. Preloading the library may cause some unwanted side-effects during installation.
# 006230                        Therefore, it is advised that one performs some tests to ensure that the package
# 006231                        manager does not break anything and logs all the appropriate files. 
# 006232 
# 006233                          The second technique is to use strace  , which logs all system calls made during the
# 006234                        execution of the installation scripts.  
# 006235            8.2.2.6. Creating Package Archives 
# 006236 
# 006237                          In this scheme, the package installation is faked into a separate tree as described
# 006238                        in the Symlink style package management. After the installation, a package archive
# 006239                        is created using the installed files. This archive is then used to install the package
# 006240                        either on the local machine or can even be used to install the package on other
# 006241                        machines. 
# 006242 
# 006243                          This approach is used by most of the package managers found in the commercial distributions.
# 006244                        Examples of package managers that follow this approach are RPM (which, incidentally,
# 006245                        is required by the Linux Standard Base Specification ), pkg-utils, Debian's apt,
# 006246                        and Gentoo's Portage system. A hint describing how to adopt this style of package
# 006247                        management for LFS systems is located at http://www.linuxfromscratch.org/hints/downloads/files/fakeroot.txt .
# 006248                        
# 006249 
# 006250                          Creation of package files that include dependency information is complex and is
# 006251                        beyond the scope of LFS. 
# 006252 
# 006253                          Slackware uses a tar  based system for package archives. This system purposely does
# 006254                        not handle package dependencies as more complex package managers do. For details
# 006255                        of Slackware package management, see http://www.slackbook.org/html/package-management.html .
# 006256                         
# 006257            8.2.2.7. User Based Management 
# 006258 
# 006259                          This scheme, unique to LFS, was devised by Matthias Benkmann, and is available from
# 006260                        the Hints Project . In this scheme, each package is installed as a separate user
# 006261                        into the standard locations. Files belonging to a package are easily identified
# 006262                        by checking the user ID. The features and shortcomings of this approach are too
# 006263                        complex to describe in this section. For the details please see the hint at http://www.linuxfromscratch.org/hints/downloads/files/more_control_and_pkg_man.txt .
# 006264                        
# 006265          8.2.3. Deploying LFS on Multiple Systems 
# 006266 
# 006267                          One of the advantages of an LFS system is that there are no files that depend on
# 006268                        the position of files on a disk system. Cloning an LFS build to another computer
# 006269                        with the same architecture as the base system is as simple as using tar  on the LFS
# 006270                        partition that contains the root directory (about 250MB uncompressed for a base
# 006271                        LFS build), copying that file via network transfer or CD-ROM to the new system and
# 006272                        expanding it. From that point, a few configuration files will have to be changed.
# 006273                        Configuration files that may need to be updated include: /etc/hosts, /etc/fstab,
# 006274                        /etc/passwd, /etc/group, /etc/shadow, /etc/ld.so.conf, /etc/sysconfig/rc.site, /etc/sysconfig/network,
# 006275                        and /etc/sysconfig/ifconfig.eth0. 
# 006276 
# 006277                          A custom kernel may need to be built for the new system depending on differences
# 006278                        in system hardware and the original kernel configuration. 
# 006279          Note 
# 006280 
# 006281                          There have been some reports of issues when copying between similar but not identical
# 006282                        architectures. For instance, the instruction set for an Intel system is not identical
# 006283                        with an AMD processor and later versions of some processors may have instructions
# 006284                        that are unavailable in earlier versions. 
# 006285 
# 006286                          Finally the new system has to be made bootable via Section 10.4, "Using GRUB to
# 006287                        Set Up the Boot Process" . 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'man-pages-*')
tar xf $(find -maxdepth 1 -type f -name 'man-pages-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'man-pages-*')
read -p "Chapter 8.3"
 
# 006288        8.3. Man-pages-5.10 
# 006289 
# 006290                          The Man-pages package contains over 2,200 man pages. 
# 006291           Approximate build time: less than 0.1 SBU
# 006292           Required disk space: 4.7 MB 
# 006293          8.3.1. Installation of Man-pages 
# 006294 
# 006295                          Install Man-pages by running: 



make install


 
# 006303          8.3.2. Contents of Man-pages 
# 006304           Installed files: various man pages  
# 006305            Short Descriptions  
# 006306 
# 006307                          
# 006308 
# 006309                man pages 
# 006310 
# 006311                          Describe C programming language functions, important device files, and significant
# 006312                        configuration files 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'iana-etc-*')
tar xf $(find -maxdepth 1 -type f -name 'iana-etc-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'iana-etc-*')
read -p "Chapter 8.4"
 
# 006313        8.4. Iana-Etc-20210202 
# 006314 
# 006315                          The Iana-Etc package provides data for network services and protocols. 
# 006316           Approximate build time: less than 0.1 SBU
# 006317           Required disk space: 4.7 MB 
# 006318          8.4.1. Installation of Iana-Etc 
# 006319 
# 006320                          For this package, we only need to copy the files into place: 



cp services protocols /etc


 
# 006328          8.4.2. Contents of Iana-Etc 
# 006329           Installed files: /etc/protocols and /etc/services  
# 006330            Short Descriptions  
# 006331 
# 006332                          
# 006333 
# 006334                /etc/protocols 
# 006335 
# 006336                          Describes the various DARPA Internet protocols that are available from the TCP/IP
# 006337                        subsystem  
# 006338 
# 006339                          /etc/services 
# 006340 
# 006341                          Provides a mapping between friendly textual names for internet services, and their
# 006342                        underlying assigned port numbers and protocol types 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'glibc-*')
tar xf $(find -maxdepth 1 -type f -name 'glibc-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'glibc-*')
read -p "Chapter 8.5"
 
# 006343        8.5. Glibc-2.33 
# 006344 
# 006345                          The Glibc package contains the main C library. This library provides the basic routines
# 006346                        for allocating memory, searching directories, opening and closing files, reading
# 006347                        and writing files, string handling, pattern matching, arithmetic, and so on. 
# 006348           Approximate build time: 19 SBU
# 006349           Required disk space: 2.5 GB 
# 006350          8.5.1. Installation of Glibc 
# 006351 
# 006352                          Some of the Glibc programs use the non-FHS compliant /var/dbdirectory to store their
# 006353                        runtime data. Apply the following patch to make such programs store their runtime
# 006354                        data in the FHS-compliant locations: 



patch -Np1 -i ../glibc-2.33-fhs-1.patch



# 006362 
# 006363                          Fix a bug that causes issues with chrooted applications: 



sed -e '402a\      *result = local->data.services[database_index];' \
    -i nss/nss_database.c



# 006372 
# 006373                          The Glibc documentation recommends building Glibc in a dedicated build directory:
# 006374                        



mkdir -v build
cd       build



# 006383 
# 006384                          Prepare Glibc for compilation: 



../configure --prefix=/usr                            \
             --disable-werror                         \
             --enable-kernel=3.2                      \
             --enable-stack-protector=strong          \
             --with-headers=/usr/include              \
             libc_cv_slibdir=/lib



# 006397 
# 006398                          The meaning of the configure options: 
# 006399 
# 006400                --disable-werror  
# 006401 
# 006402                          This option disables the -Werror option passed to GCC. This is necessary for running
# 006403                        the test suite. 
# 006404 
# 006405                --enable-kernel=3.2  
# 006406 
# 006407                          This option tells the build system that this glibc may be used with kernels as old
# 006408                        as 3.2. This means generating workarounds in case a system call introduced in a
# 006409                        later version cannot be used. 
# 006410 
# 006411                --enable-stack-protector=strong  
# 006412 
# 006413                          This option increases system security by adding extra code to check for buffer overflows,
# 006414                        such as stack smashing attacks. 
# 006415 
# 006416                --with-headers=/usr/include  
# 006417 
# 006418                          This option tells the build system where to find the kernel API headers. 
# 006419 
# 006420                libc_cv_slibdir=/lib  
# 006421 
# 006422                          This variable sets the correct library for all systems. We do not want lib64 to
# 006423                        be used. 
# 006424 
# 006425                libc_cv_include_x86_isa_level=no 
# 006426 
# 006427                          This disables "x86 ISA needed " property in Glibc libraries. Use it if  you are building
# 006428                        Glibc with -marchoption in CFLAGS, to workaround an issue in Glibc-2.33 breaking
# 006429                        it. 
# 006430 
# 006431                          Compile the package: 



make



# 006439          Important 
# 006440 
# 006441                          In this section, the test suite for Glibc is considered critical. Do not skip it
# 006442                        under any circumstance. 
# 006443 
# 006444                          Generally a few tests do not pass. The test failures listed below are usually safe
# 006445                        to ignore. 



make check



# 006453 
# 006454                          You may see some test failures. The Glibc test suite is somewhat dependent on the
# 006455                        host system. This is a list of the most common issues seen for some versions of
# 006456                        LFS: 
# 006457 
# 006458                          io/tst-lchmod  is known to fail in the LFS chroot environment. 
# 006459 
# 006460                          misc/tst-ttyname  is known to fail in the LFS chroot environment. 
# 006461 
# 006462                          elf/tst-cpu-features-cpuinfo  may fail on some architectures. 
# 006463 
# 006464                          The nss/tst-nss-files-hosts-multi  test may fail for reasons that have not been determined.
# 006465                        
# 006466 
# 006467                          The rt/tst-cputimer{1,2,3}  tests depend on the host system kernel. Kernels 4.14.91-4.14.96,
# 006468                        4.19.13-4.19.18, and 4.20.0-4.20.5 are known to cause these tests to fail. 
# 006469 
# 006470                          The math tests sometimes fail when running on systems where the CPU is not a relatively
# 006471                        new Intel or AMD processor. 
# 006472 
# 006473                          Though it is a harmless message, the install stage of Glibc will complain about
# 006474                        the absence of /etc/ld.so.conf. Prevent this warning with: 



touch /etc/ld.so.conf



# 006482 
# 006483                          Fix the generated Makefile to skip an unneeded sanity check that fails in the LFS
# 006484                        partial environment: 



sed '/test-installation/s@$(PERL)@echo not running@' -i ../Makefile



# 006492 
# 006493                          Install the package: 



make install



# 006501 
# 006502                          Install the configuration file and runtime directory for nscd  : 



cp -v ../nscd/nscd.conf /etc/nscd.conf
mkdir -pv /var/cache/nscd



# 006511 
# 006512                          Next, install the locales that can make the system respond in a different language.
# 006513                        None of the locales are required, but if some of them are missing, the test suites
# 006514                        of future packages would skip important testcases. 
# 006515 
# 006516                          Individual locales can be installed using the localedef  program. E.g., the first
# 006517                        localedef  command below combines the /usr/share/i18n/locales/cs_CZcharset-independent
# 006518                        locale definition with the /usr/share/i18n/charmaps/UTF-8.gzcharmap definition and
# 006519                        appends the result to the /usr/lib/locale/locale-archivefile. The following instructions
# 006520                        will install the minimum set of locales necessary for the optimal coverage of tests:
# 006521                        



mkdir -pv /usr/lib/locale
localedef -i POSIX -f UTF-8 C.UTF-8 2> /dev/null || true
localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8
localedef -i de_DE -f ISO-8859-1 de_DE
localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
localedef -i de_DE -f UTF-8 de_DE.UTF-8
localedef -i el_GR -f ISO-8859-7 el_GR
localedef -i en_GB -f UTF-8 en_GB.UTF-8
localedef -i en_HK -f ISO-8859-1 en_HK
localedef -i en_PH -f ISO-8859-1 en_PH
localedef -i en_US -f ISO-8859-1 en_US
localedef -i en_US -f UTF-8 en_US.UTF-8
localedef -i es_MX -f ISO-8859-1 es_MX
localedef -i fa_IR -f UTF-8 fa_IR
localedef -i fr_FR -f ISO-8859-1 fr_FR
localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro
localedef -i fr_FR -f UTF-8 fr_FR.UTF-8
localedef -i it_IT -f ISO-8859-1 it_IT
localedef -i it_IT -f UTF-8 it_IT.UTF-8
localedef -i ja_JP -f EUC-JP ja_JP
localedef -i ja_JP -f SHIFT_JIS ja_JP.SIJS 2> /dev/null || true
localedef -i ja_JP -f UTF-8 ja_JP.UTF-8
localedef -i ru_RU -f KOI8-R ru_RU.KOI8-R
localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
localedef -i tr_TR -f UTF-8 tr_TR.UTF-8
localedef -i zh_CN -f GB18030 zh_CN.GB18030
localedef -i zh_HK -f BIG5-HKSCS zh_HK.BIG5-HKSCS



# 006555 
# 006556                          In addition, install the locale for your own country, language and character set.
# 006557                        
# 006558 
# 006559                          Alternatively, install all locales listed in the glibc-2.33/localedata/SUPPORTEDfile
# 006560                        (it includes every locale listed above and many more) at once with the following
# 006561                        time-consuming command: 



make localedata/install-locales



# 006569 
# 006570                          Then use the localedef  command to create and install locales not listed in the glibc-2.33/localedata/SUPPORTEDfile
# 006571                        in the unlikely case you need them. 
# 006572          Note 
# 006573 
# 006574                          Glibc now uses libidn2 when resolving internationalized domain names. This is a
# 006575                        run time dependency. If this capability is needed, the instructions for installing
# 006576                        libidn2 are in the BLFS libidn2 page .  
# 006577          8.5.2. Configuring Glibc  
# 006578            8.5.2.1. Adding nsswitch.conf 
# 006579 
# 006580                          The /etc/nsswitch.conffile needs to be created because the Glibc defaults do not
# 006581                        work well in a networked environment. 
# 006582 
# 006583                          Create a new file /etc/nsswitch.confby running the following: 



cat > /etc/nsswitch.conf << "EOF"
# Begin /etc/nsswitch.conf

passwd: files
group: files
shadow: files

hosts: files dns
networks: files

protocols: files
services: files
ethers: files
rpc: files

# End /etc/nsswitch.conf
EOF


 
# 006607            8.5.2.2. Adding time zone data 
# 006608 
# 006609                          Install and set up the time zone data with the following: 



tar -xf ../../tzdata2021a.tar.gz

ZONEINFO=/usr/share/zoneinfo
mkdir -pv $ZONEINFO/{posix,right}

for tz in etcetera southamerica northamerica europe africa antarctica  \
          asia australasia backward; do
    zic -L /dev/null   -d $ZONEINFO       ${tz}
    zic -L /dev/null   -d $ZONEINFO/posix ${tz}
    zic -L leapseconds -d $ZONEINFO/right ${tz}
done

cp -v zone.tab zone1970.tab iso3166.tab $ZONEINFO
zic -d $ZONEINFO -p America/New_York
unset ZONEINFO



# 006631 
# 006632                          The meaning of the zic commands: 
# 006633 
# 006634                zic -L /dev/null ...  
# 006635 
# 006636                          This creates posix time zones without any leap seconds. It is conventional to put
# 006637                        these in both zoneinfoand zoneinfo/posix. It is necessary to put the POSIX time
# 006638                        zones in zoneinfo, otherwise various test-suites will report errors. On an embedded
# 006639                        system, where space is tight and you do not intend to ever update the time zones,
# 006640                        you could save 1.9 MB by not using the posixdirectory, but some applications or
# 006641                        test-suites might produce some failures. 
# 006642 
# 006643                zic -L leapseconds ...  
# 006644 
# 006645                          This creates right time zones, including leap seconds. On an embedded system, where
# 006646                        space is tight and you do not intend to ever update the time zones, or care about
# 006647                        the correct time, you could save 1.9MB by omitting the rightdirectory. 
# 006648 
# 006649                zic ... -p ...  
# 006650 
# 006651                          This creates the posixrulesfile. We use New York because POSIX requires the daylight
# 006652                        savings time rules to be in accordance with US rules. 
# 006653 
# 006654                          One way to determine the local time zone is to run the following script: 



tzselect



# 006662 
# 006663                          After answering a few questions about the location, the script will output the name
# 006664                        of the time zone (e.g., America/Edmonton  ). There are also some other possible time
# 006665                        zones listed in /usr/share/zoneinfosuch as Canada/Eastern  or EST5EDT  that are not
# 006666                        identified by the script but can be used. 
# 006667 
# 006668                          Then create the /etc/localtimefile by running: 



ln -sfv /usr/share/zoneinfo/<xxx> /etc/localtime


 
# 006676 
# 006677                          Replace <xxx> with the name of the time zone selected (e.g., Canada/Eastern).  
# 006678            8.5.2.3. Configuring the Dynamic Loader 
# 006679 
# 006680                          By default, the dynamic loader (/lib/ld-linux.so.2) searches through /liband /usr/libfor
# 006681                        dynamic libraries that are needed by programs as they are run. However, if there
# 006682                        are libraries in directories other than /liband /usr/lib, these need to be added
# 006683                        to the /etc/ld.so.conffile in order for the dynamic loader to find them. Two directories
# 006684                        that are commonly known to contain additional libraries are /usr/local/liband /opt/lib,
# 006685                        so add those directories to the dynamic loader's search path. 
# 006686 
# 006687                          Create a new file /etc/ld.so.confby running the following: 



cat > /etc/ld.so.conf << "EOF"
# Begin /etc/ld.so.conf
/usr/local/lib
/opt/lib

EOF



# 006700 
# 006701                          If desired, the dynamic loader can also search a directory and include the contents
# 006702                        of files found there. Generally the files in this include directory are one line
# 006703                        specifying the desired library path. To add this capability run the following commands:
# 006704                        



cat >> /etc/ld.so.conf << "EOF"
# Add an include directory
include /etc/ld.so.conf.d/*.conf

EOF
mkdir -pv /etc/ld.so.conf.d


 
# 006717          8.5.3. Contents of Glibc 
# 006718           Installed programs: catchsegv, gencat, getconf, getent, iconv, iconvconfig, ldconfig, ldd, lddlibc4, locale, localedef, makedb, mtrace, nscd, pcprofiledump, pldd, sln, sotruss, sprof, tzselect, xtrace, zdump, and zic
# 006719           Installed libraries: ld-2.33.so, libBrokenLocale.{a,so}, libSegFault.so, libanl.{a,so}, libc.{a,so}, libc_nonshared.a, libcrypt.{a,so}, libdl.{a,so}, libg.a, libm.{a,so}, libmcheck.a, libmemusage.so, libmvec.{a,so}, libnsl.{a,so}, libnss_compat.so, libnss_dns.so, libnss_files.so, libnss_hesiod.so, libpcprofile.so, libpthread.{a,so}, libpthread_nonshared.a, libresolv.{a,so}, librt.{a,so}, libthread_db.so, and libutil.{a,so}
# 006720           Installed directories: /usr/include/arpa, /usr/include/bits, /usr/include/gnu, /usr/include/net, /usr/include/netash, /usr/include/netatalk, /usr/include/netax25, /usr/include/neteconet, /usr/include/netinet, /usr/include/netipx, /usr/include/netiucv, /usr/include/netpacket, /usr/include/netrom, /usr/include/netrose, /usr/include/nfs, /usr/include/protocols, /usr/include/rpc, /usr/include/sys, /usr/lib/audit, /usr/lib/gconv, /usr/lib/locale, /usr/libexec/getconf, /usr/share/i18n, /usr/share/zoneinfo, /var/cache/nscd, and /var/lib/nss_db  
# 006721            Short Descriptions  
# 006722 
# 006723                          
# 006724 
# 006725                catchsegv   
# 006726 
# 006727                          Can be used to create a stack trace when a program terminates with a segmentation
# 006728                        fault  
# 006729 
# 006730                          gencat   
# 006731 
# 006732                          Generates message catalogues  
# 006733 
# 006734                          getconf   
# 006735 
# 006736                          Displays the system configuration values for file system specific variables  
# 006737 
# 006738                          getent   
# 006739 
# 006740                          Gets entries from an administrative database  
# 006741 
# 006742                          iconv   
# 006743 
# 006744                          Performs character set conversion  
# 006745 
# 006746                          iconvconfig   
# 006747 
# 006748                          Creates fastloading iconv  module configuration files  
# 006749 
# 006750                          ldconfig   
# 006751 
# 006752                          Configures the dynamic linker runtime bindings  
# 006753 
# 006754                          ldd   
# 006755 
# 006756                          Reports which shared libraries are required by each given program or shared library
# 006757                         
# 006758 
# 006759                          lddlibc4   
# 006760 
# 006761                          Assists ldd  with object files  
# 006762 
# 006763                          locale   
# 006764 
# 006765                          Prints various information about the current locale  
# 006766 
# 006767                          localedef   
# 006768 
# 006769                          Compiles locale specifications  
# 006770 
# 006771                          makedb   
# 006772 
# 006773                          Creates a simple database from textual input  
# 006774 
# 006775                          mtrace   
# 006776 
# 006777                          Reads and interprets a memory trace file and displays a summary in human-readable
# 006778                        format  
# 006779 
# 006780                          nscd   
# 006781 
# 006782                          A daemon that provides a cache for the most common name service requests  
# 006783 
# 006784                          pcprofiledump   
# 006785 
# 006786                          Dump information generated by PC profiling  
# 006787 
# 006788                          pldd   
# 006789 
# 006790                          Lists dynamic shared objects used by running processes  
# 006791 
# 006792                          sln   
# 006793 
# 006794                          A statically linked ln  program  
# 006795 
# 006796                          sotruss   
# 006797 
# 006798                          Traces shared library procedure calls of a specified command  
# 006799 
# 006800                          sprof   
# 006801 
# 006802                          Reads and displays shared object profiling data  
# 006803 
# 006804                          tzselect   
# 006805 
# 006806                          Asks the user about the location of the system and reports the corresponding time
# 006807                        zone description  
# 006808 
# 006809                          xtrace   
# 006810 
# 006811                          Traces the execution of a program by printing the currently executed function  
# 006812 
# 006813                          zdump   
# 006814 
# 006815                          The time zone dumper  
# 006816 
# 006817                          zic   
# 006818 
# 006819                          The time zone compiler  
# 006820 
# 006821                          ld-2.33.so 
# 006822 
# 006823                          The helper program for shared library executables  
# 006824 
# 006825                          libBrokenLocale 
# 006826 
# 006827                          Used internally by Glibc as a gross hack to get broken programs (e.g., some Motif
# 006828                        applications) running. See comments in glibc-2.33/locale/broken_cur_max.cfor more
# 006829                        information  
# 006830 
# 006831                          libSegFault 
# 006832 
# 006833                          The segmentation fault signal handler, used by catchsegv   
# 006834 
# 006835                          libanl 
# 006836 
# 006837                          An asynchronous name lookup library  
# 006838 
# 006839                          libc 
# 006840 
# 006841                          The main C library  
# 006842 
# 006843                          libcrypt 
# 006844 
# 006845                          The cryptography library  
# 006846 
# 006847                          libdl 
# 006848 
# 006849                          The dynamic linking interface library  
# 006850 
# 006851                          libg 
# 006852 
# 006853                          Dummy library containing no functions. Previously was a runtime library for g++   
# 006854 
# 006855                          libm 
# 006856 
# 006857                          The mathematical library  
# 006858 
# 006859                          libmcheck 
# 006860 
# 006861                          Turns on memory allocation checking when linked to  
# 006862 
# 006863                          libmemusage 
# 006864 
# 006865                          Used by memusage  to help collect information about the memory usage of a program
# 006866                         
# 006867 
# 006868                          libnsl 
# 006869 
# 006870                          The network services library  
# 006871 
# 006872                          libnss 
# 006873 
# 006874                          The Name Service Switch libraries, containing functions for resolving host names,
# 006875                        user names, group names, aliases, services, protocols, etc.  
# 006876 
# 006877                          libpcprofile 
# 006878 
# 006879                          Can be preloaded to PC profile an executable  
# 006880 
# 006881                          libpthread 
# 006882 
# 006883                          The POSIX threads library  
# 006884 
# 006885                          libresolv 
# 006886 
# 006887                          Contains functions for creating, sending, and interpreting packets to the Internet
# 006888                        domain name servers  
# 006889 
# 006890                          librt 
# 006891 
# 006892                          Contains functions providing most of the interfaces specified by the POSIX.1b Realtime
# 006893                        Extension  
# 006894 
# 006895                          libthread_db 
# 006896 
# 006897                          Contains functions useful for building debuggers for multi-threaded programs  
# 006898 
# 006899                          libutil 
# 006900 
# 006901                          Contains code for "standard " functions used in many different Unix utilities 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'zlib-*')
tar xf $(find -maxdepth 1 -type f -name 'zlib-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'zlib-*')
read -p "Chapter 8.6"
 
# 006902        8.6. Zlib-1.2.11 
# 006903 
# 006904                          The Zlib package contains compression and decompression routines used by some programs.
# 006905                        
# 006906           Approximate build time: less than 0.1 SBU
# 006907           Required disk space: 5.0 MB 
# 006908          8.6.1. Installation of Zlib 
# 006909 
# 006910                          Prepare Zlib for compilation: 



./configure --prefix=/usr



# 006918 
# 006919                          Compile the package: 



make



# 006927 
# 006928                          To test the results, issue: 



make check



# 006936 
# 006937                          Install the package: 



make install



# 006945 
# 006946                          The shared library needs to be moved to /lib, and as a result the .sofile in /usr/libwill
# 006947                        need to be recreated: 



mv -v /usr/lib/libz.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libz.so) /usr/lib/libz.so



# 006956 
# 006957                          Remove an useless static library: 



rm -fv /usr/lib/libz.a


 
# 006965          8.6.2. Contents of Zlib 
# 006966           Installed libraries: libz.so  
# 006967            Short Descriptions  
# 006968 
# 006969                          
# 006970 
# 006971                libz 
# 006972 
# 006973                          Contains compression and decompression functions used by some programs 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'bzip-*')
tar xf $(find -maxdepth 1 -type f -name 'bzip-*.gz' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'bzip-*')
read -p "Chapter 8.7"
 
# 006974        8.7. Bzip2-1.0.8 
# 006975 
# 006976                          The Bzip2 package contains programs for compressing and decompressing files. Compressing
# 006977                        text files with bzip2  yields a much better compression percentage than with the traditional
# 006978                        gzip  . 
# 006979           Approximate build time: less than 0.1 SBU
# 006980           Required disk space: 7.5 MB 
# 006981          8.7.1. Installation of Bzip2 
# 006982 
# 006983                          Apply a patch that will install the documentation for this package: 



patch -Np1 -i ../bzip2-1.0.8-install_docs-1.patch



# 006991 
# 006992                          The following command ensures installation of symbolic links are relative: 



sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile



# 007000 
# 007001                          Ensure the man pages are installed into the correct location: 



sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile



# 007009 
# 007010                          Prepare Bzip2 for compilation with: 



make -f Makefile-libbz2_so
make clean



# 007019 
# 007020                          The meaning of the make parameter: 
# 007021 
# 007022                -f Makefile-libbz2_so  
# 007023 
# 007024                          This will cause Bzip2 to be built using a different Makefilefile, in this case the
# 007025                        Makefile-libbz2_sofile, which creates a dynamic libbz2.solibrary and links the Bzip2
# 007026                        utilities against it. 
# 007027 
# 007028                          Compile and test the package: 



make



# 007036 
# 007037                          Install the programs: 



make PREFIX=/usr install



# 007045 
# 007046                          Install the shared bzip2  binary into the /bindirectory, make some necessary symbolic
# 007047                        links, and clean up: 



cp -v bzip2-shared /bin/bzip2
cp -av libbz2.so* /lib
ln -sv ../../lib/libbz2.so.1.0 /usr/lib/libbz2.so
rm -v /usr/bin/{bunzip2,bzcat,bzip2}
ln -sv bzip2 /bin/bunzip2
ln -sv bzip2 /bin/bzcat



# 007060 
# 007061                          Remove an useless static library: 



rm -fv /usr/lib/libbz2.a


 
# 007069          8.7.2. Contents of Bzip2 
# 007070           Installed programs: bunzip2 (link to bzip2), bzcat (link to bzip2), bzcmp (link to bzdiff), bzdiff, bzegrep (link to bzgrep), bzfgrep (link to bzgrep), bzgrep, bzip2, bzip2recover, bzless (link to bzmore), and bzmore
# 007071           Installed libraries: libbz2.so
# 007072           Installed directory: /usr/share/doc/bzip2-1.0.8  
# 007073            Short Descriptions  
# 007074 
# 007075                          
# 007076 
# 007077                bunzip2   
# 007078 
# 007079                          Decompresses bzipped files  
# 007080 
# 007081                          bzcat   
# 007082 
# 007083                          Decompresses to standard output  
# 007084 
# 007085                          bzcmp   
# 007086 
# 007087                          Runs cmp  on bzipped files  
# 007088 
# 007089                          bzdiff   
# 007090 
# 007091                          Runs diff  on bzipped files  
# 007092 
# 007093                          bzegrep   
# 007094 
# 007095                          Runs egrep  on bzipped files  
# 007096 
# 007097                          bzfgrep   
# 007098 
# 007099                          Runs fgrep  on bzipped files  
# 007100 
# 007101                          bzgrep   
# 007102 
# 007103                          Runs grep  on bzipped files  
# 007104 
# 007105                          bzip2   
# 007106 
# 007107                          Compresses files using the Burrows-Wheeler block sorting text compression algorithm
# 007108                        with Huffman coding; the compression rate is better than that achieved by more conventional
# 007109                        compressors using "Lempel-Ziv " algorithms, like gzip   
# 007110 
# 007111                          bzip2recover   
# 007112 
# 007113                          Tries to recover data from damaged bzipped files  
# 007114 
# 007115                          bzless   
# 007116 
# 007117                          Runs less  on bzipped files  
# 007118 
# 007119                          bzmore   
# 007120 
# 007121                          Runs more  on bzipped files  
# 007122 
# 007123                          libbz2 
# 007124 
# 007125                          The library implementing lossless, block-sorting data compression, using the Burrows-Wheeler
# 007126                        algorithm 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name '.xz-*')
tar xf $(find -maxdepth 1 -type f -name '.xz-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name '.xz-*')
read -p "Chapter 8.8"
 
# 007127        8.8. Xz-5.2.5 
# 007128 
# 007129                          The Xz package contains programs for compressing and decompressing files. It provides
# 007130                        capabilities for the lzma and the newer xz compression formats. Compressing text
# 007131                        files with xz  yields a better compression percentage than with the traditional gzip  or
# 007132                        bzip2  commands. 
# 007133           Approximate build time: 0.2 SBU
# 007134           Required disk space: 15 MB 
# 007135          8.8.1. Installation of Xz 
# 007136 
# 007137                          Prepare Xz for compilation with: 



./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.2.5



# 007147 
# 007148                          Compile the package: 



make



# 007156 
# 007157                          To test the results, issue: 



make check



# 007165 
# 007166                          Install the package and make sure that all essential files are in the correct directory:
# 007167                        



make install
mv -v   /usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat} /bin
mv -v /usr/lib/liblzma.so.* /lib
ln -svf ../../lib/$(readlink /usr/lib/liblzma.so) /usr/lib/liblzma.so


 
# 007178          8.8.2. Contents of Xz 
# 007179           Installed programs: lzcat (link to xz), lzcmp (link to xzdiff), lzdiff (link to xzdiff), lzegrep (link to xzgrep), lzfgrep (link to xzgrep), lzgrep (link to xzgrep), lzless (link to xzless), lzma (link to xz), lzmadec, lzmainfo, lzmore (link to xzmore), unlzma (link to xz), unxz (link to xz), xz, xzcat (link to xz), xzcmp (link to xzdiff), xzdec, xzdiff, xzegrep (link to xzgrep), xzfgrep (link to xzgrep), xzgrep, xzless, and xzmore
# 007180           Installed libraries: liblzma.so
# 007181           Installed directories: /usr/include/lzma and /usr/share/doc/xz-5.2.5  
# 007182            Short Descriptions  
# 007183 
# 007184                          
# 007185 
# 007186                lzcat   
# 007187 
# 007188                          Decompresses to standard output  
# 007189 
# 007190                          lzcmp   
# 007191 
# 007192                          Runs cmp  on LZMA compressed files  
# 007193 
# 007194                          lzdiff   
# 007195 
# 007196                          Runs diff  on LZMA compressed files  
# 007197 
# 007198                          lzegrep   
# 007199 
# 007200                          Runs egrep  on LZMA compressed files  
# 007201 
# 007202                          lzfgrep   
# 007203 
# 007204                          Runs fgrep  on LZMA compressed files  
# 007205 
# 007206                          lzgrep   
# 007207 
# 007208                          Runs grep  on LZMA compressed files  
# 007209 
# 007210                          lzless   
# 007211 
# 007212                          Runs less  on LZMA compressed files  
# 007213 
# 007214                          lzma   
# 007215 
# 007216                          Compresses or decompresses files using the LZMA format  
# 007217 
# 007218                          lzmadec   
# 007219 
# 007220                          A small and fast decoder for LZMA compressed files  
# 007221 
# 007222                          lzmainfo   
# 007223 
# 007224                          Shows information stored in the LZMA compressed file header  
# 007225 
# 007226                          lzmore   
# 007227 
# 007228                          Runs more  on LZMA compressed files  
# 007229 
# 007230                          unlzma   
# 007231 
# 007232                          Decompresses files using the LZMA format  
# 007233 
# 007234                          unxz   
# 007235 
# 007236                          Decompresses files using the XZ format  
# 007237 
# 007238                          xz   
# 007239 
# 007240                          Compresses or decompresses files using the XZ format  
# 007241 
# 007242                          xzcat   
# 007243 
# 007244                          Decompresses to standard output  
# 007245 
# 007246                          xzcmp   
# 007247 
# 007248                          Runs cmp  on XZ compressed files  
# 007249 
# 007250                          xzdec   
# 007251 
# 007252                          A small and fast decoder for XZ compressed files  
# 007253 
# 007254                          xzdiff   
# 007255 
# 007256                          Runs diff  on XZ compressed files  
# 007257 
# 007258                          xzegrep   
# 007259 
# 007260                          Runs egrep  on XZ compressed files  
# 007261 
# 007262                          xzfgrep   
# 007263 
# 007264                          Runs fgrep  on XZ compressed files  
# 007265 
# 007266                          xzgrep   
# 007267 
# 007268                          Runs grep  on XZ compressed files  
# 007269 
# 007270                          xzless   
# 007271 
# 007272                          Runs less  on XZ compressed files  
# 007273 
# 007274                          xzmore   
# 007275 
# 007276                          Runs more  on XZ compressed files  
# 007277 
# 007278                          liblzma 
# 007279 
# 007280                          The library implementing lossless, block-sorting data compression, using the Lempel-Ziv-Markov
# 007281                        chain algorithm 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'zstd-*')
tar xf $(find -maxdepth 1 -type f -name 'zstd-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'zstd-*')
read -p "Chapter 8.9"
 
# 007282        8.9. Zstd-1.4.8 
# 007283 
# 007284                          Zstandard is a real-time compression algorithm, providing high compression ratios.
# 007285                        It offers a very wide range of compression / speed trade-offs, while being backed
# 007286                        by a very fast decoder. 
# 007287           Approximate build time: 1.1 SBU
# 007288           Required disk space: 59 MB 
# 007289          8.9.1. Installation of Zstd 
# 007290 
# 007291                          Compile the package: 



make



# 007299 
# 007300                          To test the results, issue: 



make check



# 007308 
# 007309                          Install the package: 



make prefix=/usr install



# 007317 
# 007318                          Remove the static library and move the shared library to /lib. Also, the .sofile
# 007319                        in /usr/libwill need to be recreated: 



rm -v /usr/lib/libzstd.a
mv -v /usr/lib/libzstd.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libzstd.so) /usr/lib/libzstd.so


 
# 007329          8.9.2. Contents of Zstd 
# 007330           Installed programs: zstd, zstdcat (link to zstd), zstdgrep, zstdless, zstdmt (link to zstd), and unzstd (link to zstd)
# 007331           Installed library: libzstd.so  
# 007332            Short Descriptions  
# 007333 
# 007334                          
# 007335 
# 007336                zstd   
# 007337 
# 007338                          Compresses or decompresses files using the ZSTD format  
# 007339 
# 007340                          zstdgrep   
# 007341 
# 007342                          Runs grep  on ZSTD compressed files  
# 007343 
# 007344                          zstdless   
# 007345 
# 007346                          Runs less  on ZSTD compressed files  
# 007347 
# 007348                          libzstd 
# 007349 
# 007350                          The library implementing lossless data compression, using the ZSTD algorithm 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'file-*')
tar xf $(find -maxdepth 1 -type f -name 'file-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'file-*')
read -p "Chapter 8.10"
 
# 007351        8.10. File-5.39 
# 007352 
# 007353                          The File package contains a utility for determining the type of a given file or
# 007354                        files. 
# 007355           Approximate build time: 0.1 SBU
# 007356           Required disk space: 14 MB 
# 007357          8.10.1. Installation of File 
# 007358 
# 007359                          Prepare File for compilation: 



./configure --prefix=/usr



# 007367 
# 007368                          Compile the package: 



make



# 007376 
# 007377                          To test the results, issue: 



make check



# 007385 
# 007386                          Install the package: 



make install


 
# 007394          8.10.2. Contents of File 
# 007395           Installed programs: file
# 007396           Installed library: libmagic.so  
# 007397            Short Descriptions  
# 007398 
# 007399                          
# 007400 
# 007401                file   
# 007402 
# 007403                          Tries to classify each given file; it does this by performing several tests;file
# 007404                        system tests, magic number tests, and language tests  
# 007405 
# 007406                          libmagic 
# 007407 
# 007408                          Contains routines for magic number recognition, used by the file  program 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'readline-*')
tar xf $(find -maxdepth 1 -type f -name 'readline-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'readline-*')
read -p "Chapter 8.11"
 
# 007409        8.11. Readline-8.1 
# 007410 
# 007411                          The Readline package is a set of libraries that offers command-line editing and
# 007412                        history capabilities. 
# 007413           Approximate build time: 0.1 SBU
# 007414           Required disk space: 16 MB 
# 007415          8.11.1. Installation of Readline 
# 007416 
# 007417                          Reinstalling Readline will cause the old libraries to be moved to <libraryname>.old.
# 007418                        While this is normally not a problem, in some cases it can trigger a linking bug
# 007419                        in ldconfig  . This can be avoided by issuing the following two seds: 



sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install



# 007428 
# 007429                          Prepare Readline for compilation: 



./configure --prefix=/usr    \
            --disable-static \
            --with-curses    \
            --docdir=/usr/share/doc/readline-8.1



# 007440 
# 007441                          The meaning of the configure option: 
# 007442 
# 007443                --with-curses  
# 007444 
# 007445                          This option tells Readline that it can find the termcap library functions in the
# 007446                        curses library, rather than a separate termcap library. It allows generating a correct
# 007447                        readline.pcfile. 
# 007448 
# 007449                          Compile the package: 



make SHLIB_LIBS="-lncursesw"



# 007457 
# 007458                          The meaning of the make option: 
# 007459 
# 007460                SHLIB_LIBS="-lncursesw"  
# 007461 
# 007462                          This option forces Readline to link against the libncurseswlibrary. 
# 007463 
# 007464                          This package does not come with a test suite. 
# 007465 
# 007466                          Install the package: 



make SHLIB_LIBS="-lncursesw" install



# 007474 
# 007475                          Now move the dynamic libraries to a more appropriate location and fix up symbolic
# 007476                        links: 



mv -v /usr/lib/lib{readline,history}.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libreadline.so) /usr/lib/libreadline.so
ln -sfv ../../lib/$(readlink /usr/lib/libhistory.so ) /usr/lib/libhistory.so



# 007486 
# 007487                          If desired, install the documentation: 



install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.1


 
# 007495          8.11.2. Contents of Readline 
# 007496           Installed libraries: libhistory.so and libreadline.so
# 007497           Installed directories: /usr/include/readline and /usr/share/doc/readline-8.1  
# 007498            Short Descriptions  
# 007499 
# 007500                          
# 007501 
# 007502                libhistory 
# 007503 
# 007504                          Provides a consistent user interface for recalling lines of history  
# 007505 
# 007506                          libreadline 
# 007507 
# 007508                          Provides a set of commands for manipulating text entered in an interactive session
# 007509                        of a program 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'm4-*')
tar xf $(find -maxdepth 1 -type f -name 'm4-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'm4-*')
read -p "Chapter 8.12"
 
# 007510        8.12. M4-1.4.18 
# 007511 
# 007512                          The M4 package contains a macro processor. 
# 007513           Approximate build time: 0.4 SBU
# 007514           Required disk space: 32 MB 
# 007515          8.12.1. Installation of M4 
# 007516 
# 007517                          First, make some fixes required by glibc-2.28 and later: 



sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h



# 007526 
# 007527                          Prepare M4 for compilation: 



./configure --prefix=/usr



# 007535 
# 007536                          Compile the package: 



make



# 007544 
# 007545                          To test the results, issue: 



make check



# 007553 
# 007554                          Install the package: 



make install


 
# 007562          8.12.2. Contents of M4 
# 007563           Installed program: m4  
# 007564            Short Descriptions  
# 007565 
# 007566                          
# 007567 
# 007568                m4   
# 007569 
# 007570                          Copies the given files while expanding the macros that they contain. These macros
# 007571                        are either built-in or user-defined and can take any number of arguments. Besides
# 007572                        performing macro expansion, m4  has built-in functions for including named files,
# 007573                        running Unix commands, performing integer arithmetic, manipulating text, recursion,
# 007574                        etc. The m4  program can be used either as a front-end to a compiler or as a macro
# 007575                        processor in its own right 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'bc-*')
tar xf $(find -maxdepth 1 -type f -name 'bc-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'bc-*')
read -p "Chapter 8.13"
 
# 007576        8.13. Bc-3.3.0 
# 007577 
# 007578                          The Bc package contains an arbitrary precision numeric processing language. 
# 007579           Approximate build time: less than 0.1 SBU
# 007580           Required disk space: 6.7 MB 
# 007581          8.13.1. Installation of Bc 
# 007582 
# 007583                          Prepare Bc for compilation: 



PREFIX=/usr CC=gcc ./configure.sh -G -O3



# 007591 
# 007592                          The meaning of the configure options: 
# 007593 
# 007594                CC=gcc"  
# 007595 
# 007596                          These parameters specify the compiler to use. 
# 007597 
# 007598                -O3  
# 007599 
# 007600                          Specify the optimization to use. 
# 007601 
# 007602                -G  
# 007603 
# 007604                          Omit parts of the test suite that won't work without a GNU bc present. 
# 007605 
# 007606                          Compile the package: 



make



# 007614 
# 007615                          To test bc, run: 



make test



# 007623 
# 007624                          Install the package: 



make install


 
# 007632          8.13.2. Contents of Bc 
# 007633           Installed programs: bc and dc  
# 007634            Short Descriptions  
# 007635 
# 007636                          
# 007637 
# 007638                bc   
# 007639 
# 007640                          A command line calculator  
# 007641 
# 007642                          dc   
# 007643 
# 007644                          A reverse-polish command line calculator 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'flex-*')
tar xf $(find -maxdepth 1 -type f -name 'flex-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'flex-*')
read -p "Chapter 8.14"
 
# 007645        8.14. Flex-2.6.4 
# 007646 
# 007647                          The Flex package contains a utility for generating programs that recognize patterns
# 007648                        in text. 
# 007649           Approximate build time: 0.4 SBU
# 007650           Required disk space: 36 MB 
# 007651          8.14.1. Installation of Flex 
# 007652 
# 007653                          Prepare Flex for compilation: 



./configure --prefix=/usr \
            --docdir=/usr/share/doc/flex-2.6.4 \
            --disable-static



# 007663 
# 007664                          Compile the package: 



make



# 007672 
# 007673                          To test the results (about 0.5 SBU), issue: 



make check



# 007681 
# 007682                          Install the package: 



make install



# 007690 
# 007691                          A few programs do not know about flex  yet and try to run its predecessor, lex  . To
# 007692                        support those programs, create a symbolic link named lexthat runs flexin lex  emulation
# 007693                        mode: 



ln -sv flex /usr/bin/lex


 
# 007701          8.14.2. Contents of Flex 
# 007702           Installed programs: flex, flex++ (link to flex), and lex (link to flex)
# 007703           Installed libraries: libfl.so
# 007704           Installed directory: /usr/share/doc/flex-2.6.4  
# 007705            Short Descriptions  
# 007706 
# 007707                          
# 007708 
# 007709                flex   
# 007710 
# 007711                          A tool for generating programs that recognize patterns in text; it allows for the
# 007712                        versatility to specify the rules for pattern-finding, eradicating the need to develop
# 007713                        a specialized program  
# 007714 
# 007715                          flex++   
# 007716 
# 007717                          An extension of flex, is used for generating C++ code and classes. It is a symbolic
# 007718                        link to flex   
# 007719 
# 007720                          lex   
# 007721 
# 007722                          A symbolic link that runs flex  in lex  emulation mode  
# 007723 
# 007724                          libfl 
# 007725 
# 007726                          The flexlibrary 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'tcl8*')
tar xf $(find -maxdepth 1 -type f -name 'tcl8*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'tcl8*')
read -p "Chapter 8.15"
 
# 007727        8.15. Tcl-8.6.11 
# 007728 
# 007729                          The Tcl package contains the Tool Command Language, a robust general-purpose scripting
# 007730                        language. The Expect package is written in the Tcl language. 
# 007731           Approximate build time: 3.8 SBU
# 007732           Required disk space: 80 MB 
# 007733          8.15.1. Installation of Tcl 
# 007734 
# 007735                          This package and the next two (Expect and DejaGNU) are installed to support running
# 007736                        the test suites for binutils and GCC and other packages. Installing three packages
# 007737                        for testing purposes may seem excessive, but it is very reassuring, if not essential,
# 007738                        to know that the most important tools are working properly. 
# 007739 
# 007740                          First, unpack the documentation by issuing the following command: 



tar -xf ../tcl8.6.11-html.tar.gz --strip-components=1



# 007748 
# 007749                          Prepare Tcl for compilation: 



SRCDIR=$(pwd)
cd unix
./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            $([ "$(uname -m)" = x86_64 ] && echo --enable-64bit)



# 007761 
# 007762                          The meaning of the configure options: 
# 007763 
# 007764                $([ "$(uname -m)" = x86_64 ] && echo --enable-64bit)  
# 007765 
# 007766                          The construct $(<shell command>) is replaced by the output of the shell command.
# 007767                        Here this output is empty if running on a 32 bit machine, and is --enable-64bit if
# 007768                        running on a 64 bit machine. 
# 007769 
# 007770                          Build the package: 



make

sed -e "s|$SRCDIR/unix|/usr/lib|" \
    -e "s|$SRCDIR|/usr/include|"  \
    -i tclConfig.sh

sed -e "s|$SRCDIR/unix/pkgs/tdbc1.1.2|/usr/lib/tdbc1.1.2|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.2/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/tdbc1.1.2/library|/usr/lib/tcl8.6|" \
    -e "s|$SRCDIR/pkgs/tdbc1.1.2|/usr/include|"            \
    -i pkgs/tdbc1.1.2/tdbcConfig.sh

sed -e "s|$SRCDIR/unix/pkgs/itcl4.2.1|/usr/lib/itcl4.2.1|" \
    -e "s|$SRCDIR/pkgs/itcl4.2.1/generic|/usr/include|"    \
    -e "s|$SRCDIR/pkgs/itcl4.2.1|/usr/include|"            \
    -i pkgs/itcl4.2.1/itclConfig.sh

unset SRCDIR



# 007795 
# 007796                          The various "sed " instructions after the "make " command removes references to the
# 007797                        build directory from the configuration files and replaces them with the install
# 007798                        directory. This is not mandatory for the remainder of LFS, but may be needed in
# 007799                        case a package built later uses Tcl. 
# 007800 
# 007801                          To test the results, issue: 



make test



# 007809          Note 
# 007810 
# 007811                          In the test results there are several places associated with clock.test that indicate
# 007812                        a failure, but the summary at the end indicates no failures. clock.test passes on
# 007813                        a complete LFS system. 
# 007814 
# 007815                          Install the package: 



make install



# 007823 
# 007824                          Make the installed library writable so debugging symbols can be removed later: 



chmod -v u+w /usr/lib/libtcl8.6.so



# 007832 
# 007833                          Install Tcl's headers. The next package, Expect, requires them. 



make install-private-headers



# 007841 
# 007842                          Now make a necessary symbolic link: 



ln -sfv tclsh8.6 /usr/bin/tclsh



# 007850 
# 007851                          Finally, rename a man page that conflicts with a Perl man page: 



mv /usr/share/man/man3/{Thread,Tcl_Thread}.3


 
# 007859          8.15.2. Contents of Tcl 
# 007860           Installed programs: tclsh (link to tclsh8.6) and tclsh8.6
# 007861           Installed library: libtcl8.6.so and libtclstub8.6.a  
# 007862            Short Descriptions  
# 007863 
# 007864                          
# 007865 
# 007866                tclsh8.6   
# 007867 
# 007868                          The Tcl command shell  
# 007869 
# 007870                          tclsh   
# 007871 
# 007872                          A link to tclsh8.6  
# 007873 
# 007874                          libtcl8.6.so 
# 007875 
# 007876                          The Tcl library  
# 007877 
# 007878                          libtclstub8.6.a 
# 007879 
# 007880                          The Tcl Stub library 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'expect-*')
tar xf $(find -maxdepth 1 -type f -name 'expect-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'expect-*')
read -p "Chapter 8.16"
 
# 007881        8.16. Expect-5.45.4 
# 007882 
# 007883                          The Expect package contains tools for automating, via scripted dialogues, interactive
# 007884                        applications such as telnet  , ftp  , passwd  , fsck  , rlogin  , and tip  . Expect is also useful
# 007885                        for testing these same applications as well as easing all sorts of tasks that are
# 007886                        prohibitively difficult with anything else. The DejaGnu framework is written in Expect .
# 007887                        
# 007888           Approximate build time: 0.2 SBU
# 007889           Required disk space: 3.9 MB 
# 007890          8.16.1. Installation of Expect 
# 007891 
# 007892                          Prepare Expect for compilation: 



./configure --prefix=/usr           \
            --with-tcl=/usr/lib     \
            --enable-shared         \
            --mandir=/usr/share/man \
            --with-tclinclude=/usr/include



# 007904 
# 007905                          The meaning of the configure options: 
# 007906 
# 007907                --with-tcl=/usr/lib  
# 007908 
# 007909                          This parameter is needed to tell configure  where the tclConfig.sh  script is located.
# 007910                        
# 007911 
# 007912                --with-tclinclude=/usr/include  
# 007913 
# 007914                          This explicitly tells Expect where to find Tcl's internal headers. 
# 007915 
# 007916                          Build the package: 



make



# 007924 
# 007925                          To test the results, issue: 



make test



# 007933 
# 007934                          Install the package: 



make install
ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib


 
# 007943          8.16.2. Contents of Expect 
# 007944           Installed program: expect
# 007945           Installed library: libexpect-5.45.so  
# 007946            Short Descriptions  
# 007947 
# 007948                          
# 007949 
# 007950                expect   
# 007951 
# 007952                          Communicates with other interactive programs according to a script  
# 007953 
# 007954                          libexpect-5.45.so 
# 007955 
# 007956                          Contains functions that allow Expect to be used as a Tcl extension or to be used
# 007957                        directly from C or C++ (without Tcl) 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'dejagnu-*')
tar xf $(find -maxdepth 1 -type f -name 'dejagnu-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'dejagnu-*')
read -p "Chapter 8.17"
 
# 007958        8.17. DejaGNU-1.6.2 
# 007959 
# 007960                          The DejaGnu package contains a framework for running test suites on GNU tools. It
# 007961                        is written in expect  , which itself uses Tcl (Tool Command Language). 
# 007962           Approximate build time: less than 0.1 SBU
# 007963           Required disk space: 4.6 MB 
# 007964          8.17.1. Installation of DejaGNU 
# 007965 
# 007966                          Prepare DejaGNU for compilation: 



./configure --prefix=/usr
makeinfo --html --no-split -o doc/dejagnu.html doc/dejagnu.texi
makeinfo --plaintext       -o doc/dejagnu.txt  doc/dejagnu.texi



# 007976 
# 007977                          Build and install the package: 



make install
install -v -dm755  /usr/share/doc/dejagnu-1.6.2
install -v -m644   doc/dejagnu.{html,txt} /usr/share/doc/dejagnu-1.6.2



# 007987 
# 007988                          To test the results, issue: 



make check


 
# 007996          8.17.2. Contents of DejaGNU 
# 007997           Installed program: runtest  
# 007998            Short Descriptions  
# 007999 
# 008000                          
# 008001 
# 008002                runtest   
# 008003 
# 008004                          A wrapper script that locates the proper expect  shell and then runs DejaGNU 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'binutils-*')
tar xf $(find -maxdepth 1 -type f -name 'binutils-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'binutils-*')
read -p "Chapter 8.18"
 
# 008005        8.18. Binutils-2.36.1 
# 008006 
# 008007                          The Binutils package contains a linker, an assembler, and other tools for handling
# 008008                        object files. 
# 008009           Approximate build time: 6.2 SBU
# 008010           Required disk space: 4.9 GB 
# 008011          8.18.1. Installation of Binutils 
# 008012 
# 008013                          Verify that the PTYs are working properly inside the chroot environment by performing
# 008014                        a simple test: 



expect -c "spawn ls"



# 008022 
# 008023                          This command should output the following: 




# 008028 spawn ls



# 008032 
# 008033                          If, instead, the output includes the message below, then the environment is not
# 008034                        set up for proper PTY operation. This issue needs to be resolved before running
# 008035                        the test suites for Binutils and GCC: 




# 008040 The system has no more ptys.
# 008041 Ask your system administrator to create more.



# 008045 
# 008046                          Now remove one test that prevents the tests from running to completion: 



sed -i '/@\tincremental_copy/d' gold/testsuite/Makefile.in



# 008054 
# 008055                          The Binutils documentation recommends building Binutils in a dedicated build directory:
# 008056                        



mkdir -v build
cd       build



# 008065 
# 008066                          Prepare Binutils for compilation: 



../configure --prefix=/usr       \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --with-system-zlib



# 008081 
# 008082                          The meaning of the configure parameters: 
# 008083 
# 008084                --enable-gold  
# 008085 
# 008086                          Build the gold linker and install it as ld.gold (along side the default linker).
# 008087                        
# 008088 
# 008089                --enable-ld=default  
# 008090 
# 008091                          Build the original bfd linker and install it as both ld (the default linker) and
# 008092                        ld.bfd. 
# 008093 
# 008094                --enable-plugins  
# 008095 
# 008096                          Enables plugin support for the linker. 
# 008097 
# 008098                --enable-64-bit-bfd  
# 008099 
# 008100                          Enables 64-bit support (on hosts with narrower word sizes). May not be needed on
# 008101                        64-bit systems, but does no harm. 
# 008102 
# 008103                --with-system-zlib  
# 008104 
# 008105                          Use the installed zlib library rather than building the included version. 
# 008106 
# 008107                          Compile the package: 



make tooldir=/usr



# 008115 
# 008116                          The meaning of the make parameter: 
# 008117 
# 008118                tooldir=/usr  
# 008119 
# 008120                          Normally, the tooldir (the directory where the executables will ultimately be located)
# 008121                        is set to $(exec_prefix)/$(target_alias). For example, x86_64 machines would expand
# 008122                        that to /usr/x86_64-unknown-linux-gnu. Because this is a custom system, this target-specific
# 008123                        directory in /usris not required. $(exec_prefix)/$(target_alias)would be used if
# 008124                        the system was used to cross-compile (for example, compiling a package on an Intel
# 008125                        machine that generates code that can be executed on PowerPC machines). 
# 008126          Important 
# 008127 
# 008128                          The test suite for Binutils in this section is considered critical. Do not skip
# 008129                        it under any circumstances. 
# 008130 
# 008131                          Test the results: 



make -k check



# 008139 
# 008140                          Four tests named "Run property ... " are known to fail. 
# 008141 
# 008142                          Install the package: 



make tooldir=/usr install



# 008150 
# 008151                          Remove useless static libraries: 



rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.a


 
# 008159          8.18.2. Contents of Binutils 
# 008160           Installed programs: addr2line, ar, as, c++filt, dwp, elfedit, gprof, ld, ld.bfd, ld.gold, nm, objcopy, objdump, ranlib, readelf, size, strings, and strip
# 008161           Installed libraries: libbfd.so, libctf.so, libctf-nobfd.so, and libopcodes.so
# 008162           Installed directory: /usr/lib/ldscripts  
# 008163            Short Descriptions  
# 008164 
# 008165                          
# 008166 
# 008167                addr2line   
# 008168 
# 008169                          Translates program addresses to file names and line numbers; given an address and
# 008170                        the name of an executable, it uses the debugging information in the executable to
# 008171                        determine which source file and line number are associated with the address  
# 008172 
# 008173                          ar   
# 008174 
# 008175                          Creates, modifies, and extracts from archives  
# 008176 
# 008177                          as   
# 008178 
# 008179                          An assembler that assembles the output of gcc  into object files  
# 008180 
# 008181                          c++filt   
# 008182 
# 008183                          Used by the linker to de-mangle C++ and Java symbols and to keep overloaded functions
# 008184                        from clashing  
# 008185 
# 008186                          dwp   
# 008187 
# 008188                          The DWARF packaging utility  
# 008189 
# 008190                          elfedit   
# 008191 
# 008192                          Updates the ELF header of ELF files  
# 008193 
# 008194                          gprof   
# 008195 
# 008196                          Displays call graph profile data  
# 008197 
# 008198                          ld   
# 008199 
# 008200                          A linker that combines a number of object and archive files into a single file,
# 008201                        relocating their data and tying up symbol references  
# 008202 
# 008203                          ld.gold   
# 008204 
# 008205                          A cut down version of ld that only supports the elf object file format  
# 008206 
# 008207                          ld.bfd   
# 008208 
# 008209                          Hard link to ld   
# 008210 
# 008211                          nm   
# 008212 
# 008213                          Lists the symbols occurring in a given object file  
# 008214 
# 008215                          objcopy   
# 008216 
# 008217                          Translates one type of object file into another  
# 008218 
# 008219                          objdump   
# 008220 
# 008221                          Displays information about the given object file, with options controlling the particular
# 008222                        information to display; the information shown is useful to programmers who are working
# 008223                        on the compilation tools  
# 008224 
# 008225                          ranlib   
# 008226 
# 008227                          Generates an index of the contents of an archive and stores it in the archive; the
# 008228                        index lists all of the symbols defined by archive members that are relocatable object
# 008229                        files  
# 008230 
# 008231                          readelf   
# 008232 
# 008233                          Displays information about ELF type binaries  
# 008234 
# 008235                          size   
# 008236 
# 008237                          Lists the section sizes and the total size for the given object files  
# 008238 
# 008239                          strings   
# 008240 
# 008241                          Outputs, for each given file, the sequences of printable characters that are of
# 008242                        at least the specified length (defaulting to four); for object files, it prints,
# 008243                        by default, only the strings from the initializing and loading sections while for
# 008244                        other types of files, it scans the entire file  
# 008245 
# 008246                          strip   
# 008247 
# 008248                          Discards symbols from object files  
# 008249 
# 008250                          libbfd 
# 008251 
# 008252                          The Binary File Descriptor library  
# 008253 
# 008254                          libctf 
# 008255 
# 008256                          The Compat ANSI-C Type Format debugging support library  
# 008257 
# 008258                          libctf-nobfd 
# 008259 
# 008260                          A libctf variant which does not use libbfd functionality  
# 008261 
# 008262                          libopcodes 
# 008263 
# 008264                          A library for dealing with opcodes;the "readable text " versions of instructions for
# 008265                        the processor; it is used for building utilities like objdump  


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'gmp-*')
tar xf $(find -maxdepth 1 -type f -name 'gmp-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'gmp-*')
read -p "Chapter 8.19"
 
# 008266        8.19. GMP-6.2.1 
# 008267 
# 008268                          The GMP package contains math libraries. These have useful functions for arbitrary
# 008269                        precision arithmetic. 
# 008270           Approximate build time: 1.0 SBU
# 008271           Required disk space: 52 MB 
# 008272          8.19.1. Installation of GMP 
# 008273          Note 
# 008274 
# 008275                          If you are building for 32-bit x86, but you have a CPU which is capable of running
# 008276                        64-bit code and  you have specified CFLAGSin the environment, the configure script
# 008277                        will attempt to configure for 64-bits and fail. Avoid this by invoking the configure
# 008278                        command below with 



ABI=32 ./configure ...


 
# 008286          Note 
# 008287 
# 008288                          The default settings of GMP produce libraries optimized for the host processor.
# 008289                        If libraries suitable for processors less capable than the host's CPU are desired,
# 008290                        generic libraries can be created by running the following: 



cp -v configfsf.guess config.guess
cp -v configfsf.sub   config.sub



# 008299 
# 008300                          Prepare GMP for compilation: 



./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.2.1



# 008311 
# 008312                          The meaning of the new configure options: 
# 008313 
# 008314                --enable-cxx  
# 008315 
# 008316                          This parameter enables C++ support 
# 008317 
# 008318                --docdir=/usr/share/doc/gmp-6.2.1  
# 008319 
# 008320                          This variable specifies the correct place for the documentation. 
# 008321 
# 008322                          Compile the package and generate the HTML documentation: 



make
make html



# 008331          Important 
# 008332 
# 008333                          The test suite for GMP in this section is considered critical. Do not skip it under
# 008334                        any circumstances. 
# 008335 
# 008336                          Test the results: 



make check 2>&1 | tee gmp-check-log



# 008344          Caution 
# 008345 
# 008346                          The code in gmp is highly optimized for the processor where it is built. Occasionally,
# 008347                        the code that detects the processor misidentifies the system capabilities and there
# 008348                        will be errors in the tests or other applications using the gmp libraries with the
# 008349                        message "Illegal instruction". In this case, gmp should be reconfigured with the
# 008350                        option --build=x86_64-unknown-linux-gnu and rebuilt. 
# 008351 
# 008352                          Ensure that all 197 tests in the test suite passed. Check the results by issuing
# 008353                        the following command: 



awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log



# 008361 
# 008362                          Install the package and its documentation: 



make install
make install-html


 
# 008371          8.19.2. Contents of GMP 
# 008372           Installed Libraries: libgmp.so and libgmpxx.so
# 008373           Installed directory: /usr/share/doc/gmp-6.2.1  
# 008374            Short Descriptions  
# 008375 
# 008376                          
# 008377 
# 008378                libgmp 
# 008379 
# 008380                          Contains precision math functions  
# 008381 
# 008382                          libgmpxx 
# 008383 
# 008384                          Contains C++ precision math functions 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'mpfr-*')
tar xf $(find -maxdepth 1 -type f -name 'mpfr-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'mpfr-*')
read -p "Chapter 8.20"
 
# 008385        8.20. MPFR-4.1.0 
# 008386 
# 008387                          The MPFR package contains functions for multiple precision math. 
# 008388           Approximate build time: 0.8 SBU
# 008389           Required disk space: 38 MB 
# 008390          8.20.1. Installation of MPFR 
# 008391 
# 008392                          Prepare MPFR for compilation: 



./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.1.0



# 008403 
# 008404                          Compile the package and generate the HTML documentation: 



make
make html



# 008413          Important 
# 008414 
# 008415                          The test suite for MPFR in this section is considered critical. Do not skip it under
# 008416                        any circumstances. 
# 008417 
# 008418                          Test the results and ensure that all tests passed: 



make check



# 008426 
# 008427                          Install the package and its documentation: 



make install
make install-html


 
# 008436          8.20.2. Contents of MPFR 
# 008437           Installed Libraries: libmpfr.so
# 008438           Installed directory: /usr/share/doc/mpfr-4.1.0  
# 008439            Short Descriptions  
# 008440 
# 008441                          
# 008442 
# 008443                libmpfr 
# 008444 
# 008445                          Contains multiple-precision math functions 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'mpc-*')
tar xf $(find -maxdepth 1 -type f -name 'mpc-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'mpc-*')
read -p "Chapter 8.21"
 
# 008446        8.21. MPC-1.2.1 
# 008447 
# 008448                          The MPC package contains a library for the arithmetic of complex numbers with arbitrarily
# 008449                        high precision and correct rounding of the result. 
# 008450           Approximate build time: 0.3 SBU
# 008451           Required disk space: 22 MB 
# 008452          8.21.1. Installation of MPC 
# 008453 
# 008454                          Prepare MPC for compilation: 



./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.2.1



# 008464 
# 008465                          Compile the package and generate the HTML documentation: 



make
make html



# 008474 
# 008475                          To test the results, issue: 



make check



# 008483 
# 008484                          Install the package and its documentation: 



make install
make install-html


 
# 008493          8.21.2. Contents of MPC 
# 008494           Installed Libraries: libmpc.so
# 008495           Installed Directory: /usr/share/doc/mpc-1.2.1  
# 008496            Short Descriptions  
# 008497 
# 008498                          
# 008499 
# 008500                libmpc 
# 008501 
# 008502                          Contains complex math functions 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'attr-*')
tar xf $(find -maxdepth 1 -type f -name 'attr-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'attr-*')
read -p "Chapter 8.22"
 
# 008503        8.22. Attr-2.4.48 
# 008504 
# 008505                          The attr package contains utilities to administer the extended attributes on filesystem
# 008506                        objects. 
# 008507           Approximate build time: less than 0.1 SBU
# 008508           Required disk space: 4.2 MB 
# 008509          8.22.1. Installation of Attr 
# 008510 
# 008511                          Prepare Attr for compilation: 



./configure --prefix=/usr     \
            --bindir=/bin     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.4.48



# 008523 
# 008524                          Compile the package: 



make



# 008532 
# 008533                          The tests need to be run on a filesystem that supports extended attributes such
# 008534                        as the ext2, ext3, or ext4 filesystems. To test the results, issue: 



make check



# 008542 
# 008543                          Install the package: 



make install



# 008551 
# 008552                          The shared library needs to be moved to /lib, and as a result the .sofile in /usr/libwill
# 008553                        need to be recreated: 



mv -v /usr/lib/libattr.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libattr.so) /usr/lib/libattr.so


 
# 008562          8.22.2. Contents of Attr 
# 008563           Installed programs: attr, getfattr, and setfattr
# 008564           Installed library: libattr.so
# 008565           Installed directories: /usr/include/attr and /usr/share/doc/attr-2.4.48  
# 008566            Short Descriptions  
# 008567 
# 008568                          
# 008569 
# 008570                attr   
# 008571 
# 008572                          Extends attributes on filesystem objects  
# 008573 
# 008574                          getfattr   
# 008575 
# 008576                          Gets the extended attributes of filesystem objects  
# 008577 
# 008578                          setfattr   
# 008579 
# 008580                          Sets the extended attributes of filesystem objects  
# 008581 
# 008582                          libattr 
# 008583 
# 008584                          Contains the library functions for manipulating extended attributes 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'acl-*')
tar xf $(find -maxdepth 1 -type f -name 'acl-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'acl-*')
read -p "Chapter 8.23"
 
# 008585        8.23. Acl-2.2.53 
# 008586 
# 008587                          The Acl package contains utilities to administer Access Control Lists, which are
# 008588                        used to define more fine-grained discretionary access rights for files and directories.
# 008589                        
# 008590           Approximate build time: 0.1 SBU
# 008591           Required disk space: 2.8 MB 
# 008592          8.23.1. Installation of Acl 
# 008593 
# 008594                          Prepare Acl for compilation: 



./configure --prefix=/usr         \
            --bindir=/bin         \
            --disable-static      \
            --libexecdir=/usr/lib \
            --docdir=/usr/share/doc/acl-2.2.53



# 008606 
# 008607                          Compile the package: 



make



# 008615 
# 008616                          The Acl tests need to be run on a filesystem that supports access controls after
# 008617                        Coreutils has been built with the Acl libraries. If desired, return to this package
# 008618                        and run make check  after Coreutils has been built later in this chapter. 
# 008619 
# 008620                          Install the package: 



make install



# 008628 
# 008629                          The shared library needs to be moved to /lib, and as a result the .sofile in /usr/libwill
# 008630                        need to be recreated: 



mv -v /usr/lib/libacl.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libacl.so) /usr/lib/libacl.so


 
# 008639          8.23.2. Contents of Acl 
# 008640           Installed programs: chacl, getfacl, and setfacl
# 008641           Installed library: libacl.so
# 008642           Installed directories: /usr/include/acl and /usr/share/doc/acl-2.2.53  
# 008643            Short Descriptions  
# 008644 
# 008645                          
# 008646 
# 008647                chacl   
# 008648 
# 008649                          Changes the access control list of a file or directory  
# 008650 
# 008651                          getfacl   
# 008652 
# 008653                          Gets file access control lists  
# 008654 
# 008655                          setfacl   
# 008656 
# 008657                          Sets file access control lists  
# 008658 
# 008659                          libacl 
# 008660 
# 008661                          Contains the library functions for manipulating Access Control Lists 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'libcap-*')
tar xf $(find -maxdepth 1 -type f -name 'libcap-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'libcap-*')
read -p "Chapter 8.24"
 
# 008662        8.24. Libcap-2.48 
# 008663 
# 008664                          The Libcap package implements the user-space interfaces to the POSIX 1003.1e capabilities
# 008665                        available in Linux kernels. These capabilities are a partitioning of the all powerful
# 008666                        root privilege into a set of distinct privileges. 
# 008667           Approximate build time: less than 0.1 SBU
# 008668           Required disk space: 45 MB 
# 008669          8.24.1. Installation of Libcap 
# 008670 
# 008671                          Prevent static libraries from being installed: 



sed -i '/install -m.*STA/d' libcap/Makefile



# 008679 
# 008680                          Compile the package: 



make prefix=/usr lib=lib



# 008688 
# 008689                          The meaning of the make option: 
# 008690 
# 008691                lib=lib  
# 008692 
# 008693                          This parameter sets the library directory to /usr/librather than /usr/lib64on x86_64.
# 008694                        It has no effect on x86. 
# 008695 
# 008696                          To test the results, issue: 



make test



# 008704 
# 008705                          Install the package and make sure the essential libraries are in the correct directory:
# 008706                        



make prefix=/usr lib=lib install
for libname in cap psx; do
    mv -v /usr/lib/lib${libname}.so.* /lib
    ln -sfv ../../lib/lib${libname}.so.2 /usr/lib/lib${libname}.so
    chmod -v 755 /lib/lib${libname}.so.2.48
done


 
# 008719          8.24.2. Contents of Libcap 
# 008720           Installed programs: capsh, getcap, getpcaps, and setcap
# 008721           Installed library: libcap.so and libpsx.so  
# 008722            Short Descriptions  
# 008723 
# 008724                          
# 008725 
# 008726                capsh   
# 008727 
# 008728                          A shell wrapper to explore and constrain capability support  
# 008729 
# 008730                          getcap   
# 008731 
# 008732                          Examines file capabilities  
# 008733 
# 008734                          getpcaps   
# 008735 
# 008736                          Displays the capabilities on the queried process(es)  
# 008737 
# 008738                          setcap   
# 008739 
# 008740                          Sets file capabilities  
# 008741 
# 008742                          libcap 
# 008743 
# 008744                          Contains the library functions for manipulating POSIX 1003.1e capabilities  
# 008745 
# 008746                          libpsx 
# 008747 
# 008748                          Contains functions to support POSIX semantics for syscalls associated with the pthread
# 008749                        library 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'shadow-*')
tar xf $(find -maxdepth 1 -type f -name 'shadow-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'shadow-*')
read -p "Chapter 8.25"
 
# 008750        8.25. Shadow-4.8.1 
# 008751 
# 008752                          The Shadow package contains programs for handling passwords in a secure way. 
# 008753           Approximate build time: 0.2 SBU
# 008754           Required disk space: 45 MB 
# 008755          8.25.1. Installation of Shadow 
# 008756          Note 
# 008757 
# 008758                          If you would like to enforce the use of strong passwords, refer to http://www.linuxfromscratch.org/blfs/view/10.1/postlfs/cracklib.html for
# 008759                        installing CrackLib prior to building Shadow. Then add --with-libcrack to the configure  command
# 008760                        below. 
# 008761 
# 008762                          Disable the installation of the groups  program and its man pages, as Coreutils provides
# 008763                        a better version. Also, prevent the installation of manual pages that were already
# 008764                        installed in Section 8.3, "Man-pages-5.10" : 



sed -i 's/groups$(EXEEXT) //' src/Makefile.in
find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \;
find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \;


 
# 008775 
# 008776                          Instead of using the default crypt  method, use the more secure SHA-512  method of password
# 008777                        encryption, which also allows passwords longer than 8 characters. It is also necessary
# 008778                        to change the obsolete /var/spool/maillocation for user mailboxes that Shadow uses
# 008779                        by default to the /var/maillocation used currently: 



sed -e 's:#ENCRYPT_METHOD DES:ENCRYPT_METHOD SHA512:' \
    -e 's:/var/spool/mail:/var/mail:'                 \
    -i etc/login.defs



# 008789          Note 
# 008790 
# 008791                          If you chose to build Shadow with Cracklib support, run the following: 



sed -i 's:DICTPATH.*:DICTPATH\t/lib/cracklib/pw_dict:' etc/login.defs



# 008799 
# 008800                          Make a minor change to make the first group number generated by useradd 1000: 



sed -i 's/1000/999/' etc/useradd



# 008808 
# 008809                          Prepare Shadow for compilation: 



touch /usr/bin/passwd
./configure --sysconfdir=/etc \
            --with-group-name-max-length=32



# 008819 
# 008820                          The meaning of the configure option: 
# 008821 
# 008822                
# 008823           touch /usr/bin/passwd  
# 008824 
# 008825                          The file /usr/bin/passwdneeds to exist because its location is harcoded in some
# 008826                        programs, and the default location if it does not exist is not right. 
# 008827 
# 008828                --with-group-name-max-length=32  
# 008829 
# 008830                          The maximum user name is 32 characters. Make the maximum group name the same. 
# 008831 
# 008832                          Compile the package: 



make



# 008840 
# 008841                          This package does not come with a test suite. 
# 008842 
# 008843                          Install the package: 



make install


 
# 008851          8.25.2. Configuring Shadow 
# 008852 
# 008853                          This package contains utilities to add, modify, and delete users and groups; set
# 008854                        and change their passwords; and perform other administrative tasks. For a full explanation
# 008855                        of what password shadowing  means, see the doc/HOWTOfile within the unpacked source
# 008856                        tree. If using Shadow support, keep in mind that programs which need to verify passwords
# 008857                        (display managers, FTP programs, pop3 daemons, etc.) must be Shadow-compliant. That
# 008858                        is, they need to be able to work with shadowed passwords. 
# 008859 
# 008860                          To enable shadowed passwords, run the following command: 



pwconv



# 008868 
# 008869                          To enable shadowed group passwords, run: 



grpconv



# 008877 
# 008878                          Shadow's stock configuration for the useradd  utility has a few caveats that need
# 008879                        some explanation. First, the default action for the useradd  utility is to create
# 008880                        the user and a group of the same name as the user. By default the user ID (UID)
# 008881                        and group ID (GID) numbers will begin with 1000. This means if you don't pass parameters
# 008882                        to useradd  , each user will be a member of a unique group on the system. If this
# 008883                        behavior is undesirable, you'll need to pass the -g parameter to useradd  . The default
# 008884                        parameters are stored in the /etc/default/useraddfile. You may need to modify two
# 008885                        parameters in this file to suit your particular needs. 
# 008886 
# 008887                          /etc/default/useraddParameter Explanations 
# 008888 
# 008889                GROUP=1000  
# 008890 
# 008891                          This parameter sets the beginning of the group numbers used in the /etc/group file.
# 008892                        You can modify it to anything you desire. Note that useradd  will never reuse a UID
# 008893                        or GID. If the number identified in this parameter is used, it will use the next
# 008894                        available number after this. Note also that if you don't have a group 1000 on your
# 008895                        system the first time you use useradd  without the -g parameter, you'll get a message
# 008896                        displayed on the terminal that says: 
# 008897 useradd: unknown GID 1000. You may disregard
# 008898                        this message and group number 1000 will be used. 
# 008899 
# 008900                CREATE_MAIL_SPOOL=yes  
# 008901 
# 008902                          This parameter causes useradd  to create a mailbox file for the newly created user.
# 008903                        useradd  will make the group ownership of this file to the mailgroup with 0660 permissions.
# 008904                        If you would prefer that these mailbox files are not created by useradd  , issue the
# 008905                        following command: 



sed -i 's/yes/no/' /etc/default/useradd



# 008913          8.25.3. Setting the root password 
# 008914 
# 008915                          Choose a password for user root  and set it by running: 



passwd root


 
# 008923          8.25.4. Contents of Shadow 
# 008924           Installed programs: chage, chfn, chgpasswd, chpasswd, chsh, expiry, faillog, gpasswd, groupadd, groupdel, groupmems, groupmod, grpck, grpconv, grpunconv, lastlog, login, logoutd, newgidmap, newgrp, newuidmap, newusers, nologin, passwd, pwck, pwconv, pwunconv, sg (link to newgrp), su, useradd, userdel, usermod, vigr (link to vipw), and vipw
# 008925           Installed directory: /etc/default  
# 008926            Short Descriptions  
# 008927 
# 008928                          
# 008929 
# 008930                chage   
# 008931 
# 008932                          Used to change the maximum number of days between obligatory password changes  
# 008933 
# 008934                          chfn   
# 008935 
# 008936                          Used to change a user's full name and other information  
# 008937 
# 008938                          chgpasswd   
# 008939 
# 008940                          Used to update group passwords in batch mode  
# 008941 
# 008942                          chpasswd   
# 008943 
# 008944                          Used to update user passwords in batch mode  
# 008945 
# 008946                          chsh   
# 008947 
# 008948                          Used to change a user's default login shell  
# 008949 
# 008950                          expiry   
# 008951 
# 008952                          Checks and enforces the current password expiration policy  
# 008953 
# 008954                          faillog   
# 008955 
# 008956                          Is used to examine the log of login failures, to set a maximum number of failures
# 008957                        before an account is blocked, or to reset the failure count  
# 008958 
# 008959                          gpasswd   
# 008960 
# 008961                          Is used to add and delete members and administrators to groups  
# 008962 
# 008963                          groupadd   
# 008964 
# 008965                          Creates a group with the given name  
# 008966 
# 008967                          groupdel   
# 008968 
# 008969                          Deletes the group with the given name  
# 008970 
# 008971                          groupmems   
# 008972 
# 008973                          Allows a user to administer his/her own group membership list without the requirement
# 008974                        of super user privileges.  
# 008975 
# 008976                          groupmod   
# 008977 
# 008978                          Is used to modify the given group's name or GID  
# 008979 
# 008980                          grpck   
# 008981 
# 008982                          Verifies the integrity of the group files /etc/groupand /etc/gshadow 
# 008983 
# 008984                          grpconv   
# 008985 
# 008986                          Creates or updates the shadow group file from the normal group file  
# 008987 
# 008988                          grpunconv   
# 008989 
# 008990                          Updates /etc/groupfrom /etc/gshadowand then deletes the latter  
# 008991 
# 008992                          lastlog   
# 008993 
# 008994                          Reports the most recent login of all users or of a given user  
# 008995 
# 008996                          login   
# 008997 
# 008998                          Is used by the system to let users sign on  
# 008999 
# 009000                          logoutd   
# 009001 
# 009002                          Is a daemon used to enforce restrictions on log-on time and ports  
# 009003 
# 009004                          newgidmap   
# 009005 
# 009006                          Is used to set the gid mapping of a user namespace  
# 009007 
# 009008                          newgrp   
# 009009 
# 009010                          Is used to change the current GID during a login session  
# 009011 
# 009012                          newuidmap   
# 009013 
# 009014                          Is used to set the uid mapping of a user namespace  
# 009015 
# 009016                          newusers   
# 009017 
# 009018                          Is used to create or update an entire series of user accounts  
# 009019 
# 009020                          nologin   
# 009021 
# 009022                          Displays a message that an account is not available; it is designed to be used as
# 009023                        the default shell for accounts that have been disabled  
# 009024 
# 009025                          passwd   
# 009026 
# 009027                          Is used to change the password for a user or group account  
# 009028 
# 009029                          pwck   
# 009030 
# 009031                          Verifies the integrity of the password files /etc/passwdand /etc/shadow 
# 009032 
# 009033                          pwconv   
# 009034 
# 009035                          Creates or updates the shadow password file from the normal password file  
# 009036 
# 009037                          pwunconv   
# 009038 
# 009039                          Updates /etc/passwdfrom /etc/shadowand then deletes the latter  
# 009040 
# 009041                          sg   
# 009042 
# 009043                          Executes a given command while the user's GID is set to that of the given group
# 009044                         
# 009045 
# 009046                          su   
# 009047 
# 009048                          Runs a shell with substitute user and group IDs  
# 009049 
# 009050                          useradd   
# 009051 
# 009052                          Creates a new user with the given name, or updates the default new-user information
# 009053                         
# 009054 
# 009055                          userdel   
# 009056 
# 009057                          Deletes the given user account  
# 009058 
# 009059                          usermod   
# 009060 
# 009061                          Is used to modify the given user's login name, User Identification (UID), shell,
# 009062                        initial group, home directory, etc.  
# 009063 
# 009064                          vigr   
# 009065 
# 009066                          Edits the /etc/groupor /etc/gshadowfiles  
# 009067 
# 009068                          vipw   
# 009069 
# 009070                          Edits the /etc/passwdor /etc/shadowfiles 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'gcc-*')
tar xf $(find -maxdepth 1 -type f -name 'gcc-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'gcc-*')
read -p "Chapter 8.26"
 
# 009071        8.26. GCC-10.2.0 
# 009072 
# 009073                          The GCC package contains the GNU compiler collection, which includes the C and C++
# 009074                        compilers. 
# 009075           Approximate build time: 95 SBU (with tests)
# 009076           Required disk space: 4.6 GB 
# 009077          8.26.1. Installation of GCC 
# 009078 
# 009079                          If building on x86_64, change the default directory name for 64-bit libraries to
# 009080                        "lib " : 



case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac



# 009093 
# 009094                          The GCC documentation recommends building GCC in a dedicated build directory: 



mkdir -v build
cd       build



# 009103 
# 009104                          Prepare GCC for compilation: 



../configure --prefix=/usr            \
             LD=ld                    \
             --enable-languages=c,c++ \
             --disable-multilib       \
             --disable-bootstrap      \
             --with-system-zlib



# 009117 
# 009118                          Note that for other programming languages there are some prerequisites that are
# 009119                        not yet available. See the BLFS Book GCC page for instructions on how to build all
# 009120                        of GCC's supported languages. 
# 009121 
# 009122                          The meaning of the new configure parameters: 
# 009123 
# 009124                LD=ld  
# 009125 
# 009126                          This parameter makes the configure script use the ld installed by the binutils built
# 009127                        earlier in this chapter, rather than the cross-built version which would otherwise
# 009128                        be used. 
# 009129 
# 009130                --with-system-zlib  
# 009131 
# 009132                          This switch tells GCC to link to the system installed copy of the zlib library,
# 009133                        rather than its own internal copy. 
# 009134 
# 009135                          Compile the package: 



make



# 009143          Important 
# 009144 
# 009145                          In this section, the test suite for GCC is considered critical. Do not skip it under
# 009146                        any circumstance. 
# 009147 
# 009148                          One set of tests in the GCC test suite is known to exhaust the default stack, so
# 009149                        increase the stack size prior to running the tests: 



ulimit -s 32768



# 009157 
# 009158                          Test the results as a non-privileged user, but do not stop at errors: 



chown -Rv tester . 
su tester -c "PATH=$PATH make -k check"



# 009167 
# 009168                          To receive a summary of the test suite results, run: 



../contrib/test_summary



# 009176 
# 009177                          For only the summaries, pipe the output through grep -A7 Summ . 
# 009178 
# 009179                          Results can be compared with those located at http://www.linuxfromscratch.org/lfs/build-logs/10.1/ and
# 009180                        https://gcc.gnu.org/ml/gcc-testresults/ . 
# 009181 
# 009182                          Six tests related to get_time are known to fail. These are apparently related to
# 009183                        the en_HK locale. 
# 009184 
# 009185                          Additionally the following tests related to the following files are known to fail
# 009186                        with glibc-2.33: asan_test.C, co-ret-17-void-ret-coro.C, pr95519-05-gro.C, pr80166.c.
# 009187                        
# 009188 
# 009189                          A few unexpected failures cannot always be avoided. The GCC developers are usually
# 009190                        aware of these issues, but have not resolved them yet. Unless the test results are
# 009191                        vastly different from those at the above URL, it is safe to continue. 
# 009192 
# 009193                          Install the package and remove an unneeded directory: 



make install
rm -rf /usr/lib/gcc/$(gcc -dumpmachine)/10.2.0/include-fixed/bits/



# 009202 
# 009203                          The GCC build directory is owned by testernow and the ownership of the installed
# 009204                        header directory (and its content) will be incorrect. Change the ownership to rootuser
# 009205                        and group: 



chown -v -R root:root \
    /usr/lib/gcc/*linux-gnu/10.2.0/include{,-fixed}



# 009214 
# 009215                          Create a symlink required by the FHS for "historical" reasons. 



ln -sv ../usr/bin/cpp /lib



# 009223 
# 009224                          Add a compatibility symlink to enable building programs with Link Time Optimization
# 009225                        (LTO): 



ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/10.2.0/liblto_plugin.so \
        /usr/lib/bfd-plugins/



# 009234 
# 009235                          Now that our final toolchain is in place, it is important to again ensure that compiling
# 009236                        and linking will work as expected. We do this by performing some sanity checks:
# 009237                        



echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib'



# 009247 
# 009248                          There should be no errors, and the output of the last command will be (allowing
# 009249                        for platform-specific differences in the dynamic linker name): 




# 009254 [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]



# 009258 
# 009259                          Now make sure that we're setup to use the correct start files: 



grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log



# 009267 
# 009268                          The output of the last command should be: 




# 009273 /usr/lib/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../lib/crt1.o succeeded
# 009274 /usr/lib/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../lib/crti.o succeeded
# 009275 /usr/lib/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../lib/crtn.o succeeded



# 009279 
# 009280                          Depending on your machine architecture, the above may differ slightly. The difference
# 009281                        will be the name of the directory after /usr/lib/gcc. The important thing to look
# 009282                        for here is that gcc  has found all three crt*.ofiles under the /usr/libdirectory.
# 009283                        
# 009284 
# 009285                          Verify that the compiler is searching for the correct header files: 



grep -B4 '^ /usr/include' dummy.log



# 009293 
# 009294                          This command should return the following output: 




# 009299 #include <...> search starts here:
# 009300  /usr/lib/gcc/x86_64-pc-linux-gnu/10.2.0/include
# 009301  /usr/local/include
# 009302  /usr/lib/gcc/x86_64-pc-linux-gnu/10.2.0/include-fixed
# 009303  /usr/include



# 009307 
# 009308                          Again, the directory named after your target triplet may be different than the above,
# 009309                        depending on your system architecture. 
# 009310 
# 009311                          Next, verify that the new linker is being used with the correct search paths: 



grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'



# 009319 
# 009320                          References to paths that have components with '-linux-gnu' should be ignored, but
# 009321                        otherwise the output of the last command should be: 




# 009326 SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib64")
# 009327 SEARCH_DIR("/usr/local/lib64")
# 009328 SEARCH_DIR("/lib64")
# 009329 SEARCH_DIR("/usr/lib64")
# 009330 SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib")
# 009331 SEARCH_DIR("/usr/local/lib")
# 009332 SEARCH_DIR("/lib")
# 009333 SEARCH_DIR("/usr/lib");



# 009337 
# 009338                          A 32-bit system may see a few different directories. For example, here is the output
# 009339                        from an i686 machine: 




# 009344 SEARCH_DIR("/usr/i686-pc-linux-gnu/lib32")
# 009345 SEARCH_DIR("/usr/local/lib32")
# 009346 SEARCH_DIR("/lib32")
# 009347 SEARCH_DIR("/usr/lib32")
# 009348 SEARCH_DIR("/usr/i686-pc-linux-gnu/lib")
# 009349 SEARCH_DIR("/usr/local/lib")
# 009350 SEARCH_DIR("/lib")
# 009351 SEARCH_DIR("/usr/lib");



# 009355 
# 009356                          Next make sure that we're using the correct libc: 



grep "/lib.*/libc.so.6 " dummy.log



# 009364 
# 009365                          The output of the last command should be: 




# 009370 attempt to open /lib/libc.so.6 succeeded



# 009374 
# 009375                          Make sure GCC is using the correct dynamic linker: 



grep found dummy.log



# 009383 
# 009384                          The output of the last command should be (allowing for platform-specific differences
# 009385                        in dynamic linker name): 




# 009390 found ld-linux-x86-64.so.2 at /lib/ld-linux-x86-64.so.2



# 009394 
# 009395                          If the output does not appear as shown above or is not received at all, then something
# 009396                        is seriously wrong. Investigate and retrace the steps to find out where the problem
# 009397                        is and correct it. Any issues will need to be resolved before continuing with the
# 009398                        process. 
# 009399 
# 009400                          Once everything is working correctly, clean up the test files: 



rm -v dummy.c a.out dummy.log



# 009408 
# 009409                          Finally, move a misplaced file: 



mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib


 
# 009418          8.26.2. Contents of GCC 
# 009419           Installed programs: c++, cc (link to gcc), cpp, g++, gcc, gcc-ar, gcc-nm, gcc-ranlib, gcov, gcov-dump, and gcov-tool
# 009420           Installed libraries: libasan.{a,so}, libatomic.{a,so}, libcc1.so, libgcc.a, libgcc_eh.a, libgcc_s.so, libgcov.a, libgomp.{a,so}, libitm.{a,so}, liblsan.{a,so}, liblto_plugin.so, libquadmath.{a,so}, libssp.{a,so}, libssp_nonshared.a, libstdc++.{a,so}, libstdc++fs.a, libsupc++.a, libtsan.{a,so}, and libubsan.{a,so}
# 009421           Installed directories: /usr/include/c++, /usr/lib/gcc, /usr/libexec/gcc, and /usr/share/gcc-10.2.0  
# 009422            Short Descriptions  
# 009423 
# 009424                          
# 009425 
# 009426                c++   
# 009427 
# 009428                          The C++ compiler  
# 009429 
# 009430                          cc   
# 009431 
# 009432                          The C compiler  
# 009433 
# 009434                          cpp   
# 009435 
# 009436                          The C preprocessor; it is used by the compiler to expand the #include, #define,
# 009437                        and similar statements in the source files  
# 009438 
# 009439                          g++   
# 009440 
# 009441                          The C++ compiler  
# 009442 
# 009443                          gcc   
# 009444 
# 009445                          The C compiler  
# 009446 
# 009447                          gcc-ar   
# 009448 
# 009449                          A wrapper around ar  that adds a plugin to the command line. This program is only
# 009450                        used to add "link time optimization" and is not useful with the default build options
# 009451                         
# 009452 
# 009453                          gcc-nm   
# 009454 
# 009455                          A wrapper around nm  that adds a plugin to the command line. This program is only
# 009456                        used to add "link time optimization" and is not useful with the default build options
# 009457                         
# 009458 
# 009459                          gcc-ranlib   
# 009460 
# 009461                          A wrapper around ranlib  that adds a plugin to the command line. This program is only
# 009462                        used to add "link time optimization" and is not useful with the default build options
# 009463                         
# 009464 
# 009465                          gcov   
# 009466 
# 009467                          A coverage testing tool; it is used to analyze programs to determine where optimizations
# 009468                        will have the most effect  
# 009469 
# 009470                          gcov-dump   
# 009471 
# 009472                          Offline gcda and gcno profile dump tool  
# 009473 
# 009474                          gcov-tool   
# 009475 
# 009476                          Offline gcda profile processing tool  
# 009477 
# 009478                          libasan 
# 009479 
# 009480                          The Address Sanitizer runtime library  
# 009481 
# 009482                          libatomic 
# 009483 
# 009484                          GCC atomic built-in runtime library  
# 009485 
# 009486                          libcc1 
# 009487 
# 009488                          The C preprocessing library  
# 009489 
# 009490                          libgcc 
# 009491 
# 009492                          Contains run-time support for gcc   
# 009493 
# 009494                          libgcov 
# 009495 
# 009496                          This library is linked in to a program when GCC is instructed to enable profiling
# 009497                         
# 009498 
# 009499                          libgomp 
# 009500 
# 009501                          GNU implementation of the OpenMP API for multi-platform shared-memory parallel programming
# 009502                        in C/C++ and Fortran  
# 009503 
# 009504                          liblsan 
# 009505 
# 009506                          The Leak Sanitizer runtime library  
# 009507 
# 009508                          liblto_plugin 
# 009509 
# 009510                          GCC's Link Time Optimization (LTO) plugin allows GCC to perform optimizations across
# 009511                        compilation units  
# 009512 
# 009513                          libquadmath 
# 009514 
# 009515                          GCC Quad Precision Math Library API  
# 009516 
# 009517                          libssp 
# 009518 
# 009519                          Contains routines supporting GCC's stack-smashing protection functionality  
# 009520 
# 009521                          libstdc++ 
# 009522 
# 009523                          The standard C++ library  
# 009524 
# 009525                          libstdc++fs 
# 009526 
# 009527                          ISO/IEC TS 18822:2015 Filesystem library  
# 009528 
# 009529                          libsupc++ 
# 009530 
# 009531                          Provides supporting routines for the C++ programming language  
# 009532 
# 009533                          libtsan 
# 009534 
# 009535                          The Thread Sanitizer runtime library  
# 009536 
# 009537                          libubsan 
# 009538 
# 009539                          The Undefined Behavior Sanitizer runtime library 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'pkg-config-*')
tar xf $(find -maxdepth 1 -type f -name 'pkg-config-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'pkg-config-*')
read -p "Chapter 8.27"
 
# 009540        8.27. Pkg-config-0.29.2 
# 009541 
# 009542                          The pkg-config package contains a tool for passing the include path and/or library
# 009543                        paths to build tools during the configure and make phases of package installations.
# 009544                        
# 009545           Approximate build time: 0.3 SBU
# 009546           Required disk space: 30 MB 
# 009547          8.27.1. Installation of Pkg-config 
# 009548 
# 009549                          Prepare Pkg-config for compilation: 



./configure --prefix=/usr              \
            --with-internal-glib       \
            --disable-host-tool        \
            --docdir=/usr/share/doc/pkg-config-0.29.2



# 009560 
# 009561                          The meaning of the new configure options: 
# 009562 
# 009563                --with-internal-glib  
# 009564 
# 009565                          This will allow pkg-config to use its internal version of Glib because an external
# 009566                        version is not available in LFS. 
# 009567 
# 009568                --disable-host-tool  
# 009569 
# 009570                          This option disables the creation of an undesired hard link to the pkg-config program.
# 009571                        
# 009572 
# 009573                          Compile the package: 



make



# 009581 
# 009582                          To test the results, issue: 



make check



# 009590 
# 009591                          Install the package: 



make install


 
# 009599          8.27.2. Contents of Pkg-config 
# 009600           Installed program: pkg-config
# 009601           Installed directory: /usr/share/doc/pkg-config-0.29.2  
# 009602            Short Descriptions  
# 009603 
# 009604                          
# 009605 
# 009606                pkg-config   
# 009607 
# 009608                          Returns meta information for the specified library or package 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'ncurses-*')
tar xf $(find -maxdepth 1 -type f -name 'ncurses-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'ncurses-*')
read -p "Chapter 8.28"
 
# 009609        8.28. Ncurses-6.2 
# 009610 
# 009611                          The Ncurses package contains libraries for terminal-independent handling of character
# 009612                        screens. 
# 009613           Approximate build time: 0.4 SBU
# 009614           Required disk space: 34 MB 
# 009615          8.28.1. Installation of Ncurses 
# 009616 
# 009617                          Prepare Ncurses for compilation: 



./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --enable-pc-files       \
            --enable-widec



# 009631 
# 009632                          The meaning of the new configure options: 
# 009633 
# 009634                --enable-widec  
# 009635 
# 009636                          This switch causes wide-character libraries (e.g., libncursesw.so.6.2) to be built
# 009637                        instead of normal ones (e.g., libncurses.so.6.2). These wide-character libraries
# 009638                        are usable in both multibyte and traditional 8-bit locales, while normal libraries
# 009639                        work properly only in 8-bit locales. Wide-character and normal libraries are source-compatible,
# 009640                        but not binary-compatible. 
# 009641 
# 009642                --enable-pc-files  
# 009643 
# 009644                          This switch generates and installs .pc files for pkg-config. 
# 009645 
# 009646                --without-normal  
# 009647 
# 009648                          This switch disables building and installing most static libraries. 
# 009649 
# 009650                          Compile the package: 



make



# 009658 
# 009659                          This package has a test suite, but it can only be run after the package has been
# 009660                        installed. The tests reside in the test/directory. See the READMEfile in that directory
# 009661                        for further details. 
# 009662 
# 009663                          Install the package: 



make install



# 009671 
# 009672                          Move the shared libraries to the /libdirectory, where they are expected to reside:
# 009673                        



mv -v /usr/lib/libncursesw.so.6* /lib



# 009681 
# 009682                          Because the libraries have been moved, one symlink points to a non-existent file.
# 009683                        Recreate it: 



ln -sfv ../../lib/$(readlink /usr/lib/libncursesw.so) /usr/lib/libncursesw.so



# 009691 
# 009692                          Many applications still expect the linker to be able to find non-wide-character
# 009693                        Ncurses libraries. Trick such applications into linking with wide-character libraries
# 009694                        by means of symlinks and linker scripts: 



for lib in ncurses form panel menu ; do
    rm -vf                    /usr/lib/lib${lib}.so
    echo "INPUT(-l${lib}w)" > /usr/lib/lib${lib}.so
    ln -sfv ${lib}w.pc        /usr/lib/pkgconfig/${lib}.pc
done



# 009706 
# 009707                          Finally, make sure that old applications that look for -lcursesat build time are
# 009708                        still buildable: 



rm -vf                     /usr/lib/libcursesw.so
echo "INPUT(-lncursesw)" > /usr/lib/libcursesw.so
ln -sfv libncurses.so      /usr/lib/libcurses.so



# 009718 
# 009719                          Remove a static library that is not handled by configure: 



rm -fv /usr/lib/libncurses++w.a



# 009727 
# 009728                          If desired, install the Ncurses documentation: 



mkdir -v       /usr/share/doc/ncurses-6.2
cp -v -R doc/* /usr/share/doc/ncurses-6.2



# 009737          Note 
# 009738 
# 009739                          The instructions above don't create non-wide-character Ncurses libraries since no
# 009740                        package installed by compiling from sources would link against them at runtime.
# 009741                        However, the only known binary-only applications that link against non-wide-character
# 009742                        Ncurses libraries require version 5. If you must have such libraries because of
# 009743                        some binary-only application or to be compliant with LSB, build the package again
# 009744                        with the following commands: 



make distclean
./configure --prefix=/usr    \
            --with-shared    \
            --without-normal \
            --without-debug  \
            --without-cxx-binding \
            --with-abi-version=5 
make sources libs
cp -av lib/lib*.so.5* /usr/lib


 
# 009760          8.28.2. Contents of Ncurses 
# 009761           Installed programs: captoinfo (link to tic), clear, infocmp, infotocap (link to tic), ncursesw6-config, reset (link to tset), tabs, tic, toe, tput, and tset
# 009762           Installed libraries: libcursesw.so (symlink and linker script to libncursesw.so), libformw.so, libmenuw.so, libncursesw.so, libpanelw.so, and their non-wide-character counterparts without "w" in the library names.
# 009763           Installed directories: /usr/share/tabset, /usr/share/terminfo, and /usr/share/doc/ncurses-6.2  
# 009764            Short Descriptions  
# 009765 
# 009766                          
# 009767 
# 009768                captoinfo   
# 009769 
# 009770                          Converts a termcap description into a terminfo description  
# 009771 
# 009772                          clear   
# 009773 
# 009774                          Clears the screen, if possible  
# 009775 
# 009776                          infocmp   
# 009777 
# 009778                          Compares or prints out terminfo descriptions  
# 009779 
# 009780                          infotocap   
# 009781 
# 009782                          Converts a terminfo description into a termcap description  
# 009783 
# 009784                          ncursesw6-config   
# 009785 
# 009786                          Provides configuration information for ncurses  
# 009787 
# 009788                          reset   
# 009789 
# 009790                          Reinitializes a terminal to its default values  
# 009791 
# 009792                          tabs   
# 009793 
# 009794                          Clears and sets tab stops on a terminal  
# 009795 
# 009796                          tic   
# 009797 
# 009798                          The terminfo entry-description compiler that translates a terminfo file from source
# 009799                        format into the binary format needed for the ncurses library routines [A terminfo
# 009800                        file contains information on the capabilities of a certain terminal.]  
# 009801 
# 009802                          toe   
# 009803 
# 009804                          Lists all available terminal types, giving the primary name and description for
# 009805                        each  
# 009806 
# 009807                          tput   
# 009808 
# 009809                          Makes the values of terminal-dependent capabilities available to the shell; it can
# 009810                        also be used to reset or initialize a terminal or report its long name  
# 009811 
# 009812                          tset   
# 009813 
# 009814                          Can be used to initialize terminals  
# 009815 
# 009816                          libcursesw 
# 009817 
# 009818                          A link to libncursesw 
# 009819 
# 009820                          libncursesw 
# 009821 
# 009822                          Contains functions to display text in many complex ways on a terminal screen; a
# 009823                        good example of the use of these functions is the menu displayed during the kernel's
# 009824                        make menuconfig   
# 009825 
# 009826                          libformw 
# 009827 
# 009828                          Contains functions to implement forms  
# 009829 
# 009830                          libmenuw 
# 009831 
# 009832                          Contains functions to implement menus  
# 009833 
# 009834                          libpanelw 
# 009835 
# 009836                          Contains functions to implement panels 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'sed-*')
tar xf $(find -maxdepth 1 -type f -name 'sed-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'sed-*')
read -p "Chapter 8.29"
 
# 009837        8.29. Sed-4.8 
# 009838 
# 009839                          The Sed package contains a stream editor. 
# 009840           Approximate build time: 0.5 SBU
# 009841           Required disk space: 32 MB 
# 009842          8.29.1. Installation of Sed 
# 009843 
# 009844                          Prepare Sed for compilation: 



./configure --prefix=/usr --bindir=/bin



# 009852 
# 009853                          Compile the package and generate the HTML documentation: 



make
make html



# 009862 
# 009863                          To test the results, issue: 



chown -Rv tester .
su tester -c "PATH=$PATH make check"



# 009872 
# 009873                          Install the package and its documentation: 



make install
install -d -m755           /usr/share/doc/sed-4.8
install -m644 doc/sed.html /usr/share/doc/sed-4.8


 
# 009883          8.29.2. Contents of Sed 
# 009884           Installed program: sed
# 009885           Installed directory: /usr/share/doc/sed-4.8  
# 009886            Short Descriptions  
# 009887 
# 009888                          
# 009889 
# 009890                sed   
# 009891 
# 009892                          Filters and transforms text files in a single pass 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'psmisc-*')
tar xf $(find -maxdepth 1 -type f -name 'psmisc-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'psmisc-*')
read -p "Chapter 8.30"
 
# 009893        8.30. Psmisc-23.4 
# 009894 
# 009895                          The Psmisc package contains programs for displaying information about running processes.
# 009896                        
# 009897           Approximate build time: less than 0.1 SBU
# 009898           Required disk space: 5.7 MB 
# 009899          8.30.1. Installation of Psmisc 
# 009900 
# 009901                          Prepare Psmisc for compilation: 



./configure --prefix=/usr



# 009909 
# 009910                          Compile the package: 



make



# 009918 
# 009919                          This package does not come with a test suite. 
# 009920 
# 009921                          Install the package: 



make install



# 009929 
# 009930                          Finally, move the killall  and fuser  programs to the location specified by the FHS:
# 009931                        



mv -v /usr/bin/fuser   /bin
mv -v /usr/bin/killall /bin


 
# 009940          8.30.2. Contents of Psmisc 
# 009941           Installed programs: fuser, killall, peekfd, prtstat, pslog, pstree, and pstree.x11 (link to pstree)  
# 009942            Short Descriptions  
# 009943 
# 009944                          
# 009945 
# 009946                fuser   
# 009947 
# 009948                          Reports the Process IDs (PIDs) of processes that use the given files or file systems
# 009949                         
# 009950 
# 009951                          killall   
# 009952 
# 009953                          Kills processes by name; it sends a signal to all processes running any of the given
# 009954                        commands  
# 009955 
# 009956                          peekfd   
# 009957 
# 009958                          Peek at file descriptors of a running process, given its PID  
# 009959 
# 009960                          prtstat   
# 009961 
# 009962                          Prints information about a process  
# 009963 
# 009964                          pslog   
# 009965 
# 009966                          Reports current logs path of a process  
# 009967 
# 009968                          pstree   
# 009969 
# 009970                          Displays running processes as a tree  
# 009971 
# 009972                          pstree.x11   
# 009973 
# 009974                          Same as pstree  , except that it waits for confirmation before exiting 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'gettext-*')
tar xf $(find -maxdepth 1 -type f -name 'gettext-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'gettext-*')
read -p "Chapter 8.31"
 
# 009975        8.31. Gettext-0.21 
# 009976 
# 009977                          The Gettext package contains utilities for internationalization and localization.
# 009978                        These allow programs to be compiled with NLS (Native Language Support), enabling
# 009979                        them to output messages in the user's native language. 
# 009980           Approximate build time: 2.9 SBU
# 009981           Required disk space: 240 MB 
# 009982          8.31.1. Installation of Gettext 
# 009983 
# 009984                          Prepare Gettext for compilation: 



./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.21



# 009994 
# 009995                          Compile the package: 



make



# 010003 
# 010004                          To test the results (this takes a long time, around 3 SBUs), issue: 



make check



# 010012 
# 010013                          Install the package: 



make install
chmod -v 0755 /usr/lib/preloadable_libintl.so


 
# 010022          8.31.2. Contents of Gettext 
# 010023           Installed programs: autopoint, envsubst, gettext, gettext.sh, gettextize, msgattrib, msgcat, msgcmp, msgcomm, msgconv, msgen, msgexec, msgfilter, msgfmt, msggrep, msginit, msgmerge, msgunfmt, msguniq, ngettext, recode-sr-latin, and xgettext
# 010024           Installed libraries: libasprintf.so, libgettextlib.so, libgettextpo.so, libgettextsrc.so, libtextstyle.so, and preloadable_libintl.so
# 010025           Installed directories: /usr/lib/gettext, /usr/share/doc/gettext-0.21, /usr/share/gettext, and /usr/share/gettext-0.19.8  
# 010026            Short Descriptions  
# 010027 
# 010028                          
# 010029 
# 010030                autopoint   
# 010031 
# 010032                          Copies standard Gettext infrastructure files into a source package  
# 010033 
# 010034                          envsubst   
# 010035 
# 010036                          Substitutes environment variables in shell format strings  
# 010037 
# 010038                          gettext   
# 010039 
# 010040                          Translates a natural language message into the user's language by looking up the
# 010041                        translation in a message catalog  
# 010042 
# 010043                          gettext.sh   
# 010044 
# 010045                          Primarily serves as a shell function library for gettext  
# 010046 
# 010047                          gettextize   
# 010048 
# 010049                          Copies all standard Gettext files into the given top-level directory of a package
# 010050                        to begin internationalizing it  
# 010051 
# 010052                          msgattrib   
# 010053 
# 010054                          Filters the messages of a translation catalog according to their attributes and
# 010055                        manipulates the attributes  
# 010056 
# 010057                          msgcat   
# 010058 
# 010059                          Concatenates and merges the given .pofiles  
# 010060 
# 010061                          msgcmp   
# 010062 
# 010063                          Compares two .pofiles to check that both contain the same set of msgid strings  
# 010064 
# 010065                          msgcomm   
# 010066 
# 010067                          Finds the messages that are common to the given .pofiles  
# 010068 
# 010069                          msgconv   
# 010070 
# 010071                          Converts a translation catalog to a different character encoding  
# 010072 
# 010073                          msgen   
# 010074 
# 010075                          Creates an English translation catalog  
# 010076 
# 010077                          msgexec   
# 010078 
# 010079                          Applies a command to all translations of a translation catalog  
# 010080 
# 010081                          msgfilter   
# 010082 
# 010083                          Applies a filter to all translations of a translation catalog  
# 010084 
# 010085                          msgfmt   
# 010086 
# 010087                          Generates a binary message catalog from a translation catalog  
# 010088 
# 010089                          msggrep   
# 010090 
# 010091                          Extracts all messages of a translation catalog that match a given pattern or belong
# 010092                        to some given source files  
# 010093 
# 010094                          msginit   
# 010095 
# 010096                          Creates a new .pofile, initializing the meta information with values from the user's
# 010097                        environment  
# 010098 
# 010099                          msgmerge   
# 010100 
# 010101                          Combines two raw translations into a single file  
# 010102 
# 010103                          msgunfmt   
# 010104 
# 010105                          Decompiles a binary message catalog into raw translation text  
# 010106 
# 010107                          msguniq   
# 010108 
# 010109                          Unifies duplicate translations in a translation catalog  
# 010110 
# 010111                          ngettext   
# 010112 
# 010113                          Displays native language translations of a textual message whose grammatical form
# 010114                        depends on a number  
# 010115 
# 010116                          recode-sr-latin   
# 010117 
# 010118                          Recodes Serbian text from Cyrillic to Latin script  
# 010119 
# 010120                          xgettext   
# 010121 
# 010122                          Extracts the translatable message lines from the given source files to make the
# 010123                        first translation template  
# 010124 
# 010125                          libasprintf 
# 010126 
# 010127                          defines the autosprintf  class, which makes C formatted output routines usable in
# 010128                        C++ programs, for use with the <string>  strings and the <iostream>  streams  
# 010129 
# 010130                          libgettextlib 
# 010131 
# 010132                          a private library containing common routines used by the various Gettext programs;
# 010133                        these are not intended for general use  
# 010134 
# 010135                          libgettextpo 
# 010136 
# 010137                          Used to write specialized programs that process .pofiles; this library is used when
# 010138                        the standard applications shipped with Gettext (such as msgcomm  , msgcmp  , msgattrib  ,
# 010139                        and msgen  ) will not suffice  
# 010140 
# 010141                          libgettextsrc 
# 010142 
# 010143                          A private library containing common routines used by the various Gettext programs;
# 010144                        these are not intended for general use  
# 010145 
# 010146                          libtextstyle 
# 010147 
# 010148                          Text styling library  
# 010149 
# 010150                          preloadable_libintl 
# 010151 
# 010152                          A library, intended to be used by LD_PRELOAD that assists libintlin logging untranslated
# 010153                        messages 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'bison-*')
tar xf $(find -maxdepth 1 -type f -name 'bison-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'bison-*')
read -p "Chapter 8.32"
 
# 010154        8.32. Bison-3.7.5 
# 010155 
# 010156                          The Bison package contains a parser generator. 
# 010157           Approximate build time: 6.4 SBU
# 010158           Required disk space: 56 MB 
# 010159          8.32.1. Installation of Bison 
# 010160 
# 010161                          Prepare Bison for compilation: 



./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.7.5



# 010169 
# 010170                          Compile the package: 



make



# 010178 
# 010179                          To test the results (about 5.5 SBU), issue: 



make check



# 010187 
# 010188                          Install the package: 



make install


 
# 010196          8.32.2. Contents of Bison 
# 010197           Installed programs: bison and yacc
# 010198           Installed library: liby.a
# 010199           Installed directory: /usr/share/bison  
# 010200            Short Descriptions  
# 010201 
# 010202                          
# 010203 
# 010204                bison   
# 010205 
# 010206                          Generates, from a series of rules, a program for analyzing the structure of text
# 010207                        files; Bison is a replacement for Yacc (Yet Another Compiler Compiler)  
# 010208 
# 010209                          yacc   
# 010210 
# 010211                          A wrapper for bison  , meant for programs that still call yacc  instead of bison  ; it
# 010212                        calls bison  with the -y option  
# 010213 
# 010214                          liby 
# 010215 
# 010216                          The Yacc library containing implementations of Yacc-compatible yyerrorand mainfunctions;
# 010217                        this library is normally not very useful, but POSIX requires it 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'grep-*')
tar xf $(find -maxdepth 1 -type f -name 'grep-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'grep-*')
read -p "Chapter 8.33"
 
# 010218        8.33. Grep-3.6 
# 010219 
# 010220                          The Grep package contains programs for searching through the contents of files.
# 010221                        
# 010222           Approximate build time: 0.8 SBU
# 010223           Required disk space: 38 MB 
# 010224          8.33.1. Installation of Grep 
# 010225 
# 010226                          Prepare Grep for compilation: 



./configure --prefix=/usr --bindir=/bin



# 010234 
# 010235                          Compile the package: 



make



# 010243 
# 010244                          To test the results, issue: 



make check



# 010252 
# 010253                          Install the package: 



make install


 
# 010261          8.33.2. Contents of Grep 
# 010262           Installed programs: egrep, fgrep, and grep  
# 010263            Short Descriptions  
# 010264 
# 010265                          
# 010266 
# 010267                egrep   
# 010268 
# 010269                          Prints lines matching an extended regular expression  
# 010270 
# 010271                          fgrep   
# 010272 
# 010273                          Prints lines matching a list of fixed strings  
# 010274 
# 010275                          grep   
# 010276 
# 010277                          Prints lines matching a basic regular expression 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'bash-*')
tar xf $(find -maxdepth 1 -type f -name 'bash-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'bash-*')
read -p "Chapter 8.34"
 
# 010278        8.34. Bash-5.1 
# 010279 
# 010280                          The Bash package contains the Bourne-Again SHell. 
# 010281           Approximate build time: 1.6 SBU
# 010282           Required disk space: 51 MB 
# 010283          8.34.1. Installation of Bash 
# 010284 
# 010285                          First, fix a race condition if using multiple cores: 



sed -i  '/^bashline.o:.*shmbchar.h/a bashline.o: ${DEFDIR}/builtext.h' Makefile.in



# 010293 
# 010294                          Prepare Bash for compilation: 



./configure --prefix=/usr                    \
            --docdir=/usr/share/doc/bash-5.1 \
            --without-bash-malloc            \
            --with-installed-readline



# 010305 
# 010306                          The meaning of the new configure option: 
# 010307 
# 010308                --with-installed-readline  
# 010309 
# 010310                          This option tells Bash to use the readlinelibrary that is already installed on the
# 010311                        system rather than using its own readline version. 
# 010312 
# 010313                          Compile the package: 



make



# 010321 
# 010322                          Skip down to "Install the package " if not running the test suite. 
# 010323 
# 010324                          To prepare the tests, ensure that the testeruser can write to the sources tree:
# 010325                        



chown -Rv tester .



# 010333 
# 010334                          Now, run the tests as the testeruser: 



su tester << EOF
PATH=$PATH make tests < $(tty)
EOF



# 010344 
# 010345                          Install the package and move the main executable to /bin: 



make install
mv -vf /usr/bin/bash /bin



# 010354 
# 010355                          Run the newly compiled bash  program (replacing the one that is currently being executed):
# 010356                        



exec /bin/bash --login +h



# 010364          Note 
# 010365 
# 010366                          The parameters used make the bash  process an interactive login shell and continues
# 010367                        to disable hashing so that new programs are found as they become available.  
# 010368          8.34.2. Contents of Bash 
# 010369           Installed programs: bash, bashbug, and sh (link to bash)
# 010370           Installed directory: /usr/include/bash, /usr/lib/bash, and /usr/share/doc/bash-5.1  
# 010371            Short Descriptions  
# 010372 
# 010373                          
# 010374 
# 010375                bash   
# 010376 
# 010377                          A widely-used command interpreter; it performs many types of expansions and substitutions
# 010378                        on a given command line before executing it, thus making this interpreter a powerful
# 010379                        tool  
# 010380 
# 010381                          bashbug   
# 010382 
# 010383                          A shell script to help the user compose and mail standard formatted bug reports
# 010384                        concerning bash   
# 010385 
# 010386                          sh   
# 010387 
# 010388                          A symlink to the bash  program; when invoked as sh  , bash  tries to mimic the startup
# 010389                        behavior of historical versions of sh  as closely as possible, while conforming to
# 010390                        the POSIX standard as well 
