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
# 7.6 commands not run due to bash re-exec.
touch /var/log/{btmp,lastlog,faillog,wtmp}
chgrp -v utmp /var/log/lastlog
chmod -v 664 /var/log/lastlog
chmod -v 600 /var/log/btmp



cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'gcc-*' | cut -c 2-)"


read -p "Chapter 7.7"

#        7.7. Libstdc++ from GCC-10.2.0, Pass 2  
# 
#                          When building gcc-pass2we had to defer the installation of the C++ standard library
#                        because no suitable compiler was available to compile it. We could not use the compiler
#                        built in that section because it is a native compiler and should not be used outside
#                        of chroot and risks polluting the libraries with some host components.  
#           Approximate build time: 0.8 SBU
#           Required disk space: 1.1 GB
#          7.7.1. Installation of Target Libstdc++ 
#          Note  
# 
#                          Libstdc++is part of the GCC sources. You should first unpack the GCC tarball and
#                        change to the gcc-10.2.0directory. 
# 
#                          Create a link which exists when building libstdc++ in the gcc tree: 



ln -s gthr-posix.h libgcc/gthr-default.h



# 
#                          Create a separate build directory for libstdc++ and enter it: 



mkdir -v build
cd       build



# 
#                          Prepare libstdc++ for compilation: 



../libstdc++-v3/configure            \
    CXXFLAGS="-g -O2 -D_GNU_SOURCE"  \
    --prefix=/usr                    \
    --disable-multilib               \
    --disable-nls                    \
    --host=$(uname -m)-lfs-linux-gnu \
    --disable-libstdcxx-pch


 
# 
#                          The meaning of the configure options: 
# 
#                CXXFLAGS="-g -O2 -D_GNU_SOURCE" 
# 
#                          These flags are passed by the top level Makefile when doing a full build of GCC.
#                        
# 
#                --host=$(uname -m)-lfs-linux-gnu 
# 
#                          We have to mimic what would happen if this package were built as part of a full
#                        compiler build. This switch would be passed to configure by GCC's build machinery.
#                        
# 
#                --disable-libstdcxx-pch 
# 
#                          This switch prevents the installation of precompiled include files, which are not
#                        needed at this stage. 
# 
#                          Compile libstdc++ by running: 



make



# 
#                          Install the library: 



make install



# 
#                          Details on this package are located in Section 8.26.2, "Contents of GCC."  


rm -rf ./build
cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'gettext-*' | cut -c 2-)"

read -p "Chapter 7.8"

#        7.8. Gettext-0.21  
# 
#                          The Gettext package contains utilities for internationalization and localization.
#                        These allow programs to be compiled with NLS (Native Language Support), enabling
#                        them to output messages in the user's native language. 
#           Approximate build time: 1.8 SBU
#           Required disk space: 310 MB
#          7.8.1. Installation of Gettext 
# 
#                          For our temporary set of tools, we only need to install three programs from Gettext.
#                        
# 
#                          Prepare Gettext for compilation: 



./configure --disable-shared


 
# 
#                          The meaning of the configure option: 
# 
#                --disable-shared 
# 
#                          We do not need to install any of the shared Gettext libraries at this time, therefore
#                        there is no need to build them. 
# 
#                          Compile the package: 



make



# 
#                          Install the  msgfmt ,  msgmerge , and  xgettext programs: 



cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin



# 
#                          Details on this package are located in Section 8.31.2, "Contents of Gettext."  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'bison-*' | cut -c 2-)"

read -p "Chapter 7.9"

#        7.9. Bison-3.7.5  
# 
#                          The Bison package contains a parser generator. 
#           Approximate build time: 0.3 SBU
#           Required disk space: 52 MB
#          7.9.1. Installation of Bison 
# 
#                          Prepare Bison for compilation: 



./configure --prefix=/usr \
            --docdir=/usr/share/doc/bison-3.7.5


 
# 
#                          The meaning of the new configure option: 
# 
#                --docdir=/usr/share/doc/bison-3.7.5 
# 
#                          This tells the build system to install bison documentation into a versioned directory.
#                        
# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make install



# 
#                          Details on this package are located in Section 8.32.2, "Contents of Bison."  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'perl-*' | cut -c 2-)"

read -p "Chapter 7.10"

#        7.10. Perl-5.32.1  
# 
#                          The Perl package contains the Practical Extraction and Report Language. 
#           Approximate build time: 1.7 SBU
#           Required disk space: 268 MB
#          7.10.1. Installation of Perl 
# 
#                          Prepare Perl for compilation: 



sh Configure -des                                        \
             -Dprefix=/usr                               \
             -Dvendorprefix=/usr                         \
             -Dprivlib=/usr/lib/perl5/5.32/core_perl     \
             -Darchlib=/usr/lib/perl5/5.32/core_perl     \
             -Dsitelib=/usr/lib/perl5/5.32/site_perl     \
             -Dsitearch=/usr/lib/perl5/5.32/site_perl    \
             -Dvendorlib=/usr/lib/perl5/5.32/vendor_perl \
             -Dvendorarch=/usr/lib/perl5/5.32/vendor_perl


 
# 
#                          The meaning of the new Configure options: 
# 
#                -des 
# 
#                          This is a combination of three options: -d uses defaults for all items; -e ensures
#                        completion of all tasks; -s silences non-essential output. 
# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make install



# 
#                          Details on this package are located in Section 8.40.2, "Contents of Perl."  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'Python-*' | cut -c 2-)"

read -p "Chapter 7.11"

#        7.11. Python-3.9.2  
# 
#                          The Python 3 package contains the Python development environment. It is useful for
#                        object-oriented programming, writing scripts, prototyping large programs, or developing
#                        entire applications. 
#           Approximate build time: 0.9 SBU
#           Required disk space: 374 MB
#          7.11.1. Installation of Python 
#          Note 
# 
#                          There are two package files whose name starts with "python". The one to extract
#                        from is Python-3.9.2.tar.xz(notice the uppercase first letter). 
# 
#                          Prepare Python for compilation: 



./configure --prefix=/usr   \
            --enable-shared \
            --without-ensurepip


 
# 
#                          The meaning of the configure option: 
# 
#                --enable-shared 
# 
#                          This switch prevents installation of static libraries. 
# 
#                --without-ensurepip 
# 
#                          This switch disables the Python package installer, which is not needed at this stage.
#                        
# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make install



# 
#                          Details on this package are located in Section 8.49.2, "Contents of Python 3."  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'texinfo-*' | cut -c 2-)"

read -p "Chapter 7.12"

#        7.12. Texinfo-6.7  
# 
#                          The Texinfo package contains programs for reading, writing, and converting info
#                        pages. 
#           Approximate build time: 0.3 SBU
#           Required disk space: 105 MB
#          7.12.1. Installation of Texinfo 
# 
#                          Prepare Texinfo for compilation: 



./configure --prefix=/usr



#          Note 
# 
#                          As part of the configure process, a test is made that indicates an error for TestXS_la-TestXS.lo.
#                        This is not relevant for LFS and should be ignored. 
# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make install



# 
#                          Details on this package are located in Section 8.68.2, "Contents of Texinfo."  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'util-linux-*' | cut -c 2-)"

read -p "Chapter 7.13"

#        7.13. Util-linux-2.36.2  
# 
#                          The Util-linux package contains miscellaneous utility programs. 
#           Approximate build time: 0.7 SBU
#           Required disk space: 134 MB
#          7.13.1. Installation of Util-linux 
# 
#                          The FHS recommends using the /var/lib/hwclockdirectory instead of the usual /etcdirectory
#                        as the location for the adjtimefile. Create this directory with: 



mkdir -pv /var/lib/hwclock



# 
#                          Prepare Util-linux for compilation: 



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


 
# 
#                          The meaning of the configure options: 
# 
#                ADJTIME_PATH=/var/lib/hwclock/adjtime 
# 
#                          This sets the location of the file recording information about the hardware clock
#                        in accordance to the FHS. This is not stricly needed for this temporary tool, but
#                        it prevents creating a file at another location, which would not be overwritten
#                        or removed when building the final util-linux package. 
# 
#                --disable-* 
# 
#                          These switches prevent warnings about building components that require packages
#                        not in LFS or not installed yet. 
# 
#                --without-python 
# 
#                          This switch disables using Python. It avoids trying to build unneeded bindings.
#                        
# 
#                runstatedir=/run 
# 
#                          This switch sets the location of the socket used by  uuidd and libuuidcorrectly. 
# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make install



# 
#                          Details on this package are located in Section 8.72.2, "Contents of Util-linux."  read -p "Chapter 7.14"

#        7.14. Cleaning up and Saving the Temporary System  
# 
#                          The libtool .la files are only useful when linking with static libraries. They are
#                        unneeded, and potentially harmful, when using dynamic shared libraries, specially
#                        when using non-autotools build systems. While still in chroot, remove those files
#                        now: 



find /usr/{lib,libexec} -name \*.la -delete



# 
#                          Remove the documentation of the temporary tools, to prevent them from ending up
#                        in the final system, and save about 35 MB: 



