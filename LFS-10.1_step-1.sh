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
read -p "at end .. run = cp /home/__your_user_name__/LFS* ~"
read -p "......... run = ./LFS-10.1_step-2.sh"

#----------------------------------------------
mkdir -v $LFS/sources
chmod -v a+wt $LFS/sources








#Linux From Scratch /**/ 
#      Linux From Scratch  
#        Version 10.1 
#        Published March 1st, 2021 
#          Created by Gerard Beekmans 
#          Managing Editor: Bruce Dubbs 
# 
#                          Copyright C 1999-2021 Gerard Beekmans  
# 
#                          Copyright C 1999-2021, Gerard Beekmans 
# 
#                          All rights reserved. 
# 
#                          This book is licensed under a Creative Commons License.  
# 
#                          Computer instructions may be extracted from the book under the MIT License.  
# 
#                          Linux® is a registered trademark of Linus Torvalds. 
# --------------------------------------------------------------------------------
# Table of Contents 
#            Preface 
#                Foreword 
#                Audience 
#                LFS Target Architectures 
#                Prerequisites 
#                LFS and Standards 
#                Rationale for Packages in the Book 
#                Typography 
#                Structure 
#                Errata 
#          I. Introduction 
#            1. Introduction 
#                How to Build an LFS System 
#                What's new since the last release 
#                Changelog 
#                Resources 
#                Help 
#          II. Preparing for the Build 
#            2. Preparing the Host System 
#                Introduction 
#                Host System Requirements 
#                Building LFS in Stages 
#                Creating a New Partition 
#                Creating a File System on the Partition 
#                Setting The $LFS Variable 
#                Mounting the New Partition 
#            3. Packages and Patches 
#                Introduction 
#                All Packages 
#                Needed Patches 
#            4. Final Preparations 
#                Introduction 
#                Creating a limited directory layout in LFS filesystem 
#                Adding the LFS User 
#                Setting Up the Environment 
#                About SBUs 
#                About the Test Suites 
#          III. Building the LFS Cross Toolchain and Temporary Tools 
#            Important Preliminary Material 
#                Introduction 
#                Toolchain Technical Notes 
#                General Compilation Instructions 
#            5. Compiling a Cross-Toolchain 
#                Introduction 
#                Binutils-2.36.1 - Pass 1 
#                GCC-10.2.0 - Pass 1 
#                Linux-5.10.17 API Headers 
#                Glibc-2.33 
#                Libstdc++ from GCC-10.2.0, Pass 1 
#            6. Cross Compiling Temporary Tools 
#                Introduction 
#                M4-1.4.18 
#                Ncurses-6.2 
#                Bash-5.1 
#                Coreutils-8.32 
#                Diffutils-3.7 
#                File-5.39 
#                Findutils-4.8.0 
#                Gawk-5.1.0 
#                Grep-3.6 
#                Gzip-1.10 
#                Make-4.3 
#                Patch-2.7.6 
#                Sed-4.8 
#                Tar-1.34 
#                Xz-5.2.5 
#                Binutils-2.36.1 - Pass 2 
#                GCC-10.2.0 - Pass 2 
#            7. Entering Chroot and Building Additional Temporary Tools 
#                Introduction 
#                Changing Ownership 
#                Preparing Virtual Kernel File Systems 
#                Entering the Chroot Environment 
#                Creating Directories 
#                Creating Essential Files and Symlinks 
#                Libstdc++ from GCC-10.2.0, Pass 2 
#                Gettext-0.21 
#                Bison-3.7.5 
#                Perl-5.32.1 
#                Python-3.9.2 
#                Texinfo-6.7 
#                Util-linux-2.36.2 
#                Cleaning up and Saving the Temporary System 
#          IV. Building the LFS System 
#            8. Installing Basic System Software 
#                Introduction 
#                Package Management 
#                Man-pages-5.10 
#                Iana-Etc-20210202 
#                Glibc-2.33 
#                Zlib-1.2.11 
#                Bzip2-1.0.8 
#                Xz-5.2.5 
#                Zstd-1.4.8 
#                File-5.39 
#                Readline-8.1 
#                M4-1.4.18 
#                Bc-3.3.0 
#                Flex-2.6.4 
#                Tcl-8.6.11 
#                Expect-5.45.4 
#                DejaGNU-1.6.2 
#                Binutils-2.36.1 
#                GMP-6.2.1 
#                MPFR-4.1.0 
#                MPC-1.2.1 
#                Attr-2.4.48 
#                Acl-2.2.53 
#                Libcap-2.48 
#                Shadow-4.8.1 
#                GCC-10.2.0 
#                Pkg-config-0.29.2 
#                Ncurses-6.2 
#                Sed-4.8 
#                Psmisc-23.4 
#                Gettext-0.21 
#                Bison-3.7.5 
#                Grep-3.6 
#                Bash-5.1 
#                Libtool-2.4.6 
#                GDBM-1.19 
#                Gperf-3.1 
#                Expat-2.2.10 
#                Inetutils-2.0 
#                Perl-5.32.1 
#                XML::Parser-2.46 
#                Intltool-0.51.0 
#                Autoconf-2.71 
#                Automake-1.16.3 
#                Kmod-28 
#                Libelf from Elfutils-0.183 
#                Libffi-3.3 
#                OpenSSL-1.1.1j 
#                Python-3.9.2 
#                Ninja-1.10.2 
#                Meson-0.57.1 
#                Coreutils-8.32 
#                Check-0.15.2 
#                Diffutils-3.7 
#                Gawk-5.1.0 
#                Findutils-4.8.0 
#                Groff-1.22.4 
#                GRUB-2.04 
#                Less-563 
#                Gzip-1.10 
#                IPRoute2-5.10.0 
#                Kbd-2.4.0 
#                Libpipeline-1.5.3 
#                Make-4.3 
#                Patch-2.7.6 
#                Man-DB-2.9.4 
#                Tar-1.34 
#                Texinfo-6.7 
#                Vim-8.2.2433 
#                Eudev-3.2.10 
#                Procps-ng-3.3.17 
#                Util-linux-2.36.2 
#                E2fsprogs-1.46.1 
#                Sysklogd-1.5.1 
#                Sysvinit-2.98 
#                About Debugging Symbols 
#                Stripping Again 
#                Cleaning Up 
#            9. System Configuration 
#                Introduction 
#                LFS-Bootscripts-20210201 
#                Overview of Device and Module Handling 
#                Managing Devices 
#                General Network Configuration 
#                System V Bootscript Usage and Configuration 
#                The Bash Shell Startup Files 
#                Creating the /etc/inputrc File 
#                Creating the /etc/shells File 
#            10. Making the LFS System Bootable 
#                Introduction 
#                Creating the /etc/fstab File 
#                Linux-5.10.17 
#                Using GRUB to Set Up the Boot Process 
#            11. The End 
#                The End 
#                Get Counted 
#                Rebooting the System 
#                What Now? 
#          V. Appendices 
#                A. Acronyms and Terms 
#                B. Acknowledgments 
#                C. Dependencies 
#                D. Boot and sysconfig scripts version-20210201 
#                /etc/rc.d/init.d/rc 
#                /lib/lsb/init-functions 
#                /etc/rc.d/init.d/mountvirtfs 
#                /etc/rc.d/init.d/modules 
#                /etc/rc.d/init.d/udev 
#                /etc/rc.d/init.d/swap 
#                /etc/rc.d/init.d/setclock 
#                /etc/rc.d/init.d/checkfs 
#                /etc/rc.d/init.d/mountfs 
#                /etc/rc.d/init.d/udev_retry 
#                /etc/rc.d/init.d/cleanfs 
#                /etc/rc.d/init.d/console 
#                /etc/rc.d/init.d/localnet 
#                /etc/rc.d/init.d/sysctl 
#                /etc/rc.d/init.d/sysklogd 
#                /etc/rc.d/init.d/network 
#                /etc/rc.d/init.d/sendsignals 
#                /etc/rc.d/init.d/reboot 
#                /etc/rc.d/init.d/halt 
#                /etc/rc.d/init.d/template 
#                /etc/sysconfig/modules 
#                /etc/sysconfig/createfiles 
#                /etc/sysconfig/udev-retry 
#                /sbin/ifup 
#                /sbin/ifdown 
#                /lib/services/ipv4-static 
#                /lib/services/ipv4-static-route 
#                E. Udev configuration rules 
#                55-lfs.rules 
#                F. LFS Licenses 
#                Creative Commons License 
#                The MIT License  
#          Index 
#      Preface  
#        Foreword  
# 
#                          My journey to learn and better understand Linux began back in 1998. I had just installed
#                        my first Linux distribution and had quickly become intrigued with the whole concept
#                        and philosophy behind Linux. 
# 
#                          There are always many ways to accomplish a single task. The same can be said about
#                        Linux distributions. A great many have existed over the years. Some still exist,
#                        some have morphed into something else, yet others have been relegated to our memories.
#                        They all do things differently to suit the needs of their target audience. Because
#                        so many different ways to accomplish the same end goal exist, I began to realize
#                        I no longer had to be limited by any one implementation. Prior to discovering Linux,
#                        we simply put up with issues in other Operating Systems as you had no choice. It
#                        was what it was, whether you liked it or not. With Linux, the concept of choice
#                        began to emerge. If you didn't like something, you were free, even encouraged, to
#                        change it. 
# 
#                          I tried a number of distributions and could not decide on any one. They were great
#                        systems in their own right. It wasn't a matter of right and wrong anymore. It had
#                        become a matter of personal taste. With all that choice available, it became apparent
#                        that there would not be a single system that would be perfect for me. So I set out
#                        to create my own Linux system that would fully conform to my personal preferences.
#                        
# 
#                          To truly make it my own system, I resolved to compile everything from source code
#                        instead of using pre-compiled binary packages. This "perfect"Linux system would
#                        have the strengths of various systems without their perceived weaknesses. At first,
#                        the idea was rather daunting. I remained committed to the idea that such a system
#                        could be built. 
# 
#                          After sorting through issues such as circular dependencies and compile-time errors,
#                        I finally built a custom-built Linux system. It was fully operational and perfectly
#                        usable like any of the other Linux systems out there at the time. But it was my
#                        own creation. It was very satisfying to have put together such a system myself.
#                        The only thing better would have been to create each piece of software myself. This
#                        was the next best thing. 
# 
#                          As I shared my goals and experiences with other members of the Linux community,
#                        it became apparent that there was a sustained interest in these ideas. It quickly
#                        became plain that such custom-built Linux systems serve not only to meet user specific
#                        requirements, but also serve as an ideal learning opportunity for programmers and
#                        system administrators to enhance their (existing) Linux skills. Out of this broadened
#                        interest, the  Linux From Scratch Project was born. 
# 
#                          This Linux From Scratch book is the central core around that project. It provides
#                        the background and instructions necessary for you to design and build your own system.
#                        While this book provides a template that will result in a correctly working system,
#                        you are free to alter the instructions to suit yourself, which is, in part, an important
#                        part of this project. You remain in control; we just lend a helping hand to get
#                        you started on your own journey. 
# 
#                          I sincerely hope you will have a great time working on your own Linux From Scratch
#                        system and enjoy the numerous benefits of having a system that is truly your own.
#                        
# 
#                          --Gerard Beekmansgerard AT linuxfromscratch D0T org  
#        Audience  
# 
#                          There are many reasons why you would want to read this book. One of the questions
#                        many people raise is, "why go through all the hassle of manually building a Linux
#                        system from scratch when you can just download and install an existing one?" 
# 
#                          One important reason for this project's existence is to help you learn how a Linux
#                        system works from the inside out. Building an LFS system helps demonstrate what
#                        makes Linux tick, and how things work together and depend on each other. One of
#                        the best things that this learning experience can provide is the ability to customize
#                        a Linux system to suit your own unique needs. 
# 
#                          Another key benefit of LFS is that it allows you to have more control over the system
#                        without relying on someone else's Linux implementation. With LFS, you are in the
#                        driver's seat and dictate every aspect of the system. 
# 
#                          LFS allows you to create very compact Linux systems. When installing regular distributions,
#                        you are often forced to install a great many programs which are probably never used
#                        or understood. These programs waste resources. You may argue that with today's hard
#                        drive and CPUs, such resources are no longer a consideration. Sometimes, however,
#                        you are still constrained by size considerations if nothing else. Think about bootable
#                        CDs, USB sticks, and embedded systems. Those are areas where LFS can be beneficial.
#                        
# 
#                          Another advantage of a custom built Linux system is security. By compiling the entire
#                        system from source code, you are empowered to audit everything and apply all the
#                        security patches desired. It is no longer necessary to wait for somebody else to
#                        compile binary packages that fix a security hole. Unless you examine the patch and
#                        implement it yourself, you have no guarantee that the new binary package was built
#                        correctly and adequately fixes the problem. 
# 
#                          The goal of Linux From Scratch is to build a complete and usable foundation-level
#                        system. If you do not wish to build your own Linux system from scratch, you may
#                        nevertheless benefit from the information in this book. 
# 
#                          There are too many other good reasons to build your own LFS system to list them
#                        all here. In the end, education is by far the most powerful of reasons. As you continue
#                        in your LFS experience, you will discover the power that information and knowledge
#                        truly bring. 
#        LFS Target Architectures  
# 
#                          The primary target architectures of LFS are the AMD/Intel x86 (32-bit) and x86_64
#                        (64-bit) CPUs. On the other hand, the instructions in this book are also known to
#                        work, with some modifications, with the Power PC and ARM CPUs. To build a system
#                        that utilizes one of these CPUs, the main prerequisite, in addition to those on
#                        the next page, is an existing Linux system such as an earlier LFS installation,
#                        Ubuntu, Red Hat/Fedora, SuSE, or other distribution that targets the architecture
#                        that you have. Also note that a 32-bit distribution can be installed and used as
#                        a host system on a 64-bit AMD/Intel computer. 
# 
#                          For building LFS, the gain of building on a 64-bit system compared to a 32-bit system
#                        is minimal. For example, in a test build of LFS-9.1 on a Core i7-4790 CPU based
#                        system, using 4 cores, the following statistics were measured: 



