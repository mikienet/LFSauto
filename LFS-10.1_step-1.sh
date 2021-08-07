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
read -p "... must run this with sudo"
wget http://www.linuxfromscratch.org/lfs/downloads/stable/wget-list
wget http://www.linuxfromscratch.org/lfs/downloads/stable/md5sums --continue 
read -p "... at the end .. run = cp /home/__your_user_name__/LFS* ~"
read -p "... at the end .. run = ./LFS-10.1_step-2.sh"


#Linux From Scratch /**/  
# 000001      Linux From Scratch 
# 000002        Version 10.1 
# 000003        Published March 1st, 2021 
# 000004          Created by Gerard Beekmans 
# 000005          Managing Editor: Bruce Dubbs 
# 000006 
# 000007                          Copyright C 1999-2021 Gerard Beekmans  
# 000008 
# 000009                          Copyright C 1999-2021, Gerard Beekmans 
# 000010 
# 000011                          All rights reserved. 
# 000012 
# 000013                          This book is licensed under a Creative Commons License . 
# 000014 
# 000015                          Computer instructions may be extracted from the book under the MIT License . 
# 000016 
# 000017                          Linux ® is a registered trademark of Linus Torvalds. 
# 000018 --------------------------------------------------------------------------------
# 000019 Table of Contents 
# 000020            Preface 
# 000021                Foreword 
# 000022                Audience 
# 000023                LFS Target Architectures 
# 000024                Prerequisites 
# 000025                LFS and Standards 
# 000026                Rationale for Packages in the Book 
# 000027                Typography 
# 000028                Structure 
# 000029                Errata 
# 000030          I. Introduction 
# 000031            1. Introduction 
# 000032                How to Build an LFS System 
# 000033                What's new since the last release 
# 000034                Changelog 
# 000035                Resources 
# 000036                Help 
# 000037          II. Preparing for the Build 
# 000038            2. Preparing the Host System 
# 000039                Introduction 
# 000040                Host System Requirements 
# 000041                Building LFS in Stages 
# 000042                Creating a New Partition 
# 000043                Creating a File System on the Partition 
# 000044                Setting The $LFS Variable 
# 000045                Mounting the New Partition 
# 000046            3. Packages and Patches 
# 000047                Introduction 
# 000048                All Packages 
# 000049                Needed Patches 
# 000050            4. Final Preparations 
# 000051                Introduction 
# 000052                Creating a limited directory layout in LFS filesystem 
# 000053                Adding the LFS User 
# 000054                Setting Up the Environment 
# 000055                About SBUs 
# 000056                About the Test Suites 
# 000057          III. Building the LFS Cross Toolchain and Temporary Tools 
# 000058            Important Preliminary Material 
# 000059                Introduction 
# 000060                Toolchain Technical Notes 
# 000061                General Compilation Instructions 
# 000062            5. Compiling a Cross-Toolchain 
# 000063                Introduction 
# 000064                Binutils-2.36.1 - Pass 1 
# 000065                GCC-10.2.0 - Pass 1 
# 000066                Linux-5.10.17 API Headers 
# 000067                Glibc-2.33 
# 000068                Libstdc++ from GCC-10.2.0, Pass 1 
# 000069            6. Cross Compiling Temporary Tools 
# 000070                Introduction 
# 000071                M4-1.4.18 
# 000072                Ncurses-6.2 
# 000073                Bash-5.1 
# 000074                Coreutils-8.32 
# 000075                Diffutils-3.7 
# 000076                File-5.39 
# 000077                Findutils-4.8.0 
# 000078                Gawk-5.1.0 
# 000079                Grep-3.6 
# 000080                Gzip-1.10 
# 000081                Make-4.3 
# 000082                Patch-2.7.6 
# 000083                Sed-4.8 
# 000084                Tar-1.34 
# 000085                Xz-5.2.5 
# 000086                Binutils-2.36.1 - Pass 2 
# 000087                GCC-10.2.0 - Pass 2 
# 000088            7. Entering Chroot and Building Additional Temporary Tools 
# 000089                Introduction 
# 000090                Changing Ownership 
# 000091                Preparing Virtual Kernel File Systems 
# 000092                Entering the Chroot Environment 
# 000093                Creating Directories 
# 000094                Creating Essential Files and Symlinks 
# 000095                Libstdc++ from GCC-10.2.0, Pass 2 
# 000096                Gettext-0.21 
# 000097                Bison-3.7.5 
# 000098                Perl-5.32.1 
# 000099                Python-3.9.2 
# 000100                Texinfo-6.7 
# 000101                Util-linux-2.36.2 
# 000102                Cleaning up and Saving the Temporary System 
# 000103          IV. Building the LFS System 
# 000104            8. Installing Basic System Software 
# 000105                Introduction 
# 000106                Package Management 
# 000107                Man-pages-5.10 
# 000108                Iana-Etc-20210202 
# 000109                Glibc-2.33 
# 000110                Zlib-1.2.11 
# 000111                Bzip2-1.0.8 
# 000112                Xz-5.2.5 
# 000113                Zstd-1.4.8 
# 000114                File-5.39 
# 000115                Readline-8.1 
# 000116                M4-1.4.18 
# 000117                Bc-3.3.0 
# 000118                Flex-2.6.4 
# 000119                Tcl-8.6.11 
# 000120                Expect-5.45.4 
# 000121                DejaGNU-1.6.2 
# 000122                Binutils-2.36.1 
# 000123                GMP-6.2.1 
# 000124                MPFR-4.1.0 
# 000125                MPC-1.2.1 
# 000126                Attr-2.4.48 
# 000127                Acl-2.2.53 
# 000128                Libcap-2.48 
# 000129                Shadow-4.8.1 
# 000130                GCC-10.2.0 
# 000131                Pkg-config-0.29.2 
# 000132                Ncurses-6.2 
# 000133                Sed-4.8 
# 000134                Psmisc-23.4 
# 000135                Gettext-0.21 
# 000136                Bison-3.7.5 
# 000137                Grep-3.6 
# 000138                Bash-5.1 
# 000139                Libtool-2.4.6 
# 000140                GDBM-1.19 
# 000141                Gperf-3.1 
# 000142                Expat-2.2.10 
# 000143                Inetutils-2.0 
# 000144                Perl-5.32.1 
# 000145                XML::Parser-2.46 
# 000146                Intltool-0.51.0 
# 000147                Autoconf-2.71 
# 000148                Automake-1.16.3 
# 000149                Kmod-28 
# 000150                Libelf from Elfutils-0.183 
# 000151                Libffi-3.3 
# 000152                OpenSSL-1.1.1j 
# 000153                Python-3.9.2 
# 000154                Ninja-1.10.2 
# 000155                Meson-0.57.1 
# 000156                Coreutils-8.32 
# 000157                Check-0.15.2 
# 000158                Diffutils-3.7 
# 000159                Gawk-5.1.0 
# 000160                Findutils-4.8.0 
# 000161                Groff-1.22.4 
# 000162                GRUB-2.04 
# 000163                Less-563 
# 000164                Gzip-1.10 
# 000165                IPRoute2-5.10.0 
# 000166                Kbd-2.4.0 
# 000167                Libpipeline-1.5.3 
# 000168                Make-4.3 
# 000169                Patch-2.7.6 
# 000170                Man-DB-2.9.4 
# 000171                Tar-1.34 
# 000172                Texinfo-6.7 
# 000173                Vim-8.2.2433 
# 000174                Eudev-3.2.10 
# 000175                Procps-ng-3.3.17 
# 000176                Util-linux-2.36.2 
# 000177                E2fsprogs-1.46.1 
# 000178                Sysklogd-1.5.1 
# 000179                Sysvinit-2.98 
# 000180                About Debugging Symbols 
# 000181                Stripping Again 
# 000182                Cleaning Up 
# 000183            9. System Configuration 
# 000184                Introduction 
# 000185                LFS-Bootscripts-20210201 
# 000186                Overview of Device and Module Handling 
# 000187                Managing Devices 
# 000188                General Network Configuration 
# 000189                System V Bootscript Usage and Configuration 
# 000190                The Bash Shell Startup Files 
# 000191                Creating the /etc/inputrc File 
# 000192                Creating the /etc/shells File 
# 000193            10. Making the LFS System Bootable 
# 000194                Introduction 
# 000195                Creating the /etc/fstab File 
# 000196                Linux-5.10.17 
# 000197                Using GRUB to Set Up the Boot Process 
# 000198            11. The End 
# 000199                The End 
# 000200                Get Counted 
# 000201                Rebooting the System 
# 000202                What Now? 
# 000203          V. Appendices 
# 000204                A. Acronyms and Terms 
# 000205                B. Acknowledgments 
# 000206                C. Dependencies 
# 000207                D. Boot and sysconfig scripts version-20210201 
# 000208                /etc/rc.d/init.d/rc 
# 000209                /lib/lsb/init-functions 
# 000210                /etc/rc.d/init.d/mountvirtfs 
# 000211                /etc/rc.d/init.d/modules 
# 000212                /etc/rc.d/init.d/udev 
# 000213                /etc/rc.d/init.d/swap 
# 000214                /etc/rc.d/init.d/setclock 
# 000215                /etc/rc.d/init.d/checkfs 
# 000216                /etc/rc.d/init.d/mountfs 
# 000217                /etc/rc.d/init.d/udev_retry 
# 000218                /etc/rc.d/init.d/cleanfs 
# 000219                /etc/rc.d/init.d/console 
# 000220                /etc/rc.d/init.d/localnet 
# 000221                /etc/rc.d/init.d/sysctl 
# 000222                /etc/rc.d/init.d/sysklogd 
# 000223                /etc/rc.d/init.d/network 
# 000224                /etc/rc.d/init.d/sendsignals 
# 000225                /etc/rc.d/init.d/reboot 
# 000226                /etc/rc.d/init.d/halt 
# 000227                /etc/rc.d/init.d/template 
# 000228                /etc/sysconfig/modules 
# 000229                /etc/sysconfig/createfiles 
# 000230                /etc/sysconfig/udev-retry 
# 000231                /sbin/ifup 
# 000232                /sbin/ifdown 
# 000233                /lib/services/ipv4-static 
# 000234                /lib/services/ipv4-static-route 
# 000235                E. Udev configuration rules 
# 000236                55-lfs.rules 
# 000237                F. LFS Licenses 
# 000238                Creative Commons License 
# 000239                The MIT License 
# 000240          Index  
# 000241      Preface  
# 000242        Foreword 
# 000243 
# 000244                          My journey to learn and better understand Linux began back in 1998. I had just installed
# 000245                        my first Linux distribution and had quickly become intrigued with the whole concept
# 000246                        and philosophy behind Linux. 
# 000247 
# 000248                          There are always many ways to accomplish a single task. The same can be said about
# 000249                        Linux distributions. A great many have existed over the years. Some still exist,
# 000250                        some have morphed into something else, yet others have been relegated to our memories.
# 000251                        They all do things differently to suit the needs of their target audience. Because
# 000252                        so many different ways to accomplish the same end goal exist, I began to realize
# 000253                        I no longer had to be limited by any one implementation. Prior to discovering Linux,
# 000254                        we simply put up with issues in other Operating Systems as you had no choice. It
# 000255                        was what it was, whether you liked it or not. With Linux, the concept of choice
# 000256                        began to emerge. If you didn't like something, you were free, even encouraged, to
# 000257                        change it. 
# 000258 
# 000259                          I tried a number of distributions and could not decide on any one. They were great
# 000260                        systems in their own right. It wasn't a matter of right and wrong anymore. It had
# 000261                        become a matter of personal taste. With all that choice available, it became apparent
# 000262                        that there would not be a single system that would be perfect for me. So I set out
# 000263                        to create my own Linux system that would fully conform to my personal preferences.
# 000264                        
# 000265 
# 000266                          To truly make it my own system, I resolved to compile everything from source code
# 000267                        instead of using pre-compiled binary packages. This "perfect " Linux system would
# 000268                        have the strengths of various systems without their perceived weaknesses. At first,
# 000269                        the idea was rather daunting. I remained committed to the idea that such a system
# 000270                        could be built. 
# 000271 
# 000272                          After sorting through issues such as circular dependencies and compile-time errors,
# 000273                        I finally built a custom-built Linux system. It was fully operational and perfectly
# 000274                        usable like any of the other Linux systems out there at the time. But it was my
# 000275                        own creation. It was very satisfying to have put together such a system myself.
# 000276                        The only thing better would have been to create each piece of software myself. This
# 000277                        was the next best thing. 
# 000278 
# 000279                          As I shared my goals and experiences with other members of the Linux community,
# 000280                        it became apparent that there was a sustained interest in these ideas. It quickly
# 000281                        became plain that such custom-built Linux systems serve not only to meet user specific
# 000282                        requirements, but also serve as an ideal learning opportunity for programmers and
# 000283                        system administrators to enhance their (existing) Linux skills. Out of this broadened
# 000284                        interest, the Linux From Scratch Project  was born. 
# 000285 
# 000286                          This Linux From Scratch book is the central core around that project. It provides
# 000287                        the background and instructions necessary for you to design and build your own system.
# 000288                        While this book provides a template that will result in a correctly working system,
# 000289                        you are free to alter the instructions to suit yourself, which is, in part, an important
# 000290                        part of this project. You remain in control; we just lend a helping hand to get
# 000291                        you started on your own journey. 
# 000292 
# 000293                          I sincerely hope you will have a great time working on your own Linux From Scratch
# 000294                        system and enjoy the numerous benefits of having a system that is truly your own.
# 000295                        
# 000296 
# 000297                          --Gerard Beekmansgerard AT linuxfromscratch D0T org  
# 000298        Audience 
# 000299 
# 000300                          There are many reasons why you would want to read this book. One of the questions
# 000301                        many people raise is, "why go through all the hassle of manually building a Linux
# 000302                        system from scratch when you can just download and install an existing one? " 
# 000303 
# 000304                          One important reason for this project's existence is to help you learn how a Linux
# 000305                        system works from the inside out. Building an LFS system helps demonstrate what
# 000306                        makes Linux tick, and how things work together and depend on each other. One of
# 000307                        the best things that this learning experience can provide is the ability to customize
# 000308                        a Linux system to suit your own unique needs. 
# 000309 
# 000310                          Another key benefit of LFS is that it allows you to have more control over the system
# 000311                        without relying on someone else's Linux implementation. With LFS, you are in the
# 000312                        driver's seat and dictate every aspect of the system. 
# 000313 
# 000314                          LFS allows you to create very compact Linux systems. When installing regular distributions,
# 000315                        you are often forced to install a great many programs which are probably never used
# 000316                        or understood. These programs waste resources. You may argue that with today's hard
# 000317                        drive and CPUs, such resources are no longer a consideration. Sometimes, however,
# 000318                        you are still constrained by size considerations if nothing else. Think about bootable
# 000319                        CDs, USB sticks, and embedded systems. Those are areas where LFS can be beneficial.
# 000320                        
# 000321 
# 000322                          Another advantage of a custom built Linux system is security. By compiling the entire
# 000323                        system from source code, you are empowered to audit everything and apply all the
# 000324                        security patches desired. It is no longer necessary to wait for somebody else to
# 000325                        compile binary packages that fix a security hole. Unless you examine the patch and
# 000326                        implement it yourself, you have no guarantee that the new binary package was built
# 000327                        correctly and adequately fixes the problem. 
# 000328 
# 000329                          The goal of Linux From Scratch is to build a complete and usable foundation-level
# 000330                        system. If you do not wish to build your own Linux system from scratch, you may
# 000331                        nevertheless benefit from the information in this book. 
# 000332 
# 000333                          There are too many other good reasons to build your own LFS system to list them
# 000334                        all here. In the end, education is by far the most powerful of reasons. As you continue
# 000335                        in your LFS experience, you will discover the power that information and knowledge
# 000336                        truly bring.  
# 000337        LFS Target Architectures 
# 000338 
# 000339                          The primary target architectures of LFS are the AMD/Intel x86 (32-bit) and x86_64
# 000340                        (64-bit) CPUs. On the other hand, the instructions in this book are also known to
# 000341                        work, with some modifications, with the Power PC and ARM CPUs. To build a system
# 000342                        that utilizes one of these CPUs, the main prerequisite, in addition to those on
# 000343                        the next page, is an existing Linux system such as an earlier LFS installation,
# 000344                        Ubuntu, Red Hat/Fedora, SuSE, or other distribution that targets the architecture
# 000345                        that you have. Also note that a 32-bit distribution can be installed and used as
# 000346                        a host system on a 64-bit AMD/Intel computer. 
# 000347 
# 000348                          For building LFS, the gain of building on a 64-bit system compared to a 32-bit system
# 000349                        is minimal. For example, in a test build of LFS-9.1 on a Core i7-4790 CPU based
# 000350                        system, using 4 cores, the following statistics were measured: 