rm -rf /usr/share/{info,man,doc}/*



#          Note 
# 
#                          All the remaining steps in this section are optional. Nevertheless, as soon as you
#                        begin installing packages in Chapter 8, the temporary tools will be overwritten.
#                        So it may be a good idea to do a backup of the temporary tools as described below.
#                        The other steps are only needed if you are really short on disk space.  
# 
#                          The following steps are performed from outside the chroot environment. That means,
#                        you have to leave the chroot environment first before continuing. The reason for
#                        that is to: 
# 
#                          make sure that objects are not in use while they are manipulated. 
# 
#                          get access to file system locations outside of the chroot environment to store/read
#                        the backup archive which should not be placed within the $LFShierarchy for safety
#                        reasons. 
# 
#                          Leave the chroot environment and unmount the kernel virtual file systems: 
#          Note 
# 
#                          All of the following instructions are executed by root. Take extra care about the
#                        commands you're going to run as mistakes here can modify your host system. Be aware
#                        that the environment variable LFSis set for user lfsby default but it might not be
#                        set for root. Whenever commands are to be executed by root, make sure you have set
#                        LFSaccordingly. This has been discussed in Section 2.6, "Setting The $LFS Variable".
#                         



exit
umount $LFS/dev{/pts,}
umount $LFS/{sys,proc,run}



#          7.14.1. Stripping 
# 
#                          If the LFS partition is rather small, it is good to know that unnecessary items
#                        can be removed. The executables and libraries built so far contain a little over
#                        90 MB of unneeded debugging symbols. 
# 
#                          Strip off debugging symbols from binaries: 



strip --strip-debug $LFS/usr/lib/*
strip --strip-unneeded $LFS/usr/{,s}bin/*
strip --strip-unneeded $LFS/tools/bin/*



# 
#                          These commands will skip a number of files reporting that it does not recognize
#                        their file format. Most of these are scripts instead of binaries. 
# 
#                          Take care  NOT to use  --strip-unneededon the libraries. The static ones would be destroyed
#                        and the toolchain packages would need to be built all over again.  
# 
#                          At this point, you should have at least 5 GB of free space on the chroot partition
#                        that can be used to build and install Glibc and GCC in the next phase. If you can
#                        build and install Glibc, you can build and install the rest too. You can check the
#                        free disk space with the command df -h $LFS . 
#          7.14.2. Backup 
# 
#                          Now that the essential tools have been created, its time to think about a backup.
#                        When every check has passed successfully in the previously built packages, your
#                        temporary tools are in a good state and might be backed up for later reuse. In case
#                        of fatal failures in the subsequent chapters, it often turns out that removing everything
#                        and starting over (more carefully) is the best option to recover. Unfortunately,
#                        all the temporary tools will be removed, too. To avoid spending extra time to redo
#                        something which has been built successfully, prepare a backup. 
# 
#                          Make sure you have at least 600 MB free disk space (the source tarballs will be
#                        included in the backup archive) in the home directory of user root. 
# 
#                          Create the backup archive by running the following command: 



cd $LFS &&
tar -cJpf $HOME/lfs-temp-tools-10.1.tar.xz .



# 
#                          Replace $HOMEby a directory of your choice if you do not want to have the backup
#                        stored in root's home directory. 
#          7.14.3. Restore 
# 
#                          In case some mistakes have been made and you need to start over, you can use this
#                        backup to restore the temporary tools and save some recovery time. Since the sources
#                        are located under $LFS, they are included in the backup archive as well, so they
#                        do not need to be downloaded again. After checking that $LFSis set properly, restore
#                        the backup by executing the following commands: 



cd $LFS &&
rm -rf ./* &&
tar -xpf $HOME/lfs-temp-tools-10.1.tar.xz



# 
#                          Again, double check that the environment has been setup properly and continue building
#                        the rest of the system. 
#          Important 
# 
#                          If you left the chroot environment either to strip off debug symbols, create a backup,
#                        or restart building using a restore, remember to mount the kernel virtual filesystems
#                        now again as described in Section 7.3, "Preparing Virtual Kernel File Systems"and
#                        re-enter the chroot environment (see Section 7.4, "Entering the Chroot Environment")
#                        again before continuing.   
#      Part IV. Building the LFS System  
#        Chapter 8. Installing Basic System Software  
#        8.1. Introduction  
# 
#                          In this chapter, we start constructing the LFS system in earnest. 
# 
#                          The installation of this software is straightforward. Although in many cases the
#                        installation instructions could be made shorter and more generic, we have opted
#                        to provide the full instructions for every package to minimize the possibilities
#                        for mistakes. The key to learning what makes a Linux system work is to know what
#                        each package is used for and why you (or the system) may need it. 
# 
#                          We do not recommend using optimizations. They can make a program run slightly faster,
#                        but they may also cause compilation difficulties and problems when running the program.
#                        If a package refuses to compile when using optimization, try to compile it without
#                        optimization and see if that fixes the problem. Even if the package does compile
#                        when using optimization, there is the risk it may have been compiled incorrectly
#                        because of the complex interactions between the code and build tools. Also note
#                        that the -marchand -mtuneoptions using values not specified in the book have not
#                        been tested. This may cause problems with the toolchain packages (Binutils, GCC
#                        and Glibc). The small potential gains achieved in using compiler optimizations are
#                        often outweighed by the risks. First-time builders of LFS are encouraged to build
#                        without custom optimizations. The subsequent system will still run very fast and
#                        be stable at the same time. 
# 
#                          Before the installation instructions, each installation page provides information
#                        about the package, including a concise description of what it contains, approximately
#                        how long it will take to build, and how much disk space is required during this
#                        building process. Following the installation instructions, there is a list of programs
#                        and libraries (along with brief descriptions) that the package installs. 
#          Note 
# 
#                          The SBU values and required disk space includes test suite data for all applicable
#                        packages in Chapter 8. SBU values have been calculated using a single CPU core (-j1)
#                        for all operations.  
#          8.1.1. About libraries 
# 
#                          In general, the LFS editors discourage building and installing static libraries.
#                        The original purpose for most static libraries has been made obsolete in a modern
#                        Linux system. In addition, linking a static library into a program can be detrimental.
#                        If an update to the library is needed to remove a security problem, all programs
#                        that use the static library will need to be relinked to the new library. Since the
#                        use of static libraries is not always obvious, the relevant programs (and the procedures
#                        needed to do the linking) may not even be known. 
# 
#                          In the procedures in this chapter, we remove or disable installation of most static
#                        libraries. Usually this is done by passing a --disable-staticoption to configure .
#                        In other cases, alternate means are needed. In a few cases, especially glibc and
#                        gcc, the use of static libraries remains essential to the general package building
#                        process. 
# 
#                          For a more complete discussion of libraries, see the discussion Libraries: Static
#                        or shared?in the BLFS book.   
#        8.2. Package Management  
# 
#                          Package Management is an often requested addition to the LFS Book. A Package Manager
#                        allows tracking the installation of files making it easy to remove and upgrade packages.
#                        As well as the binary and library files, a package manager will handle the installation
#                        of configuration files. Before you begin to wonder, NO;this section will not talk
#                        about nor recommend any particular package manager. What it provides is a roundup
#                        of the more popular techniques and how they work. The perfect package manager for
#                        you may be among these techniques or may be a combination of two or more of these
#                        techniques. This section briefly mentions issues that may arise when upgrading packages.
#                        
# 
#                          Some reasons why no package manager is mentioned in LFS or BLFS include: 
# 
#                          Dealing with package management takes the focus away from the goals of these books;teaching
#                        how a Linux system is built. 
# 
#                          There are multiple solutions for package management, each having its strengths and
#                        drawbacks. Including one that satisfies all audiences is difficult. 
# 
#                          There are some hints written on the topic of package management. Visit the Hints
#                        Projectand see if one of them fits your need.  
#          8.2.1. Upgrade Issues 
# 
#                          A Package Manager makes it easy to upgrade to newer versions when they are released.
#                        Generally the instructions in the LFS and BLFS books can be used to upgrade to the
#                        newer versions. Here are some points that you should be aware of when upgrading
#                        packages, especially on a running system. 
# 
#                          If Glibc needs to be upgraded to a newer version, (e.g. from glibc-2.31 to glibc-2.32),
#                        it is safer to rebuild LFS. Though you may be able to rebuild all the packages in
#                        their dependency order, we do not recommend it. 
# 
#                          If a package containing a shared library is updated, and if the name of the library
#                        changes, then any the packages dynamically linked to the library need to be recompiled
#                        in order to link against the newer library. (Note that there is no correlation between
#                        the package version and the name of the library.) For example, consider a package
#                        foo-1.2.3 that installs a shared library with name libfoo.so.1. If you upgrade the
#                        package to a newer version foo-1.2.4 that installs a shared library with name libfoo.so.2.
#                        In this case, any packages that are dynamically linked to libfoo.so.1need to be
#                        recompiled to link against libfoo.so.2in order to use the new library version. You
#                        should not remove the previous libraries unless all the dependent packages are recompiled.
#                        
#          8.2.2. Package Management Techniques 
# 
#                          The following are some common package management techniques. Before making a decision
#                        on a package manager, do some research on the various techniques, particularly the
#                        drawbacks of the particular scheme.  
#            8.2.2.1. It is All in My Head!  
# 
#                          Yes, this is a package management technique. Some folks do not find the need for
#                        a package manager because they know the packages intimately and know what files
#                        are installed by each package. Some users also do not need any package management
#                        because they plan on rebuilding the entire system when a package is changed. 
#            8.2.2.2. Install in Separate Directories  
# 
#                          This is a simplistic package management that does not need any extra package to
#                        manage the installations. Each package is installed in a separate directory. For
#                        example, package foo-1.1 is installed in /usr/pkg/foo-1.1and a symlink is made from
#                        /usr/pkg/footo /usr/pkg/foo-1.1. When installing a new version foo-1.2, it is installed
#                        in /usr/pkg/foo-1.2and the previous symlink is replaced by a symlink to the new
#                        version. 
# 
#                          Environment variables such as PATH, LD_LIBRARY_PATH, MANPATH, INFOPATHand CPPFLAGSneed
#                        to be expanded to include /usr/pkg/foo. For more than a few packages, this scheme
#                        becomes unmanageable. 
#            8.2.2.3. Symlink Style Package Management  
# 
#                          This is a variation of the previous package management technique. Each package is
#                        installed similar to the previous scheme. But instead of making the symlink, each
#                        file is symlinked into the /usrhierarchy. This removes the need to expand the environment
#                        variables. Though the symlinks can be created by the user to automate the creation,
#                        many package managers have been written using this approach. A few of the popular
#                        ones include Stow, Epkg, Graft, and Depot. 
# 
#                          The installation needs to be faked, so that the package thinks that it is installed
#                        in /usrthough in reality it is installed in the /usr/pkghierarchy. Installing in
#                        this manner is not usually a trivial task. For example, consider that you are installing
#                        a package libfoo-1.1. The following instructions may not install the package properly:
#                        



# ./configure --prefix=/usr/pkg/libfoo/1.1
# make
# make install
# 


# 
#                          The installation will work, but the dependent packages may not link to libfoo as
#                        you would expect. If you compile a package that links against libfoo, you may notice
#                        that it is linked to /usr/pkg/libfoo/1.1/lib/libfoo.so.1instead of /usr/lib/libfoo.so.1as
#                        you would expect. The correct approach is to use the DESTDIRstrategy to fake installation
#                        of the package. This approach works as follows: 



# ./configure --prefix=/usr
# make
# make DESTDIR=/usr/pkg/libfoo/1.1 install
# 


# 
#                          Most packages support this approach, but there are some which do not. For the non-compliant
#                        packages, you may either need to manually install the package, or you may find that
#                        it is easier to install some problematic packages into /opt. 
#            8.2.2.4. Timestamp Based  
# 
#                          In this technique, a file is timestamped before the installation of the package.
#                        After the installation, a simple use of the find command with the appropriate options
#                        can generate a log of all the files installed after the timestamp file was created.
#                        A package manager written with this approach is install-log. 
# 
#                          Though this scheme has the advantage of being simple, it has two drawbacks. If,
#                        during installation, the files are installed with any timestamp other than the current
#                        time, those files will not be tracked by the package manager. Also, this scheme
#                        can only be used when one package is installed at a time. The logs are not reliable
#                        if two packages are being installed on two different consoles.  
#            8.2.2.5. Tracing Installation Scripts  
# 
#                          In this approach, the commands that the installation scripts perform are recorded.
#                        There are two techniques that one can use: 
# 
#                          The LD_PRELOADenvironment variable can be set to point to a library to be preloaded
#                        before installation. During installation, this library tracks the packages that
#                        are being installed by attaching itself to various executables such as cp ,  install ,
#                         mv and tracking the system calls that modify the filesystem. For this approach to
#                        work, all the executables need to be dynamically linked without the suid or sgid
#                        bit. Preloading the library may cause some unwanted side-effects during installation.
#                        Therefore, it is advised that one performs some tests to ensure that the package
#                        manager does not break anything and logs all the appropriate files. 
# 
#                          The second technique is to use  strace , which logs all system calls made during the
#                        execution of the installation scripts.  
#            8.2.2.6. Creating Package Archives  
# 
#                          In this scheme, the package installation is faked into a separate tree as described
#                        in the Symlink style package management. After the installation, a package archive
#                        is created using the installed files. This archive is then used to install the package
#                        either on the local machine or can even be used to install the package on other
#                        machines. 
# 
#                          This approach is used by most of the package managers found in the commercial distributions.
#                        Examples of package managers that follow this approach are RPM (which, incidentally,
#                        is required by the Linux Standard Base Specification), pkg-utils, Debian's apt,
#                        and Gentoo's Portage system. A hint describing how to adopt this style of package
#                        management for LFS systems is located at http://www.linuxfromscratch.org/hints/downloads/files/fakeroot.txt.
#                         
# 
#                          Creation of package files that include dependency information is complex and is
#                        beyond the scope of LFS. 
# 
#                          Slackware uses a tar based system for package archives. This system purposely does
#                        not handle package dependencies as more complex package managers do. For details
#                        of Slackware package management, see http://www.slackbook.org/html/package-management.html.
#                          
#            8.2.2.7. User Based Management  
# 
#                          This scheme, unique to LFS, was devised by Matthias Benkmann, and is available from
#                        the Hints Project. In this scheme, each package is installed as a separate user
#                        into the standard locations. Files belonging to a package are easily identified
#                        by checking the user ID. The features and shortcomings of this approach are too
#                        complex to describe in this section. For the details please see the hint at http://www.linuxfromscratch.org/hints/downloads/files/more_control_and_pkg_man.txt.
#                         
#          8.2.3. Deploying LFS on Multiple Systems 
# 
#                          One of the advantages of an LFS system is that there are no files that depend on
#                        the position of files on a disk system. Cloning an LFS build to another computer
#                        with the same architecture as the base system is as simple as using tar on the LFS
#                        partition that contains the root directory (about 250MB uncompressed for a base
#                        LFS build), copying that file via network transfer or CD-ROM to the new system and
#                        expanding it. From that point, a few configuration files will have to be changed.
#                        Configuration files that may need to be updated include: /etc/hosts, /etc/fstab,
#                        /etc/passwd, /etc/group,  /etc/shadow, /etc/ld.so.conf, /etc/sysconfig/rc.site, /etc/sysconfig/network,
#                        and /etc/sysconfig/ifconfig.eth0. 
# 
#                          A custom kernel may need to be built for the new system depending on differences
#                        in system hardware and the original kernel configuration. 
#          Note 
# 
#                          There have been some reports of issues when copying between similar but not identical
#                        architectures. For instance, the instruction set for an Intel system is not identical
#                        with an AMD processor and later versions of some processors may have instructions
#                        that are unavailable in earlier versions. 
# 
#                          Finally the new system has to be made bootable via Section 10.4, "Using GRUB to
#                        Set Up the Boot Process".  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'man-pages-*' | cut -c 2-)"

read -p "Chapter 8.3"

#        8.3. Man-pages-5.10  
# 
#                          The Man-pages package contains over 2,200 man pages. 
#           Approximate build time: less than 0.1 SBU
#           Required disk space: 4.7 MB
#          8.3.1. Installation of Man-pages 
# 
#                          Install Man-pages by running: 



make install


 
#          8.3.2. Contents of Man-pages  
#           Installed files: various man pages 
#            Short Descriptions   
# 
#                          
# 
#                man pages 
# 
#                          Describe C programming language functions, important device files, and significant
#                        configuration files 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'iana-etc-*' | cut -c 2-)"

read -p "Chapter 8.4"

#        8.4. Iana-Etc-20210202  
# 
#                          The Iana-Etc package provides data for network services and protocols. 
#           Approximate build time: less than 0.1 SBU
#           Required disk space: 4.7 MB
#          8.4.1. Installation of Iana-Etc 
# 
#                          For this package, we only need to copy the files into place: 



cp services protocols /etc


 
#          8.4.2. Contents of Iana-Etc  
#           Installed files: /etc/protocols and /etc/services 
#            Short Descriptions   
# 
#                          
# 
#                /etc/protocols 
# 
#                          Describes the various DARPA Internet protocols that are available from the TCP/IP
#                        subsystem  
# 
#                          /etc/services 
# 
#                          Provides a mapping between friendly textual names for internet services, and their
#                        underlying assigned port numbers and protocol types 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'glibc-*' | cut -c 2-)"

rm -rf ./build
read -p "Chapter 8.5"

#        8.5. Glibc-2.33  
# 
#                          The Glibc package contains the main C library. This library provides the basic routines
#                        for allocating memory, searching directories, opening and closing files, reading
#                        and writing files, string handling, pattern matching, arithmetic, and so on. 
#           Approximate build time: 19 SBU
#           Required disk space: 2.5 GB
#          8.5.1. Installation of Glibc 
# 
#                          Some of the Glibc programs use the non-FHS compliant /var/dbdirectory to store their
#                        runtime data. Apply the following patch to make such programs store their runtime
#                        data in the FHS-compliant locations: 



patch -Np1 -i ../glibc-2.33-fhs-1.patch



# 
#                          Fix a bug that causes issues with chrooted applications: 



sed -e '402a\      *result = local->data.services[database_index];' \
    -i nss/nss_database.c



# 
#                          The Glibc documentation recommends building Glibc in a dedicated build directory:
#                        



mkdir -v build
cd       build



# 
#                          Prepare Glibc for compilation: 



../configure --prefix=/usr                            \
             --disable-werror                         \
             --enable-kernel=3.2                      \
             --enable-stack-protector=strong          \
             --with-headers=/usr/include              \
             libc_cv_slibdir=/lib


 
# 
#                          The meaning of the configure options: 
# 
#                --disable-werror 
# 
#                          This option disables the -Werror option passed to GCC. This is necessary for running
#                        the test suite. 
# 
#                --enable-kernel=3.2 
# 
#                          This option tells the build system that this glibc may be used with kernels as old
#                        as 3.2. This means generating workarounds in case a system call introduced in a
#                        later version cannot be used. 
# 
#                --enable-stack-protector=strong 
# 
#                          This option increases system security by adding extra code to check for buffer overflows,
#                        such as stack smashing attacks. 
# 
#                --with-headers=/usr/include 
# 
#                          This option tells the build system where to find the kernel API headers. 
# 
#                libc_cv_slibdir=/lib 
# 
#                          This variable sets the correct library for all systems. We do not want lib64 to
#                        be used. 
# 
#                libc_cv_include_x86_isa_level=no
# 
#                          This disables "x86 ISA needed"property in Glibc libraries. Use it  if you are building
#                        Glibc with -marchoption in CFLAGS, to workaround an issue in Glibc-2.33 breaking
#                        it. 
# 
#                          Compile the package: 



make



#          Important 
# 
#                          In this section, the test suite for Glibc is considered critical. Do not skip it
#                        under any circumstance. 
# 
#                          Generally a few tests do not pass. The test failures listed below are usually safe
#                        to ignore. 



make check



# 
#                          You may see some test failures. The Glibc test suite is somewhat dependent on the
#                        host system. This is a list of the most common issues seen for some versions of
#                        LFS:  
# 
#                          io/tst-lchmod is known to fail in the LFS chroot environment.  
# 
#                          misc/tst-ttyname is known to fail in the LFS chroot environment.  
# 
#                          elf/tst-cpu-features-cpuinfo may fail on some architectures. 
# 
#                          The  nss/tst-nss-files-hosts-multi test may fail for reasons that have not been determined.
#                        
# 
#                          The  rt/tst-cputimer{1,2,3} tests depend on the host system kernel. Kernels 4.14.91-4.14.96,
#                        4.19.13-4.19.18, and 4.20.0-4.20.5 are known to cause these tests to fail. 
# 
#                          The math tests sometimes fail when running on systems where the CPU is not a relatively
#                        new Intel or AMD processor. 
# 
#                          Though it is a harmless message, the install stage of Glibc will complain about
#                        the absence of /etc/ld.so.conf. Prevent this warning with: 



touch /etc/ld.so.conf



# 
#                          Fix the generated Makefile to skip an unneeded sanity check that fails in the LFS
#                        partial environment: 



sed '/test-installation/s@$(PERL)@echo not running@' -i ../Makefile



# 
#                          Install the package: 



make install



# 
#                          Install the configuration file and runtime directory for  nscd : 



cp -v ../nscd/nscd.conf /etc/nscd.conf
mkdir -pv /var/cache/nscd



# 
#                          Next, install the locales that can make the system respond in a different language.
#                        None of the locales are required, but if some of them are missing, the test suites
#                        of future packages would skip important testcases. 
# 
#                          Individual locales can be installed using the  localedef program. E.g., the first
#                         localedef command below combines the /usr/share/i18n/locales/cs_CZcharset-independent
#                        locale definition with the /usr/share/i18n/charmaps/UTF-8.gzcharmap definition and
#                        appends the result to the /usr/lib/locale/locale-archivefile. The following instructions
#                        will install the minimum set of locales necessary for the optimal coverage of tests:
#                        



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



# 
#                          In addition, install the locale for your own country, language and character set.
#                        
# 
#                          Alternatively, install all locales listed in the glibc-2.33/localedata/SUPPORTEDfile
#                        (it includes every locale listed above and many more) at once with the following
#                        time-consuming command: 



make localedata/install-locales



# 
#                          Then use the  localedef command to create and install locales not listed in the glibc-2.33/localedata/SUPPORTEDfile
#                        in the unlikely case you need them. 
#          Note 
# 
#                          Glibc now uses libidn2 when resolving internationalized domain names. This is a
#                        run time dependency. If this capability is needed, the instructions for installing
#                        libidn2 are in the BLFS libidn2 page.   
#          8.5.2. Configuring Glibc  
#            8.5.2.1. Adding nsswitch.conf  
# 
#                          The /etc/nsswitch.conffile needs to be created because the Glibc defaults do not
#                        work well in a networked environment. 
# 
#                          Create a new file /etc/nsswitch.confby running the following: 



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



#            8.5.2.2. Adding time zone data  
# 
#                          Install and set up the time zone data with the following: 



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



# 
#                          The meaning of the zic commands: 
# 
#                zic -L /dev/null ... 
# 
#                          This creates posix time zones without any leap seconds. It is conventional to put
#                        these in both zoneinfoand zoneinfo/posix. It is necessary to put the POSIX time
#                        zones in zoneinfo, otherwise various test-suites will report errors. On an embedded
#                        system, where space is tight and you do not intend to ever update the time zones,
#                        you could save 1.9 MB by not using the posixdirectory, but some applications or
#                        test-suites might produce some failures. 
# 
#                zic -L leapseconds ... 
# 
#                          This creates right time zones, including leap seconds. On an embedded system, where
#                        space is tight and you do not intend to ever update the time zones, or care about
#                        the correct time, you could save 1.9MB by omitting the rightdirectory. 
# 
#                zic ... -p ... 
# 
#                          This creates the posixrulesfile. We use New York because POSIX requires the daylight
#                        savings time rules to be in accordance with US rules. 
# 
#                          One way to determine the local time zone is to run the following script: 



tzselect



# 
#                          After answering a few questions about the location, the script will output the name
#                        of the time zone (e.g.,  America/Edmonton ). There are also some other possible time
#                        zones listed in /usr/share/zoneinfosuch as  Canada/Eastern or  EST5EDT that are not
#                        identified by the script but can be used. 
# 
#                          Then create the /etc/localtimefile by running: 



ln -sfv /usr/share/zoneinfo/<xxx> /etc/localtime


 
# 
#                          Replace  <xxx>with the name of the time zone selected (e.g., Canada/Eastern).  
#            8.5.2.3. Configuring the Dynamic Loader  
# 
#                          By default, the dynamic loader (/lib/ld-linux.so.2) searches through /liband /usr/libfor
#                        dynamic libraries that are needed by programs as they are run. However, if there
#                        are libraries in directories other than /liband /usr/lib, these need to be added
#                        to the /etc/ld.so.conffile in order for the dynamic loader to find them. Two directories
#                        that are commonly known to contain additional libraries are /usr/local/liband /opt/lib,
#                        so add those directories to the dynamic loader's search path. 
# 
#                          Create a new file /etc/ld.so.confby running the following: 



cat > /etc/ld.so.conf << "EOF"
# Begin /etc/ld.so.conf
/usr/local/lib
/opt/lib

EOF



# 
#                          If desired, the dynamic loader can also search a directory and include the contents
#                        of files found there. Generally the files in this include directory are one line
#                        specifying the desired library path. To add this capability run the following commands:
#                        



cat >> /etc/ld.so.conf << "EOF"
# Add an include directory
include /etc/ld.so.conf.d/*.conf

EOF
mkdir -pv /etc/ld.so.conf.d



#          8.5.3. Contents of Glibc  
#           Installed programs: catchsegv, gencat, getconf, getent, iconv, iconvconfig, ldconfig, ldd, lddlibc4, locale, localedef, makedb, mtrace, nscd, pcprofiledump, pldd, sln, sotruss, sprof, tzselect, xtrace, zdump, and zic
#           Installed libraries: ld-2.33.so, libBrokenLocale.{a,so}, libSegFault.so, libanl.{a,so}, libc.{a,so}, libc_nonshared.a, libcrypt.{a,so}, libdl.{a,so}, libg.a, libm.{a,so}, libmcheck.a, libmemusage.so, libmvec.{a,so}, libnsl.{a,so}, libnss_compat.so, libnss_dns.so, libnss_files.so, libnss_hesiod.so, libpcprofile.so, libpthread.{a,so}, libpthread_nonshared.a, libresolv.{a,so}, librt.{a,so}, libthread_db.so, and libutil.{a,so}
#           Installed directories: /usr/include/arpa, /usr/include/bits, /usr/include/gnu, /usr/include/net, /usr/include/netash, /usr/include/netatalk, /usr/include/netax25, /usr/include/neteconet, /usr/include/netinet, /usr/include/netipx, /usr/include/netiucv, /usr/include/netpacket, /usr/include/netrom, /usr/include/netrose, /usr/include/nfs, /usr/include/protocols, /usr/include/rpc, /usr/include/sys, /usr/lib/audit, /usr/lib/gconv, /usr/lib/locale, /usr/libexec/getconf, /usr/share/i18n, /usr/share/zoneinfo, /var/cache/nscd, and /var/lib/nss_db 
#            Short Descriptions   
# 
#                          
# 
#                catchsegv   
# 
#                          Can be used to create a stack trace when a program terminates with a segmentation
#                        fault  
# 
#                          gencat   
# 
#                          Generates message catalogues  
# 
#                          getconf   
# 
#                          Displays the system configuration values for file system specific variables  
# 
#                          getent   
# 
#                          Gets entries from an administrative database  
# 
#                          iconv   
# 
#                          Performs character set conversion  
# 
#                          iconvconfig   
# 
#                          Creates fastloading iconv module configuration files   
# 
#                          ldconfig   
# 
#                          Configures the dynamic linker runtime bindings  
# 
#                          ldd   
# 
#                          Reports which shared libraries are required by each given program or shared library
#                         
# 
#                          lddlibc4   
# 
#                          Assists ldd with object files   
# 
#                          locale   
# 
#                          Prints various information about the current locale  
# 
#                          localedef   
# 
#                          Compiles locale specifications  
# 
#                          makedb   
# 
#                          Creates a simple database from textual input  
# 
#                          mtrace   
# 
#                          Reads and interprets a memory trace file and displays a summary in human-readable
#                        format  
# 
#                          nscd   
# 
#                          A daemon that provides a cache for the most common name service requests  
# 
#                          pcprofiledump   
# 
#                          Dump information generated by PC profiling  
# 
#                          pldd   
# 
#                          Lists dynamic shared objects used by running processes  
# 
#                          sln   
# 
#                          A statically linked ln program   
# 
#                          sotruss   
# 
#                          Traces shared library procedure calls of a specified command  
# 
#                          sprof   
# 
#                          Reads and displays shared object profiling data  
# 
#                          tzselect   
# 
#                          Asks the user about the location of the system and reports the corresponding time
#                        zone description  
# 
#                          xtrace   
# 
#                          Traces the execution of a program by printing the currently executed function  
# 
#                          zdump   
# 
#                          The time zone dumper  
# 
#                          zic   
# 
#                          The time zone compiler  
# 
#                          ld-2.33.so 
# 
#                          The helper program for shared library executables  
# 
#                          libBrokenLocale 
# 
#                          Used internally by Glibc as a gross hack to get broken programs (e.g., some Motif
#                        applications) running. See comments in glibc-2.33/locale/broken_cur_max.cfor more
#                        information  
# 
#                          libSegFault 
# 
#                          The segmentation fault signal handler, used by catchsegv   
# 
#                          libanl 
# 
#                          An asynchronous name lookup library  
# 
#                          libc 
# 
#                          The main C library  
# 
#                          libcrypt 
# 
#                          The cryptography library  
# 
#                          libdl 
# 
#                          The dynamic linking interface library  
# 
#                          libg 
# 
#                          Dummy library containing no functions. Previously was a runtime library for g++   
# 
#                          libm 
# 
#                          The mathematical library  
# 
#                          libmcheck 
# 
#                          Turns on memory allocation checking when linked to  
# 
#                          libmemusage 
# 
#                          Used by memusage to help collect information about the memory usage of a program
#                          
# 
#                          libnsl 
# 
#                          The network services library  
# 
#                          libnss 
# 
#                          The Name Service Switch libraries, containing functions for resolving host names,
#                        user names, group names, aliases, services, protocols, etc.  
# 
#                          libpcprofile 
# 
#                          Can be preloaded to PC profile an executable  
# 
#                          libpthread 
# 
#                          The POSIX threads library  
# 
#                          libresolv 
# 
#                          Contains functions for creating, sending, and interpreting packets to the Internet
#                        domain name servers  
# 
#                          librt 
# 
#                          Contains functions providing most of the interfaces specified by the POSIX.1b Realtime
#                        Extension  
# 
#                          libthread_db 
# 
#                          Contains functions useful for building debuggers for multi-threaded programs  
# 
#                          libutil 
# 
#                          Contains code for "standard"functions used in many different Unix utilities  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'zlib-*' | cut -c 2-)"

read -p "Chapter 8.6"

#        8.6. Zlib-1.2.11  
# 
#                          The Zlib package contains compression and decompression routines used by some programs.
#                        
#           Approximate build time: less than 0.1 SBU
#           Required disk space: 5.0 MB
#          8.6.1. Installation of Zlib 
# 
#                          Prepare Zlib for compilation: 



./configure --prefix=/usr



# 
#                          Compile the package: 



make



# 
#                          To test the results, issue: 



make check



# 
#                          Install the package: 



make install



# 
#                          The shared library needs to be moved to /lib, and as a result the .sofile in /usr/libwill
#                        need to be recreated: 



mv -v /usr/lib/libz.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libz.so) /usr/lib/libz.so



# 
#                          Remove an useless static library: 



rm -fv /usr/lib/libz.a


 
#          8.6.2. Contents of Zlib  
#           Installed libraries: libz.so 
#            Short Descriptions   
# 
#                          
# 
#                libz 
# 
#                          Contains compression and decompression functions used by some programs 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'bzip-*' | cut -c 2-)"

read -p "Chapter 8.7"

#        8.7. Bzip2-1.0.8  
# 
#                          The Bzip2 package contains programs for compressing and decompressing files. Compressing
#                        text files with bzip2 yields a much better compression percentage than with the traditional
#                         gzip . 
#           Approximate build time: less than 0.1 SBU
#           Required disk space: 7.5 MB
#          8.7.1. Installation of Bzip2 
# 
#                          Apply a patch that will install the documentation for this package: 



patch -Np1 -i ../bzip2-1.0.8-install_docs-1.patch



# 
#                          The following command ensures installation of symbolic links are relative: 



sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile



# 
#                          Ensure the man pages are installed into the correct location: 



sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile



# 
#                          Prepare Bzip2 for compilation with: 



make -f Makefile-libbz2_so
make clean


 
# 
#                          The meaning of the make parameter: 
# 
#                -f Makefile-libbz2_so 
# 
#                          This will cause Bzip2 to be built using a different Makefilefile, in this case the
#                        Makefile-libbz2_sofile, which creates a dynamic libbz2.solibrary and links the Bzip2
#                        utilities against it. 
# 
#                          Compile and test the package: 



make



# 
#                          Install the programs: 



make PREFIX=/usr install



# 
#                          Install the shared  bzip2 binary into the /bindirectory, make some necessary symbolic
#                        links, and clean up: 



cp -v bzip2-shared /bin/bzip2
cp -av libbz2.so* /lib
ln -sv ../../lib/libbz2.so.1.0 /usr/lib/libbz2.so
rm -v /usr/bin/{bunzip2,bzcat,bzip2}
ln -sv bzip2 /bin/bunzip2
ln -sv bzip2 /bin/bzcat



# 
#                          Remove an useless static library: 



rm -fv /usr/lib/libbz2.a


 
#          8.7.2. Contents of Bzip2  
#           Installed programs: bunzip2 (link to bzip2), bzcat (link to bzip2), bzcmp (link to bzdiff), bzdiff, bzegrep (link to bzgrep), bzfgrep (link to bzgrep), bzgrep, bzip2, bzip2recover, bzless (link to bzmore), and bzmore
#           Installed libraries: libbz2.so
#           Installed directory: /usr/share/doc/bzip2-1.0.8 
#            Short Descriptions   
# 
#                          
# 
#                bunzip2   
# 
#                          Decompresses bzipped files  
# 
#                          bzcat   
# 
#                          Decompresses to standard output  
# 
#                          bzcmp   
# 
#                          Runs cmp on bzipped files   
# 
#                          bzdiff   
# 
#                          Runs diff on bzipped files   
# 
#                          bzegrep   
# 
#                          Runs egrep on bzipped files   
# 
#                          bzfgrep   
# 
#                          Runs fgrep on bzipped files   
# 
#                          bzgrep   
# 
#                          Runs grep on bzipped files   
# 
#                          bzip2   
# 
#                          Compresses files using the Burrows-Wheeler block sorting text compression algorithm
#                        with Huffman coding; the compression rate is better than that achieved by more conventional
#                        compressors using "Lempel-Ziv"algorithms, like  gzip   
# 
#                          bzip2recover   
# 
#                          Tries to recover data from damaged bzipped files  
# 
#                          bzless   
# 
#                          Runs less on bzipped files   
# 
#                          bzmore   
# 
#                          Runs more on bzipped files   
# 
#                          libbz2 
# 
#                          The library implementing lossless, block-sorting data compression, using the Burrows-Wheeler
#                        algorithm 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'xz-*' | cut -c 2-)"

read -p "Chapter 8.8"

#        8.8. Xz-5.2.5  
# 
#                          The Xz package contains programs for compressing and decompressing files. It provides
#                        capabilities for the lzma and the newer xz compression formats. Compressing text
#                        files with xz yields a better compression percentage than with the traditional  gzip or
#                         bzip2 commands. 
#           Approximate build time: 0.2 SBU
#           Required disk space: 15 MB
#          8.8.1. Installation of Xz 
# 
#                          Prepare Xz for compilation with: 



./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/xz-5.2.5



# 
#                          Compile the package: 



make



# 
#                          To test the results, issue: 



make check



# 
#                          Install the package and make sure that all essential files are in the correct directory:
#                        



make install
mv -v   /usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat} /bin
mv -v /usr/lib/liblzma.so.* /lib
ln -svf ../../lib/$(readlink /usr/lib/liblzma.so) /usr/lib/liblzma.so


 
#          8.8.2. Contents of Xz  
#           Installed programs: lzcat (link to xz), lzcmp (link to xzdiff), lzdiff (link to xzdiff), lzegrep (link to xzgrep), lzfgrep (link to xzgrep), lzgrep (link to xzgrep), lzless (link to xzless), lzma (link to xz), lzmadec, lzmainfo, lzmore (link to xzmore), unlzma (link to xz), unxz (link to xz), xz, xzcat (link to xz), xzcmp (link to xzdiff), xzdec, xzdiff, xzegrep (link to xzgrep), xzfgrep (link to xzgrep), xzgrep, xzless, and xzmore
#           Installed libraries: liblzma.so
#           Installed directories: /usr/include/lzma and /usr/share/doc/xz-5.2.5 
#            Short Descriptions   
# 
#                          
# 
#                lzcat   
# 
#                          Decompresses to standard output  
# 
#                          lzcmp   
# 
#                          Runs cmp on LZMA compressed files   
# 
#                          lzdiff   
# 
#                          Runs diff on LZMA compressed files   
# 
#                          lzegrep   
# 
#                          Runs egrep on LZMA compressed files   
# 
#                          lzfgrep   
# 
#                          Runs fgrep on LZMA compressed files   
# 
#                          lzgrep   
# 
#                          Runs grep on LZMA compressed files   
# 
#                          lzless   
# 
#                          Runs less on LZMA compressed files   
# 
#                          lzma   
# 
#                          Compresses or decompresses files using the LZMA format  
# 
#                          lzmadec   
# 
#                          A small and fast decoder for LZMA compressed files  
# 
#                          lzmainfo   
# 
#                          Shows information stored in the LZMA compressed file header  
# 
#                          lzmore   
# 
#                          Runs more on LZMA compressed files   
# 
#                          unlzma   
# 
#                          Decompresses files using the LZMA format  
# 
#                          unxz   
# 
#                          Decompresses files using the XZ format  
# 
#                          xz   
# 
#                          Compresses or decompresses files using the XZ format  
# 
#                          xzcat   
# 
#                          Decompresses to standard output  
# 
#                          xzcmp   
# 
#                          Runs cmp on XZ compressed files   
# 
#                          xzdec   
# 
#                          A small and fast decoder for XZ compressed files  
# 
#                          xzdiff   
# 
#                          Runs diff on XZ compressed files   
# 
#                          xzegrep   
# 
#                          Runs egrep on XZ compressed files   
# 
#                          xzfgrep   
# 
#                          Runs fgrep on XZ compressed files   
# 
#                          xzgrep   
# 
#                          Runs grep on XZ compressed files   
# 
#                          xzless   
# 
#                          Runs less on XZ compressed files   
# 
#                          xzmore   
# 
#                          Runs more on XZ compressed files   
# 
#                          liblzma 
# 
#                          The library implementing lossless, block-sorting data compression, using the Lempel-Ziv-Markov
#                        chain algorithm 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'zstd-*' | cut -c 2-)"

read -p "Chapter 8.9"

#        8.9. Zstd-1.4.8  
# 
#                          Zstandard is a real-time compression algorithm, providing high compression ratios.
#                        It offers a very wide range of compression / speed trade-offs, while being backed
#                        by a very fast decoder. 
#           Approximate build time: 1.1 SBU
#           Required disk space: 59 MB
#          8.9.1. Installation of Zstd 
# 
#                          Compile the package: 



make



# 
#                          To test the results, issue: 



make check



# 
#                          Install the package: 



make prefix=/usr install



# 
#                          Remove the static library and move the shared library to /lib. Also, the .sofile
#                        in /usr/libwill need to be recreated: 



rm -v /usr/lib/libzstd.a
mv -v /usr/lib/libzstd.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libzstd.so) /usr/lib/libzstd.so


 
#          8.9.2. Contents of Zstd  
#           Installed programs: zstd, zstdcat (link to zstd), zstdgrep, zstdless, zstdmt (link to zstd), and unzstd (link to zstd)
#           Installed library: libzstd.so 
#            Short Descriptions   
# 
#                          
# 
#                zstd   
# 
#                          Compresses or decompresses files using the ZSTD format  
# 
#                          zstdgrep   
# 
#                          Runs grep on ZSTD compressed files   
# 
#                          zstdless   
# 
#                          Runs less on ZSTD compressed files   
# 
#                          libzstd 
# 
#                          The library implementing lossless data compression, using the ZSTD algorithm 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'file-*' | cut -c 2-)"

read -p "Chapter 8.10"

#        8.10. File-5.39  
# 
#                          The File package contains a utility for determining the type of a given file or
#                        files. 
#           Approximate build time: 0.1 SBU
#           Required disk space: 14 MB
#          8.10.1. Installation of File 
# 
#                          Prepare File for compilation: 



./configure --prefix=/usr



# 
#                          Compile the package: 



make



# 
#                          To test the results, issue: 



make check



# 
#                          Install the package: 



make install


 
#          8.10.2. Contents of File  
#           Installed programs: file
#           Installed library: libmagic.so 
#            Short Descriptions   
# 
#                          
# 
#                file   
# 
#                          Tries to classify each given file; it does this by performing several tests;file
#                        system tests, magic number tests, and language tests  
# 
#                          libmagic 
# 
#                          Contains routines for magic number recognition, used by the file program  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'readline-*' | cut -c 2-)"

read -p "Chapter 8.11"

#        8.11. Readline-8.1  
# 
#                          The Readline package is a set of libraries that offers command-line editing and
#                        history capabilities. 
#           Approximate build time: 0.1 SBU
#           Required disk space: 16 MB
#          8.11.1. Installation of Readline 
# 
#                          Reinstalling Readline will cause the old libraries to be moved to <libraryname>.old.
#                        While this is normally not a problem, in some cases it can trigger a linking bug
#                        in  ldconfig . This can be avoided by issuing the following two seds: 



sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install



# 
#                          Prepare Readline for compilation: 



./configure --prefix=/usr    \
            --disable-static \
            --with-curses    \
            --docdir=/usr/share/doc/readline-8.1


 
# 
#                          The meaning of the configure option: 
# 
#                --with-curses 
# 
#                          This option tells Readline that it can find the termcap library functions in the
#                        curses library, rather than a separate termcap library. It allows generating a correct
#                        readline.pcfile. 
# 
#                          Compile the package: 



make SHLIB_LIBS="-lncursesw"


 
# 
#                          The meaning of the make option: 
# 
#                SHLIB_LIBS="-lncursesw" 
# 
#                          This option forces Readline to link against the libncurseswlibrary. 
# 
#                          This package does not come with a test suite. 
# 
#                          Install the package: 



make SHLIB_LIBS="-lncursesw" install



# 
#                          Now move the dynamic libraries to a more appropriate location and fix up symbolic
#                        links: 



mv -v /usr/lib/lib{readline,history}.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libreadline.so) /usr/lib/libreadline.so
ln -sfv ../../lib/$(readlink /usr/lib/libhistory.so ) /usr/lib/libhistory.so



# 
#                          If desired, install the documentation: 



install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.1


 
#          8.11.2. Contents of Readline  
#           Installed libraries: libhistory.so and libreadline.so
#           Installed directories: /usr/include/readline and /usr/share/doc/readline-8.1 
#            Short Descriptions   
# 
#                          
# 
#                libhistory 
# 
#                          Provides a consistent user interface for recalling lines of history  
# 
#                          libreadline 
# 
#                          Provides a set of commands for manipulating text entered in an interactive session
#                        of a program 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'm4-*' | cut -c 2-)"

read -p "Chapter 8.12"

#        8.12. M4-1.4.18  
# 
#                          The M4 package contains a macro processor. 
#           Approximate build time: 0.4 SBU
#           Required disk space: 32 MB
#          8.12.1. Installation of M4 
# 
#                          First, make some fixes required by glibc-2.28 and later: 



sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h



# 
#                          Prepare M4 for compilation: 



./configure --prefix=/usr



# 
#                          Compile the package: 



make



# 
#                          To test the results, issue: 



make check



# 
#                          Install the package: 



make install


 
#          8.12.2. Contents of M4  
#           Installed program: m4 
#            Short Descriptions   
# 
#                          
# 
#                m4   
# 
#                          Copies the given files while expanding the macros that they contain. These macros
#                        are either built-in or user-defined and can take any number of arguments. Besides
#                        performing macro expansion, m4 has built-in functions for including named files,
#                        running Unix commands, performing integer arithmetic, manipulating text, recursion,
#                        etc. The  m4 program can be used either as a front-end to a compiler or as a macro
#                        processor in its own right  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'bc-*' | cut -c 2-)"

read -p "Chapter 8.13"

#        8.13. Bc-3.3.0  
# 
#                          The Bc package contains an arbitrary precision numeric processing language. 
#           Approximate build time: less than 0.1 SBU
#           Required disk space: 6.7 MB
#          8.13.1. Installation of Bc 
# 
#                          Prepare Bc for compilation: 



PREFIX=/usr CC=gcc ./configure.sh -G -O3


 
# 
#                          The meaning of the configure options: 
# 
#                CC=gcc" 
# 
#                          These parameters specify the compiler to use. 
# 
#                -O3 
# 
#                          Specify the optimization to use. 
# 
#                -G 
# 
#                          Omit parts of the test suite that won't work without a GNU bc present. 
# 
#                          Compile the package: 



make



# 
#                          To test bc, run: 



make test



# 
#                          Install the package: 



make install


 
#          8.13.2. Contents of Bc  
#           Installed programs: bc and dc 
#            Short Descriptions   
# 
#                          
# 
#                bc   
# 
#                          A command line calculator  
# 
#                          dc   
# 
#                          A reverse-polish command line calculator 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'flex-*' | cut -c 2-)"

read -p "Chapter 8.14"

#        8.14. Flex-2.6.4  
# 
#                          The Flex package contains a utility for generating programs that recognize patterns
#                        in text. 
#           Approximate build time: 0.4 SBU
#           Required disk space: 36 MB
#          8.14.1. Installation of Flex 
# 
#                          Prepare Flex for compilation: 



./configure --prefix=/usr \
            --docdir=/usr/share/doc/flex-2.6.4 \
            --disable-static



# 
#                          Compile the package: 



make



# 
#                          To test the results (about 0.5 SBU), issue: 



make check



# 
#                          Install the package: 



make install



# 
#                          A few programs do not know about  flex yet and try to run its predecessor,  lex . To
#                        support those programs, create a symbolic link named lexthat runs flexin  lex emulation
#                        mode: 



ln -sv flex /usr/bin/lex


 
#          8.14.2. Contents of Flex  
#           Installed programs: flex, flex++ (link to flex), and lex (link to flex)
#           Installed libraries: libfl.so
#           Installed directory: /usr/share/doc/flex-2.6.4 
#            Short Descriptions   
# 
#                          
# 
#                flex   
# 
#                          A tool for generating programs that recognize patterns in text; it allows for the
#                        versatility to specify the rules for pattern-finding, eradicating the need to develop
#                        a specialized program  
# 
#                          flex++   
# 
#                          An extension of flex, is used for generating C++ code and classes. It is a symbolic
#                        link to flex   
# 
#                          lex   
# 
#                          A symbolic link that runs flex in  lex emulation mode   
# 
#                          libfl 
# 
#                          The flexlibrary 


cd /sources
cd tlc8.6.11

read -p "Chapter 8.15"

#        8.15. Tcl-8.6.11  
# 
#                          The Tclpackage contains the Tool Command Language, a robust general-purpose scripting
#                        language. The Expectpackage is written in the Tcllanguage. 
#           Approximate build time: 3.8 SBU
#           Required disk space: 80 MB
#          8.15.1. Installation of Tcl 
# 
#                          This package and the next two (Expect and DejaGNU) are installed to support running
#                        the test suites for binutils and GCC and other packages. Installing three packages
#                        for testing purposes may seem excessive, but it is very reassuring, if not essential,
#                        to know that the most important tools are working properly. 
# 
#                          First, unpack the documentation by issuing the following command: 



tar -xf ../tcl8.6.11-html.tar.gz --strip-components=1



# 
#                          Prepare Tcl for compilation: 



SRCDIR=$(pwd)
cd unix
./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            $([ "$(uname -m)" = x86_64 ] && echo --enable-64bit)


 
# 
#                          The meaning of the configure options: 
# 
#                $([ "$(uname -m)" = x86_64 ] && echo --enable-64bit) 
# 
#                          The construct  $(<shell command>)is replaced by the output of the shell command.
#                        Here this output is empty if running on a 32 bit machine, and is  --enable-64bitif
#                        running on a 64 bit machine.  
# 
#                          Build the package: 



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



# 
#                          The various "sed"instructions after the "make"command removes references to the
#                        build directory from the configuration files and replaces them with the install
#                        directory. This is not mandatory for the remainder of LFS, but may be needed in
#                        case a package built later uses Tcl. 
# 
#                          To test the results, issue: 



make test



#          Note 
# 
#                          In the test results there are several places associated with clock.test that indicate
#                        a failure, but the summary at the end indicates no failures. clock.test passes on
#                        a complete LFS system. 
# 
#                          Install the package: 



make install



# 
#                          Make the installed library writable so debugging symbols can be removed later: 



chmod -v u+w /usr/lib/libtcl8.6.so



# 
#                          Install Tcl's headers. The next package, Expect, requires them. 



make install-private-headers



# 
#                          Now make a necessary symbolic link: 



ln -sfv tclsh8.6 /usr/bin/tclsh



# 
#                          Finally, rename a man page that conflicts with a Perl man page: 



mv /usr/share/man/man3/{Thread,Tcl_Thread}.3


 
#          8.15.2. Contents of Tcl  
#           Installed programs: tclsh (link to tclsh8.6) and tclsh8.6
#           Installed library: libtcl8.6.so and libtclstub8.6.a 
#            Short Descriptions   
# 
#                          
# 
#                tclsh8.6   
# 
#                          The Tcl command shell  
# 
#                          tclsh   
# 
#                          A link to tclsh8.6  
# 
#                          libtcl8.6.so 
# 
#                          The Tcl library  
# 
#                          libtclstub8.6.a 
# 
#                          The Tcl Stub library 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'expect*' | cut -c 2-)"

read -p "Chapter 8.16"

#        8.16. Expect-5.45.4  
# 
#                          The Expectpackage contains tools for automating, via scripted dialogues, interactive
#                        applications such as  telnet ,  ftp ,  passwd ,  fsck ,  rlogin , and  tip . Expectis also useful
#                        for testing these same applications as well as easing all sorts of tasks that are
#                        prohibitively difficult with anything else. The DejaGnuframework is written in Expect.
#                        
#           Approximate build time: 0.2 SBU
#           Required disk space: 3.9 MB
#          8.16.1. Installation of Expect 
# 
#                          Prepare Expect for compilation: 



./configure --prefix=/usr           \
            --with-tcl=/usr/lib     \
            --enable-shared         \
            --mandir=/usr/share/man \
            --with-tclinclude=/usr/include


 
# 
#                          The meaning of the configure options: 
# 
#                --with-tcl=/usr/lib 
# 
#                          This parameter is needed to tell  configure where the  tclConfig.sh script is located.
#                        
# 
#                --with-tclinclude=/usr/include 
# 
#                          This explicitly tells Expect where to find Tcl's internal headers. 
# 
#                          Build the package: 



make



# 
#                          To test the results, issue: 



make test



# 
#                          Install the package: 



make install
ln -svf expect5.45.4/libexpect5.45.4.so /usr/lib


 
#          8.16.2. Contents of Expect  
#           Installed program: expect
#           Installed library: libexpect-5.45.so 
#            Short Descriptions   
# 
#                          
# 
#                expect   
# 
#                          Communicates with other interactive programs according to a script  
# 
#                          libexpect-5.45.so 
# 
#                          Contains functions that allow Expect to be used as a Tcl extension or to be used
#                        directly from C or C++ (without Tcl) 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'dejagnu-*' | cut -c 2-)"

read -p "Chapter 8.17"

#        8.17. DejaGNU-1.6.2  
# 
#                          The DejaGnupackage contains a framework for running test suites on GNU tools. It
#                        is written in  expect , which itself uses Tcl(Tool Command Language). 
#           Approximate build time: less than 0.1 SBU
#           Required disk space: 4.6 MB
#          8.17.1. Installation of DejaGNU 
# 
#                          Prepare DejaGNU for compilation: 



./configure --prefix=/usr
makeinfo --html --no-split -o doc/dejagnu.html doc/dejagnu.texi
makeinfo --plaintext       -o doc/dejagnu.txt  doc/dejagnu.texi



# 
#                          Build and install the package: 



make install
install -v -dm755  /usr/share/doc/dejagnu-1.6.2
install -v -m644   doc/dejagnu.{html,txt} /usr/share/doc/dejagnu-1.6.2



# 
#                          To test the results, issue: 



make check


 
#          8.17.2. Contents of DejaGNU  
#           Installed program: runtest 
#            Short Descriptions   
# 
#                          
# 
#                runtest   
# 
#                          A wrapper script that locates the proper expect shell and then runs DejaGNU  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'binutils-*' | cut -c 2-)"

rm -rf ./build
read -p "Chapter 8.18"

#        8.18. Binutils-2.36.1  
# 
#                          The Binutils package contains a linker, an assembler, and other tools for handling
#                        object files. 
#           Approximate build time: 6.2 SBU
#           Required disk space: 4.9 GB
#          8.18.1. Installation of Binutils 
# 
#                          Verify that the PTYs are working properly inside the chroot environment by performing
#                        a simple test: 



expect -c "spawn ls"



# 
#                          This command should output the following: 



spawn ls



# 
#                          If, instead, the output includes the message below, then the environment is not
#                        set up for proper PTY operation. This issue needs to be resolved before running
#                        the test suites for Binutils and GCC: 



The system has no more ptys.
Ask your system administrator to create more.



# 
#                          Now remove one test that prevents the tests from running to completion: 



sed -i '/@\tincremental_copy/d' gold/testsuite/Makefile.in



# 
#                          The Binutils documentation recommends building Binutils in a dedicated build directory:
#                        



mkdir -v build
cd       build



# 
#                          Prepare Binutils for compilation: 



../configure --prefix=/usr       \
             --enable-gold       \
             --enable-ld=default \
             --enable-plugins    \
             --enable-shared     \
             --disable-werror    \
             --enable-64-bit-bfd \
             --with-system-zlib


 
# 
#                          The meaning of the configure parameters: 
# 
#                --enable-gold 
# 
#                          Build the gold linker and install it as ld.gold (along side the default linker).
#                        
# 
#                --enable-ld=default 
# 
#                          Build the original bfd linker and install it as both ld (the default linker) and
#                        ld.bfd. 
# 
#                --enable-plugins 
# 
#                          Enables plugin support for the linker. 
# 
#                --enable-64-bit-bfd 
# 
#                          Enables 64-bit support (on hosts with narrower word sizes). May not be needed on
#                        64-bit systems, but does no harm. 
# 
#                --with-system-zlib 
# 
#                          Use the installed zlib library rather than building the included version. 
# 
#                          Compile the package: 



make tooldir=/usr


 
# 
#                          The meaning of the make parameter: 
# 
#                tooldir=/usr 
# 
#                          Normally, the tooldir (the directory where the executables will ultimately be located)
#                        is set to $(exec_prefix)/$(target_alias). For example, x86_64 machines would expand
#                        that to /usr/x86_64-unknown-linux-gnu. Because this is a custom system, this target-specific
#                        directory in /usris not required. $(exec_prefix)/$(target_alias)would be used if
#                        the system was used to cross-compile (for example, compiling a package on an Intel
#                        machine that generates code that can be executed on PowerPC machines). 
#          Important 
# 
#                          The test suite for Binutils in this section is considered critical. Do not skip
#                        it under any circumstances. 
# 
#                          Test the results: 



make -k check



# 
#                          Four tests named "Run property ..."are known to fail. 
# 
#                          Install the package: 



make tooldir=/usr install



# 
#                          Remove useless static libraries: 



rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,opcodes}.a


 
#          8.18.2. Contents of Binutils  
#           Installed programs: addr2line, ar, as, c++filt, dwp, elfedit, gprof, ld, ld.bfd, ld.gold, nm, objcopy, objdump, ranlib, readelf, size, strings, and strip
#           Installed libraries: libbfd.so, libctf.so, libctf-nobfd.so, and libopcodes.so
#           Installed directory: /usr/lib/ldscripts 
#            Short Descriptions   
# 
#                          
# 
#                addr2line   
# 
#                          Translates program addresses to file names and line numbers; given an address and
#                        the name of an executable, it uses the debugging information in the executable to
#                        determine which source file and line number are associated with the address  
# 
#                          ar   
# 
#                          Creates, modifies, and extracts from archives  
# 
#                          as   
# 
#                          An assembler that assembles the output of gcc into object files   
# 
#                          c++filt   
# 
#                          Used by the linker to de-mangle C++ and Java symbols and to keep overloaded functions
#                        from clashing  
# 
#                          dwp   
# 
#                          The DWARF packaging utility  
# 
#                          elfedit   
# 
#                          Updates the ELF header of ELF files  
# 
#                          gprof   
# 
#                          Displays call graph profile data  
# 
#                          ld   
# 
#                          A linker that combines a number of object and archive files into a single file,
#                        relocating their data and tying up symbol references  
# 
#                          ld.gold   
# 
#                          A cut down version of ld that only supports the elf object file format  
# 
#                          ld.bfd   
# 
#                          Hard link to ld   
# 
#                          nm   
# 
#                          Lists the symbols occurring in a given object file  
# 
#                          objcopy   
# 
#                          Translates one type of object file into another  
# 
#                          objdump   
# 
#                          Displays information about the given object file, with options controlling the particular
#                        information to display; the information shown is useful to programmers who are working
#                        on the compilation tools  
# 
#                          ranlib   
# 
#                          Generates an index of the contents of an archive and stores it in the archive; the
#                        index lists all of the symbols defined by archive members that are relocatable object
#                        files  
# 
#                          readelf   
# 
#                          Displays information about ELF type binaries  
# 
#                          size   
# 
#                          Lists the section sizes and the total size for the given object files  
# 
#                          strings   
# 
#                          Outputs, for each given file, the sequences of printable characters that are of
#                        at least the specified length (defaulting to four); for object files, it prints,
#                        by default, only the strings from the initializing and loading sections while for
#                        other types of files, it scans the entire file  
# 
#                          strip   
# 
#                          Discards symbols from object files  
# 
#                          libbfd 
# 
#                          The Binary File Descriptor library  
# 
#                          libctf 
# 
#                          The Compat ANSI-C Type Format debugging support library  
# 
#                          libctf-nobfd 
# 
#                          A libctf variant which does not use libbfd functionality  
# 
#                          libopcodes 
# 
#                          A library for dealing with opcodes;the "readable text"versions of instructions for
#                        the processor; it is used for building utilities like  objdump  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'gmp-*' | cut -c 2-)"

read -p "Chapter 8.19"

#        8.19. GMP-6.2.1  
# 
#                          The GMP package contains math libraries. These have useful functions for arbitrary
#                        precision arithmetic. 
#           Approximate build time: 1.0 SBU
#           Required disk space: 52 MB
#          8.19.1. Installation of GMP 
#          Note 
# 
#                          If you are building for 32-bit x86, but you have a CPU which is capable of running
#                        64-bit code  and you have specified CFLAGSin the environment, the configure script
#                        will attempt to configure for 64-bits and fail. Avoid this by invoking the configure
#                        command below with 



ABI=32 ./configure ...


 
#          Note 
# 
#                          The default settings of GMP produce libraries optimized for the host processor.
#                        If libraries suitable for processors less capable than the host's CPU are desired,
#                        generic libraries can be created by running the following: 



cp -v configfsf.guess config.guess
cp -v configfsf.sub   config.sub



# 
#                          Prepare GMP for compilation: 



./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.2.1


 
# 
#                          The meaning of the new configure options: 
# 
#                --enable-cxx 
# 
#                          This parameter enables C++ support 
# 
#                --docdir=/usr/share/doc/gmp-6.2.1 
# 
#                          This variable specifies the correct place for the documentation. 
# 
#                          Compile the package and generate the HTML documentation: 



make
make html



#          Important 
# 
#                          The test suite for GMP in this section is considered critical. Do not skip it under
#                        any circumstances. 
# 
#                          Test the results: 



make check 2>&1 | tee gmp-check-log



#          Caution 
# 
#                          The code in gmp is highly optimized for the processor where it is built. Occasionally,
#                        the code that detects the processor misidentifies the system capabilities and there
#                        will be errors in the tests or other applications using the gmp libraries with the
#                        message "Illegal instruction". In this case, gmp should be reconfigured with the
#                        option --build=x86_64-unknown-linux-gnu and rebuilt. 
# 
#                          Ensure that all 197 tests in the test suite passed. Check the results by issuing
#                        the following command: 



awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log



# 
#                          Install the package and its documentation: 



make install
make install-html


 
#          8.19.2. Contents of GMP  
#           Installed Libraries: libgmp.so and libgmpxx.so
#           Installed directory: /usr/share/doc/gmp-6.2.1 
#            Short Descriptions   
# 
#                          
# 
#                libgmp 
# 
#                          Contains precision math functions  
# 
#                          libgmpxx 
# 
#                          Contains C++ precision math functions 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'mpfr-*' | cut -c 2-)"

read -p "Chapter 8.20"

#        8.20. MPFR-4.1.0  
# 
#                          The MPFR package contains functions for multiple precision math. 
#           Approximate build time: 0.8 SBU
#           Required disk space: 38 MB
#          8.20.1. Installation of MPFR 
# 
#                          Prepare MPFR for compilation: 



./configure --prefix=/usr        \
            --disable-static     \
            --enable-thread-safe \
            --docdir=/usr/share/doc/mpfr-4.1.0



# 
#                          Compile the package and generate the HTML documentation: 



make
make html



#          Important 
# 
#                          The test suite for MPFR in this section is considered critical. Do not skip it under
#                        any circumstances. 
# 
#                          Test the results and ensure that all tests passed: 



make check



# 
#                          Install the package and its documentation: 



make install
make install-html


 
#          8.20.2. Contents of MPFR  
#           Installed Libraries: libmpfr.so
#           Installed directory: /usr/share/doc/mpfr-4.1.0 
#            Short Descriptions   
# 
#                          
# 
#                libmpfr 
# 
#                          Contains multiple-precision math functions 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'mpc-*' | cut -c 2-)"

read -p "Chapter 8.21"

#        8.21. MPC-1.2.1  
# 
#                          The MPC package contains a library for the arithmetic of complex numbers with arbitrarily
#                        high precision and correct rounding of the result. 
#           Approximate build time: 0.3 SBU
#           Required disk space: 22 MB
#          8.21.1. Installation of MPC 
# 
#                          Prepare MPC for compilation: 



./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/mpc-1.2.1



# 
#                          Compile the package and generate the HTML documentation: 



make
make html



# 
#                          To test the results, issue: 



make check



# 
#                          Install the package and its documentation: 



make install
make install-html


 
#          8.21.2. Contents of MPC  
#           Installed Libraries: libmpc.so
#           Installed Directory: /usr/share/doc/mpc-1.2.1 
#            Short Descriptions   
# 
#                          
# 
#                libmpc 
# 
#                          Contains complex math functions 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'attr-*' | cut -c 2-)"

read -p "Chapter 8.22"

#        8.22. Attr-2.4.48  
# 
#                          The attr package contains utilities to administer the extended attributes on filesystem
#                        objects. 
#           Approximate build time: less than 0.1 SBU
#           Required disk space: 4.2 MB
#          8.22.1. Installation of Attr 
# 
#                          Prepare Attr for compilation: 



./configure --prefix=/usr     \
            --bindir=/bin     \
            --disable-static  \
            --sysconfdir=/etc \
            --docdir=/usr/share/doc/attr-2.4.48



# 
#                          Compile the package: 



make



# 
#                          The tests need to be run on a filesystem that supports extended attributes such
#                        as the ext2, ext3, or ext4 filesystems. To test the results, issue: 



make check



# 
#                          Install the package: 



make install



# 
#                          The shared library needs to be moved to /lib, and as a result the .sofile in /usr/libwill
#                        need to be recreated: 



mv -v /usr/lib/libattr.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libattr.so) /usr/lib/libattr.so


 
#          8.22.2. Contents of Attr  
#           Installed programs: attr, getfattr, and setfattr
#           Installed library: libattr.so
#           Installed directories: /usr/include/attr and /usr/share/doc/attr-2.4.48 
#            Short Descriptions   
# 
#                          
# 
#                attr   
# 
#                          Extends attributes on filesystem objects  
# 
#                          getfattr   
# 
#                          Gets the extended attributes of filesystem objects  
# 
#                          setfattr   
# 
#                          Sets the extended attributes of filesystem objects  
# 
#                          libattr 
# 
#                          Contains the library functions for manipulating extended attributes 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'acl-*' | cut -c 2-)"

read -p "Chapter 8.23"

#        8.23. Acl-2.2.53  
# 
#                          The Acl package contains utilities to administer Access Control Lists, which are
#                        used to define more fine-grained discretionary access rights for files and directories.
#                        
#           Approximate build time: 0.1 SBU
#           Required disk space: 2.8 MB
#          8.23.1. Installation of Acl 
# 
#                          Prepare Acl for compilation: 



./configure --prefix=/usr         \
            --bindir=/bin         \
            --disable-static      \
            --libexecdir=/usr/lib \
            --docdir=/usr/share/doc/acl-2.2.53



# 
#                          Compile the package: 



make



# 
#                          The Acl tests need to be run on a filesystem that supports access controls after
#                        Coreutilshas been built with the Acl libraries. If desired, return to this package
#                        and run  make check after Coreutilshas been built later in this chapter. 
# 
#                          Install the package: 



make install



# 
#                          The shared library needs to be moved to /lib, and as a result the .sofile in /usr/libwill
#                        need to be recreated: 



mv -v /usr/lib/libacl.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libacl.so) /usr/lib/libacl.so


 
#          8.23.2. Contents of Acl  
#           Installed programs: chacl, getfacl, and setfacl
#           Installed library: libacl.so
#           Installed directories: /usr/include/acl and /usr/share/doc/acl-2.2.53 
#            Short Descriptions   
# 
#                          
# 
#                chacl   
# 
#                          Changes the access control list of a file or directory  
# 
#                          getfacl   
# 
#                          Gets file access control lists  
# 
#                          setfacl   
# 
#                          Sets file access control lists  
# 
#                          libacl 
# 
#                          Contains the library functions for manipulating Access Control Lists 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'libcap-*' | cut -c 2-)"

read -p "Chapter 8.24"

#        8.24. Libcap-2.48  
# 
#                          The Libcap package implements the user-space interfaces to the POSIX 1003.1e capabilities
#                        available in Linux kernels. These capabilities are a partitioning of the all powerful
#                        root privilege into a set of distinct privileges. 
#           Approximate build time: less than 0.1 SBU
#           Required disk space: 45 MB
#          8.24.1. Installation of Libcap 
# 
#                          Prevent static libraries from being installed: 



sed -i '/install -m.*STA/d' libcap/Makefile



# 
#                          Compile the package: 



make prefix=/usr lib=lib


 
# 
#                          The meaning of the make option: 
# 
#                lib=lib 
# 
#                          This parameter sets the library directory to /usr/librather than /usr/lib64on x86_64.
#                        It has no effect on x86. 
# 
#                          To test the results, issue: 



make test



# 
#                          Install the package and make sure the essential libraries are in the correct directory:
#                        



make prefix=/usr lib=lib install
for libname in cap psx; do
    mv -v /usr/lib/lib${libname}.so.* /lib
    ln -sfv ../../lib/lib${libname}.so.2 /usr/lib/lib${libname}.so
    chmod -v 755 /lib/lib${libname}.so.2.48
done


 
#          8.24.2. Contents of Libcap  
#           Installed programs: capsh, getcap, getpcaps, and setcap
#           Installed library: libcap.so and libpsx.so 
#            Short Descriptions   
# 
#                          
# 
#                capsh   
# 
#                          A shell wrapper to explore and constrain capability support  
# 
#                          getcap   
# 
#                          Examines file capabilities  
# 
#                          getpcaps   
# 
#                          Displays the capabilities on the queried process(es)  
# 
#                          setcap   
# 
#                          Sets file capabilities  
# 
#                          libcap 
# 
#                          Contains the library functions for manipulating POSIX 1003.1e capabilities  
# 
#                          libpsx 
# 
#                          Contains functions to support POSIX semantics for syscalls associated with the pthread
#                        library 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'shadow-*' | cut -c 2-)"

read -p "Chapter 8.25"

#        8.25. Shadow-4.8.1  
# 
#                          The Shadow package contains programs for handling passwords in a secure way. 
#           Approximate build time: 0.2 SBU
#           Required disk space: 45 MB
#          8.25.1. Installation of Shadow 
#          Note 
# 
#                          If you would like to enforce the use of strong passwords, refer to http://www.linuxfromscratch.org/blfs/view/10.1/postlfs/cracklib.htmlfor
#                        installing CrackLib prior to building Shadow. Then add   --with-libcrackto the  configure command
#                        below. 
# 
#                          Disable the installation of the  groups program and its man pages, as Coreutils provides
#                        a better version. Also, prevent the installation of manual pages that were already
#                        installed in Section 8.3, "Man-pages-5.10":  



sed -i 's/groups$(EXEEXT) //' src/Makefile.in
find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \;
find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \;
find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \;


 
# 
#                          Instead of using the default  crypt method, use the more secure  SHA-512 method of password
#                        encryption, which also allows passwords longer than 8 characters. It is also necessary
#                        to change the obsolete /var/spool/maillocation for user mailboxes that Shadow uses
#                        by default to the /var/maillocation used currently: 



sed -e 's:#ENCRYPT_METHOD DES:ENCRYPT_METHOD SHA512:' \
    -e 's:/var/spool/mail:/var/mail:'                 \
    -i etc/login.defs



#          Note 
# 
#                          If you chose to build Shadow with Cracklib support, run the following: 



sed -i 's:DICTPATH.*:DICTPATH\t/lib/cracklib/pw_dict:' etc/login.defs



# 
#                          Make a minor change to make the first group number generated by useradd 1000: 



sed -i 's/1000/999/' etc/useradd



# 
#                          Prepare Shadow for compilation: 



touch /usr/bin/passwd
./configure --sysconfdir=/etc \
            --with-group-name-max-length=32


 
# 
#                          The meaning of the configure option: 
# 
#                
#           touch /usr/bin/passwd 
# 
#                          The file /usr/bin/passwdneeds to exist because its location is harcoded in some
#                        programs, and the default location if it does not exist is not right. 
# 
#                --with-group-name-max-length=32 
# 
#                          The maximum user name is 32 characters. Make the maximum group name the same. 
# 
#                          Compile the package: 



make



# 
#                          This package does not come with a test suite. 
# 
#                          Install the package: 



make install


 
#          8.25.2. Configuring Shadow  
# 
#                          This package contains utilities to add, modify, and delete users and groups; set
#                        and change their passwords; and perform other administrative tasks. For a full explanation
#                        of what password shadowing means, see the doc/HOWTOfile within the unpacked source
#                        tree. If using Shadow support, keep in mind that programs which need to verify passwords
#                        (display managers, FTP programs, pop3 daemons, etc.) must be Shadow-compliant. That
#                        is, they need to be able to work with shadowed passwords. 
# 
#                          To enable shadowed passwords, run the following command: 



pwconv



# 
#                          To enable shadowed group passwords, run: 



grpconv



# 
#                          Shadow's stock configuration for the  useradd utility has a few caveats that need
#                        some explanation. First, the default action for the  useradd utility is to create
#                        the user and a group of the same name as the user. By default the user ID (UID)
#                        and group ID (GID) numbers will begin with 1000. This means if you don't pass parameters
#                        to  useradd , each user will be a member of a unique group on the system. If this
#                        behavior is undesirable, you'll need to pass the  -gparameter to  useradd . The default
#                        parameters are stored in the /etc/default/useraddfile. You may need to modify two
#                        parameters in this file to suit your particular needs.  
# 
#                          /etc/default/useraddParameter Explanations 
# 
#                GROUP=1000 
# 
#                          This parameter sets the beginning of the group numbers used in the /etc/group file.
#                        You can modify it to anything you desire. Note that  useradd will never reuse a UID
#                        or GID. If the number identified in this parameter is used, it will use the next
#                        available number after this. Note also that if you don't have a group 1000 on your
#                        system the first time you use  useradd without the  -gparameter, you'll get a message
#                        displayed on the terminal that says: useradd: unknown GID 1000. You may disregard
#                        this message and group number 1000 will be used.  
# 
#                CREATE_MAIL_SPOOL=yes 
# 
#                          This parameter causes  useradd to create a mailbox file for the newly created user.
#                         useradd will make the group ownership of this file to the mailgroup with 0660 permissions.
#                        If you would prefer that these mailbox files are not created by  useradd , issue the
#                        following command: 



sed -i 's/yes/no/' /etc/default/useradd



#          8.25.3. Setting the root password 
# 
#                          Choose a password for user  root and set it by running: 



passwd root


 
#          8.25.4. Contents of Shadow  
#           Installed programs: chage, chfn, chgpasswd, chpasswd, chsh, expiry, faillog, gpasswd, groupadd, groupdel, groupmems, groupmod, grpck, grpconv, grpunconv, lastlog, login, logoutd, newgidmap, newgrp, newuidmap, newusers, nologin, passwd, pwck, pwconv, pwunconv, sg (link to newgrp), su, useradd, userdel, usermod, vigr (link to vipw), and vipw
#           Installed directory: /etc/default 
#            Short Descriptions   
# 
#                          
# 
#                chage   
# 
#                          Used to change the maximum number of days between obligatory password changes  
# 
#                          chfn   
# 
#                          Used to change a user's full name and other information  
# 
#                          chgpasswd   
# 
#                          Used to update group passwords in batch mode  
# 
#                          chpasswd   
# 
#                          Used to update user passwords in batch mode  
# 
#                          chsh   
# 
#                          Used to change a user's default login shell  
# 
#                          expiry   
# 
#                          Checks and enforces the current password expiration policy  
# 
#                          faillog   
# 
#                          Is used to examine the log of login failures, to set a maximum number of failures
#                        before an account is blocked, or to reset the failure count  
# 
#                          gpasswd   
# 
#                          Is used to add and delete members and administrators to groups  
# 
#                          groupadd   
# 
#                          Creates a group with the given name  
# 
#                          groupdel   
# 
#                          Deletes the group with the given name  
# 
#                          groupmems   
# 
#                          Allows a user to administer his/her own group membership list without the requirement
#                        of super user privileges.  
# 
#                          groupmod   
# 
#                          Is used to modify the given group's name or GID  
# 
#                          grpck   
# 
#                          Verifies the integrity of the group files /etc/groupand /etc/gshadow 
# 
#                          grpconv   
# 
#                          Creates or updates the shadow group file from the normal group file  
# 
#                          grpunconv   
# 
#                          Updates /etc/groupfrom /etc/gshadowand then deletes the latter  
# 
#                          lastlog   
# 
#                          Reports the most recent login of all users or of a given user  
# 
#                          login   
# 
#                          Is used by the system to let users sign on  
# 
#                          logoutd   
# 
#                          Is a daemon used to enforce restrictions on log-on time and ports  
# 
#                          newgidmap   
# 
#                          Is used to set the gid mapping of a user namespace  
# 
#                          newgrp   
# 
#                          Is used to change the current GID during a login session  
# 
#                          newuidmap   
# 
#                          Is used to set the uid mapping of a user namespace  
# 
#                          newusers   
# 
#                          Is used to create or update an entire series of user accounts  
# 
#                          nologin   
# 
#                          Displays a message that an account is not available; it is designed to be used as
#                        the default shell for accounts that have been disabled  
# 
#                          passwd   
# 
#                          Is used to change the password for a user or group account  
# 
#                          pwck   
# 
#                          Verifies the integrity of the password files /etc/passwdand /etc/shadow 
# 
#                          pwconv   
# 
#                          Creates or updates the shadow password file from the normal password file  
# 
#                          pwunconv   
# 
#                          Updates /etc/passwdfrom /etc/shadowand then deletes the latter  
# 
#                          sg   
# 
#                          Executes a given command while the user's GID is set to that of the given group
#                         
# 
#                          su   
# 
#                          Runs a shell with substitute user and group IDs  
# 
#                          useradd   
# 
#                          Creates a new user with the given name, or updates the default new-user information
#                         
# 
#                          userdel   
# 
#                          Deletes the given user account  
# 
#                          usermod   
# 
#                          Is used to modify the given user's login name, User Identification (UID), shell,
#                        initial group, home directory, etc.  
# 
#                          vigr   
# 
#                          Edits the /etc/groupor /etc/gshadowfiles  
# 
#                          vipw   
# 
#                          Edits the /etc/passwdor /etc/shadowfiles 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'gcc-*' | cut -c 2-)"

rm -rf ./build
read -p "Chapter 8.26"

#        8.26. GCC-10.2.0  
# 
#                          The GCC package contains the GNU compiler collection, which includes the C and C++
#                        compilers. 
#           Approximate build time: 95 SBU (with tests)
#           Required disk space: 4.6 GB
#          8.26.1. Installation of GCC 
# 
#                          If building on x86_64, change the default directory name for 64-bit libraries to
#                        "lib": 



case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac



# 
#                          The GCC documentation recommends building GCC in a dedicated build directory: 



mkdir -v build
cd       build



# 
#                          Prepare GCC for compilation: 



../configure --prefix=/usr            \
             LD=ld                    \
             --enable-languages=c,c++ \
             --disable-multilib       \
             --disable-bootstrap      \
             --with-system-zlib



# 
#                          Note that for other programming languages there are some prerequisites that are
#                        not yet available. See the BLFS Book GCC pagefor instructions on how to build all
#                        of GCC's supported languages.   
# 
#                          The meaning of the new configure parameters: 
# 
#                LD=ld 
# 
#                          This parameter makes the configure script use the ld installed by the binutils built
#                        earlier in this chapter, rather than the cross-built version which would otherwise
#                        be used. 
# 
#                --with-system-zlib 
# 
#                          This switch tells GCC to link to the system installed copy of the zlib library,
#                        rather than its own internal copy. 
# 
#                          Compile the package: 



make



#          Important 
# 
#                          In this section, the test suite for GCC is considered critical. Do not skip it under
#                        any circumstance. 
# 
#                          One set of tests in the GCC test suite is known to exhaust the default stack, so
#                        increase the stack size prior to running the tests: 



ulimit -s 32768



# 
#                          Test the results as a non-privileged user, but do not stop at errors: 



chown -Rv tester . 
su tester -c "PATH=$PATH make -k check"



# 
#                          To receive a summary of the test suite results, run: 



../contrib/test_summary



# 
#                          For only the summaries, pipe the output through  grep -A7 Summ.  
# 
#                          Results can be compared with those located at http://www.linuxfromscratch.org/lfs/build-logs/10.1/and
#                        https://gcc.gnu.org/ml/gcc-testresults/.  
# 
#                          Six tests related to get_time are known to fail. These are apparently related to
#                        the en_HK locale. 
# 
#                          Additionally the following tests related to the following files are known to fail
#                        with glibc-2.33: asan_test.C, co-ret-17-void-ret-coro.C, pr95519-05-gro.C, pr80166.c.
#                        
# 
#                          A few unexpected failures cannot always be avoided. The GCC developers are usually
#                        aware of these issues, but have not resolved them yet. Unless the test results are
#                        vastly different from those at the above URL, it is safe to continue. 
# 
#                          Install the package and remove an unneeded directory: 



make install
rm -rf /usr/lib/gcc/$(gcc -dumpmachine)/10.2.0/include-fixed/bits/



# 
#                          The GCC build directory is owned by testernow and the ownership of the installed
#                        header directory (and its content) will be incorrect. Change the ownership to rootuser
#                        and group: 



chown -v -R root:root \
    /usr/lib/gcc/*linux-gnu/10.2.0/include{,-fixed}



# 
#                          Create a symlink required by the FHSfor "historical" reasons.  



ln -sv ../usr/bin/cpp /lib



# 
#                          Add a compatibility symlink to enable building programs with Link Time Optimization
#                        (LTO): 



ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/10.2.0/liblto_plugin.so \
        /usr/lib/bfd-plugins/



# 
#                          Now that our final toolchain is in place, it is important to again ensure that compiling
#                        and linking will work as expected. We do this by performing some sanity checks:
#                        



echo 'int main(){}' > dummy.c
cc dummy.c -v -Wl,--verbose &> dummy.log
readelf -l a.out | grep ': /lib'



# 
#                          There should be no errors, and the output of the last command will be (allowing
#                        for platform-specific differences in the dynamic linker name): 



[Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]



# 
#                          Now make sure that we're setup to use the correct start files: 



grep -o '/usr/lib.*/crt[1in].*succeeded' dummy.log