# Architecture Build Time     Build Size
# 32-bit       239.9 minutes  3.6 GB
# 64-bit       233.2 minutes  4.4 GB
# 


# 
#                          As you can see, on the same hardware, the 64-bit build is only 3% faster and is
#                        22% larger than the 32-bit build. If you plan to use LFS as a LAMP server, or a
#                        firewall, a 32-bit CPU may be largely sufficient. On the other hand, several packages
#                        in BLFS now need more than 4GB of RAM to be built and/or to run, so that if you
#                        plan to use LFS as a desktop, the LFS authors recommend building on a 64-bit system.
#                        
# 
#                          The default 64-bit build that results from LFS is considered a "pure"64-bit system.
#                        That is, it supports 64-bit executables only. Building a "multi-lib"system requires
#                        compiling many applications twice, once for a 32-bit system and once for a 64-bit
#                        system. This is not directly supported in LFS because it would interfere with the
#                        educational objective of providing the instructions needed for a straightforward
#                        base Linux system. Some LFS/BLFS editors maintain a fork of LFS for multilib, which
#                        is accessible at http://www.linuxfromscratch.org/~thomas/multilib/index.html. But
#                        it is an advanced topic.   
#        Prerequisites  
# 
#                          Building an LFS system is not a simple task. It requires a certain level of existing
#                        knowledge of Unix system administration in order to resolve problems and correctly
#                        execute the commands listed. In particular, as an absolute minimum, you should already
#                        have the ability to use the command line (shell) to copy or move files and directories,
#                        list directory and file contents, and change the current directory. It is also expected
#                        that you have a reasonable knowledge of using and installing Linux software. 
# 
#                          Because the LFS book assumes at least this basic level of skill, the various LFS
#                        support forums are unlikely to be able to provide you with much assistance in these
#                        areas. You will find that your questions regarding such basic knowledge will likely
#                        go unanswered or you will simply be referred to the LFS essential pre-reading list.
#                        
# 
#                          Before building an LFS system, we recommend reading the following: 
# 
#                          Software-Building-HOWTO http://www.tldp.org/HOWTO/Software-Building-HOWTO.html  
# 
#                          This is a comprehensive guide to building and installing "generic"Unix software
#                        packages under Linux. Although it was written some time ago, it still provides a
#                        good summary of the basic techniques needed to build and install software. 
# 
#                          Beginner's Guide to Installing from Source http://moi.vonos.net/linux/beginners-installing-from-source/  
# 
#                          This guide provides a good summary of basic skills and techniques needed to build
#                        software from source code. 
#        LFS and Standards  
# 
#                          The structure of LFS follows Linux standards as closely as possible. The primary
#                        standards are: 
# 
#                          POSIX.1-2008.  
# 
#                          Filesystem Hierarchy Standard (FHS) Version 3.0 
# 
#                          Linux Standard Base (LSB) Version 5.0 (2015) 
# 
#                          The LSB has four separate standards: Core, Desktop, Runtime Languages, and Imaging.
#                        In addition to generic requirements there are also architecture specific requirements.
#                        There are also two areas for trial use: Gtk3 and Graphics. LFS attempts to conform
#                        to the architectures discussed in the previous section. 
#          Note 
# 
#                          Many people do not agree with the requirements of the LSB. The main purpose of defining
#                        it is to ensure that proprietary software will be able to be installed and run properly
#                        on a compliant system. Since LFS is source based, the user has complete control
#                        over what packages are desired and many choose not to install some packages that
#                        are specified by the LSB. 
# 
#                          Creating a complete LFS system capable of passing the LSB certifications tests is
#                        possible, but not without many additional packages that are beyond the scope of
#                        LFS. These additional packages have installation instructions in BLFS. 
#            Packages supplied by LFS needed to satisfy the LSB Requirements  
# 
#                          
# 
#                LSB Core:   
# 
#                          Bash, Bc, Binutils, Coreutils, Diffutils, File, Findutils, Gawk, Grep, Gzip, M4,
#                        Man-DB, Ncurses, Procps, Psmisc, Sed, Shadow, Tar, Util-linux, Zlib 
# 
#                          LSB Desktop:   
# 
#                          None 
# 
#                          LSB Runtime Languages:   
# 
#                          Perl 
# 
#                          LSB Imaging:   
# 
#                          None 
# 
#                          LSB Gtk3 and LSB Graphics (Trial Use):   
# 
#                          None 
#            Packages supplied by BLFS needed to satisfy the LSB Requirements  
# 
#                          
# 
#                LSB Core:   
# 
#                          At, Batch (a part of At), Cpio, Ed, Fcrontab, LSB-Tools, NSPR, NSS, PAM, Pax, Sendmail
#                        (or Postfix or Exim), time 
# 
#                          LSB Desktop:   
# 
#                          Alsa, ATK, Cairo, Desktop-file-utils, Freetype, Fontconfig, Gdk-pixbuf, Glib2, GTK+2,
#                        Icon-naming-utils, Libjpeg-turbo, Libpng, Libtiff, Libxml2, MesaLib, Pango, Xdg-utils,
#                        Xorg 
# 
#                          LSB Runtime Languages:   
# 
#                          Python, Libxml2, Libxslt 
# 
#                          LSB Imaging:   
# 
#                          CUPS, Cups-filters, Ghostscript, SANE 
# 
#                          LSB Gtk3 and LSB Graphics (Trial Use):   
# 
#                          GTK+3 
#            Packages not supplied by LFS or BLFS needed to satisfy the LSB Requirements  
# 
#                          
# 
#                LSB Core:   
# 
#                          None 
# 
#                          LSB Desktop:   
# 
#                          Qt4 (but Qt5 is provided) 
# 
#                          LSB Runtime Languages:   
# 
#                          None 
# 
#                          LSB Imaging:   
# 
#                          None 
# 
#                          LSB Gtk3 and LSB Graphics (Trial Use):   
# 
#                          None 
#        Rationale for Packages in the Book  
# 
#                          As stated earlier, the goal of LFS is to build a complete and usable foundation-level
#                        system. This includes all packages needed to replicate itself while providing a
#                        relatively minimal base from which to customize a more complete system based on
#                        the choices of the user. This does not mean that LFS is the smallest system possible.
#                        Several important packages are included that are not strictly required. The lists
#                        below document the rationale for each package in the book. 
# 
#                          Acl 
# 
#                          This package contains utilities to administer Access Control Lists, which are used
#                        to define more fine-grained discretionary access rights for files and directories.
#                        
# 
#                          Attr 
# 
#                          This package contains programs for administering extended attributes on filesystem
#                        objects. 
# 
#                          Autoconf 
# 
#                          This package contains programs for producing shell scripts that can automatically
#                        configure source code from a developer's template. It is often needed to rebuild
#                        a package after updates to the build procedures. 
# 
#                          Automake 
# 
#                          This package contains programs for generating Make files from a template. It is
#                        often needed to rebuild a package after updates to the build procedures. 
# 
#                          Bash 
# 
#                          This package satisfies an LSB core requirement to provide a Bourne Shell interface
#                        to the system. It was chosen over other shell packages because of its common usage
#                        and extensive capabilities beyond basic shell functions. 
# 
#                          Bc 
# 
#                          This package provides an arbitrary precision numeric processing language. It satisfies
#                        a requirement needed when building the Linux kernel. 
# 
#                          Binutils 
# 
#                          This package contains a linker, an assembler, and other tools for handling object
#                        files. The programs in this package are needed to compile most of the packages in
#                        an LFS system and beyond. 
# 
#                          Bison 
# 
#                          This package contains the GNU version of yacc (Yet Another Compiler Compiler) needed
#                        to build several other LFS programs. 
# 
#                          Bzip2 
# 
#                          This package contains programs for compressing and decompressing files. It is required
#                        to decompress many LFS packages. 
# 
#                          Check 
# 
#                          This package contains a test harness for other programs. 
# 
#                          Coreutils 
# 
#                          This package contains a number of essential programs for viewing and manipulating
#                        files and directories. These programs are needed for command line file management,
#                        and are necessary for the installation procedures of every package in LFS. 
# 
#                          DejaGNU 
# 
#                          This package contains a framework for testing other programs. 
# 
#                          Diffutils 
# 
#                          This package contains programs that show the differences between files or directories.
#                        These programs can be used to create patches, and are also used in many packages'
#                        build procedures. 
# 
#                          E2fsprogs 
# 
#                          This package contains the utilities for handling the ext2, ext3 and ext4 file systems.
#                        These are the most common and thoroughly tested file systems that Linux supports.
#                        
# 
#                          Eudev 
# 
#                          This package is a device manager. It dynamically controls the ownership, permissions,
#                        names, and symbolic links of devices in the /dev directory as devices are added
#                        or removed from the system. 
# 
#                          Expat 
# 
#                          This package contains a relatively small XML parsing library. It is required by
#                        the XML::Parser Perl module. 
# 
#                          Expect 
# 
#                          This package contains a program for carrying out scripted dialogues with other interactive
#                        programs. It is commonly used for testing other packages. It is only installed in
#                        the temporary toolchain. 
# 
#                          File 
# 
#                          This package contains a utility for determining the type of a given file or files.
#                        A few packages need it in their build scripts. 
# 
#                          Findutils 
# 
#                          This package contains programs to find files in a file system. It is used in many
#                        packages' build scripts. 
# 
#                          Flex 
# 
#                          This package contains a utility for generating programs that recognize patterns
#                        in text. It is the GNU version of the lex (lexical analyzer) program. It is required
#                        to build several LFS packages. 
# 
#                          Gawk 
# 
#                          This package contains programs for manipulating text files. It is the GNU version
#                        of awk (Aho-Weinberg-Kernighan). It is used in many other packages' build scripts.
#                        
# 
#                          GCC 
# 
#                          This package is the Gnu Compiler Collection. It contains the C and C++ compilers
#                        as well as several others not built by LFS. 
# 
#                          GDBM 
# 
#                          This package contains the GNU Database Manager library. It is used by one other
#                        LFS package, Man-DB. 
# 
#                          Gettext 
# 
#                          This package contains utilities and libraries for internationalization and localization
#                        of numerous packages. 
# 
#                          Glibc 
# 
#                          This package contains the main C library. Linux programs will not run without it.
#                        
# 
#                          GMP 
# 
#                          This package contains math libraries that provide useful functions for arbitrary
#                        precision arithmetic. It is required to build GCC. 
# 
#                          Gperf 
# 
#                          This package contains a program that generates a perfect hash function from a key
#                        set. It is required for Eudev. 
# 
#                          Grep 
# 
#                          This package contains programs for searching through files. These programs are used
#                        by most packages' build scripts. 
# 
#                          Groff 
# 
#                          This package contains programs for processing and formatting text. One important
#                        function of these programs is to format man pages. 
# 
#                          GRUB 
# 
#                          This package is the Grand Unified Boot Loader. It is one of several boot loaders
#                        available, but is the most flexible. 
# 
#                          Gzip 
# 
#                          This package contains programs for compressing and decompressing files. It is needed
#                        to decompress many packages in LFS and beyond. 
# 
#                          Iana-etc 
# 
#                          This package provides data for network services and protocols. It is needed to enable
#                        proper networking capabilities. 
# 
#                          Inetutils 
# 
#                          This package contains programs for basic network administration. 
# 
#                          Intltool 
# 
#                          This package contains tools for extracting translatable strings from source files.
#                        
# 
#                          IProute2 
# 
#                          This package contains programs for basic and advanced IPv4 and IPv6 networking.
#                        It was chosen over the other common network tools package (net-tools) for its IPv6
#                        capabilities. 
# 
#                          Kbd 
# 
#                          This package contains key-table files, keyboard utilities for non-US keyboards,
#                        and a number of console fonts. 
# 
#                          Kmod 
# 
#                          This package contains programs needed to administer Linux kernel modules. 
# 
#                          Less 
# 
#                          This package contains a very nice text file viewer that allows scrolling up or down
#                        when viewing a file. It is also used by Man-DB for viewing manpages. 
# 
#                          Libcap 
# 
#                          This package implements the user-space interfaces to the POSIX 1003.1e capabilities
#                        available in Linux kernels. 
# 
#                          Libelf 
# 
#                          The elfutils project provides libraries and tools for ELF files and DWARF data.
#                        Most utilities in this package are available in other packages, but the library
#                        is needed to build the Linux kernel using the default (and most efficient) configuration.
#                        
# 
#                          Libffi 
# 
#                          This package implements a portable, high level programming interface to various
#                        calling conventions. Some programs may not know at the time of compilation what
#                        arguments are to be passed to a function. For instance, an interpreter may be told
#                        at run-time about the number and types of arguments used to call a given function.
#                        Libffi can be used in such programs to provide a bridge from the interpreter program
#                        to compiled code. 
# 
#                          Libpipeline 
# 
#                          The Libpipeline package contains a library for manipulating pipelines of subprocesses
#                        in a flexible and convenient way. It is required by the Man-DB package. 
# 
#                          Libtool 
# 
#                          This package contains the GNU generic library support script. It wraps the complexity
#                        of using shared libraries in a consistent, portable interface. It is needed by the
#                        test suites in other LFS packages. 
# 
#                          Linux Kernel 
# 
#                          This package is the Operating System. It is the Linux in the GNU/Linux environment.
#                        
# 
#                          M4 
# 
#                          This package contains a general text macro processor useful as a build tool for
#                        other programs. 
# 
#                          Make 
# 
#                          This package contains a program for directing the building of packages. It is required
#                        by almost every package in LFS. 
# 
#                          Man-DB 
# 
#                          This package contains programs for finding and viewing man pages. It was chosen
#                        instead of the manpackage due to superior internationalization capabilities. It
#                        supplies the man program. 
# 
#                          Man-pages 
# 
#                          This package contains the actual contents of the basic Linux man pages. 
# 
#                          Meson 
# 
#                          This package provides a software tool for automating the building of software. The
#                        main goal for Meson is to minimize the amount of time that software developers need
#                        to spend configuring their build system. 
# 
#                          MPC 
# 
#                          This package contains functions for the arithmetic of complex numbers. It is required
#                        by GCC. 
# 
#                          MPFR 
# 
#                          This package contains functions for multiple precision arithmetic. It is required
#                        by GCC. 
# 
#                          Ninja 
# 
#                          This package contains a small build system with a focus on speed. It is designed
#                        to have its input files generated by a higher-level build system, and to run builds
#                        as fast as possible. 
# 
#                          Ncurses 
# 
#                          This package contains libraries for terminal-independent handling of character screens.
#                        It is often used to provide cursor control for a menuing system. It is needed by
#                        a number of packages in LFS. 
# 
#                          Openssl 
# 
#                          This package provides management tools and libraries relating to cryptography. These
#                        are useful for providing cryptographic functions to other packages, including the
#                        Linux kernel. 
# 
#                          Patch 
# 
#                          This package contains a program for modifying or creating files by applying a  patch file
#                        typically created by the diffprogram. It is needed by the build procedure for several
#                        LFS packages. 
# 
#                          Perl 
# 
#                          This package is an interpreter for the runtime language PERL. It is needed for the
#                        installation and test suites of several LFS packages. 
# 
#                          Pkg-config 
# 
#                          This package provides a program that returns meta-data about an installed library
#                        or package. 
# 
#                          Procps-NG 
# 
#                          This package contains programs for monitoring processes. These programs are useful
#                        for system administration, and are also used by the LFS Bootscripts. 
# 
#                          Psmisc 
# 
#                          This package contains programs for displaying information about running processes.
#                        These programs are useful for system administration. 
# 
#                          Python 3 
# 
#                          This package provides an interpreted language that has a design philosophy that
#                        emphasizes code readability. 
# 
#                          Readline 
# 
#                          This package is a set of libraries that offers command-line editing and history
#                        capabilities. It is used by Bash. 
# 
#                          Sed 
# 
#                          This package allows editing of text without opening it in a text editor. It is also
#                        needed by most LFS packages' configure scripts. 
# 
#                          Shadow 
# 
#                          This package contains programs for handling passwords in a secure way. 
# 
#                          Sysklogd 
# 
#                          This package contains programs for logging system messages, such as those given
#                        by the kernel or daemon processes when unusual events occur. 
# 
#                          Sysvinit 
# 
#                          This package provides the initprogram, which is the parent of all other processes
#                        on the Linux system. 
# 
#                          Tar 
# 
#                          This package provides archiving and extraction capabilities of virtually all packages
#                        used in LFS. 
# 
#                          Tcl 
# 
#                          This package contains the Tool Command Language used in many test suites in LFS
#                        packages. 
# 
#                          Texinfo 
# 
#                          This package contains programs for reading, writing, and converting info pages.
#                        It is used in the installation procedures of many LFS packages. 
# 
#                          Util-linux 
# 
#                          This package contains miscellaneous utility programs. Among them are utilities for
#                        handling file systems, consoles, partitions, and messages. 
# 
#                          Vim 
# 
#                          This package contains an editor. It was chosen because of its compatibility with
#                        the classic vi editor and its huge number of powerful capabilities. An editor is
#                        a very personal choice for many users and any other editor could be substituted
#                        if desired. 
# 
#                          XML::Parser 
# 
#                          This package is a Perl module that interfaces with Expat. 
# 
#                          XZ Utils 
# 
#                          This package contains programs for compressing and decompressing files. It provides
#                        the highest compression generally available and is useful for decompressing packages
#                        in XZ or LZMA format. 
# 
#                          Zlib 
# 
#                          This package contains compression and decompression routines used by some programs.
#                        
# 
#                          Zstd 
# 
#                          This package contains compression and decompression routines used by some programs.
#                        It provide high compression ratios and a very wide range of compression / speed
#                        trade-offs.  
#        Typography  
# 
#                          To make things easier to follow, there are a few typographical conventions used
#                        throughout this book. This section contains some examples of the typographical format
#                        found throughout Linux From Scratch. 