# 000354 
# 000355 Architecture Build Time     Build Size
# 000356 32-bit       239.9 minutes  3.6 GB
# 000357 64-bit       233.2 minutes  4.4 GB
# 000358 


# 000361 
# 000362                          As you can see, on the same hardware, the 64-bit build is only 3% faster and is
# 000363                        22% larger than the 32-bit build. If you plan to use LFS as a LAMP server, or a
# 000364                        firewall, a 32-bit CPU may be largely sufficient. On the other hand, several packages
# 000365                        in BLFS now need more than 4GB of RAM to be built and/or to run, so that if you
# 000366                        plan to use LFS as a desktop, the LFS authors recommend building on a 64-bit system.
# 000367                        
# 000368 
# 000369                          The default 64-bit build that results from LFS is considered a "pure " 64-bit system.
# 000370                        That is, it supports 64-bit executables only. Building a "multi-lib " system requires
# 000371                        compiling many applications twice, once for a 32-bit system and once for a 64-bit
# 000372                        system. This is not directly supported in LFS because it would interfere with the
# 000373                        educational objective of providing the instructions needed for a straightforward
# 000374                        base Linux system. Some LFS/BLFS editors maintain a fork of LFS for multilib, which
# 000375                        is accessible at http://www.linuxfromscratch.org/~thomas/multilib/index.html . But
# 000376                        it is an advanced topic.  
# 000377        Prerequisites 
# 000378 
# 000379                          Building an LFS system is not a simple task. It requires a certain level of existing
# 000380                        knowledge of Unix system administration in order to resolve problems and correctly
# 000381                        execute the commands listed. In particular, as an absolute minimum, you should already
# 000382                        have the ability to use the command line (shell) to copy or move files and directories,
# 000383                        list directory and file contents, and change the current directory. It is also expected
# 000384                        that you have a reasonable knowledge of using and installing Linux software. 
# 000385 
# 000386                          Because the LFS book assumes at least  this basic level of skill, the various LFS
# 000387                        support forums are unlikely to be able to provide you with much assistance in these
# 000388                        areas. You will find that your questions regarding such basic knowledge will likely
# 000389                        go unanswered or you will simply be referred to the LFS essential pre-reading list.
# 000390                        
# 000391 
# 000392                          Before building an LFS system, we recommend reading the following: 
# 000393 
# 000394                          Software-Building-HOWTO http://www.tldp.org/HOWTO/Software-Building-HOWTO.html 
# 000395 
# 000396                          This is a comprehensive guide to building and installing "generic " Unix software
# 000397                        packages under Linux. Although it was written some time ago, it still provides a
# 000398                        good summary of the basic techniques needed to build and install software. 
# 000399 
# 000400                          Beginner's Guide to Installing from Source http://moi.vonos.net/linux/beginners-installing-from-source/ 
# 000401 
# 000402                          This guide provides a good summary of basic skills and techniques needed to build
# 000403                        software from source code.  
# 000404        LFS and Standards 
# 000405 
# 000406                          The structure of LFS follows Linux standards as closely as possible. The primary
# 000407                        standards are: 
# 000408 
# 000409                          POSIX.1-2008 . 
# 000410 
# 000411                          Filesystem Hierarchy Standard (FHS) Version 3.0 
# 000412 
# 000413                          Linux Standard Base (LSB) Version 5.0 (2015) 
# 000414 
# 000415                          The LSB has four separate standards: Core, Desktop, Runtime Languages, and Imaging.
# 000416                        In addition to generic requirements there are also architecture specific requirements.
# 000417                        There are also two areas for trial use: Gtk3 and Graphics. LFS attempts to conform
# 000418                        to the architectures discussed in the previous section. 
# 000419          Note 
# 000420 
# 000421                          Many people do not agree with the requirements of the LSB. The main purpose of defining
# 000422                        it is to ensure that proprietary software will be able to be installed and run properly
# 000423                        on a compliant system. Since LFS is source based, the user has complete control
# 000424                        over what packages are desired and many choose not to install some packages that
# 000425                        are specified by the LSB. 
# 000426 
# 000427                          Creating a complete LFS system capable of passing the LSB certifications tests is
# 000428                        possible, but not without many additional packages that are beyond the scope of
# 000429                        LFS. These additional packages have installation instructions in BLFS.  
# 000430            Packages supplied by LFS needed to satisfy the LSB Requirements 
# 000431 
# 000432                          
# 000433 
# 000434                LSB Core:   
# 000435 
# 000436                          Bash, Bc, Binutils, Coreutils, Diffutils, File, Findutils, Gawk, Grep, Gzip, M4,
# 000437                        Man-DB, Ncurses, Procps, Psmisc, Sed, Shadow, Tar, Util-linux, Zlib 
# 000438 
# 000439                          LSB Desktop:   
# 000440 
# 000441                          None 
# 000442 
# 000443                          LSB Runtime Languages:   
# 000444 
# 000445                          Perl 
# 000446 
# 000447                          LSB Imaging:   
# 000448 
# 000449                          None 
# 000450 
# 000451                          LSB Gtk3 and LSB Graphics (Trial Use):   
# 000452 
# 000453                          None  
# 000454            Packages supplied by BLFS needed to satisfy the LSB Requirements 
# 000455 
# 000456                          
# 000457 
# 000458                LSB Core:   
# 000459 
# 000460                          At, Batch (a part of At), Cpio, Ed, Fcrontab, LSB-Tools, NSPR, NSS, PAM, Pax, Sendmail
# 000461                        (or Postfix or Exim), time 
# 000462 
# 000463                          LSB Desktop:   
# 000464 
# 000465                          Alsa, ATK, Cairo, Desktop-file-utils, Freetype, Fontconfig, Gdk-pixbuf, Glib2, GTK+2,
# 000466                        Icon-naming-utils, Libjpeg-turbo, Libpng, Libtiff, Libxml2, MesaLib, Pango, Xdg-utils,
# 000467                        Xorg 
# 000468 
# 000469                          LSB Runtime Languages:   
# 000470 
# 000471                          Python, Libxml2, Libxslt 
# 000472 
# 000473                          LSB Imaging:   
# 000474 
# 000475                          CUPS, Cups-filters, Ghostscript, SANE 
# 000476 
# 000477                          LSB Gtk3 and LSB Graphics (Trial Use):   
# 000478 
# 000479                          GTK+3  
# 000480            Packages not supplied by LFS or BLFS needed to satisfy the LSB Requirements 
# 000481 
# 000482                          
# 000483 
# 000484                LSB Core:   
# 000485 
# 000486                          None 
# 000487 
# 000488                          LSB Desktop:   
# 000489 
# 000490                          Qt4 (but Qt5 is provided) 
# 000491 
# 000492                          LSB Runtime Languages:   
# 000493 
# 000494                          None 
# 000495 
# 000496                          LSB Imaging:   
# 000497 
# 000498                          None 
# 000499 
# 000500                          LSB Gtk3 and LSB Graphics (Trial Use):   
# 000501 
# 000502                          None  
# 000503        Rationale for Packages in the Book 
# 000504 
# 000505                          As stated earlier, the goal of LFS is to build a complete and usable foundation-level
# 000506                        system. This includes all packages needed to replicate itself while providing a
# 000507                        relatively minimal base from which to customize a more complete system based on
# 000508                        the choices of the user. This does not mean that LFS is the smallest system possible.
# 000509                        Several important packages are included that are not strictly required. The lists
# 000510                        below document the rationale for each package in the book. 
# 000511 
# 000512                          Acl 
# 000513 
# 000514                          This package contains utilities to administer Access Control Lists, which are used
# 000515                        to define more fine-grained discretionary access rights for files and directories.
# 000516                        
# 000517 
# 000518                          Attr 
# 000519 
# 000520                          This package contains programs for administering extended attributes on filesystem
# 000521                        objects. 
# 000522 
# 000523                          Autoconf 
# 000524 
# 000525                          This package contains programs for producing shell scripts that can automatically
# 000526                        configure source code from a developer's template. It is often needed to rebuild
# 000527                        a package after updates to the build procedures. 
# 000528 
# 000529                          Automake 
# 000530 
# 000531                          This package contains programs for generating Make files from a template. It is
# 000532                        often needed to rebuild a package after updates to the build procedures. 
# 000533 
# 000534                          Bash 
# 000535 
# 000536                          This package satisfies an LSB core requirement to provide a Bourne Shell interface
# 000537                        to the system. It was chosen over other shell packages because of its common usage
# 000538                        and extensive capabilities beyond basic shell functions. 
# 000539 
# 000540                          Bc 
# 000541 
# 000542                          This package provides an arbitrary precision numeric processing language. It satisfies
# 000543                        a requirement needed when building the Linux kernel. 
# 000544 
# 000545                          Binutils 
# 000546 
# 000547                          This package contains a linker, an assembler, and other tools for handling object
# 000548                        files. The programs in this package are needed to compile most of the packages in
# 000549                        an LFS system and beyond. 
# 000550 
# 000551                          Bison 
# 000552 
# 000553                          This package contains the GNU version of yacc (Yet Another Compiler Compiler) needed
# 000554                        to build several other LFS programs. 
# 000555 
# 000556                          Bzip2 
# 000557 
# 000558                          This package contains programs for compressing and decompressing files. It is required
# 000559                        to decompress many LFS packages. 
# 000560 
# 000561                          Check 
# 000562 
# 000563                          This package contains a test harness for other programs. 
# 000564 
# 000565                          Coreutils 
# 000566 
# 000567                          This package contains a number of essential programs for viewing and manipulating
# 000568                        files and directories. These programs are needed for command line file management,
# 000569                        and are necessary for the installation procedures of every package in LFS. 
# 000570 
# 000571                          DejaGNU 
# 000572 
# 000573                          This package contains a framework for testing other programs. 
# 000574 
# 000575                          Diffutils 
# 000576 
# 000577                          This package contains programs that show the differences between files or directories.
# 000578                        These programs can be used to create patches, and are also used in many packages'
# 000579                        build procedures. 
# 000580 
# 000581                          E2fsprogs 
# 000582 
# 000583                          This package contains the utilities for handling the ext2, ext3 and ext4 file systems.
# 000584                        These are the most common and thoroughly tested file systems that Linux supports.
# 000585                        
# 000586 
# 000587                          Eudev 
# 000588 
# 000589                          This package is a device manager. It dynamically controls the ownership, permissions,
# 000590                        names, and symbolic links of devices in the /dev directory as devices are added
# 000591                        or removed from the system. 
# 000592 
# 000593                          Expat 
# 000594 
# 000595                          This package contains a relatively small XML parsing library. It is required by
# 000596                        the XML::Parser Perl module. 
# 000597 
# 000598                          Expect 
# 000599 
# 000600                          This package contains a program for carrying out scripted dialogues with other interactive
# 000601                        programs. It is commonly used for testing other packages. It is only installed in
# 000602                        the temporary toolchain. 
# 000603 
# 000604                          File 
# 000605 
# 000606                          This package contains a utility for determining the type of a given file or files.
# 000607                        A few packages need it in their build scripts. 
# 000608 
# 000609                          Findutils 
# 000610 
# 000611                          This package contains programs to find files in a file system. It is used in many
# 000612                        packages' build scripts. 
# 000613 
# 000614                          Flex 
# 000615 
# 000616                          This package contains a utility for generating programs that recognize patterns
# 000617                        in text. It is the GNU version of the lex (lexical analyzer) program. It is required
# 000618                        to build several LFS packages. 
# 000619 
# 000620                          Gawk 
# 000621 
# 000622                          This package contains programs for manipulating text files. It is the GNU version
# 000623                        of awk (Aho-Weinberg-Kernighan). It is used in many other packages' build scripts.
# 000624                        
# 000625 
# 000626                          GCC 
# 000627 
# 000628                          This package is the Gnu Compiler Collection. It contains the C and C++ compilers
# 000629                        as well as several others not built by LFS. 
# 000630 
# 000631                          GDBM 
# 000632 
# 000633                          This package contains the GNU Database Manager library. It is used by one other
# 000634                        LFS package, Man-DB. 
# 000635 
# 000636                          Gettext 
# 000637 
# 000638                          This package contains utilities and libraries for internationalization and localization
# 000639                        of numerous packages. 
# 000640 
# 000641                          Glibc 
# 000642 
# 000643                          This package contains the main C library. Linux programs will not run without it.
# 000644                        
# 000645 
# 000646                          GMP 
# 000647 
# 000648                          This package contains math libraries that provide useful functions for arbitrary
# 000649                        precision arithmetic. It is required to build GCC. 
# 000650 
# 000651                          Gperf 
# 000652 
# 000653                          This package contains a program that generates a perfect hash function from a key
# 000654                        set. It is required for Eudev. 
# 000655 
# 000656                          Grep 
# 000657 
# 000658                          This package contains programs for searching through files. These programs are used
# 000659                        by most packages' build scripts. 
# 000660 
# 000661                          Groff 
# 000662 
# 000663                          This package contains programs for processing and formatting text. One important
# 000664                        function of these programs is to format man pages. 
# 000665 
# 000666                          GRUB 
# 000667 
# 000668                          This package is the Grand Unified Boot Loader. It is one of several boot loaders
# 000669                        available, but is the most flexible. 
# 000670 
# 000671                          Gzip 
# 000672 
# 000673                          This package contains programs for compressing and decompressing files. It is needed
# 000674                        to decompress many packages in LFS and beyond. 
# 000675 
# 000676                          Iana-etc 
# 000677 
# 000678                          This package provides data for network services and protocols. It is needed to enable
# 000679                        proper networking capabilities. 
# 000680 
# 000681                          Inetutils 
# 000682 
# 000683                          This package contains programs for basic network administration. 
# 000684 
# 000685                          Intltool 
# 000686 
# 000687                          This package contains tools for extracting translatable strings from source files.
# 000688                        
# 000689 
# 000690                          IProute2 
# 000691 
# 000692                          This package contains programs for basic and advanced IPv4 and IPv6 networking.
# 000693                        It was chosen over the other common network tools package (net-tools) for its IPv6
# 000694                        capabilities. 
# 000695 
# 000696                          Kbd 
# 000697 
# 000698                          This package contains key-table files, keyboard utilities for non-US keyboards,
# 000699                        and a number of console fonts. 
# 000700 
# 000701                          Kmod 
# 000702 
# 000703                          This package contains programs needed to administer Linux kernel modules. 
# 000704 
# 000705                          Less 
# 000706 
# 000707                          This package contains a very nice text file viewer that allows scrolling up or down
# 000708                        when viewing a file. It is also used by Man-DB for viewing manpages. 
# 000709 
# 000710                          Libcap 
# 000711 
# 000712                          This package implements the user-space interfaces to the POSIX 1003.1e capabilities
# 000713                        available in Linux kernels. 
# 000714 
# 000715                          Libelf 
# 000716 
# 000717                          The elfutils project provides libraries and tools for ELF files and DWARF data.
# 000718                        Most utilities in this package are available in other packages, but the library
# 000719                        is needed to build the Linux kernel using the default (and most efficient) configuration.
# 000720                        
# 000721 
# 000722                          Libffi 
# 000723 
# 000724                          This package implements a portable, high level programming interface to various
# 000725                        calling conventions. Some programs may not know at the time of compilation what
# 000726                        arguments are to be passed to a function. For instance, an interpreter may be told
# 000727                        at run-time about the number and types of arguments used to call a given function.
# 000728                        Libffi can be used in such programs to provide a bridge from the interpreter program
# 000729                        to compiled code. 
# 000730 
# 000731                          Libpipeline 
# 000732 
# 000733                          The Libpipeline package contains a library for manipulating pipelines of subprocesses
# 000734                        in a flexible and convenient way. It is required by the Man-DB package. 
# 000735 
# 000736                          Libtool 
# 000737 
# 000738                          This package contains the GNU generic library support script. It wraps the complexity
# 000739                        of using shared libraries in a consistent, portable interface. It is needed by the
# 000740                        test suites in other LFS packages. 
# 000741 
# 000742                          Linux Kernel 
# 000743 
# 000744                          This package is the Operating System. It is the Linux in the GNU/Linux environment.
# 000745                        
# 000746 
# 000747                          M4 
# 000748 
# 000749                          This package contains a general text macro processor useful as a build tool for
# 000750                        other programs. 
# 000751 
# 000752                          Make 
# 000753 
# 000754                          This package contains a program for directing the building of packages. It is required
# 000755                        by almost every package in LFS. 
# 000756 
# 000757                          Man-DB 
# 000758 
# 000759                          This package contains programs for finding and viewing man pages. It was chosen
# 000760                        instead of the man package due to superior internationalization capabilities. It
# 000761                        supplies the man program. 
# 000762 
# 000763                          Man-pages 
# 000764 
# 000765                          This package contains the actual contents of the basic Linux man pages. 
# 000766 
# 000767                          Meson 
# 000768 
# 000769                          This package provides a software tool for automating the building of software. The
# 000770                        main goal for Meson is to minimize the amount of time that software developers need
# 000771                        to spend configuring their build system. 
# 000772 
# 000773                          MPC 
# 000774 
# 000775                          This package contains functions for the arithmetic of complex numbers. It is required
# 000776                        by GCC. 
# 000777 
# 000778                          MPFR 
# 000779 
# 000780                          This package contains functions for multiple precision arithmetic. It is required
# 000781                        by GCC. 
# 000782 
# 000783                          Ninja 
# 000784 
# 000785                          This package contains a small build system with a focus on speed. It is designed
# 000786                        to have its input files generated by a higher-level build system, and to run builds
# 000787                        as fast as possible. 
# 000788 
# 000789                          Ncurses 
# 000790 
# 000791                          This package contains libraries for terminal-independent handling of character screens.
# 000792                        It is often used to provide cursor control for a menuing system. It is needed by
# 000793                        a number of packages in LFS. 
# 000794 
# 000795                          Openssl 
# 000796 
# 000797                          This package provides management tools and libraries relating to cryptography. These
# 000798                        are useful for providing cryptographic functions to other packages, including the
# 000799                        Linux kernel. 
# 000800 
# 000801                          Patch 
# 000802 
# 000803                          This package contains a program for modifying or creating files by applying a patch  file
# 000804                        typically created by the diff program. It is needed by the build procedure for several
# 000805                        LFS packages. 
# 000806 
# 000807                          Perl 
# 000808 
# 000809                          This package is an interpreter for the runtime language PERL. It is needed for the
# 000810                        installation and test suites of several LFS packages. 
# 000811 
# 000812                          Pkg-config 
# 000813 
# 000814                          This package provides a program that returns meta-data about an installed library
# 000815                        or package. 
# 000816 
# 000817                          Procps-NG 
# 000818 
# 000819                          This package contains programs for monitoring processes. These programs are useful
# 000820                        for system administration, and are also used by the LFS Bootscripts. 
# 000821 
# 000822                          Psmisc 
# 000823 
# 000824                          This package contains programs for displaying information about running processes.
# 000825                        These programs are useful for system administration. 
# 000826 
# 000827                          Python 3 
# 000828 
# 000829                          This package provides an interpreted language that has a design philosophy that
# 000830                        emphasizes code readability. 
# 000831 
# 000832                          Readline 
# 000833 
# 000834                          This package is a set of libraries that offers command-line editing and history
# 000835                        capabilities. It is used by Bash. 
# 000836 
# 000837                          Sed 
# 000838 
# 000839                          This package allows editing of text without opening it in a text editor. It is also
# 000840                        needed by most LFS packages' configure scripts. 
# 000841 
# 000842                          Shadow 
# 000843 
# 000844                          This package contains programs for handling passwords in a secure way. 
# 000845 
# 000846                          Sysklogd 
# 000847 
# 000848                          This package contains programs for logging system messages, such as those given
# 000849                        by the kernel or daemon processes when unusual events occur. 
# 000850 
# 000851                          Sysvinit 
# 000852 
# 000853                          This package provides the init program, which is the parent of all other processes
# 000854                        on the Linux system. 
# 000855 
# 000856                          Tar 
# 000857 
# 000858                          This package provides archiving and extraction capabilities of virtually all packages
# 000859                        used in LFS. 
# 000860 
# 000861                          Tcl 
# 000862 
# 000863                          This package contains the Tool Command Language used in many test suites in LFS
# 000864                        packages. 
# 000865 
# 000866                          Texinfo 
# 000867 
# 000868                          This package contains programs for reading, writing, and converting info pages.
# 000869                        It is used in the installation procedures of many LFS packages. 
# 000870 
# 000871                          Util-linux 
# 000872 
# 000873                          This package contains miscellaneous utility programs. Among them are utilities for
# 000874                        handling file systems, consoles, partitions, and messages. 
# 000875 
# 000876                          Vim 
# 000877 
# 000878                          This package contains an editor. It was chosen because of its compatibility with
# 000879                        the classic vi editor and its huge number of powerful capabilities. An editor is
# 000880                        a very personal choice for many users and any other editor could be substituted
# 000881                        if desired. 
# 000882 
# 000883                          XML::Parser 
# 000884 
# 000885                          This package is a Perl module that interfaces with Expat. 
# 000886 
# 000887                          XZ Utils 
# 000888 
# 000889                          This package contains programs for compressing and decompressing files. It provides
# 000890                        the highest compression generally available and is useful for decompressing packages
# 000891                        in XZ or LZMA format. 
# 000892 
# 000893                          Zlib 
# 000894 
# 000895                          This package contains compression and decompression routines used by some programs.
# 000896                        
# 000897 
# 000898                          Zstd 
# 000899 
# 000900                          This package contains compression and decompression routines used by some programs.
# 000901                        It provide high compression ratios and a very wide range of compression / speed
# 000902                        trade-offs.  
# 000903        Typography 
# 000904 
# 000905                          To make things easier to follow, there are a few typographical conventions used
# 000906                        throughout this book. This section contains some examples of the typographical format
# 000907                        found throughout Linux From Scratch. 