# 
#                          The output of the last command should be: 



/usr/lib/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../lib/crt1.o succeeded
/usr/lib/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../lib/crti.o succeeded
/usr/lib/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../lib/crtn.o succeeded



# 
#                          Depending on your machine architecture, the above may differ slightly. The difference
#                        will be the name of the directory after /usr/lib/gcc. The important thing to look
#                        for here is that gcc has found all three crt*.ofiles under the /usr/libdirectory.
#                        
# 
#                          Verify that the compiler is searching for the correct header files: 



grep -B4 '^ /usr/include' dummy.log



# 
#                          This command should return the following output: 



#include <...> search starts here:
 /usr/lib/gcc/x86_64-pc-linux-gnu/10.2.0/include
 /usr/local/include
 /usr/lib/gcc/x86_64-pc-linux-gnu/10.2.0/include-fixed
 /usr/include



# 
#                          Again, the directory named after your target triplet may be different than the above,
#                        depending on your system architecture. 
# 
#                          Next, verify that the new linker is being used with the correct search paths: 



grep 'SEARCH.*/usr/lib' dummy.log |sed 's|; |\n|g'



# 
#                          References to paths that have components with '-linux-gnu' should be ignored, but
#                        otherwise the output of the last command should be: 



SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib64")
SEARCH_DIR("/usr/local/lib64")
SEARCH_DIR("/lib64")
SEARCH_DIR("/usr/lib64")
SEARCH_DIR("/usr/x86_64-pc-linux-gnu/lib")
SEARCH_DIR("/usr/local/lib")
SEARCH_DIR("/lib")
SEARCH_DIR("/usr/lib");