# ./configure --prefix=/usr
# 


# 
#                          This form of text is designed to be typed exactly as seen unless otherwise noted
#                        in the surrounding text. It is also used in the explanation sections to identify
#                        which of the commands is being referenced. 
# 
#                          In some cases, a logical line is extended to two or more physical lines with a backslash
#                        at the end of the line. 



# CC="gcc -B/usr/bin/" ../binutils-2.18/configure \
#   --prefix=/tools --disable-nls --disable-werror
# 


# 
#                          Note that the backslash must be followed by an immediate return. Other whitespace
#                        characters like spaces or tab characters will create incorrect results. 



# install-info: unknown option '--dir-file=/mnt/lfs/usr/info/dir'
# 


# 
#                          This form of text (fixed-width text) shows screen output, usually as the result
#                        of commands issued. This format is also used to show filenames, such as /etc/ld.so.conf.
#                        
# 
#                          Emphasis  
# 
#                          This form of text is used for several purposes in the book. Its main purpose is
#                        to emphasize important points or items. 
# 
#                          http://www.linuxfromscratch.org/ 
# 
#                          This format is used for hyperlinks both within the LFS community and to external
#                        pages. It includes HOWTOs, download locations, and websites. 



# cat > $LFS/etc/group << "EOF"
# root:x:0:
# bin:x:1:
# ......
# EOF
# 