# 000911 ./configure --prefix=/usr
# 000912 


# 000915 
# 000916                          This form of text is designed to be typed exactly as seen unless otherwise noted
# 000917                        in the surrounding text. It is also used in the explanation sections to identify
# 000918                        which of the commands is being referenced. 
# 000919 
# 000920                          In some cases, a logical line is extended to two or more physical lines with a backslash
# 000921                        at the end of the line. 



# 000925 CC="gcc -B/usr/bin/" ../binutils-2.18/configure \
# 000926   --prefix=/tools --disable-nls --disable-werror
# 000927 


# 000930 
# 000931                          Note that the backslash must be followed by an immediate return. Other whitespace
# 000932                        characters like spaces or tab characters will create incorrect results. 



# 000936 
# 000937 install-info: unknown option '--dir-file=/mnt/lfs/usr/info/dir'
# 000938 


# 000941 
# 000942                          This form of text (fixed-width text) shows screen output, usually as the result
# 000943                        of commands issued. This format is also used to show filenames, such as /etc/ld.so.conf.
# 000944                        
# 000945 
# 000946                          Emphasis  
# 000947 
# 000948                          This form of text is used for several purposes in the book. Its main purpose is
# 000949                        to emphasize important points or items. 
# 000950 
# 000951                          http://www.linuxfromscratch.org/ 
# 000952 
# 000953                          This format is used for hyperlinks both within the LFS community and to external
# 000954                        pages. It includes HOWTOs, download locations, and websites. 



# 000958 cat > $LFS/etc/group << "EOF"
# 000959 root:x:0:
# 000960 bin:x:1:
# 000961 ......
# 000962 EOF
# 000963 