# 
#                          A 32-bit system may see a few different directories. For example, here is the output
#                        from an i686 machine: 



SEARCH_DIR("/usr/i686-pc-linux-gnu/lib32")
SEARCH_DIR("/usr/local/lib32")
SEARCH_DIR("/lib32")
SEARCH_DIR("/usr/lib32")
SEARCH_DIR("/usr/i686-pc-linux-gnu/lib")
SEARCH_DIR("/usr/local/lib")
SEARCH_DIR("/lib")
SEARCH_DIR("/usr/lib");



# 
#                          Next make sure that we're using the correct libc: 



grep "/lib.*/libc.so.6 " dummy.log



# 
#                          The output of the last command should be: 



attempt to open /lib/libc.so.6 succeeded



# 
#                          Make sure GCC is using the correct dynamic linker: 



grep found dummy.log



# 
#                          The output of the last command should be (allowing for platform-specific differences
#                        in dynamic linker name): 



found ld-linux-x86-64.so.2 at /lib/ld-linux-x86-64.so.2



# 
#                          If the output does not appear as shown above or is not received at all, then something
#                        is seriously wrong. Investigate and retrace the steps to find out where the problem
#                        is and correct it. Any issues will need to be resolved before continuing with the
#                        process. 
# 
#                          Once everything is working correctly, clean up the test files: 