# 
#                          This format is used when creating configuration files. The first command tells the
#                        system to create the file $LFS/etc/groupfrom whatever is typed on the following
#                        lines until the sequence End Of File (EOF) is encountered. Therefore, this entire
#                        section is generally typed as seen. 
# 
#                          <REPLACED TEXT> 
# 
#                          This format is used to encapsulate text that is not to be typed as seen or for copy-and-paste
#                        operations. 
# 
#                          [OPTIONAL TEXT] 
# 
#                          This format is used to encapsulate text that is optional. 
# 
#                          passwd(5)
# 
#                          This format is used to refer to a specific manual (man) page. The number inside
#                        parentheses indicates a specific section inside the manuals. For example, passwd has
#                        two man pages. Per LFS installation instructions, those two man pages will be located
#                        at /usr/share/man/man1/passwd.1and /usr/share/man/man5/passwd.5. When the book uses
#                        passwd(5)it is specifically referring to /usr/share/man/man5/passwd.5.  man passwd will
#                        print the first man page it finds that matches "passwd", which will be /usr/share/man/man1/passwd.1.
#                        For this example, you will need to run  man 5 passwd in order to read the page being
#                        specified. Note that most man pages do not have duplicate page names in different
#                        sections. Therefore,  man <program name>  is generally sufficient.  
#        Structure  
# 
#                          This book is divided into the following parts. 
#          Part I - Introduction 
# 
#                          Part I explains a few important notes on how to proceed with the LFS installation.
#                        This section also provides meta-information about the book. 
#          Part II - Preparing for the Build 
# 
#                          Part II describes how to prepare for the building process;making a partition, downloading
#                        the packages, and compiling temporary tools. 
#          Part III - Building the LFS Cross Toolchain and Temporary Tools 
# 
#                          Part III provides instructions for building the tools needed for constructing the
#                        final LFS system. 
#          Part IV - Building the LFS System 
# 
#                          Part IV guides the reader through the building of the LFS system;compiling and installing
#                        all the packages one by one, setting up the boot scripts, and installing the kernel.
#                        The resulting Linux system is the foundation on which other software can be built
#                        to expand the system as desired. At the end of this book, there is an easy to use
#                        reference listing all of the programs, libraries, and important files that have
#                        been installed. 
#          Part V - Appendices 
# 
#                          Part V provides information about the book itself including acronyms and terms,
#                        acknowledgments, package dependencies, a listing of LFS boot scripts, licenses for
#                        the distribution of the book, and a comprehensive index of packages, programs, libraries,
#                        and scripts. 
#        Errata  
# 
#                          The software used to create an LFS system is constantly being updated and enhanced.
#                        Security warnings and bug fixes may become available after the LFS book has been
#                        released. To check whether the package versions or instructions in this release
#                        of LFS need any modifications to accommodate security vulnerabilities or other bug
#                        fixes, please visit http://www.linuxfromscratch.org/lfs/errata/10.1/before proceeding
#                        with your build. You should note any changes shown and apply them to the relevant
#                        section of the book as you progress with building the LFS system.  
#      Part I. Introduction  
#        Chapter 1. Introduction  
#        1.1. How to Build an LFS System  
# 
#                          The LFS system will be built by using an already installed Linux distribution (such
#                        as Debian, OpenMandriva, Fedora, or openSUSE). This existing Linux system (the host)
#                        will be used as a starting point to provide necessary programs, including a compiler,
#                        linker, and shell, to build the new system. Select the "development"option during
#                        the distribution installation to be able to access these tools. 
# 
#                          As an alternative to installing a separate distribution onto your machine, you may
#                        wish to use a LiveCD from a commercial distribution.  
# 
#                          Chapter 2of this book describes how to create a new Linux native partition and file
#                        system. This is the place where the new LFS system will be compiled and installed.
#                        Chapter 3explains which packages and patches need to be downloaded to build an LFS
#                        system and how to store them on the new file system. Chapter 4discusses the setup
#                        of an appropriate working environment. Please read Chapter 4carefully as it explains
#                        several important issues you need be aware of before beginning to work your way
#                        through Chapter 5and beyond.  
# 
#                          Chapter 5, explains the installation of the initial tool chain, (binutils, gcc,
#                        and glibc) using cross compilation techniques to isolate the new tools from the
#                        host system.  
# 
#                          Chapter 6shows you how to cross-compile basic utilities using the just built cross-toolchain.
#                         
# 
#                          Chapter 7then enters a "chroot" environment and uses the previously built tools
#                        to build the additional tools needed to build and test the final system.  
# 
#                          This effort to isolate the new system from the host distribution may seem excessive.
#                        A full technical explanation as to why this is done is provided in Toolchain Technical
#                        Notes.  
# 
#                          In Chapter 8, The full LFS system is built. Another advantage provided by the chroot
#                        environment is that it allows you to continue using the host system while LFS is
#                        being built. While waiting for package compilations to complete, you can continue
#                        using your computer as normal.  
# 
#                          To finish the installation, the basic system configuration is set up in Chapter
#                        9, and the kernel and boot loader are set up in Chapter 10. Chapter 11contains information
#                        on continuing the LFS experience beyond this book. After the steps in this book
#                        have been implemented, the computer will be ready to reboot into the new LFS system.
#                         
# 
#                          This is the process in a nutshell. Detailed information on each step is discussed
#                        in the following chapters and package descriptions. Items that may seem complicated
#                        will be clarified, and everything will fall into place as you embark on the LFS
#                        adventure. 
#        1.2. What's new since the last release  
# 
#                          In this version of LFS, there has been a major reorganization of the book using
#                        techniques that avoid changing the host system and provides a more straight forward
#                        build process. 
# 
#                          Below is a list of package updates made since the previous release of the book.
#                        
# 
#                          Upgraded to: 
# 
#                          Autoconf-2.71 
# 
#                          Automake-1.16.3 
# 
#                          Bash 5.1 
# 
#                          Bc 3.3.0 
# 
#                          Binutils-2.36.1 
# 
#                          Bison-3.7.5 
# 
#                          E2fsprogs-1.46.1 
# 
#                          Eudev-3.2.10 
# 
#                          Expat-2.2.10 
# 
#                          Findutils-4.8.0 
# 
#                          GDBM-1.19 
# 
#                          Glibc-2.33 
# 
#                          GMP-6.2.1 
# 
#                          Grep-3.6 
# 
#                          IANA-Etc-20210202 
# 
#                          Inetutils-2.0 
# 
#                          IPRoute2-5.10.0 
# 
#                          Kbd-2.4.0 
# 
#                          Kmod-28 
# 
#                          Less-563 
# 
#                          Libcap-2.48 
# 
#                          Libelf-0.183 (from elfutils) 
# 
#                          Linux-5.10.17 
# 
#                          Man-DB-2.9.4 
# 
#                          Man-pages-5.10 
# 
#                          Meson-0.57.1 
# 
#                          MPC-1.2.1 
# 
#                          Ninja-1.10.2 
# 
#                          Openssl-1.1.1j 
# 
#                          Perl-5.32.1 
# 
#                          Procps-ng-3.3.17 
# 
#                          Psmisc-23.4 
# 
#                          Python-3.9.2 
# 
#                          SysVinit-2.98 
# 
#                          Tar-1.34 
# 
#                          Tcl-8.6.11 
# 
#                          Tzdata-2021a 
# 
#                          Util-Linux-2.36.2 
# 
#                          Vim-8.2.2433 
# 
#                          Zstd-1.4.8 
# 
#                          Added: 
# 
#                          systemd-247-upstream_fixes-1.patch 
# 
#                          Removed: 
# 
#                          bash-5.0-upstream_fixes-1.patch 
#        1.3. Changelog  
# 
#                          This is version 10.1of the Linux From Scratch book, dated March 1st, 2021. If this
#                        book is more than six months old, a newer and better version is probably already
#                        available. To find out, please check one of the mirrors via http://www.linuxfromscratch.org/mirrors.html.
#                         
# 
#                          Below is a list of changes made since the previous release of the book.  
# 
#                          Changelog Entries: 
# 
#                          2021-03-01 
# 
#                          [bdubbs] - LFS-10.1 released. 
# 
#                          2021-02-20 
# 
#                          [bdubbs] - Update to meson-0.57.1. Fixes #4821.  
# 
#                          [bdubbs] - Update to Python-3.9.2. Fixes #4820.  
# 
#                          [pierre] - Fix grub to prevent generation of a huge binary blob for lzma compression.
#                        Reported on the lfs-support mailing list by Frans de Boer. 
# 
#                          2021-02-18 
# 
#                          [bdubbs] - Fix a glibc bug that causes issues with chrooted applications. Fixes
#                        #4817.  
# 
#                          [bdubbs] - Update to bc-3.3.0. Fixes #4819.  
# 
#                          [bdubbs] - Update to openssl-1.1.1j. Fixes #4816.  
# 
#                          [bdubbs] - Update to meson-0.57.0. Fixes #4815.  
# 
#                          [bdubbs] - Update to linux-5.10.17. Fixes #4807.  
# 
#                          2021-02-14 
# 
#                          [renodr] - Add a command explanation for 'pwait'. 
# 
#                          [bdubbs] - Update to util-linux-2.36.2. Fixes #4812.  
# 
#                          [bdubbs] - Update to tar-1.34. Fixes #4813.  
# 
#                          [bdubbs] - Update to psmisc-23.4. Fixes #4805.  
# 
#                          [bdubbs] - Update to procps-ng-3.3.17. Fixes #4811.  
# 
#                          [bdubbs] - Update to man-db-2.9.4. Fixes #4808.  
# 
#                          [bdubbs] - Update to eudev-3.2.10. Fixes #4810.  
# 
#                          [bdubbs] - Update to elfutils-0.183. Fixes #4806.  
# 
#                          [bdubbs] - Update to e2fsprogs-1.46.1. Fixes #4809.  
# 
#                          [bdubbs] - Update to bc-3.2.7. Fixes #4814.  
# 
#                          2021-02-01 
# 
#                          [bdubbs] - Update to iana-etc-20210202. Addresses #4722.  
# 
#                          [bdubbs] - Update to inetutils-2.0. Fixes #4803.  
# 
#                          [bdubbs] - Update to libcap-2.48. Fixes #4802.  
# 
#                          [bdubbs] - Update to binutils-2.36.1. Fixes #4804.  
# 
#                          [bdubbs] - Update to linux-5.10.13. Fixes #4801.  
# 
#                          2021-02-02 
# 
#                          [pierre] - Move tcl, expect, and dejagnu just before binutils in chapter 8: this
#                        allows to build them against chapter 8 glibc. 
# 
#                          [pierre] - To allow building with newer version of glibc than the host distribution,
#                        build a "file" executable for the host before cross-compiling it. 
# 
#                          [pierre] - Replace the relinked libctf (which may incorrectly link against libz
#                        from the host distribution) with the one that was linked during "make" in binutils-pass2.
#                        Thanks to Xi Ruoyao for the fix. 
# 
#                          [bdubbs] - Update to bc-3.2.6. Fixes #4800.  
# 
#                          [bdubbs] - Update to glibc-2.33. Fixes #4799.  
# 
#                          [bdubbs] - Minor change to mountfs boot script. Fixes #4798.  
# 
#                          2021-02-01 
# 
#                          [bdubbs] - Update to vim-8.2.2433. Addresses #4500.  
# 
#                          [bdubbs] - Update to iana-etc-20210115. Addresses #4722.  
# 
#                          [bdubbs] - Update to bc-3.2.5. Fixes #4797.  
# 
#                          [bdubbs] - Update to e2fsprogs-1.46.0. Fixes #4796.  
# 
#                          [bdubbs] - Update to autoconf-2.71. Fixes #4795.  
# 
#                          [bdubbs] - Update to tzdata-2021a. Fixes #4793.  
# 
#                          [bdubbs] - Update to perl-5.32.1. Fixes #4792.  
# 
#                          [bdubbs] - Update to libcap-2.47. Fixes #4791.  
# 
#                          [bdubbs] - Update to bison-3.7.5. Fixes #4790.  
# 
#                          [bdubbs] - Update to binutils-2.36. Fixes #4789.  
# 
#                          [bdubbs] - Update to linux-5.10.12. Fixes #4786.  
# 
#                          2020-01-16 
# 
#                          [renodr] - Update to findutils-4.8.0. Fixes #4785.  
# 
#                          [renodr] - Update to kmod-28. Fixes #4784.  
# 
#                          [renodr] - Update to tar-1.33. Fixes #4783.  
# 
#                          [renodr] - Update to linux-5.10.7. Fixes #4782.  
# 
#                          [renodr] - Update to meson-0.56.2. Fixes #4781.  
# 
#                          [renodr] - Update to tcl-8.6.11. Fixes #4780.  
# 
#                          2021-01-13 
# 
#                          [xry111] - Fix util-linux uuidd socket path. 
# 
#                          [xry111] - Remove various references to deprecated /var/run, use /run instead. 
# 
#                          [xry111] - Update to lfs-bootscripts-20210113. 
# 
#                          2021-01-01 
# 
#                          [bdubbs] - Update to vim-8.2.2253. Addresses #4500.  
# 
#                          [bdubbs] - Update to iana-etc-20201229. Addresses #4722.  
# 
#                          [bdubbs] - Update to gdbm-1.19. Fixes #4779.  
# 
#                          [bdubbs] - Update to tzdata-2020f. Fixes #4777.  
# 
#                          [bdubbs] - Update to man-pages-5.10. Fixes #4776.  
# 
#                          [bdubbs] - Update to iproute2-5.10.0. Fixes #4775.  
# 
#                          [bdubbs] - Update to zstd-1.4.8. Fixes #4774.  
# 
#                          [bdubbs] - Update to kbd-2.4.0. Fixes #4773.  
# 
#                          [bdubbs] - Update to linux-5.10.4. Fixes #4772.  
# 
#                          2020-12-15 
# 
#                          [bdubbs] - Update to libcap-2.46. Fixes #4771.  
# 
#                          [bdubbs] - Update to bc-3.2.4. Fixes #4770.  
# 
#                          [bdubbs] - Update to autoconf-2.70. Fixes #4769.  
# 
#                          [bdubbs] - Update to openssl-1.1.1i. Fixes #4768.  
# 
#                          [bdubbs] - Update to Python3-3.9.1. Fixes #4767.  
# 
#                          [bdubbs] - Update to linux-5.9.14. Fixes #4766.  
# 
#                          [bdubbs] - Update to bash-5.1 and readline-8.1. Fixes #4764.  
# 
#                          2020-12-07 
# 
#                          [ken] - Patch meson-0.56.0 to correctly create pkgconfig files re static libraries
#                        (re sysprof in BLFS) . Fixes #4675.  
# 
#                          2020-12-03 
# 
#                          [renodr] - Update to linux-5.9.12. Fixes #4673.  
# 
#                          [renodr] - Update to bc-3.2.3. Fixes #4672.  
# 
#                          2020-12-01 
# 
#                          [bdubbs] - Update to ninja-1.10.2. Fixes #4760.  
# 
#                          [bdubbs] - Update to bc-3.2.1. Fixes #4759.  
# 
#                          [bdubbs] - Update to linux-5.9.11. Fixes #4758.  
# 
#                          [bdubbs] - Update to automake-1.16.3. Fixes #4757.  
# 
#                          [bdubbs] - Update to sysvinit-2.98. Fixes #4756.  
# 
#                          [bdubbs] - Update to util-linux-2.36.1. Fixes #4755.  
# 
#                          [bdubbs] - Update to iana-etc-20201124. Addresses #4722.  
# 
#                          [bdubbs] - Update to vim-8.2.2070. Addresses #4500.  
# 
#                          2020-11-15 
# 
#                          [bdubbs] - Update to gmp-6.2.1. Fixes #4754.  
# 
#                          [bdubbs] - Update to iana-etc-20201110. Addresses #4722.  
# 
#                          [bdubbs] - Update to man-pages-5.09. Fixes #4750.  
# 
#                          [bdubbs] - Update to linux-5.9.8. Fixes #4749.  
# 
#                          [bdubbs] - Update to libcap-2.45. Fixes #4751.  
# 
#                          [bdubbs] - Update to grep-3.6. Fixes #4752.  
# 
#                          [bdubbs] - Update to bison-3.7.4. Fixes #4753.  
# 
#                          2020-11-01 
# 
#                          [bdubbs] - Update to elfutils-0.182. Fixes #4748.  
# 
#                          [bdubbs] - Update to meson-0.56.0. Fixes #4747.  
# 
#                          [bdubbs] - Update to linux-5.9.2. Fixes #4746.  
# 
#                          [bdubbs] - Update to mpc-1.2.1. Fixes #4744.  
# 
#                          [bdubbs] - Update to less-563. Fixes #4743.  
# 
#                          [bdubbs] - Update to tzdata-2020d. Fixes #4742.  
# 
#                          2020-10-19 
# 
#                          [dj] - Update to lfs-bootscripts-20201019. 
# 
#                          2020-10-20 
# 
#                          [bdubbs] - Update to iproute2-5.9.0. Fixes #4739.  
# 
#                          [bdubbs] - Update to tzdata-2020c. Fixes #4741.  
# 
#                          [bdubbs] - Update to linux-5.9.1. Fixes #4740.  
# 
#                          2020-10-15 
# 
#                          [bdubbs] - Update to iana-etc-20201012. Addresses #4722.  
# 
#                          [bdubbs] - Update to vim-8.2.1845. Addresses #4500.  
# 
#                          [bdubbs] - Update to bison-3.7.3. Fixes #4738.  
# 
#                          [bdubbs] - Update to tzdata-2020b. Fixes #4737.  
# 
#                          [bdubbs] - Update to libcap-2.44. Fixes #4735.  
# 
#                          [bdubbs] - Update to Python-3.9. Fixes #4736.  
# 
#                          [bdubbs] - Update to expat-2.2.10. Fixes #4734.  
# 
#                          [bdubbs] - Update to bc-3.1.6. Fixes #4732.  
# 
#                          [bdubbs] - Update to linux-5.9. Fixes #4733.  
# 
#                          2020-10-01 
# 
#                          [bdubbs] - Update to grep-3.5. Fixes #4731.  
# 
#                          [bdubbs] - Update to Python-3.8.6. Fixes #4730.  
# 
#                          [bdubbs] - Update to openssl-1.1.1h. Fixes #4729.  
# 
#                          [bdubbs] - Update to binutils-2.35.1. Fixes #4728.  
# 
#                          [bdubbs] - Update to linux-5.8.12. Fixes #4727.  
# 
#                          2020-09-27 
# 
#                          [bdubbs] - Add autoconf-2.69-consolidated_fixes-1.patch which allows autoconf tests
#                        to pass. 
# 
#                          2020-09-15 
# 
#                          [bdubbs] - Update to linux-5.8.9. Fixes #4723.  
# 
#                          [bdubbs] - Update to bison-3.7.2. Fixes #4724.  
# 
#                          [bdubbs] - Update to elfutils-0.181. Fixes #4725.  
# 
#                          [bdubbs] - Update to meson-0.55.3. Fixes #4726.  
# 
#                          2020-09-02 
# 
#                          [bdubbs] - Update to linux-5.8.5. Fixes #4721.  
# 
#                          [bdubbs] - Update to ninja-1.10.1. Fixes #4719.  
# 
#                          [bdubbs] - Update to mpc-1.2.0. Fixes #4717.  
# 
#                          [bdubbs] - Update to meson-0.55.1. Fixes #4716.  
# 
#                          [bdubbs] - Update to libcap-2.43. Fixes #4715.  
# 
#                          2020-09-01 
# 
#                          [bdubbs] - LFS-10.0 released. 
#        1.4. Resources  
#          1.4.1. FAQ  
# 
#                          If during the building of the LFS system you encounter any errors, have any questions,
#                        or think there is a typo in the book, please start by consulting the Frequently
#                        Asked Questions (FAQ) that is located at http://www.linuxfromscratch.org/faq/.  
#          1.4.2. Mailing Lists  
# 
#                          The linuxfromscratch.orgserver hosts a number of mailing lists used for the development
#                        of the LFS project. These lists include the main development and support lists,
#                        among others. If the FAQ does not solve the problem you are having, the next step
#                        would be to search the mailing lists at http://www.linuxfromscratch.org/search.html.
#                         
# 
#                          For information on the different lists, how to subscribe, archive locations, and
#                        additional information, visit http://www.linuxfromscratch.org/mail.html.  
#          1.4.3. IRC  
# 
#                          Several members of the LFS community offer assistance on Internet Relay Chat (IRC).
#                        Before using this support, please make sure that your question is not already answered
#                        in the LFS FAQ or the mailing list archives. You can find the IRC network at irc.freenode.net.
#                        The support channel is named #LFS-support. 
#          1.4.4. Mirror Sites  
# 
#                          The LFS project has a number of world-wide mirrors to make accessing the website
#                        and downloading the required packages more convenient. Please visit the LFS website
#                        at http://www.linuxfromscratch.org/mirrors.htmlfor a list of current mirrors.  
#          1.4.5. Contact Information  
# 
#                          Please direct all your questions and comments to one of the LFS mailing lists (see
#                        above). 
#        1.5. Help  
# 
#                          If an issue or a question is encountered while working through this book, please
#                        check the FAQ page at http://www.linuxfromscratch.org/faq/#generalfaq. Questions
#                        are often already answered there. If your question is not answered on this page,
#                        try to find the source of the problem. The following hint will give you some guidance
#                        for troubleshooting: http://www.linuxfromscratch.org/hints/downloads/files/errors.txt.
#                         
# 
#                          If you cannot find your problem listed in the FAQ, search the mailing lists at http://www.linuxfromscratch.org/search.html.
#                         
# 
#                          We also have a wonderful LFS community that is willing to offer assistance through
#                        the mailing lists and IRC (see the Section 1.4, "Resources"section of this book).
#                        However, we get several support questions every day and many of them can be easily
#                        answered by going to the FAQ and by searching the mailing lists first. So, for us
#                        to offer the best assistance possible, you need to do some research on your own
#                        first. That allows us to focus on the more unusual support needs. If your searches
#                        do not produce a solution, please include all relevant information (mentioned below)
#                        in your request for help.  
#          1.5.1. Things to Mention 
# 
#                          Apart from a brief explanation of the problem being experienced, the essential things
#                        to include in any request for help are: 
# 
#                          The version of the book being used (in this case 10.1) 
# 
#                          The host distribution and version being used to create LFS 
# 
#                          The output from the Host System Requirementsscript  
# 
#                          The package or section the problem was encountered in 
# 
#                          The exact error message or symptom being received 
# 
#                          Note whether you have deviated from the book at all 
#          Note 
# 
#                          Deviating from this book does  not mean that we will not help you. After all, LFS
#                        is about personal preference. Being upfront about any changes to the established
#                        procedure helps us evaluate and determine possible causes of your problem. 
#          1.5.2. Configure Script Problems 
# 
#                          If something goes wrong while running the  configure script, review the config.logfile.
#                        This file may contain errors encountered during  configure which were not printed
#                        to the screen. Include the  relevant lines if you need to ask for help. 
#          1.5.3. Compilation Problems 
# 
#                          Both the screen output and the contents of various files are useful in determining
#                        the cause of compilation problems. The screen output from the  configure script and
#                        the  make run can be helpful. It is not necessary to include the entire output, but
#                        do include enough of the relevant information. Below is an example of the type of
#                        information to include from the screen output from  make : 