# 000966 
# 000967                          This format is used when creating configuration files. The first command tells the
# 000968                        system to create the file $LFS/etc/groupfrom whatever is typed on the following
# 000969                        lines until the sequence End Of File (EOF) is encountered. Therefore, this entire
# 000970                        section is generally typed as seen. 
# 000971 
# 000972                          <REPLACED TEXT> 
# 000973 
# 000974                          This format is used to encapsulate text that is not to be typed as seen or for copy-and-paste
# 000975                        operations. 
# 000976 
# 000977                          [OPTIONAL TEXT] 
# 000978 
# 000979                          This format is used to encapsulate text that is optional. 
# 000980 
# 000981                          passwd(5)
# 000982 
# 000983                          This format is used to refer to a specific manual (man) page. The number inside
# 000984                        parentheses indicates a specific section inside the manuals. For example, passwd  has
# 000985                        two man pages. Per LFS installation instructions, those two man pages will be located
# 000986                        at /usr/share/man/man1/passwd.1and /usr/share/man/man5/passwd.5. When the book uses
# 000987                        passwd(5)it is specifically referring to /usr/share/man/man5/passwd.5. man passwd  will
# 000988                        print the first man page it finds that matches "passwd " , which will be /usr/share/man/man1/passwd.1.
# 000989                        For this example, you will need to run man 5 passwd  in order to read the page being
# 000990                        specified. Note that most man pages do not have duplicate page names in different
# 000991                        sections. Therefore, man <program name>   is generally sufficient.  
# 000992        Structure 
# 000993 
# 000994                          This book is divided into the following parts. 
# 000995          Part I - Introduction 
# 000996 
# 000997                          Part I explains a few important notes on how to proceed with the LFS installation.
# 000998                        This section also provides meta-information about the book. 
# 000999          Part II - Preparing for the Build 
# 001000 
# 001001                          Part II describes how to prepare for the building process;making a partition, downloading
# 001002                        the packages, and compiling temporary tools. 
# 001003          Part III - Building the LFS Cross Toolchain and Temporary Tools 
# 001004 
# 001005                          Part III provides instructions for building the tools needed for constructing the
# 001006                        final LFS system. 
# 001007          Part IV - Building the LFS System 
# 001008 
# 001009                          Part IV guides the reader through the building of the LFS system;compiling and installing
# 001010                        all the packages one by one, setting up the boot scripts, and installing the kernel.
# 001011                        The resulting Linux system is the foundation on which other software can be built
# 001012                        to expand the system as desired. At the end of this book, there is an easy to use
# 001013                        reference listing all of the programs, libraries, and important files that have
# 001014                        been installed. 
# 001015          Part V - Appendices 
# 001016 
# 001017                          Part V provides information about the book itself including acronyms and terms,
# 001018                        acknowledgments, package dependencies, a listing of LFS boot scripts, licenses for
# 001019                        the distribution of the book, and a comprehensive index of packages, programs, libraries,
# 001020                        and scripts.  
# 001021        Errata 
# 001022 
# 001023                          The software used to create an LFS system is constantly being updated and enhanced.
# 001024                        Security warnings and bug fixes may become available after the LFS book has been
# 001025                        released. To check whether the package versions or instructions in this release
# 001026                        of LFS need any modifications to accommodate security vulnerabilities or other bug
# 001027                        fixes, please visit http://www.linuxfromscratch.org/lfs/errata/10.1/ before proceeding
# 001028                        with your build. You should note any changes shown and apply them to the relevant
# 001029                        section of the book as you progress with building the LFS system.  
# 001030      Part I. Introduction  
# 001031        Chapter 1. Introduction  
# 001032        1.1. How to Build an LFS System 
# 001033 
# 001034                          The LFS system will be built by using an already installed Linux distribution (such
# 001035                        as Debian, OpenMandriva, Fedora, or openSUSE). This existing Linux system (the host)
# 001036                        will be used as a starting point to provide necessary programs, including a compiler,
# 001037                        linker, and shell, to build the new system. Select the "development " option during
# 001038                        the distribution installation to be able to access these tools. 
# 001039 
# 001040                          As an alternative to installing a separate distribution onto your machine, you may
# 001041                        wish to use a LiveCD from a commercial distribution. 
# 001042 
# 001043                          Chapter 2 of this book describes how to create a new Linux native partition and file
# 001044                        system. This is the place where the new LFS system will be compiled and installed.
# 001045                        Chapter 3 explains which packages and patches need to be downloaded to build an LFS
# 001046                        system and how to store them on the new file system. Chapter 4 discusses the setup
# 001047                        of an appropriate working environment. Please read Chapter 4 carefully as it explains
# 001048                        several important issues you need be aware of before beginning to work your way
# 001049                        through Chapter 5 and beyond. 
# 001050 
# 001051                          Chapter 5 , explains the installation of the initial tool chain, (binutils, gcc,
# 001052                        and glibc) using cross compilation techniques to isolate the new tools from the
# 001053                        host system. 
# 001054 
# 001055                          Chapter 6 shows you how to cross-compile basic utilities using the just built cross-toolchain.
# 001056                        
# 001057 
# 001058                          Chapter 7 then enters a "chroot" environment and uses the previously built tools
# 001059                        to build the additional tools needed to build and test the final system. 
# 001060 
# 001061                          This effort to isolate the new system from the host distribution may seem excessive.
# 001062                        A full technical explanation as to why this is done is provided in Toolchain Technical
# 001063                        Notes . 
# 001064 
# 001065                          In Chapter 8 , The full LFS system is built. Another advantage provided by the chroot
# 001066                        environment is that it allows you to continue using the host system while LFS is
# 001067                        being built. While waiting for package compilations to complete, you can continue
# 001068                        using your computer as normal. 
# 001069 
# 001070                          To finish the installation, the basic system configuration is set up in Chapter
# 001071                        9 , and the kernel and boot loader are set up in Chapter 10 . Chapter 11 contains information
# 001072                        on continuing the LFS experience beyond this book. After the steps in this book
# 001073                        have been implemented, the computer will be ready to reboot into the new LFS system.
# 001074                        
# 001075 
# 001076                          This is the process in a nutshell. Detailed information on each step is discussed
# 001077                        in the following chapters and package descriptions. Items that may seem complicated
# 001078                        will be clarified, and everything will fall into place as you embark on the LFS
# 001079                        adventure.  
# 001080        1.2. What's new since the last release 
# 001081 
# 001082                          In this version of LFS, there has been a major reorganization of the book using
# 001083                        techniques that avoid changing the host system and provides a more straight forward
# 001084                        build process. 
# 001085 
# 001086                          Below is a list of package updates made since the previous release of the book.
# 001087                        
# 001088 
# 001089                          Upgraded to: 
# 001090 
# 001091                          Autoconf-2.71 
# 001092 
# 001093                          Automake-1.16.3 
# 001094 
# 001095                          Bash 5.1 
# 001096 
# 001097                          Bc 3.3.0 
# 001098 
# 001099                          Binutils-2.36.1 
# 001100 
# 001101                          Bison-3.7.5 
# 001102 
# 001103                          E2fsprogs-1.46.1 
# 001104 
# 001105                          Eudev-3.2.10 
# 001106 
# 001107                          Expat-2.2.10 
# 001108 
# 001109                          Findutils-4.8.0 
# 001110 
# 001111                          GDBM-1.19 
# 001112 
# 001113                          Glibc-2.33 
# 001114 
# 001115                          GMP-6.2.1 
# 001116 
# 001117                          Grep-3.6 
# 001118 
# 001119                          IANA-Etc-20210202 
# 001120 
# 001121                          Inetutils-2.0 
# 001122 
# 001123                          IPRoute2-5.10.0 
# 001124 
# 001125                          Kbd-2.4.0 
# 001126 
# 001127                          Kmod-28 
# 001128 
# 001129                          Less-563 
# 001130 
# 001131                          Libcap-2.48 
# 001132 
# 001133                          Libelf-0.183 (from elfutils) 
# 001134 
# 001135                          Linux-5.10.17 
# 001136 
# 001137                          Man-DB-2.9.4 
# 001138 
# 001139                          Man-pages-5.10 
# 001140 
# 001141                          Meson-0.57.1 
# 001142 
# 001143                          MPC-1.2.1 
# 001144 
# 001145                          Ninja-1.10.2 
# 001146 
# 001147                          Openssl-1.1.1j 
# 001148 
# 001149                          Perl-5.32.1 
# 001150 
# 001151                          Procps-ng-3.3.17 
# 001152 
# 001153                          Psmisc-23.4 
# 001154 
# 001155                          Python-3.9.2 
# 001156 
# 001157                          SysVinit-2.98 
# 001158 
# 001159                          Tar-1.34 
# 001160 
# 001161                          Tcl-8.6.11 
# 001162 
# 001163                          Tzdata-2021a 
# 001164 
# 001165                          Util-Linux-2.36.2 
# 001166 
# 001167                          Vim-8.2.2433 
# 001168 
# 001169                          Zstd-1.4.8 
# 001170 
# 001171                          Added: 
# 001172 
# 001173                          systemd-247-upstream_fixes-1.patch 
# 001174 
# 001175                          Removed: 
# 001176 
# 001177                          bash-5.0-upstream_fixes-1.patch  
# 001178        1.3. Changelog 
# 001179 
# 001180                          This is version 10.1 of the Linux From Scratch book, dated March 1st, 2021. If this
# 001181                        book is more than six months old, a newer and better version is probably already
# 001182                        available. To find out, please check one of the mirrors via http://www.linuxfromscratch.org/mirrors.html .
# 001183                        
# 001184 
# 001185                          Below is a list of changes made since the previous release of the book. 
# 001186 
# 001187                          Changelog Entries: 
# 001188 
# 001189                          2021-03-01 
# 001190 
# 001191                          [bdubbs] - LFS-10.1 released. 
# 001192 
# 001193                          2021-02-20 
# 001194 
# 001195                          [bdubbs] - Update to meson-0.57.1. Fixes #4821 . 
# 001196 
# 001197                          [bdubbs] - Update to Python-3.9.2. Fixes #4820 . 
# 001198 
# 001199                          [pierre] - Fix grub to prevent generation of a huge binary blob for lzma compression.
# 001200                        Reported on the lfs-support mailing list by Frans de Boer. 
# 001201 
# 001202                          2021-02-18 
# 001203 
# 001204                          [bdubbs] - Fix a glibc bug that causes issues with chrooted applications. Fixes
# 001205                        #4817 . 
# 001206 
# 001207                          [bdubbs] - Update to bc-3.3.0. Fixes #4819 . 
# 001208 
# 001209                          [bdubbs] - Update to openssl-1.1.1j. Fixes #4816 . 
# 001210 
# 001211                          [bdubbs] - Update to meson-0.57.0. Fixes #4815 . 
# 001212 
# 001213                          [bdubbs] - Update to linux-5.10.17. Fixes #4807 . 
# 001214 
# 001215                          2021-02-14 
# 001216 
# 001217                          [renodr] - Add a command explanation for 'pwait'. 
# 001218 
# 001219                          [bdubbs] - Update to util-linux-2.36.2. Fixes #4812 . 
# 001220 
# 001221                          [bdubbs] - Update to tar-1.34. Fixes #4813 . 
# 001222 
# 001223                          [bdubbs] - Update to psmisc-23.4. Fixes #4805 . 
# 001224 
# 001225                          [bdubbs] - Update to procps-ng-3.3.17. Fixes #4811 . 
# 001226 
# 001227                          [bdubbs] - Update to man-db-2.9.4. Fixes #4808 . 
# 001228 
# 001229                          [bdubbs] - Update to eudev-3.2.10. Fixes #4810 . 
# 001230 
# 001231                          [bdubbs] - Update to elfutils-0.183. Fixes #4806 . 
# 001232 
# 001233                          [bdubbs] - Update to e2fsprogs-1.46.1. Fixes #4809 . 
# 001234 
# 001235                          [bdubbs] - Update to bc-3.2.7. Fixes #4814 . 
# 001236 
# 001237                          2021-02-01 
# 001238 
# 001239                          [bdubbs] - Update to iana-etc-20210202. Addresses #4722 . 
# 001240 
# 001241                          [bdubbs] - Update to inetutils-2.0. Fixes #4803 . 
# 001242 
# 001243                          [bdubbs] - Update to libcap-2.48. Fixes #4802 . 
# 001244 
# 001245                          [bdubbs] - Update to binutils-2.36.1. Fixes #4804 . 
# 001246 
# 001247                          [bdubbs] - Update to linux-5.10.13. Fixes #4801 . 
# 001248 
# 001249                          2021-02-02 
# 001250 
# 001251                          [pierre] - Move tcl, expect, and dejagnu just before binutils in chapter 8: this
# 001252                        allows to build them against chapter 8 glibc. 
# 001253 
# 001254                          [pierre] - To allow building with newer version of glibc than the host distribution,
# 001255                        build a "file" executable for the host before cross-compiling it. 
# 001256 
# 001257                          [pierre] - Replace the relinked libctf (which may incorrectly link against libz
# 001258                        from the host distribution) with the one that was linked during "make" in binutils-pass2.
# 001259                        Thanks to Xi Ruoyao for the fix. 
# 001260 
# 001261                          [bdubbs] - Update to bc-3.2.6. Fixes #4800 . 
# 001262 
# 001263                          [bdubbs] - Update to glibc-2.33. Fixes #4799 . 
# 001264 
# 001265                          [bdubbs] - Minor change to mountfs boot script. Fixes #4798 . 
# 001266 
# 001267                          2021-02-01 
# 001268 
# 001269                          [bdubbs] - Update to vim-8.2.2433. Addresses #4500 . 
# 001270 
# 001271                          [bdubbs] - Update to iana-etc-20210115. Addresses #4722 . 
# 001272 
# 001273                          [bdubbs] - Update to bc-3.2.5. Fixes #4797 . 
# 001274 
# 001275                          [bdubbs] - Update to e2fsprogs-1.46.0. Fixes #4796 . 
# 001276 
# 001277                          [bdubbs] - Update to autoconf-2.71. Fixes #4795 . 
# 001278 
# 001279                          [bdubbs] - Update to tzdata-2021a. Fixes #4793 . 
# 001280 
# 001281                          [bdubbs] - Update to perl-5.32.1. Fixes #4792 . 
# 001282 
# 001283                          [bdubbs] - Update to libcap-2.47. Fixes #4791 . 
# 001284 
# 001285                          [bdubbs] - Update to bison-3.7.5. Fixes #4790 . 
# 001286 
# 001287                          [bdubbs] - Update to binutils-2.36. Fixes #4789 . 
# 001288 
# 001289                          [bdubbs] - Update to linux-5.10.12. Fixes #4786 . 
# 001290 
# 001291                          2020-01-16 
# 001292 
# 001293                          [renodr] - Update to findutils-4.8.0. Fixes #4785 . 
# 001294 
# 001295                          [renodr] - Update to kmod-28. Fixes #4784 . 
# 001296 
# 001297                          [renodr] - Update to tar-1.33. Fixes #4783 . 
# 001298 
# 001299                          [renodr] - Update to linux-5.10.7. Fixes #4782 . 
# 001300 
# 001301                          [renodr] - Update to meson-0.56.2. Fixes #4781 . 
# 001302 
# 001303                          [renodr] - Update to tcl-8.6.11. Fixes #4780 . 
# 001304 
# 001305                          2021-01-13 
# 001306 
# 001307                          [xry111] - Fix util-linux uuidd socket path. 
# 001308 
# 001309                          [xry111] - Remove various references to deprecated /var/run, use /run instead. 
# 001310 
# 001311                          [xry111] - Update to lfs-bootscripts-20210113. 
# 001312 
# 001313                          2021-01-01 
# 001314 
# 001315                          [bdubbs] - Update to vim-8.2.2253. Addresses #4500 . 
# 001316 
# 001317                          [bdubbs] - Update to iana-etc-20201229. Addresses #4722 . 
# 001318 
# 001319                          [bdubbs] - Update to gdbm-1.19. Fixes #4779 . 
# 001320 
# 001321                          [bdubbs] - Update to tzdata-2020f. Fixes #4777 . 
# 001322 
# 001323                          [bdubbs] - Update to man-pages-5.10. Fixes #4776 . 
# 001324 
# 001325                          [bdubbs] - Update to iproute2-5.10.0. Fixes #4775 . 
# 001326 
# 001327                          [bdubbs] - Update to zstd-1.4.8. Fixes #4774 . 
# 001328 
# 001329                          [bdubbs] - Update to kbd-2.4.0. Fixes #4773 . 
# 001330 
# 001331                          [bdubbs] - Update to linux-5.10.4. Fixes #4772 . 
# 001332 
# 001333                          2020-12-15 
# 001334 
# 001335                          [bdubbs] - Update to libcap-2.46. Fixes #4771 . 
# 001336 
# 001337                          [bdubbs] - Update to bc-3.2.4. Fixes #4770 . 
# 001338 
# 001339                          [bdubbs] - Update to autoconf-2.70. Fixes #4769 . 
# 001340 
# 001341                          [bdubbs] - Update to openssl-1.1.1i. Fixes #4768 . 
# 001342 
# 001343                          [bdubbs] - Update to Python3-3.9.1. Fixes #4767 . 
# 001344 
# 001345                          [bdubbs] - Update to linux-5.9.14. Fixes #4766 . 
# 001346 
# 001347                          [bdubbs] - Update to bash-5.1 and readline-8.1. Fixes #4764 . 
# 001348 
# 001349                          2020-12-07 
# 001350 
# 001351                          [ken] - Patch meson-0.56.0 to correctly create pkgconfig files re static libraries
# 001352                        (re sysprof in BLFS) . Fixes #4675 . 
# 001353 
# 001354                          2020-12-03 
# 001355 
# 001356                          [renodr] - Update to linux-5.9.12. Fixes #4673 . 
# 001357 
# 001358                          [renodr] - Update to bc-3.2.3. Fixes #4672 . 
# 001359 
# 001360                          2020-12-01 
# 001361 
# 001362                          [bdubbs] - Update to ninja-1.10.2. Fixes #4760 . 
# 001363 
# 001364                          [bdubbs] - Update to bc-3.2.1. Fixes #4759 . 
# 001365 
# 001366                          [bdubbs] - Update to linux-5.9.11. Fixes #4758 . 
# 001367 
# 001368                          [bdubbs] - Update to automake-1.16.3. Fixes #4757 . 
# 001369 
# 001370                          [bdubbs] - Update to sysvinit-2.98. Fixes #4756 . 
# 001371 
# 001372                          [bdubbs] - Update to util-linux-2.36.1. Fixes #4755 . 
# 001373 
# 001374                          [bdubbs] - Update to iana-etc-20201124. Addresses #4722 . 
# 001375 
# 001376                          [bdubbs] - Update to vim-8.2.2070. Addresses #4500 . 
# 001377 
# 001378                          2020-11-15 
# 001379 
# 001380                          [bdubbs] - Update to gmp-6.2.1. Fixes #4754 . 
# 001381 
# 001382                          [bdubbs] - Update to iana-etc-20201110. Addresses #4722 . 
# 001383 
# 001384                          [bdubbs] - Update to man-pages-5.09. Fixes #4750 . 
# 001385 
# 001386                          [bdubbs] - Update to linux-5.9.8. Fixes #4749 . 
# 001387 
# 001388                          [bdubbs] - Update to libcap-2.45. Fixes #4751 . 
# 001389 
# 001390                          [bdubbs] - Update to grep-3.6. Fixes #4752 . 
# 001391 
# 001392                          [bdubbs] - Update to bison-3.7.4. Fixes #4753 . 
# 001393 
# 001394                          2020-11-01 
# 001395 
# 001396                          [bdubbs] - Update to elfutils-0.182. Fixes #4748 . 
# 001397 
# 001398                          [bdubbs] - Update to meson-0.56.0. Fixes #4747 . 
# 001399 
# 001400                          [bdubbs] - Update to linux-5.9.2. Fixes #4746 . 
# 001401 
# 001402                          [bdubbs] - Update to mpc-1.2.1. Fixes #4744 . 
# 001403 
# 001404                          [bdubbs] - Update to less-563. Fixes #4743 . 
# 001405 
# 001406                          [bdubbs] - Update to tzdata-2020d. Fixes #4742 . 
# 001407 
# 001408                          2020-10-19 
# 001409 
# 001410                          [dj] - Update to lfs-bootscripts-20201019. 
# 001411 
# 001412                          2020-10-20 
# 001413 
# 001414                          [bdubbs] - Update to iproute2-5.9.0. Fixes #4739 . 
# 001415 
# 001416                          [bdubbs] - Update to tzdata-2020c. Fixes #4741 . 
# 001417 
# 001418                          [bdubbs] - Update to linux-5.9.1. Fixes #4740 . 
# 001419 
# 001420                          2020-10-15 
# 001421 
# 001422                          [bdubbs] - Update to iana-etc-20201012. Addresses #4722 . 
# 001423 
# 001424                          [bdubbs] - Update to vim-8.2.1845. Addresses #4500 . 
# 001425 
# 001426                          [bdubbs] - Update to bison-3.7.3. Fixes #4738 . 
# 001427 
# 001428                          [bdubbs] - Update to tzdata-2020b. Fixes #4737 . 
# 001429 
# 001430                          [bdubbs] - Update to libcap-2.44. Fixes #4735 . 
# 001431 
# 001432                          [bdubbs] - Update to Python-3.9. Fixes #4736 . 
# 001433 
# 001434                          [bdubbs] - Update to expat-2.2.10. Fixes #4734 . 
# 001435 
# 001436                          [bdubbs] - Update to bc-3.1.6. Fixes #4732 . 
# 001437 
# 001438                          [bdubbs] - Update to linux-5.9. Fixes #4733 . 
# 001439 
# 001440                          2020-10-01 
# 001441 
# 001442                          [bdubbs] - Update to grep-3.5. Fixes #4731 . 
# 001443 
# 001444                          [bdubbs] - Update to Python-3.8.6. Fixes #4730 . 
# 001445 
# 001446                          [bdubbs] - Update to openssl-1.1.1h. Fixes #4729 . 
# 001447 
# 001448                          [bdubbs] - Update to binutils-2.35.1. Fixes #4728 . 
# 001449 
# 001450                          [bdubbs] - Update to linux-5.8.12. Fixes #4727 . 
# 001451 
# 001452                          2020-09-27 
# 001453 
# 001454                          [bdubbs] - Add autoconf-2.69-consolidated_fixes-1.patch which allows autoconf tests
# 001455                        to pass. 
# 001456 
# 001457                          2020-09-15 
# 001458 
# 001459                          [bdubbs] - Update to linux-5.8.9. Fixes #4723 . 
# 001460 
# 001461                          [bdubbs] - Update to bison-3.7.2. Fixes #4724 . 
# 001462 
# 001463                          [bdubbs] - Update to elfutils-0.181. Fixes #4725 . 
# 001464 
# 001465                          [bdubbs] - Update to meson-0.55.3. Fixes #4726 . 
# 001466 
# 001467                          2020-09-02 
# 001468 
# 001469                          [bdubbs] - Update to linux-5.8.5. Fixes #4721 . 
# 001470 
# 001471                          [bdubbs] - Update to ninja-1.10.1. Fixes #4719 . 
# 001472 
# 001473                          [bdubbs] - Update to mpc-1.2.0. Fixes #4717 . 
# 001474 
# 001475                          [bdubbs] - Update to meson-0.55.1. Fixes #4716 . 
# 001476 
# 001477                          [bdubbs] - Update to libcap-2.43. Fixes #4715 . 
# 001478 
# 001479                          2020-09-01 
# 001480 
# 001481                          [bdubbs] - LFS-10.0 released.  
# 001482        1.4. Resources  
# 001483          1.4.1. FAQ 
# 001484 
# 001485                          If during the building of the LFS system you encounter any errors, have any questions,
# 001486                        or think there is a typo in the book, please start by consulting the Frequently
# 001487                        Asked Questions (FAQ) that is located at http://www.linuxfromscratch.org/faq/ .  
# 001488          1.4.2. Mailing Lists 
# 001489 
# 001490                          The linuxfromscratch.orgserver hosts a number of mailing lists used for the development
# 001491                        of the LFS project. These lists include the main development and support lists,
# 001492                        among others. If the FAQ does not solve the problem you are having, the next step
# 001493                        would be to search the mailing lists at http://www.linuxfromscratch.org/search.html .
# 001494                        
# 001495 
# 001496                          For information on the different lists, how to subscribe, archive locations, and
# 001497                        additional information, visit http://www.linuxfromscratch.org/mail.html .  
# 001498          1.4.3. IRC 
# 001499 
# 001500                          Several members of the LFS community offer assistance on Internet Relay Chat (IRC).
# 001501                        Before using this support, please make sure that your question is not already answered
# 001502                        in the LFS FAQ or the mailing list archives. You can find the IRC network at irc.freenode.net.
# 001503                        The support channel is named #LFS-support.  
# 001504          1.4.4. Mirror Sites 
# 001505 
# 001506                          The LFS project has a number of world-wide mirrors to make accessing the website
# 001507                        and downloading the required packages more convenient. Please visit the LFS website
# 001508                        at http://www.linuxfromscratch.org/mirrors.html for a list of current mirrors.  
# 001509          1.4.5. Contact Information 
# 001510 
# 001511                          Please direct all your questions and comments to one of the LFS mailing lists (see
# 001512                        above).  
# 001513        1.5. Help 
# 001514 
# 001515                          If an issue or a question is encountered while working through this book, please
# 001516                        check the FAQ page at http://www.linuxfromscratch.org/faq/#generalfaq . Questions
# 001517                        are often already answered there. If your question is not answered on this page,
# 001518                        try to find the source of the problem. The following hint will give you some guidance
# 001519                        for troubleshooting: http://www.linuxfromscratch.org/hints/downloads/files/errors.txt .
# 001520                        
# 001521 
# 001522                          If you cannot find your problem listed in the FAQ, search the mailing lists at http://www.linuxfromscratch.org/search.html .
# 001523                        
# 001524 
# 001525                          We also have a wonderful LFS community that is willing to offer assistance through
# 001526                        the mailing lists and IRC (see the Section 1.4, "Resources" section of this book).
# 001527                        However, we get several support questions every day and many of them can be easily
# 001528                        answered by going to the FAQ and by searching the mailing lists first. So, for us
# 001529                        to offer the best assistance possible, you need to do some research on your own
# 001530                        first. That allows us to focus on the more unusual support needs. If your searches
# 001531                        do not produce a solution, please include all relevant information (mentioned below)
# 001532                        in your request for help. 
# 001533          1.5.1. Things to Mention 
# 001534 
# 001535                          Apart from a brief explanation of the problem being experienced, the essential things
# 001536                        to include in any request for help are: 
# 001537 
# 001538                          The version of the book being used (in this case 10.1 ) 
# 001539 
# 001540                          The host distribution and version being used to create LFS 
# 001541 
# 001542                          The output from the Host System Requirements script 
# 001543 
# 001544                          The package or section the problem was encountered in 
# 001545 
# 001546                          The exact error message or symptom being received 
# 001547 
# 001548                          Note whether you have deviated from the book at all 
# 001549          Note 
# 001550 
# 001551                          Deviating from this book does not  mean that we will not help you. After all, LFS
# 001552                        is about personal preference. Being upfront about any changes to the established
# 001553                        procedure helps us evaluate and determine possible causes of your problem. 
# 001554          1.5.2. Configure Script Problems 
# 001555 
# 001556                          If something goes wrong while running the configure  script, review the config.logfile.
# 001557                        This file may contain errors encountered during configure  which were not printed
# 001558                        to the screen. Include the relevant  lines if you need to ask for help. 
# 001559          1.5.3. Compilation Problems 
# 001560 
# 001561                          Both the screen output and the contents of various files are useful in determining
# 001562                        the cause of compilation problems. The screen output from the configure  script and
# 001563                        the make  run can be helpful. It is not necessary to include the entire output, but
# 001564                        do include enough of the relevant information. Below is an example of the type of
# 001565                        information to include from the screen output from make  : 