rm -v dummy.c a.out dummy.log



# 
#                          Finally, move a misplaced file: 



mkdir -pv /usr/share/gdb/auto-load/usr/lib
mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib


 
#          8.26.2. Contents of GCC  
#           Installed programs: c++, cc (link to gcc), cpp, g++, gcc, gcc-ar, gcc-nm, gcc-ranlib, gcov, gcov-dump, and gcov-tool
#           Installed libraries: libasan.{a,so}, libatomic.{a,so}, libcc1.so, libgcc.a, libgcc_eh.a, libgcc_s.so, libgcov.a, libgomp.{a,so}, libitm.{a,so}, liblsan.{a,so}, liblto_plugin.so, libquadmath.{a,so}, libssp.{a,so}, libssp_nonshared.a, libstdc++.{a,so}, libstdc++fs.a, libsupc++.a, libtsan.{a,so}, and libubsan.{a,so}
#           Installed directories: /usr/include/c++, /usr/lib/gcc, /usr/libexec/gcc, and /usr/share/gcc-10.2.0 
#            Short Descriptions   
# 
#                          
# 
#                c++   
# 
#                          The C++ compiler  
# 
#                          cc   
# 
#                          The C compiler  
# 
#                          cpp   
# 
#                          The C preprocessor; it is used by the compiler to expand the #include, #define,
#                        and similar statements in the source files  
# 
#                          g++   
# 
#                          The C++ compiler  
# 
#                          gcc   
# 
#                          The C compiler  
# 
#                          gcc-ar   
# 
#                          A wrapper around ar that adds a plugin to the command line. This program is only
#                        used to add "link time optimization" and is not useful with the default build options
#                          
# 
#                          gcc-nm   
# 
#                          A wrapper around nm that adds a plugin to the command line. This program is only
#                        used to add "link time optimization" and is not useful with the default build options
#                          
# 
#                          gcc-ranlib   
# 
#                          A wrapper around ranlib that adds a plugin to the command line. This program is only
#                        used to add "link time optimization" and is not useful with the default build options
#                          
# 
#                          gcov   
# 
#                          A coverage testing tool; it is used to analyze programs to determine where optimizations
#                        will have the most effect  
# 
#                          gcov-dump   
# 
#                          Offline gcda and gcno profile dump tool  
# 
#                          gcov-tool   
# 
#                          Offline gcda profile processing tool  
# 
#                          libasan 
# 
#                          The Address Sanitizer runtime library  
# 
#                          libatomic 
# 
#                          GCC atomic built-in runtime library  
# 
#                          libcc1 
# 
#                          The C preprocessing library  
# 
#                          libgcc 
# 
#                          Contains run-time support for gcc   
# 
#                          libgcov 
# 
#                          This library is linked in to a program when GCC is instructed to enable profiling
#                         
# 
#                          libgomp 
# 
#                          GNU implementation of the OpenMP API for multi-platform shared-memory parallel programming
#                        in C/C++ and Fortran  
# 
#                          liblsan 
# 
#                          The Leak Sanitizer runtime library  
# 
#                          liblto_plugin 
# 
#                          GCC's Link Time Optimization (LTO) plugin allows GCC to perform optimizations across
#                        compilation units  
# 
#                          libquadmath 
# 
#                          GCC Quad Precision Math Library API  
# 
#                          libssp 
# 
#                          Contains routines supporting GCC's stack-smashing protection functionality  
# 
#                          libstdc++ 
# 
#                          The standard C++ library  
# 
#                          libstdc++fs 
# 
#                          ISO/IEC TS 18822:2015 Filesystem library  
# 
#                          libsupc++ 
# 
#                          Provides supporting routines for the C++ programming language  
# 
#                          libtsan 
# 
#                          The Thread Sanitizer runtime library  
# 
#                          libubsan 
# 
#                          The Undefined Behavior Sanitizer runtime library 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'pkg-config-*' | cut -c 2-)"