# gcc -DALIASPATH=\"/mnt/lfs/usr/share/locale:.\"
# -DLOCALEDIR=\"/mnt/lfs/usr/share/locale\"
# -DLIBDIR=\"/mnt/lfs/usr/lib\"
# -DINCLUDEDIR=\"/mnt/lfs/usr/include\" -DHAVE_CONFIG_H -I. -I.
# -g -O2 -c getopt1.c
# gcc -g -O2 -static -o make ar.o arscan.o commands.o dir.o
# expand.o file.o function.o getopt.o implicit.o job.o main.o
# misc.o read.o remake.o rule.o signame.o variable.o vpath.o
# default.o remote-stub.o version.o opt1.o
# -lutil job.o: In function `load_too_high':
# /lfs/tmp/make-3.79.1/job.c:1565: undefined reference
# to `getloadavg'
# collect2: ld returned 1 exit status
# make[2]: *** [make] Error 1
# make[2]: Leaving directory `/lfs/tmp/make-3.79.1'
# make[1]: *** [all-recursive] Error 1
# make[1]: Leaving directory `/lfs/tmp/make-3.79.1'
# make: *** [all-recursive-am] Error 2
# 


# 
#                          In this case, many people would just include the bottom section: 



# make [2]: *** [make] Error 1
# 


# 
#                          This is not enough information to properly diagnose the problem because it only
#                        notes that something went wrong, not  what went wrong. The entire section, as in the
#                        example above, is what should be saved because it includes the command that was
#                        executed and the associated error message(s). 
# 
#                          An excellent article about asking for help on the Internet is available online at
#                        http://catb.org/~esr/faqs/smart-questions.html. Read and follow the hints in this
#                        document to increase the likelihood of getting the help you need.   
#      Part II. Preparing for the Build  
#        Chapter 2. Preparing the Host System  
#        2.1. Introduction  
# 
#                          In this chapter, the host tools needed for building LFS are checked and, if necessary,
#                        installed. Then a partition which will host the LFS system is prepared. We will
#                        create the partition itself, create a file system on it, and mount it. 
#        2.2. Host System Requirements  
# 
#                          Your host system should have the following software with the minimum versions indicated.
#                        This should not be an issue for most modern Linux distributions. Also note that
#                        many distributions will place software headers into separate packages, often in
#                        the form of "<package-name>-devel"or "<package-name>-dev". Be sure to install those
#                        if your distribution provides them. 
# 
#                          Earlier versions of the listed software packages may work, but have not been tested.
#                         
# 
#                          Bash-3.2 (/bin/sh should be a symbolic or hard link to bash)  
# 
#                          Binutils-2.25 (Versions greater than 2.36.1 are not recommended as they have not
#                        been tested)  
# 
#                          Bison-2.7 (/usr/bin/yacc should be a link to bison or small script that executes
#                        bison)  
# 
#                          Bzip2-1.0.4  
# 
#                          Coreutils-6.9  
# 
#                          Diffutils-2.8.1  
# 
#                          Findutils-4.2.31  
# 
#                          Gawk-4.0.1 (/usr/bin/awk should be a link to gawk)  
# 
#                          GCC-6.2 including the C++ compiler,  g++ (Versions greater than 10.2.0 are not recommended
#                        as they have not been tested)  
# 
#                          Glibc-2.11 (Versions greater than 2.33 are not recommended as they have not been
#                        tested)  
# 
#                          Grep-2.5.1a  
# 
#                          Gzip-1.3.12  
# 
#                          Linux Kernel-3.2  
# 
#                          The reason for the kernel version requirement is that we specify that version when
#                        building glibcin Chapter 6 at the recommendation of the developers. It is also required
#                        by udev. 
# 
#                          If the host kernel is earlier than 3.2 you will need to replace the kernel with
#                        a more up to date version. There are two ways you can go about this. First, see
#                        if your Linux vendor provides a 3.2 or later kernel package. If so, you may wish
#                        to install it. If your vendor doesn't offer an acceptable kernel package, or you
#                        would prefer not to install it, you can compile a kernel yourself. Instructions
#                        for compiling the kernel and configuring the boot loader (assuming the host uses
#                        GRUB) are located in Chapter 10.   
# 
#                          M4-1.4.10  
# 
#                          Make-4.0  
# 
#                          Patch-2.5.4  
# 
#                          Perl-5.8.8  
# 
#                          Python-3.4  
# 
#                          Sed-4.1.5  
# 
#                          Tar-1.22  
# 
#                          Texinfo-4.7  
# 
#                          Xz-5.0.0  
#          Important 
# 
#                          Note that the symlinks mentioned above are required to build an LFS system using
#                        the instructions contained within this book. Symlinks that point to other software
#                        (such as dash, mawk, etc.) may work, but are not tested or supported by the LFS
#                        development team, and may require either deviation from the instructions or additional
#                        patches to some packages.  
# 
#                          
# To see whether your host system has all the appropriate versions, and the ability
#                        to compile programs, run the following: 



cat > version-check.sh << "EOF"
#!/bin/bash
# Simple script to list version numbers of critical development tools
export LC_ALL=C
bash --version | head -n1 | cut -d" " -f2-4
MYSH=$(readlink -f /bin/sh)
echo "/bin/sh -> $MYSH"
echo $MYSH | grep -q bash || echo "ERROR: /bin/sh does not point to bash"
unset MYSH

echo -n "Binutils: "; ld --version | head -n1 | cut -d" " -f3-
bison --version | head -n1

if [ -h /usr/bin/yacc ]; then
  echo "/usr/bin/yacc -> `readlink -f /usr/bin/yacc`";
elif [ -x /usr/bin/yacc ]; then
  echo yacc is `/usr/bin/yacc --version | head -n1`
else
  echo "yacc not found" 
fi

bzip2 --version 2>&1 < /dev/null | head -n1 | cut -d" " -f1,6-
echo -n "Coreutils: "; chown --version | head -n1 | cut -d")" -f2
diff --version | head -n1
find --version | head -n1
gawk --version | head -n1

if [ -h /usr/bin/awk ]; then
  echo "/usr/bin/awk -> `readlink -f /usr/bin/awk`";
elif [ -x /usr/bin/awk ]; then
  echo awk is `/usr/bin/awk --version | head -n1`
else 
  echo "awk not found" 
fi

gcc --version | head -n1
g++ --version | head -n1
ldd --version | head -n1 | cut -d" " -f2-  # glibc version
grep --version | head -n1
gzip --version | head -n1
cat /proc/version
m4 --version | head -n1
make --version | head -n1
patch --version | head -n1
echo Perl `perl -V:version`
python3 --version
sed --version | head -n1
tar --version | head -n1
makeinfo --version | head -n1  # texinfo version
xz --version | head -n1

echo 'int main(){}' > dummy.c && g++ -o dummy dummy.c
if [ -x dummy ]
  then echo "g++ compilation OK";
  else echo "g++ compilation failed"; fi
rm -f dummy.c dummy
EOF

bash version-check.sh



#        2.3. Building LFS in Stages  
# 
#                          LFS is designed to be built in one session. That is, the instructions assume that
#                        the system will not be shut down during the process. That does not mean that the
#                        system has to be done in one sitting. The issue is that certain procedures have
#                        to be re-accomplished after a reboot if resuming LFS at different points. 
#          2.3.1. Chapters 1-4 
# 
#                          These chapters are accomplished on the host system. When restarting, be careful
#                        of the following: 
# 
#                          Procedures done as the rootuser after Section 2.4 need to have the LFS environment
#                        variable set FOR THE ROOT USER . 
#          2.3.2. Chapter 5-6 
# 
#                          The /mnt/lfs partition must be mounted. 
# 
#                          These two chapters  must be done as user lfs. A  su - lfs needs to be done before any
#                        task in these chapters. Failing to do that, you are at risk of installing packages
#                        to the host, and potentially rendering it unusable. 
# 
#                          The procedures in General Compilation Instructionsare critical. If there is any
#                        doubt about installing a package, ensure any previously expanded tarballs are removed,
#                        then re-extract the package files, and complete all instructions in that section.
#                         
#          2.3.3. Chapter 7-10 
# 
#                          The /mnt/lfs partition must be mounted. 
# 
#                          A few operations, from "Changing Ownership"to "Entering the Chroot Environment"must
#                        be done as the rootuser, with the LFS environment variable set for the rootuser.
#                        
# 
#                          When entering chroot, the LFS environment variable must be set for root. The LFS
#                        variable is not used afterwards. 
# 
#                          The virtual file systems must be mounted. This can be done before or after entering
#                        chroot by changing to a host virtual terminal and, as root, running the commands
#                        in Section 7.3.2, "Mounting and Populating /dev"and Section 7.3.3, "Mounting Virtual
#                        Kernel File Systems".   
#        2.4. Creating a New Partition  
# 
#                          Like most other operating systems, LFS is usually installed on a dedicated partition.
#                        The recommended approach to building an LFS system is to use an available empty
#                        partition or, if you have enough unpartitioned space, to create one. 
# 
#                          A minimal system requires a partition of around 10 gigabytes (GB). This is enough
#                        to store all the source tarballs and compile the packages. However, if the LFS system
#                        is intended to be the primary Linux system, additional software will probably be
#                        installed which will require additional space. A 30 GB partition is a reasonable
#                        size to provide for growth. The LFS system itself will not take up this much room.
#                        A large portion of this requirement is to provide sufficient free temporary storage
#                        as well as for adding additional capabilities after LFS is complete. Additionally,
#                        compiling packages can require a lot of disk space which will be reclaimed after
#                        the package is installed. 
# 
#                          Because there is not always enough Random Access Memory (RAM) available for compilation
#                        processes, it is a good idea to use a small disk partition as swapspace. This is
#                        used by the kernel to store seldom-used data and leave more memory available for
#                        active processes. The swappartition for an LFS system can be the same as the one
#                        used by the host system, in which case it is not necessary to create another one.
#                        
# 
#                          Start a disk partitioning program such as cfdisk or  fdisk with a command line option
#                        naming the hard disk on which the new partition will be created;for example /dev/sdafor
#                        the primary disk drive. Create a Linux native partition and a swappartition, if
#                        needed. Please refer to cfdisk(8)or fdisk(8)if you do not yet know how to use the
#                        programs. 
#          Note 
# 
#                          For experienced users, other partitioning schemes are possible. The new LFS system
#                        can be on a software RAIDarray or an LVMlogical volume. However, some of these options
#                        require an initramfs, which is an advanced topic. These partitioning methodologies
#                        are not recommended for first time LFS users.  
# 
#                          Remember the designation of the new partition (e.g., sda5). This book will refer
#                        to this as the LFS partition. Also remember the designation of the swappartition.
#                        These names will be needed later for the /etc/fstabfile. 
#          2.4.1. Other Partition Issues 
# 
#                          Requests for advice on system partitioning are often posted on the LFS mailing lists.
#                        This is a highly subjective topic. The default for most distributions is to use
#                        the entire drive with the exception of one small swap partition. This is not optimal
#                        for LFS for several reasons. It reduces flexibility, makes sharing of data across
#                        multiple distributions or LFS builds more difficult, makes backups more time consuming,
#                        and can waste disk space through inefficient allocation of file system structures.
#                         
#            2.4.1.1. The Root Partition  
# 
#                          A root LFS partition (not to be confused with the /rootdirectory) of twenty gigabytes
#                        is a good compromise for most systems. It provides enough space to build LFS and
#                        most of BLFS, but is small enough so that multiple partitions can be easily created
#                        for experimentation. 
#            2.4.1.2. The Swap Partition  
# 
#                          Most distributions automatically create a swap partition. Generally the recommended
#                        size of the swap partition is about twice the amount of physical RAM, however this
#                        is rarely needed. If disk space is limited, hold the swap partition to two gigabytes
#                        and monitor the amount of disk swapping. 
# 
#                          If you want to use the hibernation feature (suspend-to-disk) of Linux, it writes
#                        out the contents of RAM to the swap partition before turning off the machine. In
#                        this case the size of the swap partition should be at least as large as the system's
#                        installed RAM. 
# 
#                          Swapping is never good. For mechanical hard drives you can generally tell if a system
#                        is swapping by just listening to disk activity and observing how the system reacts
#                        to commands. For an SSD drive you will not be able to hear swapping but you can
#                        tell how much swap space is being used by the top or  free programs. Use of an SSD
#                        drive for a swap partition should be avoided if possible. The first reaction to
#                        swapping should be to check for an unreasonable command such as trying to edit a
#                        five gigabyte file. If swapping becomes a normal occurrence, the best solution is
#                        to purchase more RAM for your system.  
#            2.4.1.3. The Grub Bios Partition  
# 
#                          If the boot disk has been partitioned with a GUID Partition Table (GPT), then a small,
#                        typically 1 MB, partition must be created if it does not already exist. This partition
#                        is not formatted, but must be available for GRUB to use during installation of the
#                        boot loader. This partition will normally be labeled 'BIOS Boot' if using  fdisk or
#                        have a code of  EF02 if using  gdisk . 
#          Note 
# 
#                          The Grub Bios partition must be on the drive that the BIOS uses to boot the system.
#                        This is not necessarily the same drive where the LFS root partition is located.
#                        Disks on a system may use different partition table types. The requirement for this
#                        partition depends only on the partition table type of the boot disk.  
#            2.4.1.4. Convenience Partitions  
# 
#                          There are several other partitions that are not required, but should be considered
#                        when designing a disk layout. The following list is not comprehensive, but is meant
#                        as a guide. 
# 
#                          /boot - Highly recommended. Use this partition to store kernels and other booting
#                        information. To minimize potential boot problems with larger disks, make this the
#                        first physical partition on your first disk drive. A partition size of 200 megabytes
#                        is quite adequate. 
# 
#                          /home - Highly recommended. Share your home directory and user customization across
#                        multiple distributions or LFS builds. The size is generally fairly large and depends
#                        on available disk space. 
# 
#                          /usr - A separate /usr partition is generally used if providing a server for a thin
#                        client or diskless workstation. It is normally not needed for LFS. A size of ten
#                        gigabytes will handle most installations. 
# 
#                          /opt - This directory is most useful for BLFS where multiple installations of large
#                        packages like Gnome or KDE can be installed without embedding the files in the /usr
#                        hierarchy. If used, 5 to 10 gigabytes is generally adequate. 
# 
#                          /tmp - A separate /tmp directory is rare, but useful if configuring a thin client.
#                        This partition, if used, will usually not need to exceed a couple of gigabytes.
#                        
# 
#                          /usr/src - This partition is very useful for providing a location to store BLFS
#                        source files and share them across LFS builds. It can also be used as a location
#                        for building BLFS packages. A reasonably large partition of 30-50 gigabytes allows
#                        plenty of room. 
# 
#                          Any separate partition that you want automatically mounted upon boot needs to be
#                        specified in the /etc/fstab. Details about how to specify partitions will be discussed
#                        in Section 10.2, "Creating the /etc/fstab File".  
#        2.5. Creating a File System on the Partition  
# 
#                          Now that a blank partition has been set up, the file system can be created. LFS
#                        can use any file system recognized by the Linux kernel, but the most common types
#                        are ext3 and ext4. The choice of file system can be complex and depends on the characteristics
#                        of the files and the size of the partition. For example: 
# 
#                ext2
# 
#                          is suitable for small partitions that are updated infrequently such as /boot. 
# 
#                ext3
# 
#                          is an upgrade to ext2 that includes a journal to help recover the partition's status
#                        in the case of an unclean shutdown. It is commonly used as a general purpose file
#                        system. 
# 
#                ext4
# 
#                          is the latest version of the ext file system family of partition types. It provides
#                        several new capabilities including nano-second timestamps, creation and use of very
#                        large files (16 TB), and speed improvements. 
# 
#                          Other file systems, including FAT32, NTFS, ReiserFS, JFS, and XFS are useful for
#                        specialized purposes. More information about these file systems can be found at
#                        http://en.wikipedia.org/wiki/Comparison_of_file_systems.  
# 
#                          LFS assumes that the root file system (/) is of type ext4. To create an ext4file
#                        system on the LFS partition, run the following: 