# 001569 
# 001570 gcc -DALIASPATH=\"/mnt/lfs/usr/share/locale:.\"
# 001571 -DLOCALEDIR=\"/mnt/lfs/usr/share/locale\"
# 001572 -DLIBDIR=\"/mnt/lfs/usr/lib\"
# 001573 -DINCLUDEDIR=\"/mnt/lfs/usr/include\" -DHAVE_CONFIG_H -I. -I.
# 001574 -g -O2 -c getopt1.c
# 001575 gcc -g -O2 -static -o make ar.o arscan.o commands.o dir.o
# 001576 expand.o file.o function.o getopt.o implicit.o job.o main.o
# 001577 misc.o read.o remake.o rule.o signame.o variable.o vpath.o
# 001578 default.o remote-stub.o version.o opt1.o
# 001579 -lutil job.o: In function `load_too_high':
# 001580 /lfs/tmp/make-3.79.1/job.c:1565: undefined reference
# 001581 to `getloadavg'
# 001582 collect2: ld returned 1 exit status
# 001583 make[2]: *** [make] Error 1
# 001584 make[2]: Leaving directory `/lfs/tmp/make-3.79.1'
# 001585 make[1]: *** [all-recursive] Error 1
# 001586 make[1]: Leaving directory `/lfs/tmp/make-3.79.1'
# 001587 make: *** [all-recursive-am] Error 2
# 001588 


# 001591 
# 001592                          In this case, many people would just include the bottom section: 



# 001596 
# 001597 make [2]: *** [make] Error 1
# 001598 


# 001601 
# 001602                          This is not enough information to properly diagnose the problem because it only
# 001603                        notes that something went wrong, not what  went wrong. The entire section, as in the
# 001604                        example above, is what should be saved because it includes the command that was
# 001605                        executed and the associated error message(s). 
# 001606 
# 001607                          An excellent article about asking for help on the Internet is available online at
# 001608                        http://catb.org/~esr/faqs/smart-questions.html . Read and follow the hints in this
# 001609                        document to increase the likelihood of getting the help you need.  
# 001610      Part II. Preparing for the Build  
# 001611        Chapter 2. Preparing the Host System  
# 001612        2.1. Introduction 
# 001613 
# 001614                          In this chapter, the host tools needed for building LFS are checked and, if necessary,
# 001615                        installed. Then a partition which will host the LFS system is prepared. We will
# 001616                        create the partition itself, create a file system on it, and mount it. 


read -p "Chapter 2.2"
 
# 001617        2.2. Host System Requirements 
# 001618 
# 001619                          Your host system should have the following software with the minimum versions indicated.
# 001620                        This should not be an issue for most modern Linux distributions. Also note that
# 001621                        many distributions will place software headers into separate packages, often in
# 001622                        the form of "<package-name>-devel " or "<package-name>-dev " . Be sure to install those
# 001623                        if your distribution provides them. 
# 001624 
# 001625                          Earlier versions of the listed software packages may work, but have not been tested.
# 001626                        
# 001627 
# 001628                          Bash-3.2  (/bin/sh should be a symbolic or hard link to bash) 
# 001629 
# 001630                          Binutils-2.25  (Versions greater than 2.36.1 are not recommended as they have not
# 001631                        been tested) 
# 001632 
# 001633                          Bison-2.7  (/usr/bin/yacc should be a link to bison or small script that executes
# 001634                        bison) 
# 001635 
# 001636                          Bzip2-1.0.4  
# 001637 
# 001638                          Coreutils-6.9  
# 001639 
# 001640                          Diffutils-2.8.1  
# 001641 
# 001642                          Findutils-4.2.31  
# 001643 
# 001644                          Gawk-4.0.1  (/usr/bin/awk should be a link to gawk) 
# 001645 
# 001646                          GCC-6.2  including the C++ compiler, g++  (Versions greater than 10.2.0 are not recommended
# 001647                        as they have not been tested) 
# 001648 
# 001649                          Glibc-2.11  (Versions greater than 2.33 are not recommended as they have not been
# 001650                        tested) 
# 001651 
# 001652                          Grep-2.5.1a  
# 001653 
# 001654                          Gzip-1.3.12  
# 001655 
# 001656                          Linux Kernel-3.2  
# 001657 
# 001658                          The reason for the kernel version requirement is that we specify that version when
# 001659                        building glibc in Chapter 6 at the recommendation of the developers. It is also required
# 001660                        by udev. 
# 001661 
# 001662                          If the host kernel is earlier than 3.2 you will need to replace the kernel with
# 001663                        a more up to date version. There are two ways you can go about this. First, see
# 001664                        if your Linux vendor provides a 3.2 or later kernel package. If so, you may wish
# 001665                        to install it. If your vendor doesn't offer an acceptable kernel package, or you
# 001666                        would prefer not to install it, you can compile a kernel yourself. Instructions
# 001667                        for compiling the kernel and configuring the boot loader (assuming the host uses
# 001668                        GRUB) are located in Chapter 10 . 
# 001669 
# 001670                          M4-1.4.10  
# 001671 
# 001672                          Make-4.0  
# 001673 
# 001674                          Patch-2.5.4  
# 001675 
# 001676                          Perl-5.8.8  
# 001677 
# 001678                          Python-3.4  
# 001679 
# 001680                          Sed-4.1.5  
# 001681 
# 001682                          Tar-1.22  
# 001683 
# 001684                          Texinfo-4.7  
# 001685 
# 001686                          Xz-5.0.0  
# 001687          Important 
# 001688 
# 001689                          Note that the symlinks mentioned above are required to build an LFS system using
# 001690                        the instructions contained within this book. Symlinks that point to other software
# 001691                        (such as dash, mawk, etc.) may work, but are not tested or supported by the LFS
# 001692                        development team, and may require either deviation from the instructions or additional
# 001693                        patches to some packages.  
# 001694 
# 001695                          
# 001696 To see whether your host system has all the appropriate versions, and the ability
# 001697                        to compile programs, run the following: 



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


 
# 001763        2.3. Building LFS in Stages 
# 001764 
# 001765                          LFS is designed to be built in one session. That is, the instructions assume that
# 001766                        the system will not be shut down during the process. That does not mean that the
# 001767                        system has to be done in one sitting. The issue is that certain procedures have
# 001768                        to be re-accomplished after a reboot if resuming LFS at different points. 
# 001769          2.3.1. Chapters 1-4 
# 001770 
# 001771                          These chapters are accomplished on the host system. When restarting, be careful
# 001772                        of the following: 
# 001773 
# 001774                          Procedures done as the rootuser after Section 2.4 need to have the LFS environment
# 001775                        variable set FOR THE ROOT USER  . 
# 001776          2.3.2. Chapter 5-6 
# 001777 
# 001778                          The /mnt/lfs partition must be mounted. 
# 001779 
# 001780                          These two chapters must  be done as user lfs. A su - lfs  needs to be done before any
# 001781                        task in these chapters. Failing to do that, you are at risk of installing packages
# 001782                        to the host, and potentially rendering it unusable. 
# 001783 
# 001784                          The procedures in General Compilation Instructions are critical. If there is any
# 001785                        doubt about installing a package, ensure any previously expanded tarballs are removed,
# 001786                        then re-extract the package files, and complete all instructions in that section.
# 001787                        
# 001788          2.3.3. Chapter 7-10 
# 001789 
# 001790                          The /mnt/lfs partition must be mounted. 
# 001791 
# 001792                          A few operations, from "Changing Ownership " to "Entering the Chroot Environment " must
# 001793                        be done as the rootuser, with the LFS environment variable set for the rootuser.
# 001794                        
# 001795 
# 001796                          When entering chroot, the LFS environment variable must be set for root. The LFS
# 001797                        variable is not used afterwards. 
# 001798 
# 001799                          The virtual file systems must be mounted. This can be done before or after entering
# 001800                        chroot by changing to a host virtual terminal and, as root, running the commands
# 001801                        in Section 7.3.2, "Mounting and Populating /dev" and Section 7.3.3, "Mounting Virtual
# 001802                        Kernel File Systems" .  
# 001803        2.4. Creating a New Partition 
# 001804 
# 001805                          Like most other operating systems, LFS is usually installed on a dedicated partition.
# 001806                        The recommended approach to building an LFS system is to use an available empty
# 001807                        partition or, if you have enough unpartitioned space, to create one. 
# 001808 
# 001809                          A minimal system requires a partition of around 10 gigabytes (GB). This is enough
# 001810                        to store all the source tarballs and compile the packages. However, if the LFS system
# 001811                        is intended to be the primary Linux system, additional software will probably be
# 001812                        installed which will require additional space. A 30 GB partition is a reasonable
# 001813                        size to provide for growth. The LFS system itself will not take up this much room.
# 001814                        A large portion of this requirement is to provide sufficient free temporary storage
# 001815                        as well as for adding additional capabilities after LFS is complete. Additionally,
# 001816                        compiling packages can require a lot of disk space which will be reclaimed after
# 001817                        the package is installed. 
# 001818 
# 001819                          Because there is not always enough Random Access Memory (RAM) available for compilation
# 001820                        processes, it is a good idea to use a small disk partition as swapspace. This is
# 001821                        used by the kernel to store seldom-used data and leave more memory available for
# 001822                        active processes. The swappartition for an LFS system can be the same as the one
# 001823                        used by the host system, in which case it is not necessary to create another one.
# 001824                        
# 001825 
# 001826                          Start a disk partitioning program such as cfdisk  or fdisk  with a command line option
# 001827                        naming the hard disk on which the new partition will be created;for example /dev/sdafor
# 001828                        the primary disk drive. Create a Linux native partition and a swappartition, if
# 001829                        needed. Please refer to cfdisk(8)or fdisk(8)if you do not yet know how to use the
# 001830                        programs. 
# 001831          Note 
# 001832 
# 001833                          For experienced users, other partitioning schemes are possible. The new LFS system
# 001834                        can be on a software RAID array or an LVM logical volume. However, some of these options
# 001835                        require an initramfs , which is an advanced topic. These partitioning methodologies
# 001836                        are not recommended for first time LFS users. 
# 001837 
# 001838                          Remember the designation of the new partition (e.g., sda5). This book will refer
# 001839                        to this as the LFS partition. Also remember the designation of the swappartition.
# 001840                        These names will be needed later for the /etc/fstabfile. 
# 001841          2.4.1. Other Partition Issues 
# 001842 
# 001843                          Requests for advice on system partitioning are often posted on the LFS mailing lists.
# 001844                        This is a highly subjective topic. The default for most distributions is to use
# 001845                        the entire drive with the exception of one small swap partition. This is not optimal
# 001846                        for LFS for several reasons. It reduces flexibility, makes sharing of data across
# 001847                        multiple distributions or LFS builds more difficult, makes backups more time consuming,
# 001848                        and can waste disk space through inefficient allocation of file system structures.
# 001849                         
# 001850            2.4.1.1. The Root Partition 
# 001851 
# 001852                          A root LFS partition (not to be confused with the /rootdirectory) of twenty gigabytes
# 001853                        is a good compromise for most systems. It provides enough space to build LFS and
# 001854                        most of BLFS, but is small enough so that multiple partitions can be easily created
# 001855                        for experimentation.  
# 001856            2.4.1.2. The Swap Partition 
# 001857 
# 001858                          Most distributions automatically create a swap partition. Generally the recommended
# 001859                        size of the swap partition is about twice the amount of physical RAM, however this
# 001860                        is rarely needed. If disk space is limited, hold the swap partition to two gigabytes
# 001861                        and monitor the amount of disk swapping. 
# 001862 
# 001863                          If you want to use the hibernation feature (suspend-to-disk) of Linux, it writes
# 001864                        out the contents of RAM to the swap partition before turning off the machine. In
# 001865                        this case the size of the swap partition should be at least as large as the system's
# 001866                        installed RAM. 
# 001867 
# 001868                          Swapping is never good. For mechanical hard drives you can generally tell if a system
# 001869                        is swapping by just listening to disk activity and observing how the system reacts
# 001870                        to commands. For an SSD drive you will not be able to hear swapping but you can
# 001871                        tell how much swap space is being used by the top  or free  programs. Use of an SSD
# 001872                        drive for a swap partition should be avoided if possible. The first reaction to
# 001873                        swapping should be to check for an unreasonable command such as trying to edit a
# 001874                        five gigabyte file. If swapping becomes a normal occurrence, the best solution is
# 001875                        to purchase more RAM for your system.  
# 001876            2.4.1.3. The Grub Bios Partition 
# 001877 
# 001878                          If the boot disk  has been partitioned with a GUID Partition Table (GPT), then a small,
# 001879                        typically 1 MB, partition must be created if it does not already exist. This partition
# 001880                        is not formatted, but must be available for GRUB to use during installation of the
# 001881                        boot loader. This partition will normally be labeled 'BIOS Boot' if using fdisk  or
# 001882                        have a code of EF02  if using gdisk  . 
# 001883          Note 
# 001884 
# 001885                          The Grub Bios partition must be on the drive that the BIOS uses to boot the system.
# 001886                        This is not necessarily the same drive where the LFS root partition is located.
# 001887                        Disks on a system may use different partition table types. The requirement for this
# 001888                        partition depends only on the partition table type of the boot disk.  
# 001889            2.4.1.4. Convenience Partitions 
# 001890 
# 001891                          There are several other partitions that are not required, but should be considered
# 001892                        when designing a disk layout. The following list is not comprehensive, but is meant
# 001893                        as a guide. 
# 001894 
# 001895                          /boot - Highly recommended. Use this partition to store kernels and other booting
# 001896                        information. To minimize potential boot problems with larger disks, make this the
# 001897                        first physical partition on your first disk drive. A partition size of 200 megabytes
# 001898                        is quite adequate. 
# 001899 
# 001900                          /home - Highly recommended. Share your home directory and user customization across
# 001901                        multiple distributions or LFS builds. The size is generally fairly large and depends
# 001902                        on available disk space. 
# 001903 
# 001904                          /usr - A separate /usr partition is generally used if providing a server for a thin
# 001905                        client or diskless workstation. It is normally not needed for LFS. A size of ten
# 001906                        gigabytes will handle most installations. 
# 001907 
# 001908                          /opt - This directory is most useful for BLFS where multiple installations of large
# 001909                        packages like Gnome or KDE can be installed without embedding the files in the /usr
# 001910                        hierarchy. If used, 5 to 10 gigabytes is generally adequate. 
# 001911 
# 001912                          /tmp - A separate /tmp directory is rare, but useful if configuring a thin client.
# 001913                        This partition, if used, will usually not need to exceed a couple of gigabytes.
# 001914                        
# 001915 
# 001916                          /usr/src - This partition is very useful for providing a location to store BLFS
# 001917                        source files and share them across LFS builds. It can also be used as a location
# 001918                        for building BLFS packages. A reasonably large partition of 30-50 gigabytes allows
# 001919                        plenty of room. 
# 001920 
# 001921                          Any separate partition that you want automatically mounted upon boot needs to be
# 001922                        specified in the /etc/fstab. Details about how to specify partitions will be discussed
# 001923                        in Section 10.2, "Creating the /etc/fstab File" .  
# 001924        2.5. Creating a File System on the Partition 
# 001925 
# 001926                          Now that a blank partition has been set up, the file system can be created. LFS
# 001927                        can use any file system recognized by the Linux kernel, but the most common types
# 001928                        are ext3 and ext4. The choice of file system can be complex and depends on the characteristics
# 001929                        of the files and the size of the partition. For example: 
# 001930 
# 001931                ext2 
# 001932 
# 001933                          is suitable for small partitions that are updated infrequently such as /boot. 
# 001934 
# 001935                ext3 
# 001936 
# 001937                          is an upgrade to ext2 that includes a journal to help recover the partition's status
# 001938                        in the case of an unclean shutdown. It is commonly used as a general purpose file
# 001939                        system. 
# 001940 
# 001941                ext4 
# 001942 
# 001943                          is the latest version of the ext file system family of partition types. It provides
# 001944                        several new capabilities including nano-second timestamps, creation and use of very
# 001945                        large files (16 TB), and speed improvements. 
# 001946 
# 001947                          Other file systems, including FAT32, NTFS, ReiserFS, JFS, and XFS are useful for
# 001948                        specialized purposes. More information about these file systems can be found at
# 001949                        http://en.wikipedia.org/wiki/Comparison_of_file_systems . 
# 001950 
# 001951                          LFS assumes that the root file system (/) is of type ext4. To create an ext4file
# 001952                        system on the LFS partition, run the following: 