read -p "Chapter 8.27"

#        8.27. Pkg-config-0.29.2  
# 
#                          The pkg-config package contains a tool for passing the include path and/or library
#                        paths to build tools during the configure and make phases of package installations.
#                        
#           Approximate build time: 0.3 SBU
#           Required disk space: 30 MB
#          8.27.1. Installation of Pkg-config 
# 
#                          Prepare Pkg-config for compilation: 



./configure --prefix=/usr              \
            --with-internal-glib       \
            --disable-host-tool        \
            --docdir=/usr/share/doc/pkg-config-0.29.2


 
# 
#                          The meaning of the new configure options: 
# 
#                --with-internal-glib 
# 
#                          This will allow pkg-config to use its internal version of Glib because an external
#                        version is not available in LFS. 
# 
#                --disable-host-tool 
# 
#                          This option disables the creation of an undesired hard link to the pkg-config program.
#                        
# 
#                          Compile the package: 



make



# 
#                          To test the results, issue: 



make check



# 
#                          Install the package: 



make install


 
#          8.27.2. Contents of Pkg-config  
#           Installed program: pkg-config
#           Installed directory: /usr/share/doc/pkg-config-0.29.2 
#            Short Descriptions   
# 
#                          
# 
#                pkg-config   
# 
#                          Returns meta information for the specified library or package 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'ncurses-*' | cut -c 2-)"