# mkfs -v -t ext4 /dev/<xxx>
# 

 
# 
#                          Replace  <xxx>with the name of the LFS partition.  
# 
#                          If you are using an existing swappartition, there is no need to format it. If a
#                        new swappartition was created, it will need to be initialized with this command:
#                        



# mkswap /dev/<yyy>
# 

 
# 
#                          Replace <yyy>with the name of the swappartition.  
#        2.6. Setting The $LFS Variable  
# 
#                          Throughout this book, the environment variable LFSwill be used several times. You
#                        should ensure that this variable is always defined throughout the LFS build process.
#                        It should be set to the name of the directory where you will be building your LFS
#                        system - we will use /mnt/lfsas an example, but the directory choice is up to you.
#                        If you are building LFS on a separate partition, this directory will be the mount
#                        point for the partition. Choose a directory location and set the variable with the
#                        following command: 



# export LFS=/mnt/lfs
# 

 
# 
#                          Having this variable set is beneficial in that commands such as mkdir -v $LFS/tools can
#                        be typed literally. The shell will automatically replace "$LFS"with "/mnt/lfs"(or
#                        whatever the variable was set to) when it processes the command line. 
#          Caution 
# 
#                          Do not forget to check that LFSis set whenever you leave and reenter the current
#                        working environment (such as when doing a  su to rootor another user). Check that
#                        the LFSvariable is set up properly with: 



# echo $LFS
# 


# 
#                          Make sure the output shows the path to your LFS system's build location, which is
#                        /mnt/lfsif the provided example was followed. If the output is incorrect, use the
#                        command given earlier on this page to set $LFSto the correct directory name. 
#          Note 
# 
#                          One way to ensure that the LFSvariable is always set is to edit the .bash_profilefile
#                        in both your personal home directory and in /root/.bash_profileand enter the export
#                        command above. In addition, the shell specified in the /etc/passwdfile for all users
#                        that need the LFSvariable needs to be bash to ensure that the /root/.bash_profilefile
#                        is incorporated as a part of the login process. 
# 
#                          Another consideration is the method that is used to log into the host system. If
#                        logging in through a graphical display manager, the user's .bash_profileis not normally
#                        used when a virtual terminal is started. In this case, add the export command to
#                        the .bashrcfile for the user and root. In addition, some distributions have instructions
#                        to not run the .bashrcinstructions in a non-interactive bash invocation. Be sure
#                        to add the export command before the test for non-interactive use.  
#        2.7. Mounting the New Partition  
# 
#                          Now that a file system has been created, the partition needs to be made accessible.
#                        In order to do this, the partition needs to be mounted at a chosen mount point.
#                        For the purposes of this book, it is assumed that the file system is mounted under
#                        the directory specified by the LFSenvironment variable as described in the previous
#                        section. 
# 
#                          Create the mount point and mount the LFS file system by running: 



# mkdir -pv $LFS
# mount -v -t ext4 /dev/<xxx> $LFS
# 

 
# 
#                          Replace <xxx>with the designation of the LFS partition.  
# 
#                          If using multiple partitions for LFS (e.g., one for /and another for /usr), mount
#                        them using: 



# mkdir -pv $LFS
# mount -v -t ext4 /dev/<xxx> $LFS
# mkdir -v $LFS/usr
# mount -v -t ext4 /dev/<yyy> $LFS/usr
# 

 
# 
#                          Replace <xxx>and  <yyy>with the appropriate partition names.  
# 
#                          Ensure that this new partition is not mounted with permissions that are too restrictive
#                        (such as the nosuidor nodevoptions). Run the mount command without any parameters
#                        to see what options are set for the mounted LFS partition. If nosuidand/or nodevare
#                        set, the partition will need to be remounted. 
#          Warning 
# 
#                          The above instructions assume that you will not be restarting your computer throughout
#                        the LFS process. If you shut down your system, you will either need to remount the
#                        LFS partition each time you restart the build process or modify your host system's
#                        /etc/fstab file to automatically remount it upon boot. For example: 



# /dev/<xxx>  /mnt/lfs ext4   defaults      1     1
# 

 
# 
#                          If you use additional optional partitions, be sure to add them also. 
# 
#                          If you are using a swappartition, ensure that it is enabled using the  swapon command:
#                        



# /sbin/swapon -v /dev/<zzz>
# 

 
# 
#                          Replace  <zzz>with the name of the swappartition.  
# 
#                          Now that there is an established place to work, it is time to download the packages.
#                        
#        Chapter 3. Packages and Patches  
#        3.1. Introduction  
# 
#                          This chapter includes a list of packages that need to be downloaded in order to
#                        build a basic Linux system. The listed version numbers correspond to versions of
#                        the software that are known to work, and this book is based on their use. We highly
#                        recommend against using newer versions because the build commands for one version
#                        may not work with a newer version. The newest package versions may also have problems
#                        that require work-arounds. These work-arounds will be developed and stabilized in
#                        the development version of the book. 
# 
#                          Download locations may not always be accessible. If a download location has changed
#                        since this book was published, Google (http://www.google.com/) provides a useful
#                        search engine for most packages. If this search is unsuccessful, try one of the
#                        alternative means of downloading discussed at http://www.linuxfromscratch.org/lfs/packages.html#packages.
#                         
# 
#                          Downloaded packages and patches will need to be stored somewhere that is conveniently
#                        available throughout the entire build. A working directory is also required to unpack
#                        the sources and build them. $LFS/sourcescan be used both as the place to store the
#                        tarballs and patches and as a working directory. By using this directory, the required
#                        elements will be located on the LFS partition and will be available during all stages
#                        of the building process. 
# 
#                          To create this directory, execute the following command, as user root, before starting
#                        the download session: 



# mkdir -v $LFS/sources
# 


# 
#                          Make this directory writable and sticky. "Sticky"means that even if multiple users
#                        have write permission on a directory, only the owner of a file can delete the file
#                        within a sticky directory. The following command will enable the write and sticky
#                        modes: 



# chmod -v a+wt $LFS/sources
# 


# 
#                          There are several ways to optain all the necessary packages and patches to build
#                        LFS: 
# 
#                          The files can be downloaded individually as described in the next two sections.
#                        
# 
#                          For stable versions of the book, a tarball of all the needed files can be downloaded
#                        from one of the LFS files mirrors listed at http://www.linuxfromscratch.org/mirrors.html#files.
#                         
# 
#                          The files can be downloaded using  wget and a wget-list as described below. 
# 
#                          To download all of the packages and patches by using wget-listas an input to the
#                          wget command, use: 



# wget --input-file=wget-list --continue --directory-prefix=$LFS/sources
# 


# 
#                          Additionally, starting with LFS-7.0, there is a separate file, md5sums, which can
#                        be used to verify that all the correct packages are available before proceeding.
#                        Place that file in $LFS/sourcesand run:  



# pushd $LFS/sources
#   md5sum -c md5sums
# popd
# 