# 001956 mkfs -v -t ext4 /dev/<xxx>
# 001957 

 
# 001960 
# 001961                          Replace <xxx> with the name of the LFS partition. 
# 001962 
# 001963                          If you are using an existing swappartition, there is no need to format it. If a
# 001964                        new swappartition was created, it will need to be initialized with this command:
# 001965                        



# 001969 mkswap /dev/<yyy>
# 001970 

 
# 001973 
# 001974                          Replace <yyy> with the name of the swappartition. 


read -p "Chapter 2.6"
 
# 001975        2.6. Setting The $LFS Variable 
# 001976 
# 001977                          Throughout this book, the environment variable LFSwill be used several times. You
# 001978                        should ensure that this variable is always defined throughout the LFS build process.
# 001979                        It should be set to the name of the directory where you will be building your LFS
# 001980                        system - we will use /mnt/lfsas an example, but the directory choice is up to you.
# 001981                        If you are building LFS on a separate partition, this directory will be the mount
# 001982                        point for the partition. Choose a directory location and set the variable with the
# 001983                        following command: 



export LFS=/mnt/lfs


 
# 001991 
# 001992                          Having this variable set is beneficial in that commands such as mkdir -v $LFS/tools  can
# 001993                        be typed literally. The shell will automatically replace "$LFS " with "/mnt/lfs " (or
# 001994                        whatever the variable was set to) when it processes the command line. 
# 001995          Caution 
# 001996 
# 001997                          Do not forget to check that LFSis set whenever you leave and reenter the current
# 001998                        working environment (such as when doing a su  to rootor another user). Check that
# 001999                        the LFSvariable is set up properly with: 



echo $LFS



# 002007 
# 002008                          Make sure the output shows the path to your LFS system's build location, which is
# 002009                        /mnt/lfsif the provided example was followed. If the output is incorrect, use the
# 002010                        command given earlier on this page to set $LFSto the correct directory name. 
# 002011          Note 
# 002012 
# 002013                          One way to ensure that the LFSvariable is always set is to edit the .bash_profilefile
# 002014                        in both your personal home directory and in /root/.bash_profileand enter the export
# 002015                        command above. In addition, the shell specified in the /etc/passwdfile for all users
# 002016                        that need the LFSvariable needs to be bash to ensure that the /root/.bash_profilefile
# 002017                        is incorporated as a part of the login process. 
# 002018 
# 002019                          Another consideration is the method that is used to log into the host system. If
# 002020                        logging in through a graphical display manager, the user's .bash_profileis not normally
# 002021                        used when a virtual terminal is started. In this case, add the export command to
# 002022                        the .bashrcfile for the user and root. In addition, some distributions have instructions
# 002023                        to not run the .bashrcinstructions in a non-interactive bash invocation. Be sure
# 002024                        to add the export command before the test for non-interactive use.  
# 002025        2.7. Mounting the New Partition 
# 002026 
# 002027                          Now that a file system has been created, the partition needs to be made accessible.
# 002028                        In order to do this, the partition needs to be mounted at a chosen mount point.
# 002029                        For the purposes of this book, it is assumed that the file system is mounted under
# 002030                        the directory specified by the LFSenvironment variable as described in the previous
# 002031                        section. 
# 002032 
# 002033                          Create the mount point and mount the LFS file system by running: 



# 002037 mkdir -pv $LFS
# 002038 mount -v -t ext4 /dev/<xxx> $LFS
# 002039 

 
# 002042 
# 002043                          Replace <xxx> with the designation of the LFS partition. 
# 002044 
# 002045                          If using multiple partitions for LFS (e.g., one for /and another for /usr), mount
# 002046                        them using: 



# 002050 mkdir -pv $LFS
# 002051 mount -v -t ext4 /dev/<xxx> $LFS
# 002052 mkdir -v $LFS/usr
# 002053 mount -v -t ext4 /dev/<yyy> $LFS/usr
# 002054 

 
# 002057 
# 002058                          Replace <xxx> and <yyy> with the appropriate partition names. 
# 002059 
# 002060                          Ensure that this new partition is not mounted with permissions that are too restrictive
# 002061                        (such as the nosuidor nodevoptions). Run the mount  command without any parameters
# 002062                        to see what options are set for the mounted LFS partition. If nosuidand/or nodevare
# 002063                        set, the partition will need to be remounted. 
# 002064          Warning 
# 002065 
# 002066                          The above instructions assume that you will not be restarting your computer throughout
# 002067                        the LFS process. If you shut down your system, you will either need to remount the
# 002068                        LFS partition each time you restart the build process or modify your host system's
# 002069                        /etc/fstab file to automatically remount it upon boot. For example: 



# 002073 /dev/<xxx>  /mnt/lfs ext4   defaults      1     1
# 002074 

 
# 002077 
# 002078                          If you use additional optional partitions, be sure to add them also. 
# 002079 
# 002080                          If you are using a swappartition, ensure that it is enabled using the swapon  command:
# 002081                        



# 002085 /sbin/swapon -v /dev/<zzz>
# 002086 

 
# 002089 
# 002090                          Replace <zzz> with the name of the swappartition. 
# 002091 
# 002092                          Now that there is an established place to work, it is time to download the packages.
# 002093                         
# 002094        Chapter 3. Packages and Patches 


read -p "Chapter 3.1"
 
# 002095        3.1. Introduction 
# 002096 
# 002097                          This chapter includes a list of packages that need to be downloaded in order to
# 002098                        build a basic Linux system. The listed version numbers correspond to versions of
# 002099                        the software that are known to work, and this book is based on their use. We highly
# 002100                        recommend against using newer versions because the build commands for one version
# 002101                        may not work with a newer version. The newest package versions may also have problems
# 002102                        that require work-arounds. These work-arounds will be developed and stabilized in
# 002103                        the development version of the book. 
# 002104 
# 002105                          Download locations may not always be accessible. If a download location has changed
# 002106                        since this book was published, Google (http://www.google.com/ ) provides a useful
# 002107                        search engine for most packages. If this search is unsuccessful, try one of the
# 002108                        alternative means of downloading discussed at http://www.linuxfromscratch.org/lfs/packages.html#packages .
# 002109                        
# 002110 
# 002111                          Downloaded packages and patches will need to be stored somewhere that is conveniently
# 002112                        available throughout the entire build. A working directory is also required to unpack
# 002113                        the sources and build them. $LFS/sourcescan be used both as the place to store the
# 002114                        tarballs and patches and as a working directory. By using this directory, the required
# 002115                        elements will be located on the LFS partition and will be available during all stages
# 002116                        of the building process. 
# 002117 
# 002118                          To create this directory, execute the following command, as user root, before starting
# 002119                        the download session: 



mkdir -v $LFS/sources



# 002127 
# 002128                          Make this directory writable and sticky. "Sticky " means that even if multiple users
# 002129                        have write permission on a directory, only the owner of a file can delete the file
# 002130                        within a sticky directory. The following command will enable the write and sticky
# 002131                        modes: 



chmod -v a+wt $LFS/sources



# 002139 
# 002140                          There are several ways to optain all the necessary packages and patches to build
# 002141                        LFS: 
# 002142 
# 002143                          The files can be downloaded individually as described in the next two sections.
# 002144                        
# 002145 
# 002146                          For stable versions of the book, a tarball of all the needed files can be downloaded
# 002147                        from one of the LFS files mirrors listed at http://www.linuxfromscratch.org/mirrors.html#files .
# 002148                        
# 002149 
# 002150                          The files can be downloaded using wget  and a wget-list as described below. 
# 002151 
# 002152                          To download all of the packages and patches by using wget-list as an input to the
# 002153                        wget  command, use: 



wget --input-file=wget-list --continue --directory-prefix=$LFS/sources



# 002161 
# 002162                          Additionally, starting with LFS-7.0, there is a separate file, md5sums , which can
# 002163                        be used to verify that all the correct packages are available before proceeding.
# 002164                        Place that file in $LFS/sourcesand run: 



pushd $LFS/sources
  md5sum -c md5sums
popd