read -p "Chapter 8.28"

#        8.28. Ncurses-6.2  
# 
#                          The Ncurses package contains libraries for terminal-independent handling of character
#                        screens. 
#           Approximate build time: 0.4 SBU
#           Required disk space: 34 MB
#          8.28.1. Installation of Ncurses 
# 
#                          Prepare Ncurses for compilation: 



./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --enable-pc-files       \
            --enable-widec


 
# 
#                          The meaning of the new configure options: 
# 
#                --enable-widec 
# 
#                          This switch causes wide-character libraries (e.g., libncursesw.so.6.2) to be built
#                        instead of normal ones (e.g., libncurses.so.6.2). These wide-character libraries
#                        are usable in both multibyte and traditional 8-bit locales, while normal libraries
#                        work properly only in 8-bit locales. Wide-character and normal libraries are source-compatible,
#                        but not binary-compatible. 
# 
#                --enable-pc-files 
# 
#                          This switch generates and installs .pc files for pkg-config. 
# 
#                --without-normal 
# 
#                          This switch disables building and installing most static libraries. 
# 
#                          Compile the package: 



make



# 
#                          This package has a test suite, but it can only be run after the package has been
#                        installed. The tests reside in the test/directory. See the READMEfile in that directory
#                        for further details. 
# 
#                          Install the package: 



make install



# 
#                          Move the shared libraries to the /libdirectory, where they are expected to reside:
#                        



mv -v /usr/lib/libncursesw.so.6* /lib



# 
#                          Because the libraries have been moved, one symlink points to a non-existent file.
#                        Recreate it: 



ln -sfv ../../lib/$(readlink /usr/lib/libncursesw.so) /usr/lib/libncursesw.so



# 
#                          Many applications still expect the linker to be able to find non-wide-character
#                        Ncurses libraries. Trick such applications into linking with wide-character libraries
#                        by means of symlinks and linker scripts: 



for lib in ncurses form panel menu ; do
    rm -vf                    /usr/lib/lib${lib}.so
    echo "INPUT(-l${lib}w)" > /usr/lib/lib${lib}.so
    ln -sfv ${lib}w.pc        /usr/lib/pkgconfig/${lib}.pc
done



# 
#                          Finally, make sure that old applications that look for -lcursesat build time are
#                        still buildable: 



rm -vf                     /usr/lib/libcursesw.so
echo "INPUT(-lncursesw)" > /usr/lib/libcursesw.so
ln -sfv libncurses.so      /usr/lib/libcurses.so



# 
#                          Remove a static library that is not handled by configure: 



rm -fv /usr/lib/libncurses++w.a



# 
#                          If desired, install the Ncurses documentation: 