# 
#                          This check can be used after retrieving the needed files with any of the methods
#                        listed above.  
#        3.2. All Packages  
# 
#                          Download or otherwise obtain the following packages: 
# 
#                Acl (2.2.53) - 513 KB:
# 
#                          Home page: https://savannah.nongnu.org/projects/acl  
# 
#                          Download: http://download.savannah.gnu.org/releases/acl/acl-2.2.53.tar.gz 
# 
#                          MD5 sum: 007aabf1dbb550bcddde52a244cd1070
# 
#                Attr (2.4.48) - 457 KB:
# 
#                          Home page: https://savannah.nongnu.org/projects/attr  
# 
#                          Download: http://download.savannah.gnu.org/releases/attr/attr-2.4.48.tar.gz 
# 
#                          MD5 sum: bc1e5cb5c96d99b24886f1f527d3bb3d
# 
#                Autoconf (2.71) - 1,263 KB:
# 
#                          Home page: http://www.gnu.org/software/autoconf/  
# 
#                          Download: http://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.xz 
# 
#                          MD5 sum: 12cfa1687ffa2606337efe1a64416106
# 
#                Automake (1.16.3) - 1,554 KB:
# 
#                          Home page: http://www.gnu.org/software/automake/  
# 
#                          Download: http://ftp.gnu.org/gnu/automake/automake-1.16.3.tar.xz 
# 
#                          MD5 sum: c27f608a4e1f302ec7ce42f1251c184e
# 
#                Bash (5.1) - 10,214 KB:
# 
#                          Home page: http://www.gnu.org/software/bash/  
# 
#                          Download: http://ftp.gnu.org/gnu/bash/bash-5.1.tar.gz 
# 
#                          MD5 sum: bb91a17fd6c9032c26d0b2b78b50aff5
# 
#                Bc (3.3.0) - 225 KB:
# 
#                          Home page: https://git.yzena.com/gavin/bc  
# 
#                          Download: https://github.com/gavinhoward/bc/releases/download/3.3.0/bc-3.3.0.tar.xz 
# 
#                          MD5 sum: 452ae2d467b1d7212bb7896c0c689825
# 
#                Binutils (2.36.1) - 22,239 KB:
# 
#                          Home page: http://www.gnu.org/software/binutils/  
# 
#                          Download: http://ftp.gnu.org/gnu/binutils/binutils-2.36.1.tar.xz 
# 
#                          MD5 sum: 628d490d976d8957279bbbff06cf29d4
# 
#                Bison (3.7.5) - 2,561 KB:
# 
#                          Home page: http://www.gnu.org/software/bison/  
# 
#                          Download: http://ftp.gnu.org/gnu/bison/bison-3.7.5.tar.xz 
# 
#                          MD5 sum: 9b762dc24a6723f86d14d957d3deeb90
# 
#                Bzip2 (1.0.8) - 792 KB:
# 
#                          Download: https://www.sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz  
# 
#                          MD5 sum: 67e051268d0c475ea773822f7500d0e5
# 
#                Check (0.15.2) - 760 KB:
# 
#                          Home page: https://libcheck.github.io/check  
# 
#                          Download: https://github.com/libcheck/check/releases/download/0.15.2/check-0.15.2.tar.gz 
# 
#                          MD5 sum: 50fcafcecde5a380415b12e9c574e0b2
# 
#                Coreutils (8.32) - 5,418 KB:
# 
#                          Home page: http://www.gnu.org/software/coreutils/  
# 
#                          Download: http://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz 
# 
#                          MD5 sum: 022042695b7d5bcf1a93559a9735e668
# 
#                DejaGNU (1.6.2) - 514 KB:
# 
#                          Home page: http://www.gnu.org/software/dejagnu/  
# 
#                          Download: http://ftp.gnu.org/gnu/dejagnu/dejagnu-1.6.2.tar.gz 
# 
#                          MD5 sum: e1b07516533f351b3aba3423fafeffd6
# 
#                Diffutils (3.7) - 1,415 KB:
# 
#                          Home page: http://www.gnu.org/software/diffutils/  
# 
#                          Download: http://ftp.gnu.org/gnu/diffutils/diffutils-3.7.tar.xz 
# 
#                          MD5 sum: 4824adc0e95dbbf11dfbdfaad6a1e461
# 
#                E2fsprogs (1.46.1) - 9,269 KB:
# 
#                          Home page: http://e2fsprogs.sourceforge.net/  
# 
#                          Download: https://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v1.46.1/e2fsprogs-1.46.1.tar.gz 
# 
#                          MD5 sum: 8c52585522b7ca6bdae2bdecba27b3a4
# 
#                Elfutils (0.183) - 8,896 KB:
# 
#                          Home page: https://sourceware.org/ftp/elfutils/  
# 
#                          Download: https://sourceware.org/ftp/elfutils/0.183/elfutils-0.183.tar.bz2 
# 
#                          MD5 sum: 6f58aa1b9af1a5681b1cbf63e0da2d67
# 
#                Eudev (3.2.10) - 1,916 KB:
# 
#                          Download: https://dev.gentoo.org/~blueness/eudev/eudev-3.2.10.tar.gz  
# 
#                          MD5 sum: 60b135a189523f333cea5f71a3345c8d
# 
#                Expat (2.2.10) - 416 KB:
# 
#                          Home page: https://libexpat.github.io/  
# 
#                          Download: https://prdownloads.sourceforge.net/expat/expat-2.2.10.tar.xz 
# 
#                          MD5 sum: e0fe49a6b3480827c9455e4cfc799133
# 
#                Expect (5.45.4) - 618 KB:
# 
#                          Home page: https://core.tcl.tk/expect/  
# 
#                          Download: https://prdownloads.sourceforge.net/expect/expect5.45.4.tar.gz 
# 
#                          MD5 sum: 00fce8de158422f5ccd2666512329bd2
# 
#                File (5.39) - 932 KB:
# 
#                          Home page: https://www.darwinsys.com/file/  
# 
#                          Download: http://ftp.astron.com/pub/file/file-5.39.tar.gz 
# 
#                          MD5 sum: 1c450306053622803a25647d88f80f25
#          Note 
# 
#                          File (5.39) may no longer be available at the listed location. The site administrators
#                        of the master download location occasionally remove older versions when new ones
#                        are released. An alternative download location that may have the correct version
#                        available can also be found at: http://www.linuxfromscratch.org/lfs/download.html#ftp.
#                         
# 
#                Findutils (4.8.0) - 1,940 KB:
# 
#                          Home page: http://www.gnu.org/software/findutils/  
# 
#                          Download: http://ftp.gnu.org/gnu/findutils/findutils-4.8.0.tar.xz 
# 
#                          MD5 sum: eeefe2e6380931a77dfa6d9350b43186
# 
#                Flex (2.6.4) - 1,386 KB:
# 
#                          Home page: https://github.com/westes/flex  
# 
#                          Download: https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz 
# 
#                          MD5 sum: 2882e3179748cc9f9c23ec593d6adc8d
# 
#                Gawk (5.1.0) - 3,081 KB:
# 
#                          Home page: http://www.gnu.org/software/gawk/  
# 
#                          Download: http://ftp.gnu.org/gnu/gawk/gawk-5.1.0.tar.xz 
# 
#                          MD5 sum: 8470c34eeecc41c1aa0c5d89e630df50
# 
#                GCC (10.2.0) - 73,247 KB:
# 
#                          Home page: https://gcc.gnu.org/  
# 
#                          Download: http://ftp.gnu.org/gnu/gcc/gcc-10.2.0/gcc-10.2.0.tar.xz 
# 
#                          MD5 sum: e9fd9b1789155ad09bcf3ae747596b50
# 
#                GDBM (1.19) - 946 KB:
# 
#                          Home page: http://www.gnu.org/software/gdbm/  
# 
#                          Download: http://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz 
# 
#                          MD5 sum: aeb29c6a90350a4c959cd1df38cd0a7e
# 
#                Gettext (0.21) - 9,487 KB:
# 
#                          Home page: http://www.gnu.org/software/gettext/  
# 
#                          Download: http://ftp.gnu.org/gnu/gettext/gettext-0.21.tar.xz 
# 
#                          MD5 sum: 40996bbaf7d1356d3c22e33a8b255b31
# 
#                Glibc (2.33) - 16,663 KB:
# 
#                          Home page: http://www.gnu.org/software/libc/  
# 
#                          Download: http://ftp.gnu.org/gnu/glibc/glibc-2.33.tar.xz 
# 
#                          MD5 sum: 390bbd889c7e8e8a7041564cb6b27cca
# 
#                GMP (6.2.1) - 1,980 KB:
# 
#                          Home page: http://www.gnu.org/software/gmp/  
# 
#                          Download: http://ftp.gnu.org/gnu/gmp/gmp-6.2.1.tar.xz 
# 
#                          MD5 sum: 0b82665c4a92fd2ade7440c13fcaa42b
# 
#                Gperf (3.1) - 1,188 KB:
# 
#                          Home page: http://www.gnu.org/software/gperf/  
# 
#                          Download: http://ftp.gnu.org/gnu/gperf/gperf-3.1.tar.gz 
# 
#                          MD5 sum: 9e251c0a618ad0824b51117d5d9db87e
# 
#                Grep (3.6) - 1,553 KB:
# 
#                          Home page: http://www.gnu.org/software/grep/  
# 
#                          Download: http://ftp.gnu.org/gnu/grep/grep-3.6.tar.xz 
# 
#                          MD5 sum: f47fe27049510b2249dba7f862ac1b51
# 
#                Groff (1.22.4) - 4,044 KB:
# 
#                          Home page: http://www.gnu.org/software/groff/  
# 
#                          Download: http://ftp.gnu.org/gnu/groff/groff-1.22.4.tar.gz 
# 
#                          MD5 sum: 08fb04335e2f5e73f23ea4c3adbf0c5f
# 
#                GRUB (2.04) - 6,245 KB:
# 
#                          Home page: http://www.gnu.org/software/grub/  
# 
#                          Download: https://ftp.gnu.org/gnu/grub/grub-2.04.tar.xz 
# 
#                          MD5 sum: 5aaca6713b47ca2456d8324a58755ac7
# 
#                Gzip (1.10) - 757 KB:
# 
#                          Home page: http://www.gnu.org/software/gzip/  
# 
#                          Download: http://ftp.gnu.org/gnu/gzip/gzip-1.10.tar.xz 
# 
#                          MD5 sum: 691b1221694c3394f1c537df4eee39d3
# 
#                Iana-Etc (20210202) - 578 KB:
# 
#                          Home page: https://www.iana.org/protocols  
# 
#                          Download: https://github.com/Mic92/iana-etc/releases/download/20210202/iana-etc-20210202.tar.gz 
# 
#                          MD5 sum: 1c193a4d6ca36274570d1505140a7bee
# 
#                Inetutils (2.0) - 1,462 KB:
# 
#                          Home page: http://www.gnu.org/software/inetutils/  
# 
#                          Download: http://ftp.gnu.org/gnu/inetutils/inetutils-2.0.tar.xz 
# 
#                          MD5 sum: 5e1018502cd131ed8e42339f6b5c98aa
# 
#                Intltool (0.51.0) - 159 KB:
# 
#                          Home page: https://freedesktop.org/wiki/Software/intltool  
# 
#                          Download: https://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz 
# 
#                          MD5 sum: 12e517cac2b57a0121cda351570f1e63
# 
#                IPRoute2 (5.10.0) - 781 KB:
# 
#                          Home page: https://www.kernel.org/pub/linux/utils/net/iproute2/  
# 
#                          Download: https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-5.10.0.tar.xz 
# 
#                          MD5 sum: 19ffea480a21e600453776b7225f3319
# 
#                Kbd (2.4.0) - 1,095 KB:
# 
#                          Home page: http://ftp.altlinux.org/pub/people/legion/kbd  
# 
#                          Download: https://www.kernel.org/pub/linux/utils/kbd/kbd-2.4.0.tar.xz 
# 
#                          MD5 sum: 3cac5be0096fcf7b32dcbd3c53831380
# 
#                Kmod (28) - 540 KB:
# 
#                          Download: https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-28.tar.xz  
# 
#                          MD5 sum: 0a2b887b1b3dfb8c0b3f41f598203e56
# 
#                Less (563) - 328 KB:
# 
#                          Home page: http://www.greenwoodsoftware.com/less/  
# 
#                          Download: http://www.greenwoodsoftware.com/less/less-563.tar.gz 
# 
#                          MD5 sum: 1ee44fa71447a845f6eef5b3f38d2781
# 
#                LFS-Bootscripts (20210201) - 32 KB:
# 
#                          Download: http://www.linuxfromscratch.org/lfs/downloads/10.1/lfs-bootscripts-20210201.tar.xz  
# 
#                          MD5 sum: 1fc441ef96c522974f7267dec8b40a47
# 
#                Libcap (2.48) - 130 KB:
# 
#                          Home page: https://sites.google.com/site/fullycapable/  
# 
#                          Download: https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.48.tar.xz 
# 
#                          MD5 sum: ca71693a9abe4e0ad9cc33a755ee47e0
# 
#                Libffi (3.3) - 1,275 KB:
# 
#                          Home page: https://sourceware.org/libffi/  
# 
#                          Download: https://sourceware.org/pub/libffi/libffi-3.3.tar.gz 
# 
#                          MD5 sum: 6313289e32f1d38a9df4770b014a2ca7
# 
#                Libpipeline (1.5.3) - 972 KB:
# 
#                          Home page: http://libpipeline.nongnu.org/  
# 
#                          Download: http://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.5.3.tar.gz 
# 
#                          MD5 sum: dad443d0911cf9f0f1bd90a334bc9004
# 
#                Libtool (2.4.6) - 951 KB:
# 
#                          Home page: http://www.gnu.org/software/libtool/  
# 
#                          Download: http://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz 
# 
#                          MD5 sum: 1bfb9b923f2c1339b4d2ce1807064aa5
# 
#                Linux (5.10.17) - 113,548 KB:
# 
#                          Home page: https://www.kernel.org/  
# 
#                          Download: https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.10.17.tar.xz 
# 
#                          MD5 sum: 4908707ed841923d8d1814130d5c380f
#          Note 
# 
#                          The Linux kernel is updated relatively often, many times due to discoveries of security
#                        vulnerabilities. The latest available stable kernel version may be used, unless
#                        the errata page says otherwise. 
# 
#                          For users with limited speed or expensive bandwidth who wish to update the Linux
#                        kernel, a baseline version of the package and patches can be downloaded separately.
#                        This may save some time or cost for a subsequent patch level upgrade within a minor
#                        release. 
# 
#                M4 (1.4.18) - 1,180 KB:
# 
#                          Home page: http://www.gnu.org/software/m4/  
# 
#                          Download: http://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz 
# 
#                          MD5 sum: 730bb15d96fffe47e148d1e09235af82
# 
#                Make (4.3) - 2,263 KB:
# 
#                          Home page: http://www.gnu.org/software/make/  
# 
#                          Download: http://ftp.gnu.org/gnu/make/make-4.3.tar.gz 
# 
#                          MD5 sum: fc7a67ea86ace13195b0bce683fd4469
# 
#                Man-DB (2.9.4) - 1,865 KB:
# 
#                          Home page: https://www.nongnu.org/man-db/  
# 
#                          Download: http://download.savannah.gnu.org/releases/man-db/man-db-2.9.4.tar.xz 
# 
#                          MD5 sum: 6e233a555f7b9ae91ce7cd0faa322bce
# 
#                Man-pages (5.10) - 1,707 KB:
# 
#                          Home page: https://www.kernel.org/doc/man-pages/  
# 
#                          Download: https://www.kernel.org/pub/linux/docs/man-pages/man-pages-5.10.tar.xz 
# 
#                          MD5 sum: 4ae3f74a1beddd919936e1058642644c
# 
#                Meson (0.57.1) - 1,806 KB:
# 
#                          Home page: https://mesonbuild.com  
# 
#                          Download: https://github.com/mesonbuild/meson/releases/download/0.57.1/meson-0.57.1.tar.gz 
# 
#                          MD5 sum: fbd744560351491892478a36a1586815
# 
#                MPC (1.2.1) - 820 KB:
# 
#                          Home page: http://www.multiprecision.org/  
# 
#                          Download: https://ftp.gnu.org/gnu/mpc/mpc-1.2.1.tar.gz 
# 
#                          MD5 sum: 9f16c976c25bb0f76b50be749cd7a3a8
# 
#                MPFR (4.1.0) - 1,490 KB:
# 
#                          Home page: https://www.mpfr.org/  
# 
#                          Download: http://www.mpfr.org/mpfr-4.1.0/mpfr-4.1.0.tar.xz 
# 
#                          MD5 sum: bdd3d5efba9c17da8d83a35ec552baef
# 
#                Ncurses (6.2) - 3,346 KB:
# 
#                          Home page: http://www.gnu.org/software/ncurses/  
# 
#                          Download: http://ftp.gnu.org/gnu/ncurses/ncurses-6.2.tar.gz 
# 
#                          MD5 sum: e812da327b1c2214ac1aed440ea3ae8d
# 
#                Ninja (1.10.2) - 209 KB:
# 
#                          Home page: https://ninja-build.org/  
# 
#                          Download: https://github.com/ninja-build/ninja/archive/v1.10.2/ninja-1.10.2.tar.gz 
# 
#                          MD5 sum: 639f75bc2e3b19ab893eaf2c810d4eb4
# 
#                OpenSSL (1.1.1j) - 9,593 KB:
# 
#                          Home page: https://www.openssl.org/  
# 
#                          Download: https://www.openssl.org/source/openssl-1.1.1j.tar.gz 
# 
#                          MD5 sum: cccaa064ed860a2b4d1303811bf5c682
# 
#                Patch (2.7.6) - 766 KB:
# 
#                          Home page: https://savannah.gnu.org/projects/patch/  
# 
#                          Download: http://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz 
# 
#                          MD5 sum: 78ad9937e4caadcba1526ef1853730d5
# 
#                Perl (5.32.1) - 12,316 KB:
# 
#                          Home page: https://www.perl.org/  
# 
#                          Download: https://www.cpan.org/src/5.0/perl-5.32.1.tar.xz 
# 
#                          MD5 sum: 7f104064b906ad8c7329ca5e409a32d7
# 
#                Pkg-config (0.29.2) - 1,970 KB:
# 
#                          Home page: https://www.freedesktop.org/wiki/Software/pkg-config  
# 
#                          Download: https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz 
# 
#                          MD5 sum: f6e931e319531b736fadc017f470e68a
# 
#                Procps (3.3.17) - 985 KB:
# 
#                          Home page: https://sourceforge.net/projects/procps-ng  
# 
#                          Download: https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-3.3.17.tar.xz 
# 
#                          MD5 sum: d60613e88c2f442ebd462b5a75313d56
# 
#                Psmisc (23.4) - 362 KB:
# 
#                          Home page: http://psmisc.sourceforge.net/  
# 
#                          Download: https://sourceforge.net/projects/psmisc/files/psmisc/psmisc-23.4.tar.xz 
# 
#                          MD5 sum: 8114cd4489b95308efe2509c3a406bbf
# 
#                Python (3.9.2) - 18,477 KB:
# 
#                          Home page: https://www.python.org/  
# 
#                          Download: https://www.python.org/ftp/python/3.9.2/Python-3.9.2.tar.xz 
# 
#                          MD5 sum: f0dc9000312abeb16de4eccce9a870ab
# 
#                Python Documentation (3.9.2) - 6,659 KB:
# 
#                          Download: https://www.python.org/ftp/python/doc/3.9.2/python-3.9.2-docs-html.tar.bz2  
# 
#                          MD5 sum: 719cd64a4c5768b646b716df20229400
# 
#                Readline (8.1) - 2,924 KB:
# 
#                          Home page: https://tiswww.case.edu/php/chet/readline/rltop.html  
# 
#                          Download: http://ftp.gnu.org/gnu/readline/readline-8.1.tar.gz 
# 
#                          MD5 sum: e9557dd5b1409f5d7b37ef717c64518e
# 
#                Sed (4.8) - 1,317 KB:
# 
#                          Home page: http://www.gnu.org/software/sed/  
# 
#                          Download: http://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz 
# 
#                          MD5 sum: 6d906edfdb3202304059233f51f9a71d
# 
#                Shadow (4.8.1) - 1,574 KB:
# 
#                          Download: https://github.com/shadow-maint/shadow/releases/download/4.8.1/shadow-4.8.1.tar.xz  
# 
#                          MD5 sum: 4b05eff8a427cf50e615bda324b5bc45
# 
#                Sysklogd (1.5.1) - 88 KB:
# 
#                          Home page: http://www.infodrom.org/projects/sysklogd/  
# 
#                          Download: http://www.infodrom.org/projects/sysklogd/download/sysklogd-1.5.1.tar.gz 
# 
#                          MD5 sum: c70599ab0d037fde724f7210c2c8d7f8
# 
#                Sysvinit (2.98) - 125 KB:
# 
#                          Home page: https://savannah.nongnu.org/projects/sysvinit  
# 
#                          Download: http://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.98.tar.xz 
# 
#                          MD5 sum: e3254f7622ea5cf2322b1b386a98ba59
# 
#                Tar (1.34) - 2,174 KB:
# 
#                          Home page: http://www.gnu.org/software/tar/  
# 
#                          Download: http://ftp.gnu.org/gnu/tar/tar-1.34.tar.xz 
# 
#                          MD5 sum: 9a08d29a9ac4727130b5708347c0f5cf
# 
#                Tcl (8.6.11) - 10,020 KB:
# 
#                          Home page: http://tcl.sourceforge.net/  
# 
#                          Download: https://downloads.sourceforge.net/tcl/tcl8.6.11-src.tar.gz 
# 
#                          MD5 sum: 8a4c004f48984a03a7747e9ba06e4da4
# 
#                Tcl Documentation (8.6.11) - 1,172 KB:
# 
#                          Download: https://downloads.sourceforge.net/tcl/tcl8.6.11-html.tar.gz  
# 
#                          MD5 sum: e358a9140c3a171e42f18c8a7f6a36ea
# 
#                Texinfo (6.7) - 4,237 KB:
# 
#                          Home page: http://www.gnu.org/software/texinfo/  
# 
#                          Download: http://ftp.gnu.org/gnu/texinfo/texinfo-6.7.tar.xz 
# 
#                          MD5 sum: d4c5d8cc84438c5993ec5163a59522a6
# 
#                Time Zone Data (2021a) - 403 KB:
# 
#                          Home page: https://www.iana.org/time-zones  
# 
#                          Download: https://www.iana.org/time-zones/repository/releases/tzdata2021a.tar.gz 
# 
#                          MD5 sum: 20eae7d1da671c6eac56339c8df85bbd
# 
#                Udev-lfs Tarball (udev-lfs-20171102) - 11 KB:
# 
#                          Download: http://anduin.linuxfromscratch.org/LFS/udev-lfs-20171102.tar.xz  
# 
#                          MD5 sum: 27cd82f9a61422e186b9d6759ddf1634
# 
#                Util-linux (2.36.2) - 5,223 KB:
# 
#                          Home page: http://freecode.com/projects/util-linux  
# 
#                          Download: https://www.kernel.org/pub/linux/utils/util-linux/v2.36/util-linux-2.36.2.tar.xz 
# 
#                          MD5 sum: f78419af679ac9678190ad961eb3cf27
# 
#                Vim (8.2.2433) - 15,051 KB:
# 
#                          Home page: https://www.vim.org  
# 
#                          Download: http://anduin.linuxfromscratch.org/LFS/vim-8.2.2433.tar.gz 
# 
#                          MD5 sum: a26555c8919cf40938d2428d834bf913
#          Note 
# 
#                          The version of vim changes daily. To get the latest version, go to https://github.com/vim/vim/releases.
#                         
# 
#                XML::Parser (2.46) - 249 KB:
# 
#                          Home page: https://github.com/chorny/XML-Parser  
# 
#                          Download: https://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.46.tar.gz 
# 
#                          MD5 sum: 80bb18a8e6240fcf7ec2f7b57601c170
# 
#                Xz Utils (5.2.5) - 1,122 KB:
# 
#                          Home page: https://tukaani.org/xz  
# 
#                          Download: https://tukaani.org/xz/xz-5.2.5.tar.xz 
# 
#                          MD5 sum: aa1621ec7013a19abab52a8aff04fe5b
# 
#                Zlib (1.2.11) - 457 KB:
# 
#                          Home page: https://www.zlib.net/  
# 
#                          Download: https://zlib.net/zlib-1.2.11.tar.xz 
# 
#                          MD5 sum: 85adef240c5f370b308da8c938951a68
# 
#                Zstd (1.4.8) - 1,762 KB:
# 
#                          Home page: https://facebook.github.io/zstd/  
# 
#                          Download: https://github.com/facebook/zstd/releases/download/v1.4.8/zstd-1.4.8.tar.gz 
# 
#                          MD5 sum: e873db7cfa5ef05832e6d55a5a572840
# 
#                          Total size of these packages: about 418 MB 
#        3.3. Needed Patches  
# 
#                          In addition to the packages, several patches are also required. These patches correct
#                        any mistakes in the packages that should be fixed by the maintainer. The patches
#                        also make small modifications to make the packages easier to work with. The following
#                        patches will be needed to build an LFS system: 
# 
#                Bzip2 Documentation Patch - 1.6 KB:
# 
#                          Download: http://www.linuxfromscratch.org/patches/lfs/10.1/bzip2-1.0.8-install_docs-1.patch  
# 
#                          MD5 sum: 6a5ac7e89b791aae556de0f745916f7f
# 
#                Coreutils Internationalization Fixes Patch - 166 KB:
# 
#                          Download: http://www.linuxfromscratch.org/patches/lfs/10.1/coreutils-8.32-i18n-1.patch  
# 
#                          MD5 sum: cd8ebed2a67fff2e231026df91af6776
# 
#                Glibc FHS Patch - 2.8 KB:
# 
#                          Download: http://www.linuxfromscratch.org/patches/lfs/10.1/glibc-2.33-fhs-1.patch  
# 
#                          MD5 sum: 9a5997c3452909b1769918c759eff8a2
# 
#                Kbd Backspace/Delete Fix Patch - 12 KB:
# 
#                          Download: http://www.linuxfromscratch.org/patches/lfs/10.1/kbd-2.4.0-backspace-1.patch  
# 
#                          MD5 sum: f75cca16a38da6caa7d52151f7136895
# 
#                Sysvinit Consolidated Patch - 2.4 KB:
# 
#                          Download: http://www.linuxfromscratch.org/patches/lfs/10.1/sysvinit-2.98-consolidated-1.patch  
# 
#                          MD5 sum: 4900322141d493e74020c9cf437b2cdc
# 
#                          Total size of these patches: about 184.8 KB 
# 
#                          In addition to the above required patches, there exist a number of optional patches
#                        created by the LFS community. These optional patches solve minor problems or enable
#                        functionality that is not enabled by default. Feel free to peruse the patches database
#                        located at http://www.linuxfromscratch.org/patches/downloads/and acquire any additional
#                        patches to suit your system needs.  
#        Chapter 4. Final Preparations  
#        4.1. Introduction  
# 
#                          In this chapter, we will perform a few additional tasks to prepare for building
#                        the temporary system. We will create a set of directories in $LFSfor the installation
#                        of the temporary tools, add an unprivileged user to reduce risk, and create an appropriate
#                        build environment for that user. We will also explain the unit of time we use to
#                        measure how long LFS packages take to build, or "SBUs", and give some information
#                        about package test suites.  
#        4.2. Creating a limited directory layout in LFS filesystem  
# 
#                          The first task performed in the LFS partition is to create a limited directory hierarchy
#                        so that programs compiled in Chapter 6may be installed in their final location.
#                        This is needed so that those temporary programs be overwritten when rebuilding them
#                        in Chapter 8.  
# 
#                          Create the required directory layout by running the following as root: 