# 002174 
# 002175                          This check can be used after retrieving the needed files with any of the methods
# 002176                        listed above.  
# 002177        3.2. All Packages 
# 002178 
# 002179                          Download or otherwise obtain the following packages: 
# 002180 
# 002181                Acl (2.2.53) - 513 KB: 
# 002182 
# 002183                          Home page: https://savannah.nongnu.org/projects/acl 
# 002184 
# 002185                          Download: http://download.savannah.gnu.org/releases/acl/acl-2.2.53.tar.gz 
# 002186 
# 002187                          MD5 sum: 007aabf1dbb550bcddde52a244cd1070
# 002188 
# 002189                Attr (2.4.48) - 457 KB: 
# 002190 
# 002191                          Home page: https://savannah.nongnu.org/projects/attr 
# 002192 
# 002193                          Download: http://download.savannah.gnu.org/releases/attr/attr-2.4.48.tar.gz 
# 002194 
# 002195                          MD5 sum: bc1e5cb5c96d99b24886f1f527d3bb3d
# 002196 
# 002197                Autoconf (2.71) - 1,263 KB: 
# 002198 
# 002199                          Home page: http://www.gnu.org/software/autoconf/ 
# 002200 
# 002201                          Download: http://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.xz 
# 002202 
# 002203                          MD5 sum: 12cfa1687ffa2606337efe1a64416106
# 002204 
# 002205                Automake (1.16.3) - 1,554 KB: 
# 002206 
# 002207                          Home page: http://www.gnu.org/software/automake/ 
# 002208 
# 002209                          Download: http://ftp.gnu.org/gnu/automake/automake-1.16.3.tar.xz 
# 002210 
# 002211                          MD5 sum: c27f608a4e1f302ec7ce42f1251c184e
# 002212 
# 002213                Bash (5.1) - 10,214 KB: 
# 002214 
# 002215                          Home page: http://www.gnu.org/software/bash/ 
# 002216 
# 002217                          Download: http://ftp.gnu.org/gnu/bash/bash-5.1.tar.gz 
# 002218 
# 002219                          MD5 sum: bb91a17fd6c9032c26d0b2b78b50aff5
# 002220 
# 002221                Bc (3.3.0) - 225 KB: 
# 002222 
# 002223                          Home page: https://git.yzena.com/gavin/bc 
# 002224 
# 002225                          Download: https://github.com/gavinhoward/bc/releases/download/3.3.0/bc-3.3.0.tar.xz 
# 002226 
# 002227                          MD5 sum: 452ae2d467b1d7212bb7896c0c689825
# 002228 
# 002229                Binutils (2.36.1) - 22,239 KB: 
# 002230 
# 002231                          Home page: http://www.gnu.org/software/binutils/ 
# 002232 
# 002233                          Download: http://ftp.gnu.org/gnu/binutils/binutils-2.36.1.tar.xz 
# 002234 
# 002235                          MD5 sum: 628d490d976d8957279bbbff06cf29d4
# 002236 
# 002237                Bison (3.7.5) - 2,561 KB: 
# 002238 
# 002239                          Home page: http://www.gnu.org/software/bison/ 
# 002240 
# 002241                          Download: http://ftp.gnu.org/gnu/bison/bison-3.7.5.tar.xz 
# 002242 
# 002243                          MD5 sum: 9b762dc24a6723f86d14d957d3deeb90
# 002244 
# 002245                Bzip2 (1.0.8) - 792 KB: 
# 002246 
# 002247                          Download: https://www.sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz 
# 002248 
# 002249                          MD5 sum: 67e051268d0c475ea773822f7500d0e5
# 002250 
# 002251                Check (0.15.2) - 760 KB: 
# 002252 
# 002253                          Home page: https://libcheck.github.io/check 
# 002254 
# 002255                          Download: https://github.com/libcheck/check/releases/download/0.15.2/check-0.15.2.tar.gz 
# 002256 
# 002257                          MD5 sum: 50fcafcecde5a380415b12e9c574e0b2
# 002258 
# 002259                Coreutils (8.32) - 5,418 KB: 
# 002260 
# 002261                          Home page: http://www.gnu.org/software/coreutils/ 
# 002262 
# 002263                          Download: http://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz 
# 002264 
# 002265                          MD5 sum: 022042695b7d5bcf1a93559a9735e668
# 002266 
# 002267                DejaGNU (1.6.2) - 514 KB: 
# 002268 
# 002269                          Home page: http://www.gnu.org/software/dejagnu/ 
# 002270 
# 002271                          Download: http://ftp.gnu.org/gnu/dejagnu/dejagnu-1.6.2.tar.gz 
# 002272 
# 002273                          MD5 sum: e1b07516533f351b3aba3423fafeffd6
# 002274 
# 002275                Diffutils (3.7) - 1,415 KB: 
# 002276 
# 002277                          Home page: http://www.gnu.org/software/diffutils/ 
# 002278 
# 002279                          Download: http://ftp.gnu.org/gnu/diffutils/diffutils-3.7.tar.xz 
# 002280 
# 002281                          MD5 sum: 4824adc0e95dbbf11dfbdfaad6a1e461
# 002282 
# 002283                E2fsprogs (1.46.1) - 9,269 KB: 
# 002284 
# 002285                          Home page: http://e2fsprogs.sourceforge.net/ 
# 002286 
# 002287                          Download: https://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v1.46.1/e2fsprogs-1.46.1.tar.gz 
# 002288 
# 002289                          MD5 sum: 8c52585522b7ca6bdae2bdecba27b3a4
# 002290 
# 002291                Elfutils (0.183) - 8,896 KB: 
# 002292 
# 002293                          Home page: https://sourceware.org/ftp/elfutils/ 
# 002294 
# 002295                          Download: https://sourceware.org/ftp/elfutils/0.183/elfutils-0.183.tar.bz2 
# 002296 
# 002297                          MD5 sum: 6f58aa1b9af1a5681b1cbf63e0da2d67
# 002298 
# 002299                Eudev (3.2.10) - 1,916 KB: 
# 002300 
# 002301                          Download: https://dev.gentoo.org/~blueness/eudev/eudev-3.2.10.tar.gz 
# 002302 
# 002303                          MD5 sum: 60b135a189523f333cea5f71a3345c8d
# 002304 
# 002305                Expat (2.2.10) - 416 KB: 
# 002306 
# 002307                          Home page: https://libexpat.github.io/ 
# 002308 
# 002309                          Download: https://prdownloads.sourceforge.net/expat/expat-2.2.10.tar.xz 
# 002310 
# 002311                          MD5 sum: e0fe49a6b3480827c9455e4cfc799133
# 002312 
# 002313                Expect (5.45.4) - 618 KB: 
# 002314 
# 002315                          Home page: https://core.tcl.tk/expect/ 
# 002316 
# 002317                          Download: https://prdownloads.sourceforge.net/expect/expect5.45.4.tar.gz 
# 002318 
# 002319                          MD5 sum: 00fce8de158422f5ccd2666512329bd2
# 002320 
# 002321                File (5.39) - 932 KB: 
# 002322 
# 002323                          Home page: https://www.darwinsys.com/file/ 
# 002324 
# 002325                          Download: http://ftp.astron.com/pub/file/file-5.39.tar.gz 
# 002326 
# 002327                          MD5 sum: 1c450306053622803a25647d88f80f25
# 002328          Note 
# 002329 
# 002330                          File (5.39) may no longer be available at the listed location. The site administrators
# 002331                        of the master download location occasionally remove older versions when new ones
# 002332                        are released. An alternative download location that may have the correct version
# 002333                        available can also be found at: http://www.linuxfromscratch.org/lfs/download.html#ftp .
# 002334                        
# 002335 
# 002336                Findutils (4.8.0) - 1,940 KB: 
# 002337 
# 002338                          Home page: http://www.gnu.org/software/findutils/ 
# 002339 
# 002340                          Download: http://ftp.gnu.org/gnu/findutils/findutils-4.8.0.tar.xz 
# 002341 
# 002342                          MD5 sum: eeefe2e6380931a77dfa6d9350b43186
# 002343 
# 002344                Flex (2.6.4) - 1,386 KB: 
# 002345 
# 002346                          Home page: https://github.com/westes/flex 
# 002347 
# 002348                          Download: https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz 
# 002349 
# 002350                          MD5 sum: 2882e3179748cc9f9c23ec593d6adc8d
# 002351 
# 002352                Gawk (5.1.0) - 3,081 KB: 
# 002353 
# 002354                          Home page: http://www.gnu.org/software/gawk/ 
# 002355 
# 002356                          Download: http://ftp.gnu.org/gnu/gawk/gawk-5.1.0.tar.xz 
# 002357 
# 002358                          MD5 sum: 8470c34eeecc41c1aa0c5d89e630df50
# 002359 
# 002360                GCC (10.2.0) - 73,247 KB: 
# 002361 
# 002362                          Home page: https://gcc.gnu.org/ 
# 002363 
# 002364                          Download: http://ftp.gnu.org/gnu/gcc/gcc-10.2.0/gcc-10.2.0.tar.xz 
# 002365 
# 002366                          MD5 sum: e9fd9b1789155ad09bcf3ae747596b50
# 002367 
# 002368                GDBM (1.19) - 946 KB: 
# 002369 
# 002370                          Home page: http://www.gnu.org/software/gdbm/ 
# 002371 
# 002372                          Download: http://ftp.gnu.org/gnu/gdbm/gdbm-1.19.tar.gz 
# 002373 
# 002374                          MD5 sum: aeb29c6a90350a4c959cd1df38cd0a7e
# 002375 
# 002376                Gettext (0.21) - 9,487 KB: 
# 002377 
# 002378                          Home page: http://www.gnu.org/software/gettext/ 
# 002379 
# 002380                          Download: http://ftp.gnu.org/gnu/gettext/gettext-0.21.tar.xz 
# 002381 
# 002382                          MD5 sum: 40996bbaf7d1356d3c22e33a8b255b31
# 002383 
# 002384                Glibc (2.33) - 16,663 KB: 
# 002385 
# 002386                          Home page: http://www.gnu.org/software/libc/ 
# 002387 
# 002388                          Download: http://ftp.gnu.org/gnu/glibc/glibc-2.33.tar.xz 
# 002389 
# 002390                          MD5 sum: 390bbd889c7e8e8a7041564cb6b27cca
# 002391 
# 002392                GMP (6.2.1) - 1,980 KB: 
# 002393 
# 002394                          Home page: http://www.gnu.org/software/gmp/ 
# 002395 
# 002396                          Download: http://ftp.gnu.org/gnu/gmp/gmp-6.2.1.tar.xz 
# 002397 
# 002398                          MD5 sum: 0b82665c4a92fd2ade7440c13fcaa42b
# 002399 
# 002400                Gperf (3.1) - 1,188 KB: 
# 002401 
# 002402                          Home page: http://www.gnu.org/software/gperf/ 
# 002403 
# 002404                          Download: http://ftp.gnu.org/gnu/gperf/gperf-3.1.tar.gz 
# 002405 
# 002406                          MD5 sum: 9e251c0a618ad0824b51117d5d9db87e
# 002407 
# 002408                Grep (3.6) - 1,553 KB: 
# 002409 
# 002410                          Home page: http://www.gnu.org/software/grep/ 
# 002411 
# 002412                          Download: http://ftp.gnu.org/gnu/grep/grep-3.6.tar.xz 
# 002413 
# 002414                          MD5 sum: f47fe27049510b2249dba7f862ac1b51
# 002415 
# 002416                Groff (1.22.4) - 4,044 KB: 
# 002417 
# 002418                          Home page: http://www.gnu.org/software/groff/ 
# 002419 
# 002420                          Download: http://ftp.gnu.org/gnu/groff/groff-1.22.4.tar.gz 
# 002421 
# 002422                          MD5 sum: 08fb04335e2f5e73f23ea4c3adbf0c5f
# 002423 
# 002424                GRUB (2.04) - 6,245 KB: 
# 002425 
# 002426                          Home page: http://www.gnu.org/software/grub/ 
# 002427 
# 002428                          Download: https://ftp.gnu.org/gnu/grub/grub-2.04.tar.xz 
# 002429 
# 002430                          MD5 sum: 5aaca6713b47ca2456d8324a58755ac7
# 002431 
# 002432                Gzip (1.10) - 757 KB: 
# 002433 
# 002434                          Home page: http://www.gnu.org/software/gzip/ 
# 002435 
# 002436                          Download: http://ftp.gnu.org/gnu/gzip/gzip-1.10.tar.xz 
# 002437 
# 002438                          MD5 sum: 691b1221694c3394f1c537df4eee39d3
# 002439 
# 002440                Iana-Etc (20210202) - 578 KB: 
# 002441 
# 002442                          Home page: https://www.iana.org/protocols 
# 002443 
# 002444                          Download: https://github.com/Mic92/iana-etc/releases/download/20210202/iana-etc-20210202.tar.gz 
# 002445 
# 002446                          MD5 sum: 1c193a4d6ca36274570d1505140a7bee
# 002447 
# 002448                Inetutils (2.0) - 1,462 KB: 
# 002449 
# 002450                          Home page: http://www.gnu.org/software/inetutils/ 
# 002451 
# 002452                          Download: http://ftp.gnu.org/gnu/inetutils/inetutils-2.0.tar.xz 
# 002453 
# 002454                          MD5 sum: 5e1018502cd131ed8e42339f6b5c98aa
# 002455 
# 002456                Intltool (0.51.0) - 159 KB: 
# 002457 
# 002458                          Home page: https://freedesktop.org/wiki/Software/intltool 
# 002459 
# 002460                          Download: https://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz 
# 002461 
# 002462                          MD5 sum: 12e517cac2b57a0121cda351570f1e63
# 002463 
# 002464                IPRoute2 (5.10.0) - 781 KB: 
# 002465 
# 002466                          Home page: https://www.kernel.org/pub/linux/utils/net/iproute2/ 
# 002467 
# 002468                          Download: https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-5.10.0.tar.xz 
# 002469 
# 002470                          MD5 sum: 19ffea480a21e600453776b7225f3319
# 002471 
# 002472                Kbd (2.4.0) - 1,095 KB: 
# 002473 
# 002474                          Home page: http://ftp.altlinux.org/pub/people/legion/kbd 
# 002475 
# 002476                          Download: https://www.kernel.org/pub/linux/utils/kbd/kbd-2.4.0.tar.xz 
# 002477 
# 002478                          MD5 sum: 3cac5be0096fcf7b32dcbd3c53831380
# 002479 
# 002480                Kmod (28) - 540 KB: 
# 002481 
# 002482                          Download: https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-28.tar.xz 
# 002483 
# 002484                          MD5 sum: 0a2b887b1b3dfb8c0b3f41f598203e56
# 002485 
# 002486                Less (563) - 328 KB: 
# 002487 
# 002488                          Home page: http://www.greenwoodsoftware.com/less/ 
# 002489 
# 002490                          Download: http://www.greenwoodsoftware.com/less/less-563.tar.gz 
# 002491 
# 002492                          MD5 sum: 1ee44fa71447a845f6eef5b3f38d2781
# 002493 
# 002494                LFS-Bootscripts (20210201) - 32 KB: 
# 002495 
# 002496                          Download: http://www.linuxfromscratch.org/lfs/downloads/10.1/lfs-bootscripts-20210201.tar.xz 
# 002497 
# 002498                          MD5 sum: 1fc441ef96c522974f7267dec8b40a47
# 002499 
# 002500                Libcap (2.48) - 130 KB: 
# 002501 
# 002502                          Home page: https://sites.google.com/site/fullycapable/ 
# 002503 
# 002504                          Download: https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.48.tar.xz 
# 002505 
# 002506                          MD5 sum: ca71693a9abe4e0ad9cc33a755ee47e0
# 002507 
# 002508                Libffi (3.3) - 1,275 KB: 
# 002509 
# 002510                          Home page: https://sourceware.org/libffi/ 
# 002511 
# 002512                          Download: https://sourceware.org/pub/libffi/libffi-3.3.tar.gz 
# 002513 
# 002514                          MD5 sum: 6313289e32f1d38a9df4770b014a2ca7
# 002515 
# 002516                Libpipeline (1.5.3) - 972 KB: 
# 002517 
# 002518                          Home page: http://libpipeline.nongnu.org/ 
# 002519 
# 002520                          Download: http://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.5.3.tar.gz 
# 002521 
# 002522                          MD5 sum: dad443d0911cf9f0f1bd90a334bc9004
# 002523 
# 002524                Libtool (2.4.6) - 951 KB: 
# 002525 
# 002526                          Home page: http://www.gnu.org/software/libtool/ 
# 002527 
# 002528                          Download: http://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz 
# 002529 
# 002530                          MD5 sum: 1bfb9b923f2c1339b4d2ce1807064aa5
# 002531 
# 002532                Linux (5.10.17) - 113,548 KB: 
# 002533 
# 002534                          Home page: https://www.kernel.org/ 
# 002535 
# 002536                          Download: https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.10.17.tar.xz 
# 002537 
# 002538                          MD5 sum: 4908707ed841923d8d1814130d5c380f
# 002539          Note 
# 002540 
# 002541                          The Linux kernel is updated relatively often, many times due to discoveries of security
# 002542                        vulnerabilities. The latest available stable kernel version may be used, unless
# 002543                        the errata page says otherwise. 
# 002544 
# 002545                          For users with limited speed or expensive bandwidth who wish to update the Linux
# 002546                        kernel, a baseline version of the package and patches can be downloaded separately.
# 002547                        This may save some time or cost for a subsequent patch level upgrade within a minor
# 002548                        release. 
# 002549 
# 002550                M4 (1.4.18) - 1,180 KB: 
# 002551 
# 002552                          Home page: http://www.gnu.org/software/m4/ 
# 002553 
# 002554                          Download: http://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz 
# 002555 
# 002556                          MD5 sum: 730bb15d96fffe47e148d1e09235af82
# 002557 
# 002558                Make (4.3) - 2,263 KB: 
# 002559 
# 002560                          Home page: http://www.gnu.org/software/make/ 
# 002561 
# 002562                          Download: http://ftp.gnu.org/gnu/make/make-4.3.tar.gz 
# 002563 
# 002564                          MD5 sum: fc7a67ea86ace13195b0bce683fd4469
# 002565 
# 002566                Man-DB (2.9.4) - 1,865 KB: 
# 002567 
# 002568                          Home page: https://www.nongnu.org/man-db/ 
# 002569 
# 002570                          Download: http://download.savannah.gnu.org/releases/man-db/man-db-2.9.4.tar.xz 
# 002571 
# 002572                          MD5 sum: 6e233a555f7b9ae91ce7cd0faa322bce
# 002573 
# 002574                Man-pages (5.10) - 1,707 KB: 
# 002575 
# 002576                          Home page: https://www.kernel.org/doc/man-pages/ 
# 002577 
# 002578                          Download: https://www.kernel.org/pub/linux/docs/man-pages/man-pages-5.10.tar.xz 
# 002579 
# 002580                          MD5 sum: 4ae3f74a1beddd919936e1058642644c
# 002581 
# 002582                Meson (0.57.1) - 1,806 KB: 
# 002583 
# 002584                          Home page: https://mesonbuild.com 
# 002585 
# 002586                          Download: https://github.com/mesonbuild/meson/releases/download/0.57.1/meson-0.57.1.tar.gz 
# 002587 
# 002588                          MD5 sum: fbd744560351491892478a36a1586815
# 002589 
# 002590                MPC (1.2.1) - 820 KB: 
# 002591 
# 002592                          Home page: http://www.multiprecision.org/ 
# 002593 
# 002594                          Download: https://ftp.gnu.org/gnu/mpc/mpc-1.2.1.tar.gz 
# 002595 
# 002596                          MD5 sum: 9f16c976c25bb0f76b50be749cd7a3a8
# 002597 
# 002598                MPFR (4.1.0) - 1,490 KB: 
# 002599 
# 002600                          Home page: https://www.mpfr.org/ 
# 002601 
# 002602                          Download: http://www.mpfr.org/mpfr-4.1.0/mpfr-4.1.0.tar.xz 
# 002603 
# 002604                          MD5 sum: bdd3d5efba9c17da8d83a35ec552baef
# 002605 
# 002606                Ncurses (6.2) - 3,346 KB: 
# 002607 
# 002608                          Home page: http://www.gnu.org/software/ncurses/ 
# 002609 
# 002610                          Download: http://ftp.gnu.org/gnu/ncurses/ncurses-6.2.tar.gz 
# 002611 
# 002612                          MD5 sum: e812da327b1c2214ac1aed440ea3ae8d
# 002613 
# 002614                Ninja (1.10.2) - 209 KB: 
# 002615 
# 002616                          Home page: https://ninja-build.org/ 
# 002617 
# 002618                          Download: https://github.com/ninja-build/ninja/archive/v1.10.2/ninja-1.10.2.tar.gz 
# 002619 
# 002620                          MD5 sum: 639f75bc2e3b19ab893eaf2c810d4eb4
# 002621 
# 002622                OpenSSL (1.1.1j) - 9,593 KB: 
# 002623 
# 002624                          Home page: https://www.openssl.org/ 
# 002625 
# 002626                          Download: https://www.openssl.org/source/openssl-1.1.1j.tar.gz 
# 002627 
# 002628                          MD5 sum: cccaa064ed860a2b4d1303811bf5c682
# 002629 
# 002630                Patch (2.7.6) - 766 KB: 
# 002631 
# 002632                          Home page: https://savannah.gnu.org/projects/patch/ 
# 002633 
# 002634                          Download: http://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz 
# 002635 
# 002636                          MD5 sum: 78ad9937e4caadcba1526ef1853730d5
# 002637 
# 002638                Perl (5.32.1) - 12,316 KB: 
# 002639 
# 002640                          Home page: https://www.perl.org/ 
# 002641 
# 002642                          Download: https://www.cpan.org/src/5.0/perl-5.32.1.tar.xz 
# 002643 
# 002644                          MD5 sum: 7f104064b906ad8c7329ca5e409a32d7
# 002645 
# 002646                Pkg-config (0.29.2) - 1,970 KB: 
# 002647 
# 002648                          Home page: https://www.freedesktop.org/wiki/Software/pkg-config 
# 002649 
# 002650                          Download: https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz 
# 002651 
# 002652                          MD5 sum: f6e931e319531b736fadc017f470e68a
# 002653 
# 002654                Procps (3.3.17) - 985 KB: 
# 002655 
# 002656                          Home page: https://sourceforge.net/projects/procps-ng 
# 002657 
# 002658                          Download: https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-3.3.17.tar.xz 
# 002659 
# 002660                          MD5 sum: d60613e88c2f442ebd462b5a75313d56
# 002661 
# 002662                Psmisc (23.4) - 362 KB: 
# 002663 
# 002664                          Home page: http://psmisc.sourceforge.net/ 
# 002665 
# 002666                          Download: https://sourceforge.net/projects/psmisc/files/psmisc/psmisc-23.4.tar.xz 
# 002667 
# 002668                          MD5 sum: 8114cd4489b95308efe2509c3a406bbf
# 002669 
# 002670                Python (3.9.2) - 18,477 KB: 
# 002671 
# 002672                          Home page: https://www.python.org/ 
# 002673 
# 002674                          Download: https://www.python.org/ftp/python/3.9.2/Python-3.9.2.tar.xz 
# 002675 
# 002676                          MD5 sum: f0dc9000312abeb16de4eccce9a870ab
# 002677 
# 002678                Python Documentation (3.9.2) - 6,659 KB: 
# 002679 
# 002680                          Download: https://www.python.org/ftp/python/doc/3.9.2/python-3.9.2-docs-html.tar.bz2 
# 002681 
# 002682                          MD5 sum: 719cd64a4c5768b646b716df20229400
# 002683 
# 002684                Readline (8.1) - 2,924 KB: 
# 002685 
# 002686                          Home page: https://tiswww.case.edu/php/chet/readline/rltop.html 
# 002687 
# 002688                          Download: http://ftp.gnu.org/gnu/readline/readline-8.1.tar.gz 
# 002689 
# 002690                          MD5 sum: e9557dd5b1409f5d7b37ef717c64518e
# 002691 
# 002692                Sed (4.8) - 1,317 KB: 
# 002693 
# 002694                          Home page: http://www.gnu.org/software/sed/ 
# 002695 
# 002696                          Download: http://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz 
# 002697 
# 002698                          MD5 sum: 6d906edfdb3202304059233f51f9a71d
# 002699 
# 002700                Shadow (4.8.1) - 1,574 KB: 
# 002701 
# 002702                          Download: https://github.com/shadow-maint/shadow/releases/download/4.8.1/shadow-4.8.1.tar.xz 
# 002703 
# 002704                          MD5 sum: 4b05eff8a427cf50e615bda324b5bc45
# 002705 
# 002706                Sysklogd (1.5.1) - 88 KB: 
# 002707 
# 002708                          Home page: http://www.infodrom.org/projects/sysklogd/ 
# 002709 
# 002710                          Download: http://www.infodrom.org/projects/sysklogd/download/sysklogd-1.5.1.tar.gz 
# 002711 
# 002712                          MD5 sum: c70599ab0d037fde724f7210c2c8d7f8
# 002713 
# 002714                Sysvinit (2.98) - 125 KB: 
# 002715 
# 002716                          Home page: https://savannah.nongnu.org/projects/sysvinit 
# 002717 
# 002718                          Download: http://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.98.tar.xz 
# 002719 
# 002720                          MD5 sum: e3254f7622ea5cf2322b1b386a98ba59
# 002721 
# 002722                Tar (1.34) - 2,174 KB: 
# 002723 
# 002724                          Home page: http://www.gnu.org/software/tar/ 
# 002725 
# 002726                          Download: http://ftp.gnu.org/gnu/tar/tar-1.34.tar.xz 
# 002727 
# 002728                          MD5 sum: 9a08d29a9ac4727130b5708347c0f5cf
# 002729 
# 002730                Tcl (8.6.11) - 10,020 KB: 
# 002731 
# 002732                          Home page: http://tcl.sourceforge.net/ 
# 002733 
# 002734                          Download: https://downloads.sourceforge.net/tcl/tcl8.6.11-src.tar.gz 
# 002735 
# 002736                          MD5 sum: 8a4c004f48984a03a7747e9ba06e4da4
# 002737 
# 002738                Tcl Documentation (8.6.11) - 1,172 KB: 
# 002739 
# 002740                          Download: https://downloads.sourceforge.net/tcl/tcl8.6.11-html.tar.gz 
# 002741 
# 002742                          MD5 sum: e358a9140c3a171e42f18c8a7f6a36ea
# 002743 
# 002744                Texinfo (6.7) - 4,237 KB: 
# 002745 
# 002746                          Home page: http://www.gnu.org/software/texinfo/ 
# 002747 
# 002748                          Download: http://ftp.gnu.org/gnu/texinfo/texinfo-6.7.tar.xz 
# 002749 
# 002750                          MD5 sum: d4c5d8cc84438c5993ec5163a59522a6
# 002751 
# 002752                Time Zone Data (2021a) - 403 KB: 
# 002753 
# 002754                          Home page: https://www.iana.org/time-zones 
# 002755 
# 002756                          Download: https://www.iana.org/time-zones/repository/releases/tzdata2021a.tar.gz 
# 002757 
# 002758                          MD5 sum: 20eae7d1da671c6eac56339c8df85bbd
# 002759 
# 002760                Udev-lfs Tarball (udev-lfs-20171102) - 11 KB: 
# 002761 
# 002762                          Download: http://anduin.linuxfromscratch.org/LFS/udev-lfs-20171102.tar.xz 
# 002763 
# 002764                          MD5 sum: 27cd82f9a61422e186b9d6759ddf1634
# 002765 
# 002766                Util-linux (2.36.2) - 5,223 KB: 
# 002767 
# 002768                          Home page: http://freecode.com/projects/util-linux 
# 002769 
# 002770                          Download: https://www.kernel.org/pub/linux/utils/util-linux/v2.36/util-linux-2.36.2.tar.xz 
# 002771 
# 002772                          MD5 sum: f78419af679ac9678190ad961eb3cf27
# 002773 
# 002774                Vim (8.2.2433) - 15,051 KB: 
# 002775 
# 002776                          Home page: https://www.vim.org 
# 002777 
# 002778                          Download: http://anduin.linuxfromscratch.org/LFS/vim-8.2.2433.tar.gz 
# 002779 
# 002780                          MD5 sum: a26555c8919cf40938d2428d834bf913
# 002781          Note 
# 002782 
# 002783                          The version of vim changes daily. To get the latest version, go to https://github.com/vim/vim/releases .
# 002784                        
# 002785 
# 002786                XML::Parser (2.46) - 249 KB: 
# 002787 
# 002788                          Home page: https://github.com/chorny/XML-Parser 
# 002789 
# 002790                          Download: https://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.46.tar.gz 
# 002791 
# 002792                          MD5 sum: 80bb18a8e6240fcf7ec2f7b57601c170
# 002793 
# 002794                Xz Utils (5.2.5) - 1,122 KB: 
# 002795 
# 002796                          Home page: https://tukaani.org/xz 
# 002797 
# 002798                          Download: https://tukaani.org/xz/xz-5.2.5.tar.xz 
# 002799 
# 002800                          MD5 sum: aa1621ec7013a19abab52a8aff04fe5b
# 002801 
# 002802                Zlib (1.2.11) - 457 KB: 
# 002803 
# 002804                          Home page: https://www.zlib.net/ 
# 002805 
# 002806                          Download: https://zlib.net/zlib-1.2.11.tar.xz 
# 002807 
# 002808                          MD5 sum: 85adef240c5f370b308da8c938951a68
# 002809 
# 002810                Zstd (1.4.8) - 1,762 KB: 
# 002811 
# 002812                          Home page: https://facebook.github.io/zstd/ 
# 002813 
# 002814                          Download: https://github.com/facebook/zstd/releases/download/v1.4.8/zstd-1.4.8.tar.gz 
# 002815 
# 002816                          MD5 sum: e873db7cfa5ef05832e6d55a5a572840
# 002817 
# 002818                          Total size of these packages: about 418 MB  
# 002819        3.3. Needed Patches 
# 002820 
# 002821                          In addition to the packages, several patches are also required. These patches correct
# 002822                        any mistakes in the packages that should be fixed by the maintainer. The patches
# 002823                        also make small modifications to make the packages easier to work with. The following
# 002824                        patches will be needed to build an LFS system: 
# 002825 
# 002826                Bzip2 Documentation Patch - 1.6 KB: 
# 002827 
# 002828                          Download: http://www.linuxfromscratch.org/patches/lfs/10.1/bzip2-1.0.8-install_docs-1.patch 
# 002829 
# 002830                          MD5 sum: 6a5ac7e89b791aae556de0f745916f7f
# 002831 
# 002832                Coreutils Internationalization Fixes Patch - 166 KB: 
# 002833 
# 002834                          Download: http://www.linuxfromscratch.org/patches/lfs/10.1/coreutils-8.32-i18n-1.patch 
# 002835 
# 002836                          MD5 sum: cd8ebed2a67fff2e231026df91af6776
# 002837 
# 002838                Glibc FHS Patch - 2.8 KB: 
# 002839 
# 002840                          Download: http://www.linuxfromscratch.org/patches/lfs/10.1/glibc-2.33-fhs-1.patch 
# 002841 
# 002842                          MD5 sum: 9a5997c3452909b1769918c759eff8a2
# 002843 
# 002844                Kbd Backspace/Delete Fix Patch - 12 KB: 
# 002845 
# 002846                          Download: http://www.linuxfromscratch.org/patches/lfs/10.1/kbd-2.4.0-backspace-1.patch 
# 002847 
# 002848                          MD5 sum: f75cca16a38da6caa7d52151f7136895
# 002849 
# 002850                Sysvinit Consolidated Patch - 2.4 KB: 
# 002851 
# 002852                          Download: http://www.linuxfromscratch.org/patches/lfs/10.1/sysvinit-2.98-consolidated-1.patch 
# 002853 
# 002854                          MD5 sum: 4900322141d493e74020c9cf437b2cdc
# 002855 
# 002856                          Total size of these patches: about 184.8 KB 
# 002857 
# 002858                          In addition to the above required patches, there exist a number of optional patches
# 002859                        created by the LFS community. These optional patches solve minor problems or enable
# 002860                        functionality that is not enabled by default. Feel free to peruse the patches database
# 002861                        located at http://www.linuxfromscratch.org/patches/downloads/ and acquire any additional
# 002862                        patches to suit your system needs.  
# 002863        Chapter 4. Final Preparations  
# 002864        4.1. Introduction 
# 002865 
# 002866                          In this chapter, we will perform a few additional tasks to prepare for building
# 002867                        the temporary system. We will create a set of directories in $LFSfor the installation
# 002868                        of the temporary tools, add an unprivileged user to reduce risk, and create an appropriate
# 002869                        build environment for that user. We will also explain the unit of time we use to
# 002870                        measure how long LFS packages take to build, or "SBUs " , and give some information
# 002871                        about package test suites. 