mkdir -v       /usr/share/doc/ncurses-6.2
cp -v -R doc/* /usr/share/doc/ncurses-6.2



#          Note 
# 
#                          The instructions above don't create non-wide-character Ncurses libraries since no
#                        package installed by compiling from sources would link against them at runtime.
#                        However, the only known binary-only applications that link against non-wide-character
#                        Ncurses libraries require version 5. If you must have such libraries because of
#                        some binary-only application or to be compliant with LSB, build the package again
#                        with the following commands: 



make distclean
./configure --prefix=/usr    \
            --with-shared    \
            --without-normal \
            --without-debug  \
            --without-cxx-binding \
            --with-abi-version=5 
make sources libs
cp -av lib/lib*.so.5* /usr/lib


 
#          8.28.2. Contents of Ncurses  
#           Installed programs: captoinfo (link to tic), clear, infocmp, infotocap (link to tic), ncursesw6-config, reset (link to tset), tabs, tic, toe, tput, and tset
#           Installed libraries: libcursesw.so (symlink and linker script to libncursesw.so), libformw.so, libmenuw.so, libncursesw.so, libpanelw.so, and their non-wide-character counterparts without "w" in the library names.
#           Installed directories: /usr/share/tabset, /usr/share/terminfo, and /usr/share/doc/ncurses-6.2 
#            Short Descriptions   
# 
#                          
# 
#                captoinfo   
# 
#                          Converts a termcap description into a terminfo description  
# 
#                          clear   
# 
#                          Clears the screen, if possible  
# 
#                          infocmp   
# 
#                          Compares or prints out terminfo descriptions  
# 
#                          infotocap   
# 
#                          Converts a terminfo description into a termcap description  
# 
#                          ncursesw6-config   
# 
#                          Provides configuration information for ncurses  
# 
#                          reset   
# 
#                          Reinitializes a terminal to its default values  
# 
#                          tabs   
# 
#                          Clears and sets tab stops on a terminal  
# 
#                          tic   
# 
#                          The terminfo entry-description compiler that translates a terminfo file from source
#                        format into the binary format needed for the ncurses library routines [A terminfo
#                        file contains information on the capabilities of a certain terminal.]  
# 
#                          toe   
# 
#                          Lists all available terminal types, giving the primary name and description for
#                        each  
# 
#                          tput   
# 
#                          Makes the values of terminal-dependent capabilities available to the shell; it can
#                        also be used to reset or initialize a terminal or report its long name  
# 
#                          tset   
# 
#                          Can be used to initialize terminals  
# 
#                          libcursesw 
# 
#                          A link to libncursesw 
# 
#                          libncursesw 
# 
#                          Contains functions to display text in many complex ways on a terminal screen; a
#                        good example of the use of these functions is the menu displayed during the kernel's
#                        make menuconfig   
# 
#                          libformw 
# 
#                          Contains functions to implement forms  
# 
#                          libmenuw 
# 
#                          Contains functions to implement menus  
# 
#                          libpanelw 
# 
#                          Contains functions to implement panels 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'sed-*' | cut -c 2-)"

read -p "Chapter 8.29"

#        8.29. Sed-4.8  
# 
#                          The Sed package contains a stream editor. 
#           Approximate build time: 0.5 SBU
#           Required disk space: 32 MB
#          8.29.1. Installation of Sed 
# 
#                          Prepare Sed for compilation: 



./configure --prefix=/usr --bindir=/bin



# 
#                          Compile the package and generate the HTML documentation: 



make
make html



# 
#                          To test the results, issue: 



chown -Rv tester .
su tester -c "PATH=$PATH make check"



# 
#                          Install the package and its documentation: 



make install
install -d -m755           /usr/share/doc/sed-4.8
install -m644 doc/sed.html /usr/share/doc/sed-4.8


 
#          8.29.2. Contents of Sed  
#           Installed program: sed
#           Installed directory: /usr/share/doc/sed-4.8 
#            Short Descriptions   
# 
#                          
# 
#                sed   
# 
#                          Filters and transforms text files in a single pass 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'psmisc-*' | cut -c 2-)"

read -p "Chapter 8.30"

#        8.30. Psmisc-23.4  
# 
#                          The Psmisc package contains programs for displaying information about running processes.
#                        
#           Approximate build time: less than 0.1 SBU
#           Required disk space: 5.7 MB
#          8.30.1. Installation of Psmisc 
# 
#                          Prepare Psmisc for compilation: 



./configure --prefix=/usr



# 
#                          Compile the package: 



make



# 
#                          This package does not come with a test suite. 
# 
#                          Install the package: 



make install



# 
#                          Finally, move the  killall and  fuser programs to the location specified by the FHS:
#                        



mv -v /usr/bin/fuser   /bin
mv -v /usr/bin/killall /bin


 
#          8.30.2. Contents of Psmisc  
#           Installed programs: fuser, killall, peekfd, prtstat, pslog, pstree, and pstree.x11 (link to pstree) 
#            Short Descriptions   
# 
#                          
# 
#                fuser   
# 
#                          Reports the Process IDs (PIDs) of processes that use the given files or file systems
#                         
# 
#                          killall   
# 
#                          Kills processes by name; it sends a signal to all processes running any of the given
#                        commands  
# 
#                          peekfd   
# 
#                          Peek at file descriptors of a running process, given its PID  
# 
#                          prtstat   
# 
#                          Prints information about a process  
# 
#                          pslog   
# 
#                          Reports current logs path of a process  
# 
#                          pstree   
# 
#                          Displays running processes as a tree  
# 
#                          pstree.x11   
# 
#                          Same as pstree , except that it waits for confirmation before exiting  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'gettext-*' | cut -c 2-)"

read -p "Chapter 8.31"

#        8.31. Gettext-0.21  
# 
#                          The Gettext package contains utilities for internationalization and localization.
#                        These allow programs to be compiled with NLS (Native Language Support), enabling
#                        them to output messages in the user's native language. 
#           Approximate build time: 2.9 SBU
#           Required disk space: 240 MB
#          8.31.1. Installation of Gettext 
# 
#                          Prepare Gettext for compilation: 



./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/gettext-0.21



# 
#                          Compile the package: 



make



# 
#                          To test the results (this takes a long time, around 3 SBUs), issue: 



make check



# 
#                          Install the package: 



make install
chmod -v 0755 /usr/lib/preloadable_libintl.so


 
#          8.31.2. Contents of Gettext  
#           Installed programs: autopoint, envsubst, gettext, gettext.sh, gettextize, msgattrib, msgcat, msgcmp, msgcomm, msgconv, msgen, msgexec, msgfilter, msgfmt, msggrep, msginit, msgmerge, msgunfmt, msguniq, ngettext, recode-sr-latin, and xgettext
#           Installed libraries: libasprintf.so, libgettextlib.so, libgettextpo.so, libgettextsrc.so, libtextstyle.so, and preloadable_libintl.so
#           Installed directories: /usr/lib/gettext, /usr/share/doc/gettext-0.21, /usr/share/gettext, and /usr/share/gettext-0.19.8 
#            Short Descriptions   
# 
#                          
# 
#                autopoint   
# 
#                          Copies standard Gettext infrastructure files into a source package  
# 
#                          envsubst   
# 
#                          Substitutes environment variables in shell format strings  
# 
#                          gettext   
# 
#                          Translates a natural language message into the user's language by looking up the
#                        translation in a message catalog  
# 
#                          gettext.sh   
# 
#                          Primarily serves as a shell function library for gettext  
# 
#                          gettextize   
# 
#                          Copies all standard Gettext files into the given top-level directory of a package
#                        to begin internationalizing it  
# 
#                          msgattrib   
# 
#                          Filters the messages of a translation catalog according to their attributes and
#                        manipulates the attributes  
# 
#                          msgcat   
# 
#                          Concatenates and merges the given .pofiles  
# 
#                          msgcmp   
# 
#                          Compares two .pofiles to check that both contain the same set of msgid strings  
# 
#                          msgcomm   
# 
#                          Finds the messages that are common to the given .pofiles  
# 
#                          msgconv   
# 
#                          Converts a translation catalog to a different character encoding  
# 
#                          msgen   
# 
#                          Creates an English translation catalog  
# 
#                          msgexec   
# 
#                          Applies a command to all translations of a translation catalog  
# 
#                          msgfilter   
# 
#                          Applies a filter to all translations of a translation catalog  
# 
#                          msgfmt   
# 
#                          Generates a binary message catalog from a translation catalog  
# 
#                          msggrep   
# 
#                          Extracts all messages of a translation catalog that match a given pattern or belong
#                        to some given source files  
# 
#                          msginit   
# 
#                          Creates a new .pofile, initializing the meta information with values from the user's
#                        environment  
# 
#                          msgmerge   
# 
#                          Combines two raw translations into a single file  
# 
#                          msgunfmt   
# 
#                          Decompiles a binary message catalog into raw translation text  
# 
#                          msguniq   
# 
#                          Unifies duplicate translations in a translation catalog  
# 
#                          ngettext   
# 
#                          Displays native language translations of a textual message whose grammatical form
#                        depends on a number  
# 
#                          recode-sr-latin   
# 
#                          Recodes Serbian text from Cyrillic to Latin script  
# 
#                          xgettext   
# 
#                          Extracts the translatable message lines from the given source files to make the
#                        first translation template  
# 
#                          libasprintf 
# 
#                          defines the autosprintf class, which makes C formatted output routines usable in
#                        C++ programs, for use with the  <string> strings and the  <iostream> streams   
# 
#                          libgettextlib 
# 
#                          a private library containing common routines used by the various Gettext programs;
#                        these are not intended for general use  
# 
#                          libgettextpo 
# 
#                          Used to write specialized programs that process .pofiles; this library is used when
#                        the standard applications shipped with Gettext (such as msgcomm ,  msgcmp ,  msgattrib ,
#                        and  msgen ) will not suffice   
# 
#                          libgettextsrc 
# 
#                          A private library containing common routines used by the various Gettext programs;
#                        these are not intended for general use  
# 
#                          libtextstyle 
# 
#                          Text styling library  
# 
#                          preloadable_libintl 
# 
#                          A library, intended to be used by LD_PRELOAD that assists libintlin logging untranslated
#                        messages 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'bison-*' | cut -c 2-)"

read -p "Chapter 8.32"

#        8.32. Bison-3.7.5  
# 
#                          The Bison package contains a parser generator. 
#           Approximate build time: 6.4 SBU
#           Required disk space: 56 MB
#          8.32.1. Installation of Bison 
# 
#                          Prepare Bison for compilation: 



./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.7.5



# 
#                          Compile the package: 



make



# 
#                          To test the results (about 5.5 SBU), issue: 



make check



# 
#                          Install the package: 



make install


 
#          8.32.2. Contents of Bison  
#           Installed programs: bison and yacc
#           Installed library: liby.a
#           Installed directory: /usr/share/bison 
#            Short Descriptions   
# 
#                          
# 
#                bison   
# 
#                          Generates, from a series of rules, a program for analyzing the structure of text
#                        files; Bison is a replacement for Yacc (Yet Another Compiler Compiler)  
# 
#                          yacc   
# 
#                          A wrapper for bison , meant for programs that still call  yacc instead of  bison ; it
#                        calls  bison with the  -yoption   
# 
#                          liby 
# 
#                          The Yacc library containing implementations of Yacc-compatible yyerrorand mainfunctions;
#                        this library is normally not very useful, but POSIX requires it 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'grep-*' | cut -c 2-)"

read -p "Chapter 8.33"

#        8.33. Grep-3.6  
# 
#                          The Grep package contains programs for searching through the contents of files.
#                        
#           Approximate build time: 0.8 SBU
#           Required disk space: 38 MB
#          8.33.1. Installation of Grep 
# 
#                          Prepare Grep for compilation: 



./configure --prefix=/usr --bindir=/bin



# 
#                          Compile the package: 



make



# 
#                          To test the results, issue: 



make check



# 
#                          Install the package: 



make install


 
#          8.33.2. Contents of Grep  
#           Installed programs: egrep, fgrep, and grep 
#            Short Descriptions   
# 
#                          
# 
#                egrep   
# 
#                          Prints lines matching an extended regular expression  
# 
#                          fgrep   
# 
#                          Prints lines matching a list of fixed strings  
# 
#                          grep   
# 
#                          Prints lines matching a basic regular expression 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'bash-*' | cut -c 2-)"

read -p "Chapter 8.34"

#        8.34. Bash-5.1  
# 
#                          The Bash package contains the Bourne-Again SHell. 
#           Approximate build time: 1.6 SBU
#           Required disk space: 51 MB
#          8.34.1. Installation of Bash 
# 
#                          First, fix a race condition if using multiple cores: 



sed -i  '/^bashline.o:.*shmbchar.h/a bashline.o: ${DEFDIR}/builtext.h' Makefile.in



# 
#                          Prepare Bash for compilation: 



./configure --prefix=/usr                    \
            --docdir=/usr/share/doc/bash-5.1 \
            --without-bash-malloc            \
            --with-installed-readline


 
# 
#                          The meaning of the new configure option: 
# 
#                --with-installed-readline 
# 
#                          This option tells Bash to use the readlinelibrary that is already installed on the
#                        system rather than using its own readline version. 
# 
#                          Compile the package: 



make



# 
#                          Skip down to "Install the package"if not running the test suite. 
# 
#                          To prepare the tests, ensure that the testeruser can write to the sources tree:
#                        



chown -Rv tester .



# 
#                          Now, run the tests as the testeruser: 



su tester << EOF
PATH=$PATH make tests < $(tty)
EOF



# 
#                          Install the package and move the main executable to /bin: 



make install
mv -vf /usr/bin/bash /bin



# 
#                          Run the newly compiled  bash program (replacing the one that is currently being executed):
#                        



exec /bin/bash --login +h



#          Note 
# 
#                          The parameters used make the  bash process an interactive login shell and continues
#                        to disable hashing so that new programs are found as they become available.  
#          8.34.2. Contents of Bash  
#           Installed programs: bash, bashbug, and sh (link to bash)
#           Installed directory: /usr/include/bash, /usr/lib/bash, and /usr/share/doc/bash-5.1 
#            Short Descriptions   
# 
#                          
# 
#                bash   
# 
#                          A widely-used command interpreter; it performs many types of expansions and substitutions
#                        on a given command line before executing it, thus making this interpreter a powerful
#                        tool  
# 
#                          bashbug   
# 
#                          A shell script to help the user compose and mail standard formatted bug reports
#                        concerning bash   
# 
#                          sh   
# 
#                          A symlink to the bash program; when invoked as  sh ,  bash tries to mimic the startup
#                        behavior of historical versions of  sh as closely as possible, while conforming to
#                        the POSIX standard as well  