mkdir -pv $LFS/{bin,etc,lib,sbin,usr,var}
case $(uname -m) in
  x86_64) mkdir -pv $LFS/lib64 ;;
esac



# 
#                          Programs in Chapter 6will be compiled with a cross-compiler (more details in section
#                        Toolchain Technical Notes). In order to separate this cross-compiler from the other
#                        programs, it will be installed in a special directory. Create this directory with:
#                         



mkdir -pv $LFS/tools



#        4.3. Adding the LFS User  
# 
#                          When logged in as user root, making a single mistake can damage or destroy a system.
#                        Therefore, the packages in the next two chapters are built as an unprivileged user.
#                        You could use your own user name, but to make it easier to set up a clean working
#                        environment, create a new user called lfsas a member of a new group (also named
#                        lfs) and use this user during the installation process. As root, issue the following
#                        commands to add the new user: 



groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs



# 
#                          The meaning of the command line options: 
# 
#                -s /bin/bash 
# 
#                          This makes  bash the default shell for user lfs. 
# 
#                -g lfs 
# 
#                          This option adds user lfsto group lfs. 
# 
#                -m 
# 
#                          This creates a home directory for lfs. 
# 
#                -k /dev/null 
# 
#                          This parameter prevents possible copying of files from a skeleton directory (default
#                        is /etc/skel) by changing the input location to the special null device. 
# 
#                lfs 
# 
#                          This is the actual name for the created user. 
# 
#                          To log in as lfs(as opposed to switching to user lfswhen logged in as root, which
#                        does not require the lfsuser to have a password), give lfsa password: 



passwd lfs



# 
#                          Grant lfsfull access to all directories under $LFSby making lfsthe directory owner:
#                        



chown -v lfs $LFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -v lfs $LFS/lib64 ;;
esac



# 
#                          If a separate working directory was created as suggested, give user lfsownership
#                        of this directory: 



chown -v lfs $LFS/sources



#          Note 
# 
#                          In some host systems, the following command does not complete properly and suspends
#                        the login to the lfs user to the background. If the prompt "lfs:~$" does not appear
#                        immediately, entering the  fg command will fix the issue. 
# 
#                          Next, login as user lfs. This can be done via a virtual console, through a display
#                        manager, or with the following substitute/switch user command: 



su - lfs



# 
#                          The " - "instructs  su to start a login shell as opposed to a non-login shell. The difference
#                        between these two types of shells can be found in detail in bash(1)and  info bash .
#                         