read -p "Chapter 4.2"
 
# 002872        4.2. Creating a limited directory layout in LFS filesystem 
# 002873 
# 002874                          The first task performed in the LFS partition is to create a limited directory hierarchy
# 002875                        so that programs compiled in Chapter 6 may be installed in their final location.
# 002876                        This is needed so that those temporary programs be overwritten when rebuilding them
# 002877                        in Chapter 8 . 
# 002878 
# 002879                          Create the required directory layout by running the following as root: 



mkdir -pv $LFS/{bin,etc,lib,sbin,usr,var}
case $(uname -m) in
  x86_64) mkdir -pv $LFS/lib64 ;;
esac



# 002890 
# 002891                          Programs in Chapter 6 will be compiled with a cross-compiler (more details in section
# 002892                        Toolchain Technical Notes ). In order to separate this cross-compiler from the other
# 002893                        programs, it will be installed in a special directory. Create this directory with:
# 002894                        



mkdir -pv $LFS/tools





read -p "Chapter 4.3"
 
# 002902        4.3. Adding the LFS User 
# 002903 
# 002904                          When logged in as user root, making a single mistake can damage or destroy a system.
# 002905                        Therefore, the packages in the next two chapters are built as an unprivileged user.
# 002906                        You could use your own user name, but to make it easier to set up a clean working
# 002907                        environment, create a new user called lfsas a member of a new group (also named
# 002908                        lfs) and use this user during the installation process. As root, issue the following
# 002909                        commands to add the new user: 



groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs



# 002918 
# 002919                          The meaning of the command line options: 
# 002920 
# 002921                -s /bin/bash  
# 002922 
# 002923                          This makes bash  the default shell for user lfs. 
# 002924 
# 002925                -g lfs  
# 002926 
# 002927                          This option adds user lfsto group lfs. 
# 002928 
# 002929                -m  
# 002930 
# 002931                          This creates a home directory for lfs. 
# 002932 
# 002933                -k /dev/null  
# 002934 
# 002935                          This parameter prevents possible copying of files from a skeleton directory (default
# 002936                        is /etc/skel) by changing the input location to the special null device. 
# 002937 
# 002938                lfs  
# 002939 
# 002940                          This is the actual name for the created user. 
# 002941 
# 002942                          To log in as lfs(as opposed to switching to user lfswhen logged in as root, which
# 002943                        does not require the lfsuser to have a password), give lfsa password: 



passwd lfs



# 002951 
# 002952                          Grant lfsfull access to all directories under $LFSby making lfsthe directory owner:
# 002953                        



chown -v lfs $LFS/{usr,lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -v lfs $LFS/lib64 ;;
esac



# 002964 
# 002965                          If a separate working directory was created as suggested, give user lfsownership
# 002966                        of this directory: 



chown -v lfs $LFS/sources



# 002974          Note 
# 002975 
# 002976                          In some host systems, the following command does not complete properly and suspends
# 002977                        the login to the lfs user to the background. If the prompt "lfs:~$" does not appear
# 002978                        immediately, entering the fg  command will fix the issue. 
# 002979 
# 002980                          Next, login as user lfs. This can be done via a virtual console, through a display
# 002981                        manager, or with the following substitute/switch user command: 



su - lfs



# 002989 
# 002990                          The "-  " instructs su  to start a login shell as opposed to a non-login shell. The difference
# 002991                        between these two types of shells can be found in detail in bash(1)and info bash  .
# 002992                        
