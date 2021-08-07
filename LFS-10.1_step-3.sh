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
read -p "... at the end .. run = sudo ./LFS-10.1_step-4.sh"
 
# 003134        4.5. About SBUs 
# 003135 
# 003136                          Many people would like to know beforehand approximately how long it takes to compile
# 003137                        and install each package. Because Linux From Scratch can be built on many different
# 003138                        systems, it is impossible to provide accurate time estimates. The biggest package
# 003139                        (Glibc) will take approximately 20 minutes on the fastest systems, but could take
# 003140                        up to three days on slower systems! Instead of providing actual times, the Standard
# 003141                        Build Unit (SBU) measure will be used instead. 
# 003142 
# 003143                          The SBU measure works as follows. The first package to be compiled from this book
# 003144                        is binutils in Chapter 5 . The time it takes to compile this package is what will
# 003145                        be referred to as the Standard Build Unit or SBU. All other compile times will be
# 003146                        expressed relative to this time. 
# 003147 
# 003148                          For example, consider a package whose compilation time is 4.5 SBUs. This means that
# 003149                        if a system took 10 minutes to compile and install the first pass of binutils, it
# 003150                        will take approximately  45 minutes to build this example package. Fortunately, most
# 003151                        build times are shorter than the one for binutils. 
# 003152 
# 003153                          In general, SBUs are not entirely accurate because they depend on many factors,
# 003154                        including the host system's version of GCC. They are provided here to give an estimate
# 003155                        of how long it might take to install a package, but the numbers can vary by as much
# 003156                        as dozens of minutes in some cases. 
# 003157          Note 
# 003158 
# 003159                          For many modern systems with multiple processors (or cores) the compilation time
# 003160                        for a package can be reduced by performing a "parallel make" by either setting an
# 003161                        environment variable or telling the make  program how many processors are available.
# 003162                        For instance, an Intel i5-6500 CPU can support four simultaneous processes with:
# 003163                        



# 003167 export MAKEFLAGS='-j4'
# 003168 


# 003171 
# 003172                          or just building with: 



# 003176 make -j4
# 003177 


# 003180 
# 003181                          When multiple processors are used in this way, the SBU units in the book will vary
# 003182                        even more than they normally would. In some cases, the make step will simply fail.
# 003183                        Analyzing the output of the build process will also be more difficult because the
# 003184                        lines of different processes will be interleaved. If you run into a problem with
# 003185                        a build step, revert back to a single processor build to properly analyze the error
# 003186                        messages.  
# 003187        4.6. About the Test Suites 
# 003188 
# 003189                          Most packages provide a test suite. Running the test suite for a newly built package
# 003190                        is a good idea because it can provide a "sanity check " indicating that everything
# 003191                        compiled correctly. A test suite that passes its set of checks usually proves that
# 003192                        the package is functioning as the developer intended. It does not, however, guarantee
# 003193                        that the package is totally bug free. 
# 003194 
# 003195                          Some test suites are more important than others. For example, the test suites for
# 003196                        the core toolchain packages;GCC, binutils, and glibc;are of the utmost importance
# 003197                        due to their central role in a properly functioning system. The test suites for
# 003198                        GCC and glibc can take a very long time to complete, especially on slower hardware,
# 003199                        but are strongly recommended. 
# 003200          Note 
# 003201 
# 003202                          Running the test suites in Chapter 5 and Chapter 6 is impossible, since the programs
# 003203                        are compiled with a cross-compiler, so are not supposed to be able to run on the
# 003204                        build host. 
# 003205 
# 003206                          A common issue with running the test suites for binutils and GCC is running out
# 003207                        of pseudo terminals (PTYs). This can result in a high number of failing tests. This
# 003208                        may happen for several reasons, but the most likely cause is that the host system
# 003209                        does not have the devptsfile system set up correctly. This issue is discussed in
# 003210                        greater detail at http://www.linuxfromscratch.org/lfs/faq.html#no-ptys . 
# 003211 
# 003212                          Sometimes package test suites will fail, but for reasons which the developers are
# 003213                        aware of and have deemed non-critical. Consult the logs located at http://www.linuxfromscratch.org/lfs/build-logs/10.1/ to
# 003214                        verify whether or not these failures are expected. This site is valid for all tests
# 003215                        throughout this book.  
# 003216      Part III. Building the LFS Cross Toolchain and Temporary Tools  
# 003217        Important Preliminary Material  
# 003218        Introduction 
# 003219 
# 003220                          This part is divided into three stages: first building a cross compiler and its
# 003221                        associated libraries; second, use this cross toolchain to build several utilities
# 003222                        in a way that isolates them from the host distribution; third, enter the chroot
# 003223                        environment, which further improves host isolation, and build the remaining tools
# 003224                        needed to build the final system. 
# 003225          Important 
# 003226 
# 003227                          With this part begins the real work of building a new system. It requires much care
# 003228                        in ensuring that the instructions are followed exactly as the book shows them. You
# 003229                        should try to understand what they do, and whatever your eagerness to finish your
# 003230                        build, you should refrain from blindly type them as shown, but rather read documentation
# 003231                        when there is something you do not understand. Also, keep track of your typing and
# 003232                        of the output of commands, by sending them to a file, using the tee  utility. This
# 003233                        allows for better diagnosing if something gets wrong. 
# 003234 
# 003235                          The next section gives a technical introduction to the build process, while the
# 003236                        following one contains very important  general instructions.  
# 003237        Toolchain Technical Notes 
# 003238 
# 003239                          This section explains some of the rationale and technical details behind the overall
# 003240                        build method. It is not essential to immediately understand everything in this section.
# 003241                        Most of this information will be clearer after performing an actual build. This
# 003242                        section can be referred to at any time during the process. 
# 003243 
# 003244                          The overall goal of Chapter 5 and Chapter 6 is to produce a temporary area that contains
# 003245                        a known-good set of tools that can be isolated from the host system. By using chroot  ,
# 003246                        the commands in the remaining chapters will be contained within that environment,
# 003247                        ensuring a clean, trouble-free build of the target LFS system. The build process
# 003248                        has been designed to minimize the risks for new readers and to provide the most
# 003249                        educational value at the same time. 
# 003250 
# 003251                          The build process is based on the process of cross-compilation  . Cross-compilation
# 003252                        is normally used for building a compiler and its toolchain for a machine different
# 003253                        from the one that is used for the build. This is not strictly needed for LFS, since
# 003254                        the machine where the new system will run is the same as the one used for the build.
# 003255                        But cross-compilation has the great advantage that anything that is cross-compiled
# 003256                        cannot depend on the host environment.  
# 003257          About Cross-Compilation 
# 003258 
# 003259                          Cross-compilation involves some concepts that deserve a section on their own. Although
# 003260                        this section may be omitted in a first reading, it is strongly suggested to come
# 003261                        back to it later in order to get a full grasp of the build process. 
# 003262 
# 003263                          Let us first define some terms used in this context: 
# 003264 
# 003265                build 
# 003266 
# 003267                          is the machine where we build programs. Note that this machine is referred to as
# 003268                        the "host " in other sections. 
# 003269 
# 003270                host 
# 003271 
# 003272                          is the machine/system where the built programs will run. Note that this use of "host " is
# 003273                        not the same as in other sections. 
# 003274 
# 003275                target 
# 003276 
# 003277                          is only used for compilers. It is the machine the compiler produces code for. It
# 003278                        may be different from both build and host. 
# 003279 
# 003280                          As an example, let us imagine the following scenario (sometimes referred to as "Canadian
# 003281                        Cross " ): we may have a compiler on a slow machine only, let's call the machine A,
# 003282                        and the compiler ccA. We may have also a fast machine (B), but with no compiler,
# 003283                        and we may want to produce code for another slow machine (C). To build a compiler
# 003284                        for machine C, we would have three stages: 
# 003285 
# 003286                Stage Build Host Target Action 1 A A B build cross-compiler cc1 using ccA on machine A 2 A B C build cross-compiler cc2 using cc1 on machine A 3 B C C build compiler ccC using cc2 on machine B 
# 003287 
# 003288                          Then, all the other programs needed by machine C can be compiled using cc2 on the
# 003289                        fast machine B. Note that unless B can run programs produced for C, there is no
# 003290                        way to test the built programs until machine C itself is running. For example, for
# 003291                        testing ccC, we may want to add a fourth stage: 
# 003292 
# 003293                Stage Build Host Target Action 4 C C C rebuild and test ccC using itself on machine C 
# 003294 
# 003295                          In the example above, only cc1 and cc2 are cross-compilers, that is, they produce
# 003296                        code for a machine different from the one they are run on. The other compilers ccA
# 003297                        and ccC produce code for the machine they are run on. Such compilers are called
# 003298                        native  compilers.  
# 003299          Implementation of Cross-Compilation for LFS 
# 003300          Note 
# 003301 
# 003302                          Almost all the build systems use names of the form cpu-vendor-kernel-os referred
# 003303                        to as the machine triplet. An astute reader may wonder why a "triplet " refers to
# 003304                        a four component name. The reason is history: initially, three component names were
# 003305                        enough to designate unambiguously a machine, but with new machines and systems appearing,
# 003306                        that proved insufficient. The word "triplet " remained. A simple way to determine
# 003307                        your machine triplet is to run the config.guess  script that comes with the source
# 003308                        for many packages. Unpack the binutils sources and run the script: ./config.guess and
# 003309                        note the output. For example, for a 32-bit Intel processor the output will be i686-pc-linux-gnu  .
# 003310                        On a 64-bit system it will be x86_64-pc-linux-gnu  . 
# 003311 
# 003312                          Also be aware of the name of the platform's dynamic linker, often referred to as
# 003313                        the dynamic loader (not to be confused with the standard linker ld  that is part of
# 003314                        binutils). The dynamic linker provided by Glibc finds and loads the shared libraries
# 003315                        needed by a program, prepares the program to run, and then runs it. The name of
# 003316                        the dynamic linker for a 32-bit Intel machine will be ld-linux.so.2(ld-linux-x86-64.so.2for
# 003317                        64-bit systems). A sure-fire way to determine the name of the dynamic linker is
# 003318                        to inspect a random binary from the host system by running: readelf -l <name of
# 003319                        binary> | grep interpreter and noting the output. The authoritative reference covering
# 003320                        all platforms is in the shlib-versionsfile in the root of the Glibc source tree.
# 003321                        
# 003322 
# 003323                          In order to fake a cross compilation, the name of the host triplet is slightly adjusted
# 003324                        by changing the "vendor" field in the LFS_TGTvariable. We also use the --with-sysroot option
# 003325                        when building the cross linker and cross compiler to tell them where to find the
# 003326                        needed host files. This ensures that none of the other programs built in Chapter
# 003327                        6 can link to libraries on the build machine. Only two stages are mandatory, and
# 003328                        one more for tests: 
# 003329 
# 003330                Stage Build Host Target Action 1 pc pc lfs build cross-compiler cc1 using cc-pc on pc 2 pc lfs lfs build compiler cc-lfs using cc1 on pc 3 lfs lfs lfs rebuild and test cc-lfs using itself on lfs 
# 003331 
# 003332                          In the above table, "on pc " means the commands are run on a machine using the already
# 003333                        installed distribution. "On lfs " means the commands are run in a chrooted environment.
# 003334                        
# 003335 
# 003336                          Now, there is more about cross-compiling: the C language is not just a compiler,
# 003337                        but also defines a standard library. In this book, the GNU C library, named glibc,
# 003338                        is used. This library must be compiled for the lfs machine, that is, using the cross
# 003339                        compiler cc1. But the compiler itself uses an internal library implementing complex
# 003340                        instructions not available in the assembler instruction set. This internal library
# 003341                        is named libgcc, and must be linked to the glibc library to be fully functional!
# 003342                        Furthermore, the standard library for C++ (libstdc++) also needs being linked to
# 003343                        glibc. The solution to this chicken and egg problem is to first build a degraded
# 003344                        cc1 based libgcc, lacking some functionalities such as threads and exception handling,
# 003345                        then build glibc using this degraded compiler (glibc itself is not degraded), then
# 003346                        build libstdc++. But this last library will lack the same functionalities as libgcc.
# 003347                        
# 003348 
# 003349                          This is not the end of the story: the conclusion of the preceding paragraph is that
# 003350                        cc1 is unable to build a fully functional libstdc++, but this is the only compiler
# 003351                        available for building the C/C++ libraries during stage 2! Of course, the compiler
# 003352                        built during stage 2, cc-lfs, would be able to build those libraries, but (1) the
# 003353                        build system of GCC does not know that it is usable on pc, and (2) using it on pc
# 003354                        would be at risk of linking to the pc libraries, since cc-lfs is a native compiler.
# 003355                        So we have to build libstdc++ later, in chroot.  
# 003356          Other procedural details 
# 003357 
# 003358                          The cross-compiler will be installed in a separate $LFS/toolsdirectory, since it
# 003359                        will not be part of the final system. 
# 003360 
# 003361                          Binutils is installed first because the configure  runs of both GCC and Glibc perform
# 003362                        various feature tests on the assembler and linker to determine which software features
# 003363                        to enable or disable. This is more important than one might first realize. An incorrectly
# 003364                        configured GCC or Glibc can result in a subtly broken toolchain, where the impact
# 003365                        of such breakage might not show up until near the end of the build of an entire
# 003366                        distribution. A test suite failure will usually highlight this error before too
# 003367                        much additional work is performed. 
# 003368 
# 003369                          Binutils installs its assembler and linker in two locations, $LFS/tools/binand $LFS/tools/$LFS_TGT/bin.
# 003370                        The tools in one location are hard linked to the other. An important facet of the
# 003371                        linker is its library search order. Detailed information can be obtained from ld  by
# 003372                        passing it the --verbose flag. For example, $LFS_TGT-ld --verbose | grep SEARCH  will
# 003373                        illustrate the current search paths and their order. It shows which files are linked
# 003374                        by ld  by compiling a dummy program and passing the --verbose switch to the linker.
# 003375                        For example, $LFS_TGT-gcc dummy.c -Wl,--verbose 2>&1 | grep succeeded  will show all
# 003376                        the files successfully opened during the linking. 
# 003377 
# 003378                          The next package installed is GCC. An example of what can be seen during its run
# 003379                        of configure  is: 



# 003383 
# 003384 checking what assembler to use... /mnt/lfs/tools/i686-lfs-linux-gnu/bin/as
# 003385 checking what linker to use... /mnt/lfs/tools/i686-lfs-linux-gnu/bin/ld
# 003386 


# 003389 
# 003390                          This is important for the reasons mentioned above. It also demonstrates that GCC's
# 003391                        configure script does not search the PATH directories to find which tools to use.
# 003392                        However, during the actual operation of gcc  itself, the same search paths are not
# 003393                        necessarily used. To find out which standard linker gcc  will use, run: $LFS_TGT-gcc
# 003394                        -print-prog-name=ld  . 
# 003395 
# 003396                          Detailed information can be obtained from gcc  by passing it the -v command line option
# 003397                        while compiling a dummy program. For example, gcc -v dummy.c  will show detailed information
# 003398                        about the preprocessor, compilation, and assembly stages, including gcc  's included
# 003399                        search paths and their order. 
# 003400 
# 003401                          Next installed are sanitized Linux API headers. These allow the standard C library
# 003402                        (Glibc) to interface with features that the Linux kernel will provide. 
# 003403 
# 003404                          The next package installed is Glibc. The most important considerations for building
# 003405                        Glibc are the compiler, binary tools, and kernel headers. The compiler is generally
# 003406                        not an issue since Glibc will always use the compiler relating to the --host parameter
# 003407                        passed to its configure script; e.g. in our case, the compiler will be $LFS_TGT-gcc  .
# 003408                        The binary tools and kernel headers can be a bit more complicated. Therefore, take
# 003409                        no risks and use the available configure switches to enforce the correct selections.
# 003410                        After the run of configure  , check the contents of the config.makefile in the builddirectory
# 003411                        for all important details. Note the use of CC="$LFS_TGT-gcc" (with $LFS_TGTexpanded)
# 003412                        to control which binary tools are used and the use of the -nostdinc and -isystem flags
# 003413                        to control the compiler's include search path. These items highlight an important
# 003414                        aspect of the Glibc package;it is very self-sufficient in terms of its build machinery
# 003415                        and generally does not rely on toolchain defaults. 
# 003416 
# 003417                          As said above, the standard C++ library is compiled next, followed in Chapter 6 by
# 003418                        all the programs that need themselves to be built. The install step of all those
# 003419                        packages uses the DESTDIRvariable to have the programs land into the LFS filesystem.
# 003420                        
# 003421 
# 003422                          At the end of Chapter 6 the native lfs compiler is installed. First binutils-pass2
# 003423                        is built, with the same DESTDIRinstall as the other programs, then the second pass
# 003424                        of GCC is constructed, omitting libstdc++ and other non-important libraries. Due
# 003425                        to some weird logic in GCC's configure script, CC_FOR_TARGETends up as cc  when the
# 003426                        host is the same as the target, but is different from the build system. This is
# 003427                        why CC_FOR_TARGET=$LFS_TGT-gcc is put explicitly into the configure options. 
# 003428 
# 003429                          Upon entering the chroot environment in Chapter 7 , the first task is to install
# 003430                        libstdc++. Then temporary installations of programs needed for the proper operation
# 003431                        of the toolchain are performed. From this point onwards, the core toolchain is self-contained
# 003432                        and self-hosted. In Chapter 8 , final versions of all the packages needed for a fully
# 003433                        functional system are built, tested and installed.  
# 003434        General Compilation Instructions 
# 003435 
# 003436                          When building packages there are several assumptions made within the instructions:
# 003437                        
# 003438 
# 003439                          Several of the packages are patched before compilation, but only when the patch
# 003440                        is needed to circumvent a problem. A patch is often needed in both this and the
# 003441                        following chapters, but sometimes in only one location. Therefore, do not be concerned
# 003442                        if instructions for a downloaded patch seem to be missing. Warning messages about
# 003443                        offset  or fuzz  may also be encountered when applying a patch. Do not worry about these
# 003444                        warnings, as the patch was still successfully applied. 
# 003445 
# 003446                          During the compilation of most packages, there will be several warnings that scroll
# 003447                        by on the screen. These are normal and can safely be ignored. These warnings are
# 003448                        as they appear;warnings about deprecated, but not invalid, use of the C or C++ syntax.
# 003449                        C standards change fairly often, and some packages still use the older standard.
# 003450                        This is not a problem, but does prompt the warning. 
# 003451 
# 003452                          Check one last time that the LFSenvironment variable is set up properly: 



# 003456 echo $LFS
# 003457 


# 003460 
# 003461                          Make sure the output shows the path to the LFS partition's mount point, which is
# 003462                        /mnt/lfs, using our example. 
# 003463 
# 003464                          Finally, two important items must be emphasized: 
# 003465          Important 
# 003466 
# 003467                          The build instructions assume that the Host System Requirements , including symbolic
# 003468                        links, have been set properly: 
# 003469 
# 003470                          bash  is the shell in use. 
# 003471 
# 003472                          sh  is a symbolic link to bash  . 
# 003473 
# 003474                          /usr/bin/awk  is a symbolic link to gawk  . 
# 003475 
# 003476                          /usr/bin/yacc  is a symbolic link to bison  or a small script that executes bison. 
# 003477          Important 
# 003478 
# 003479                          To re-emphasize the build process: 
# 003480 
# 003481                          Place all the sources and patches in a directory that will be accessible from the
# 003482                        chroot environment such as /mnt/lfs/sources/. 
# 003483 
# 003484                          Change to the sources directory.  
# 003485 
# 003486                          For each package: 
# 003487 
# 003488                          Using the tar  program, extract the package to be built. In Chapter 5 and Chapter 6 ,
# 003489                        ensure you are the lfs  user when extracting the package. 
# 003490 
# 003491                          Change to the directory created when the package was extracted. 
# 003492 
# 003493                          Follow the book's instructions for building the package. 
# 003494 
# 003495                          Change back to the sources directory. 
# 003496 
# 003497                          Delete the extracted source directory unless instructed otherwise. read -p "Chapter 5"
 
# 003498        Chapter 5. Compiling a Cross-Toolchain  
# 003499        5.1. Introduction 
# 003500 
# 003501                          This chapter shows how to build a cross-compiler and its associated tools. Although
# 003502                        here cross-compilation is faked, the principles are the same as for a real cross-toolchain.
# 003503                        
# 003504 
# 003505                          The programs compiled in this chapter will be installed under the $LFS/toolsdirectory
# 003506                        to keep them separate from the files installed in the following chapters. The libraries,
# 003507                        on the other hand, are installed into their final place, since they pertain to the
# 003508                        system we want to build. 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'binutils-*')
tar xf $(find -maxdepth 1 -type f -name 'binutils-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'binutils-*')
read -p "Chapter 5.2"
 
# 003509        5.2. Binutils-2.36.1 - Pass 1 
# 003510 
# 003511                          The Binutils package contains a linker, an assembler, and other tools for handling
# 003512                        object files. 
# 003513           Approximate build time: 1 SBU
# 003514           Required disk space: 640 MB 
# 003515          5.2.1. Installation of Cross Binutils 
# 003516          Note 
# 003517 
# 003518                          Go back and re-read the notes in the section titled General Compilation Instructions .
# 003519                        Understanding the notes labeled important can save you a lot of problems later.
# 003520                        
# 003521 
# 003522                          It is important that Binutils be the first package compiled because both Glibc and
# 003523                        GCC perform various tests on the available linker and assembler to determine which
# 003524                        of their own features to enable. 
# 003525 
# 003526                          The Binutils documentation recommends building Binutils in a dedicated build directory:
# 003527                        



mkdir -v build
cd       build



# 003536          Note 
# 003537 
# 003538                          In order for the SBU values listed in the rest of the book to be of any use, measure
# 003539                        the time it takes to build this package from the configuration, up to and including
# 003540                        the first install. To achieve this easily, wrap the commands in a time  command like
# 003541                        this: time { ../configure ... && make && make install; } . 
# 003542 
# 003543                          Now prepare Binutils for compilation: 



../configure --prefix=$LFS/tools       \
             --with-sysroot=$LFS        \
             --target=$LFS_TGT          \
             --disable-nls              \
             --disable-werror



# 003555 
# 003556                          The meaning of the configure options: 
# 003557 
# 003558                --prefix=$LFS/tools  
# 003559 
# 003560                          This tells the configure script to prepare to install the binutils programs in the
# 003561                        $LFS/toolsdirectory. 
# 003562 
# 003563                --with-sysroot=$LFS  
# 003564 
# 003565                          For cross compilation, this tells the build system to look in $LFS for the target
# 003566                        system libraries as needed. 
# 003567 
# 003568                --target=$LFS_TGT 
# 003569 
# 003570                          Because the machine description in the LFS_TGTvariable is slightly different than
# 003571                        the value returned by the config.guess  script, this switch will tell the configure  script
# 003572                        to adjust binutil's build system for building a cross linker. 
# 003573 
# 003574                --disable-nls  
# 003575 
# 003576                          This disables internationalization as i18n is not needed for the temporary tools.
# 003577                        
# 003578 
# 003579                --disable-werror  
# 003580 
# 003581                          This prevents the build from stopping in the event that there are warnings from
# 003582                        the host's compiler. 
# 003583 
# 003584                          Continue with compiling the package: 



make



# 003592 
# 003593                          Install the package: 



make install



# 003601 
# 003602                          Details on this package are located in Section 8.18.2, "Contents of Binutils." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'gcc-*')
tar xf $(find -maxdepth 1 -type f -name 'gcc-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'gcc-*')
read -p "Chapter 5.3"
 
# 003603        5.3. GCC-10.2.0 - Pass 1 
# 003604 
# 003605                          The GCC package contains the GNU compiler collection, which includes the C and C++
# 003606                        compilers. 
# 003607           Approximate build time: 11 SBU
# 003608           Required disk space: 3.7 GB 
# 003609          5.3.1. Installation of Cross GCC 
# 003610 
# 003611                          GCC requires the GMP, MPFR and MPC packages. As these packages may not be included
# 003612                        in your host distribution, they will be built with GCC. Unpack each package into
# 003613                        the GCC source directory and rename the resulting directories so the GCC build procedures
# 003614                        will automatically use them: 
# 003615          Note 
# 003616 
# 003617                          There are frequent misunderstandings about this chapter. The procedures are the
# 003618                        same as every other chapter as explained earlier (Package build instructions ). First
# 003619                        extract the gcc tarball from the sources directory and then change to the directory
# 003620                        created. Only then should you proceed with the instructions below. 



tar -xf ../mpfr-4.1.0.tar.xz
mv -v mpfr-4.1.0 mpfr
tar -xf ../gmp-6.2.1.tar.xz
mv -v gmp-6.2.1 gmp
tar -xf ../mpc-1.2.1.tar.gz
mv -v mpc-1.2.1 mpc



# 003633 
# 003634                          On x86_64 hosts, set the default directory name for 64-bit libraries to "lib " : 



case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
 ;;
esac



# 003647 
# 003648                          The GCC documentation recommends building GCC in a dedicated build directory: 



mkdir -v build
cd       build



# 003657 
# 003658                          Prepare GCC for compilation: 



../configure                                       \
    --target=$LFS_TGT                              \
    --prefix=$LFS/tools                            \
    --with-glibc-version=2.11                      \
    --with-sysroot=$LFS                            \
    --with-newlib                                  \
    --without-headers                              \
    --enable-initfini-array                        \
    --disable-nls                                  \
    --disable-shared                               \
    --disable-multilib                             \
    --disable-decimal-float                        \
    --disable-threads                              \
    --disable-libatomic                            \
    --disable-libgomp                              \
    --disable-libquadmath                          \
    --disable-libssp                               \
    --disable-libvtv                               \
    --disable-libstdcxx                            \
    --enable-languages=c,c++



# 003685 
# 003686                          The meaning of the configure options: 
# 003687 
# 003688                --with-glibc-version=2.11  
# 003689 
# 003690                          This option ensures the package will be compatible with the host's version of glibc.
# 003691                        It is set to the minimum glibc requirement specified in the Host System Requirements .
# 003692                        
# 003693 
# 003694                --with-newlib  
# 003695 
# 003696                          Since a working C library is not yet available, this ensures that the inhibit_libc
# 003697                        constant is defined when building libgcc. This prevents the compiling of any code
# 003698                        that requires libc support. 
# 003699 
# 003700                --without-headers  
# 003701 
# 003702                          When creating a complete cross-compiler, GCC requires standard headers compatible
# 003703                        with the target system. For our purposes these headers will not be needed. This
# 003704                        switch prevents GCC from looking for them. 
# 003705 
# 003706                --enable-initfini-array  
# 003707 
# 003708                          This switch forces the use of some internal data structures that are needed but
# 003709                        cannot be detected when building a cross compiler. 
# 003710 
# 003711                --disable-shared  
# 003712 
# 003713                          This switch forces GCC to link its internal libraries statically. We need this because
# 003714                        the shared libraries require glibc, which is not yet installed on the target system.
# 003715                        
# 003716 
# 003717                --disable-multilib  
# 003718 
# 003719                          On x86_64, LFS does not support a multilib configuration. This switch is harmless
# 003720                        for x86. 
# 003721 
# 003722                --disable-decimal-float, --disable-threads, --disable-libatomic, --disable-libgomp, --disable-libquadmath, --disable-libssp, --disable-libvtv, --disable-libstdcxx  
# 003723 
# 003724                          These switches disable support for the decimal floating point extension, threading,
# 003725                        libatomic, libgomp, libquadmath, libssp, libvtv, and the C++ standard library respectively.
# 003726                        These features will fail to compile when building a cross-compiler and are not necessary
# 003727                        for the task of cross-compiling the temporary libc. 
# 003728 
# 003729                --enable-languages=c,c++  
# 003730 
# 003731                          This option ensures that only the C and C++ compilers are built. These are the only
# 003732                        languages needed now. 
# 003733 
# 003734                          Compile GCC by running: 



make



# 003742 
# 003743                          Install the package: 



make install



# 003751 
# 003752                          This build of GCC has installed a couple of internal system headers. Normally one
# 003753                        of them, limits.h, would in turn include the corresponding system limits.hheader,
# 003754                        in this case, $LFS/usr/include/limits.h. However, at the time of this build of GCC
# 003755                        $LFS/usr/include/limits.hdoes not exist, so the internal header that has just been
# 003756                        installed is a partial, self-contained file and does not include the extended features
# 003757                        of the system header. This is adequate for building glibc, but the full internal
# 003758                        header will be needed later. Create a full version of the internal header using
# 003759                        a command that is identical to what the GCC build system does in normal circumstances:
# 003760                        



cd ..
cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
  `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/install-tools/include/limits.h



# 003770 
# 003771                          Details on this package are located in Section 8.26.2, "Contents of GCC." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'linux-*')
tar xf $(find -maxdepth 1 -type f -name 'linux-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'linux-*')
read -p "Chapter 5.4"
 
# 003772        5.4. Linux-5.10.17 API Headers 
# 003773 
# 003774                          The Linux API Headers (in linux-5.10.17.tar.xz) expose the kernel's API for use
# 003775                        by Glibc. 
# 003776           Approximate build time: 0.1 SBU
# 003777           Required disk space: 1.1 GB 
# 003778          5.4.1. Installation of Linux API Headers 
# 003779 
# 003780                          The Linux kernel needs to expose an Application Programming Interface (API) for
# 003781                        the system's C library (Glibc in LFS) to use. This is done by way of sanitizing
# 003782                        various C header files that are shipped in the Linux kernel source tarball. 
# 003783 
# 003784                          Make sure there are no stale files embedded in the package: 



make mrproper



# 003792 
# 003793                          Now extract the user-visible kernel headers from the source. The recommended make
# 003794                        target "headers_install " cannot be used, because it requires rsync , which may not
# 003795                        be available. The headers are first placed in ./usr, then copied to the needed location.
# 003796                        



make headers
find usr/include -name '.*' -delete
rm usr/include/Makefile
cp -rv usr/include $LFS/usr


 
# 003807          5.4.2. Contents of Linux API Headers 
# 003808           Installed headers: /usr/include/asm/*.h, /usr/include/asm-generic/*.h, /usr/include/drm/*.h, /usr/include/linux/*.h, /usr/include/misc/*.h, /usr/include/mtd/*.h, /usr/include/rdma/*.h, /usr/include/scsi/*.h, /usr/include/sound/*.h, /usr/include/video/*.h, and /usr/include/xen/*.h
# 003809           Installed directories: /usr/include/asm, /usr/include/asm-generic, /usr/include/drm, /usr/include/linux, /usr/include/misc, /usr/include/mtd, /usr/include/rdma, /usr/include/scsi, /usr/include/sound, /usr/include/video, and /usr/include/xen  
# 003810            Short Descriptions  
# 003811 
# 003812                          
# 003813 
# 003814                /usr/include/asm/*.h 
# 003815 
# 003816                          The Linux API ASM Headers  
# 003817 
# 003818                          /usr/include/asm-generic/*.h 
# 003819 
# 003820                          The Linux API ASM Generic Headers  
# 003821 
# 003822                          /usr/include/drm/*.h 
# 003823 
# 003824                          The Linux API DRM Headers  
# 003825 
# 003826                          /usr/include/linux/*.h 
# 003827 
# 003828                          The Linux API Linux Headers  
# 003829 
# 003830                          /usr/include/misc/*.h 
# 003831 
# 003832                          The Linux API Miscellaneous Headers  
# 003833 
# 003834                          /usr/include/mtd/*.h 
# 003835 
# 003836                          The Linux API MTD Headers  
# 003837 
# 003838                          /usr/include/rdma/*.h 
# 003839 
# 003840                          The Linux API RDMA Headers  
# 003841 
# 003842                          /usr/include/scsi/*.h 
# 003843 
# 003844                          The Linux API SCSI Headers  
# 003845 
# 003846                          /usr/include/sound/*.h 
# 003847 
# 003848                          The Linux API Sound Headers  
# 003849 
# 003850                          /usr/include/video/*.h 
# 003851 
# 003852                          The Linux API Video Headers  
# 003853 
# 003854                          /usr/include/xen/*.h 
# 003855 
# 003856                          The Linux API Xen Headers 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'glibc-*')
tar xf $(find -maxdepth 1 -type f -name 'glibc-*.xz' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'glibc-*')
read -p "Chapter 5.5"
 
# 003857        5.5. Glibc-2.33 
# 003858 
# 003859                          The Glibc package contains the main C library. This library provides the basic routines
# 003860                        for allocating memory, searching directories, opening and closing files, reading
# 003861                        and writing files, string handling, pattern matching, arithmetic, and so on. 
# 003862           Approximate build time: 4.2 SBU
# 003863           Required disk space: 770 MB 
# 003864          5.5.1. Installation of Glibc 
# 003865 
# 003866                          First, create a symbolic link for LSB compliance. Additionally, for x86_64, create
# 003867                        a compatibility symbolic link required for proper operation of the dynamic library
# 003868                        loader: 



case $(uname -m) in
    i?86)   ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3
    ;;
    x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
            ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
    ;;
esac



# 003882 
# 003883                          Some of the Glibc programs use the non-FHS compliant /var/dbdirectory to store their
# 003884                        runtime data. Apply the following patch to make such programs store their runtime
# 003885                        data in the FHS-compliant locations: 



patch -Np1 -i ../glibc-2.33-fhs-1.patch



# 003893 
# 003894                          The Glibc documentation recommends building Glibc in a dedicated build directory:
# 003895                        



mkdir -v build
cd       build



# 003904 
# 003905                          Next, prepare Glibc for compilation: 



../configure                             \
      --prefix=/usr                      \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2                \
      --with-headers=$LFS/usr/include    \
      libc_cv_slibdir=/lib



# 003919 
# 003920                          The meaning of the configure options: 
# 003921 
# 003922                --host=$LFS_TGT, --build=$(../scripts/config.guess)  
# 003923 
# 003924                          The combined effect of these switches is that Glibc's build system configures itself
# 003925                        to be cross-compiled, using the cross-linker and cross-compiler in $LFS/tools. 
# 003926 
# 003927                --enable-kernel=3.2  
# 003928 
# 003929                          This tells Glibc to compile the library with support for 3.2 and later Linux kernels.
# 003930                        Workarounds for older kernels are not enabled. 
# 003931 
# 003932                --with-headers=$LFS/usr/include  
# 003933 
# 003934                          This tells Glibc to compile itself against the headers recently installed to the
# 003935                        $LFS/usr/include directory, so that it knows exactly what features the kernel has
# 003936                        and can optimize itself accordingly. 
# 003937 
# 003938                libc_cv_slibdir=/lib  
# 003939 
# 003940                          This ensures that the library is installed in /lib instead of the default /lib64
# 003941                        on 64 bit machines. 
# 003942 
# 003943                libc_cv_include_x86_isa_level=no 
# 003944 
# 003945                          This disables "x86 ISA needed " property in Glibc libraries. Use it if  you are building
# 003946                        Glibc with -marchoption in CFLAGS, to workaround an issue in Glibc-2.33 breaking
# 003947                        it. 
# 003948 
# 003949                          During this stage the following warning might appear: 




# 003954 configure: WARNING:
# 003955 *** These auxiliary programs are missing or
# 003956 *** incompatible versions: msgfmt
# 003957 *** some features will be disabled.
# 003958 *** Check the INSTALL file for required versions.



# 003962 
# 003963                          The missing or incompatible msgfmt  program is generally harmless. This msgfmt  program
# 003964                        is part of the Gettext package which the host distribution should provide. 
# 003965          Note 
# 003966 
# 003967                          There have been reports that this package may fail when building as a "parallel
# 003968                        make". If this occurs, rerun the make command with a "-j1" option. 
# 003969 
# 003970                          Compile the package: 



make



# 003978 
# 003979                          Install the package: 
# 003980          Warning 
# 003981 
# 003982                          If LFSis not properly set, and despite the recommendations, you are building as
# 003983                        root, the next command will install the newly built glibc to your host system, which
# 003984                        most likely will render it unusable. So double check that the environment is correctly
# 003985                        set, before running the following command. 



make DESTDIR=$LFS install



# 003993 
# 003994                          The meaning of the make install  option: 
# 003995 
# 003996                DESTDIR=$LFS  
# 003997 
# 003998                          The DESTDIRmake variable is used by almost all packages to define the location where
# 003999                        the package should be installed. If it is not set, it defaults to the root (/) directory.
# 004000                        Here we specify that the package be installed in $LFS, which will become the root
# 004001                        after Section 7.4, "Entering the Chroot Environment" . 
# 004002          Caution 
# 004003 
# 004004                          At this point, it is imperative to stop and ensure that the basic functions (compiling
# 004005                        and linking) of the new toolchain are working as expected. To perform a sanity check,
# 004006                        run the following commands: 



echo 'int main(){}' > dummy.c
$LFS_TGT-gcc dummy.c
readelf -l a.out | grep '/ld-linux'



# 004016 
# 004017                          If everything is working correctly, there should be no errors, and the output of
# 004018                        the last command will be of the form: 




# 004023 [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]



# 004027 
# 004028                          Note that for 32-bit machines, the interpreter name will be /lib/ld-linux.so.2.
# 004029                        
# 004030 
# 004031                          If the output is not shown as above or there was no output at all, then something
# 004032                        is wrong. Investigate and retrace the steps to find out where the problem is and
# 004033                        correct it. This issue must be resolved before continuing on. 
# 004034 
# 004035                          Once all is well, clean up the test files: 



rm -v dummy.c a.out



# 004043          Note 
# 004044 
# 004045                          Building packages in the next chapter will serve as an additional check that the
# 004046                        toolchain has been built properly. If some package, especially binutils-pass2 or
# 004047                        gcc-pass2, fails to build, it is an indication that something has gone wrong with
# 004048                        the previous Binutils, GCC, or Glibc installations. 
# 004049 
# 004050                          Now that our cross-toolchain is complete, finalize the installation of the limits.h
# 004051                        header. For doing so, run a utility provided by the GCC developers: 



$LFS/tools/libexec/gcc/$LFS_TGT/10.2.0/install-tools/mkheaders



# 004059 
# 004060                          Details on this package are located in Section 8.5.3, "Contents of Glibc." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'gcc-*')
tar xf $(find -maxdepth 1 -type f -name 'gcc-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'gcc-*')
read -p "Chapter 5.6"
 
# 004061        5.6. Libstdc++ from GCC-10.2.0, Pass 1 
# 004062 
# 004063                          Libstdc++ is the standard C++ library. It is needed to compile C++ code (part of
# 004064                        GCC is written in C++), but we had to defer its installation when we built gcc-pass1 because
# 004065                        it depends on glibc, which was not yet available in the target directory. 
# 004066           Approximate build time: 0.4 SBU
# 004067           Required disk space: 953 MB 
# 004068          5.6.1. Installation of Target Libstdc++ 
# 004069          Note 
# 004070 
# 004071                          Libstdc++ is part of the GCC sources. You should first unpack the GCC tarball and
# 004072                        change to the gcc-10.2.0directory. 
# 004073 
# 004074                          Create a separate build directory for libstdc++ and enter it: 



mkdir -v build
cd       build



# 004083 
# 004084                          Prepare libstdc++ for compilation: 



../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --build=$(../config.guess)      \
    --prefix=/usr                   \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/10.2.0



# 004099 
# 004100                          The meaning of the configure options: 
# 004101 
# 004102                --host=...  
# 004103 
# 004104                          Specifies the use the cross compiler we have just built instead of the one in /usr/bin.
# 004105                        
# 004106 
# 004107                --disable-libstdcxx-pch  
# 004108 
# 004109                          This switch prevents the installation of precompiled include files, which are not
# 004110                        needed at this stage. 
# 004111 
# 004112                --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/10.2.0  
# 004113 
# 004114                          This is the location where the C++ compiler should search for the standard include
# 004115                        files. In a normal build, this information is automatically passed to the libstdc++
# 004116                        configure  options from the top level directory. In our case, this information must
# 004117                        be explicitly given. 
# 004118 
# 004119                          Compile libstdc++ by running: 



make



# 004127 
# 004128                          Install the library: 



make DESTDIR=$LFS install



# 004136 
# 004137                          Details on this package are located in Section 8.26.2, "Contents of GCC."  
# 004138        Chapter 6. Cross Compiling Temporary Tools  
# 004139        6.1. Introduction 
# 004140 
# 004141                          This chapter shows how to cross-compile basic utilities using the just built cross-toolchain.
# 004142                        Those utilities are installed into their final location, but cannot be used yet.
# 004143                        Basic tasks still rely on the host's tools. Nevertheless, the installed libraries
# 004144                        are used when linking. 
# 004145 
# 004146                          Using the utilities will be possible in next chapter after entering the "chroot " environment.
# 004147                        But all the packages built in the present chapter need to be built before we do
# 004148                        that. Therefore we cannot be independent of the host system yet. 
# 004149 
# 004150                          Once again, let us recall that improper setting of LFStogether with building as
# 004151                        root, may render your computer unusable. This whole chapter must be done as user
# 004152                        lfs, with the environment as described in Section 4.4, "Setting Up the Environment" .
# 004153                        


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'm4-*')
tar xf $(find -maxdepth 1 -type f -name 'm4-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'm4-*')
read -p "Chapter 6.2"
 
# 004154        6.2. M4-1.4.18 
# 004155 
# 004156                          The M4 package contains a macro processor. 
# 004157           Approximate build time: 0.1 SBU
# 004158           Required disk space: 22 MB 
# 004159          6.2.1. Installation of M4 
# 004160 
# 004161                          First, make some fixes introduced by glibc-2.28: 



sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h



# 004170 
# 004171                          Prepare M4 for compilation: 



./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)



# 004181 
# 004182                          Compile the package: 



make



# 004190 
# 004191                          Install the package: 



make DESTDIR=$LFS install



# 004199 
# 004200                          Details on this package are located in Section 8.12.2, "Contents of M4." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'ncurses-*')
tar xf $(find -maxdepth 1 -type f -name 'ncurses-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'ncurses-*')
read -p "Chapter 6.3"
 
# 004201        6.3. Ncurses-6.2 
# 004202 
# 004203                          The Ncurses package contains libraries for terminal-independent handling of character
# 004204                        screens. 
# 004205           Approximate build time: 0.7 SBU
# 004206           Required disk space: 48 MB 
# 004207          6.3.1. Installation of Ncurses 
# 004208 
# 004209                          First, ensure that gawk  is found first during configuration: 



sed -i s/mawk// configure



# 004217 
# 004218                          Then, run the following commands to build the "tic " program on the build host: 



mkdir build
pushd build
  ../configure
  make -C include
  make -C progs tic
popd



# 004231 
# 004232                          Prepare Ncurses for compilation: 



./configure --prefix=/usr                \
            --host=$LFS_TGT              \
            --build=$(./config.guess)    \
            --mandir=/usr/share/man      \
            --with-manpage-format=normal \
            --with-shared                \
            --without-debug              \
            --without-ada                \
            --without-normal             \
            --enable-widec



# 004249 
# 004250                          The meaning of the new configure options: 
# 004251 
# 004252                --with-manpage-format=normal  
# 004253 
# 004254                          This prevents Ncurses installing compressed manual pages, which may happen if the
# 004255                        host distribution itself has compressed manual pages. 
# 004256 
# 004257                --without-ada  
# 004258 
# 004259                          This ensures that Ncurses does not build support for the Ada compiler which may
# 004260                        be present on the host but will not be available once we enter the chroot  environment.
# 004261                        
# 004262 
# 004263                --enable-widec  
# 004264 
# 004265                          This switch causes wide-character libraries (e.g., libncursesw.so.6.2) to be built
# 004266                        instead of normal ones (e.g., libncurses.so.6.2). These wide-character libraries
# 004267                        are usable in both multibyte and traditional 8-bit locales, while normal libraries
# 004268                        work properly only in 8-bit locales. Wide-character and normal libraries are source-compatible,
# 004269                        but not binary-compatible. 
# 004270 
# 004271                --without-normal  
# 004272 
# 004273                          This switch disables building and installing most static libraries. 
# 004274 
# 004275                          Compile the package: 



make



# 004283 
# 004284                          Install the package: 



make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install
echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so



# 004293 
# 004294                          The meaning of the install options: 
# 004295 
# 004296                TIC_PATH=$(pwd)/build/progs/tic  
# 004297 
# 004298                          We need to pass the path of the just built tic  able to run on the building machine,
# 004299                        so that the terminal database can be created without errors. 
# 004300 
# 004301                
# 004302           echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so  
# 004303 
# 004304                          The libncurses.solibrary is needed by a few packages we will build soon. We create
# 004305                        this small linker script, as this is what is done in Chapter 8 . 
# 004306 
# 004307                          Move the shared libraries to the /libdirectory, where they are expected to reside:
# 004308                        



mv -v $LFS/usr/lib/libncursesw.so.6* $LFS/lib



# 004316 
# 004317                          Because the libraries have been moved, one symlink points to a non-existent file.
# 004318                        Recreate it: 



ln -sfv ../../lib/$(readlink $LFS/usr/lib/libncursesw.so) $LFS/usr/lib/libncursesw.so



# 004326 
# 004327                          Details on this package are located in Section 8.28.2, "Contents of Ncurses." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'bash-*')
tar xf $(find -maxdepth 1 -type f -name 'bash-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'bash-*')
read -p "Chapter 6.4"
 
# 004328        6.4. Bash-5.1 
# 004329 
# 004330                          The Bash package contains the Bourne-Again SHell. 
# 004331           Approximate build time: 0.4 SBU
# 004332           Required disk space: 66 MB 
# 004333          6.4.1. Installation of Bash 
# 004334 
# 004335                          Prepare Bash for compilation: 



./configure --prefix=/usr                   \
            --build=$(support/config.guess) \
            --host=$LFS_TGT                 \
            --without-bash-malloc



# 004346 
# 004347                          The meaning of the configure options: 
# 004348 
# 004349                --without-bash-malloc  
# 004350 
# 004351                          This option turns off the use of Bash's memory allocation (malloc) function which
# 004352                        is known to cause segmentation faults. By turning this option off, Bash will use
# 004353                        the mallocfunctions from Glibc which are more stable. 
# 004354 
# 004355                          Compile the package: 



make



# 004363 
# 004364                          Install the package: 



make DESTDIR=$LFS install



# 004372 
# 004373                          Move the executable to where it is expected: 



mv $LFS/usr/bin/bash $LFS/bin/bash



# 004381 
# 004382                          Make a link for the programs that use sh  for a shell: 



ln -sv bash $LFS/bin/sh



# 004390 
# 004391                          Details on this package are located in Section 8.34.2, "Contents of Bash." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'coreutils-*')
tar xf $(find -maxdepth 1 -type f -name 'coreutils-*.xz' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'coreutils-*')
read -p "Chapter 6.5"
 
# 004392        6.5. Coreutils-8.32 
# 004393 
# 004394                          The Coreutils package contains utilities for showing and setting the basic system
# 004395                        characteristics. 
# 004396           Approximate build time: 0.5 SBU
# 004397           Required disk space: 170 MB 
# 004398          6.5.1. Installation of Coreutils 
# 004399 
# 004400                          Prepare Coreutils for compilation: 



./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --enable-install-program=hostname \
            --enable-no-install-program=kill,uptime



# 004412 
# 004413                          The meaning of the configure options: 
# 004414 
# 004415                --enable-install-program=hostname 
# 004416 
# 004417                          This enables the hostname  binary to be built and installed - it is disabled by default
# 004418                        but is required by the Perl test suite. 
# 004419 
# 004420                          Compile the package: 



make



# 004428 
# 004429                          Install the package: 



make DESTDIR=$LFS install



# 004437 
# 004438                          Move programs to their final expected locations. Although this is not necessary
# 004439                        in this temporary environment, we must do so because some programs harcode executable
# 004440                        locations: 



mv -v $LFS/usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} $LFS/bin
mv -v $LFS/usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm}        $LFS/bin
mv -v $LFS/usr/bin/{rmdir,stty,sync,true,uname}               $LFS/bin
mv -v $LFS/usr/bin/{head,nice,sleep,touch}                    $LFS/bin
mv -v $LFS/usr/bin/chroot                                     $LFS/usr/sbin
mkdir -pv $LFS/usr/share/man/man8
mv -v $LFS/usr/share/man/man1/chroot.1                        $LFS/usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/'                                           $LFS/usr/share/man/man8/chroot.8



# 004455 
# 004456                          Details on this package are located in Section 8.52.2, "Contents of Coreutils." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'diffutils-*')
tar xf $(find -maxdepth 1 -type f -name 'diffutils-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'diffutils-*')
read -p "Chapter 6.6"
 
# 004457        6.6. Diffutils-3.7 
# 004458 
# 004459                          The Diffutils package contains programs that show the differences between files
# 004460                        or directories. 
# 004461           Approximate build time: 0.1 SBU
# 004462           Required disk space: 26 MB 
# 004463          6.6.1. Installation of Diffutils 
# 004464 
# 004465                          Prepare Diffutils for compilation: 



./configure --prefix=/usr --host=$LFS_TGT



# 004473 
# 004474                          Compile the package: 



make



# 004482 
# 004483                          Install the package: 



make DESTDIR=$LFS install



# 004491 
# 004492                          Details on this package are located in Section 8.54.2, "Contents of Diffutils." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'file-*')
tar xf $(find -maxdepth 1 -type f -name 'file-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'file-*')
read -p "Chapter 6.7"
 
# 004493        6.7. File-5.39 
# 004494 
# 004495                          The File package contains a utility for determining the type of a given file or
# 004496                        files. 
# 004497           Approximate build time: 0.2 SBU
# 004498           Required disk space: 31 MB 
# 004499          6.7.1. Installation of File 
# 004500 
# 004501                          The file  command on the build host needs to be same version as the one we are building
# 004502                        in order to create the signature file. Run the following commands to build it: 



mkdir build
pushd build
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib
  make
popd



# 004517 
# 004518                          The meaning of the new configure option: 
# 004519 
# 004520                --disable-*  
# 004521 
# 004522                          The configuration script attempts to use some packages from the host distribution
# 004523                        if the corresponding library files exist. It may cause compilation failure if a
# 004524                        library file exists, but the corresponding header files do not. These options prevent
# 004525                        using these unneeded capabilities from the host. 
# 004526 
# 004527                          Prepare File for compilation: 



./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)



# 004535 
# 004536                          Compile the package: 



make FILE_COMPILE=$(pwd)/build/src/file



# 004544 
# 004545                          Install the package: 



make DESTDIR=$LFS install



# 004553 
# 004554                          Details on this package are located in Section 8.10.2, "Contents of File." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'findutils-*')
tar xf $(find -maxdepth 1 -type f -name 'findutils-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'findutils-*')
read -p "Chapter 6.8"
 
# 004555        6.8. Findutils-4.8.0 
# 004556 
# 004557                          The Findutils package contains programs to find files. These programs are provided
# 004558                        to recursively search through a directory tree and to create, maintain, and search
# 004559                        a database (often faster than the recursive find, but is unreliable if the database
# 004560                        has not been recently updated). 
# 004561           Approximate build time: 0.2 SBU
# 004562           Required disk space: 42 MB 
# 004563          6.8.1. Installation of Findutils 
# 004564 
# 004565                          Prepare Findutils for compilation: 



./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)



# 004575 
# 004576                          Compile the package: 



make



# 004584 
# 004585                          Install the package: 



make DESTDIR=$LFS install



# 004593 
# 004594                          Move the executable to its final expected location: 



mv -v $LFS/usr/bin/find $LFS/bin
sed -i 's|find:=${BINDIR}|find:=/bin|' $LFS/usr/bin/updatedb



# 004603 
# 004604                          Details on this package are located in Section 8.56.2, "Contents of Findutils." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'gawk-*')
tar xf $(find -maxdepth 1 -type f -name 'gawk-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'gawk-*')
read -p "Chapter 6.9"
 
# 004605        6.9. Gawk-5.1.0 
# 004606 
# 004607                          The Gawk package contains programs for manipulating text files. 
# 004608           Approximate build time: 0.2 SBU
# 004609           Required disk space: 46 MB 
# 004610          6.9.1. Installation of Gawk 
# 004611 
# 004612                          First, ensure some unneeded files are not installed: 



sed -i 's/extras//' Makefile.in



# 004620 
# 004621                          Prepare Gawk for compilation: 



./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(./config.guess)



# 004631 
# 004632                          Compile the package: 



make



# 004640 
# 004641                          Install the package: 



make DESTDIR=$LFS install



# 004649 
# 004650                          Details on this package are located in Section 8.55.2, "Contents of Gawk." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'grep-*')
tar xf $(find -maxdepth 1 -type f -name 'grep-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'grep-*')
read -p "Chapter 6.10"
 
# 004651        6.10. Grep-3.6 
# 004652 
# 004653                          The Grep package contains programs for searching through the contents of files.
# 004654                        
# 004655           Approximate build time: 0.2 SBU
# 004656           Required disk space: 26 MB 
# 004657          6.10.1. Installation of Grep 
# 004658 
# 004659                          Prepare Grep for compilation: 



./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --bindir=/bin



# 004669 
# 004670                          Compile the package: 



make



# 004678 
# 004679                          Install the package: 



make DESTDIR=$LFS install



# 004687 
# 004688                          Details on this package are located in Section 8.33.2, "Contents of Grep." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'gzip-*')
tar xf $(find -maxdepth 1 -type f -name 'gzip-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'gzip-*')
read -p "Chapter 6.11"
 
# 004689        6.11. Gzip-1.10 
# 004690 
# 004691                          The Gzip package contains programs for compressing and decompressing files. 
# 004692           Approximate build time: 0.1 SBU
# 004693           Required disk space: 10 MB 
# 004694          6.11.1. Installation of Gzip 
# 004695 
# 004696                          Prepare Gzip for compilation: 



./configure --prefix=/usr --host=$LFS_TGT



# 004704 
# 004705                          Compile the package: 



make



# 004713 
# 004714                          Install the package: 



make DESTDIR=$LFS install



# 004722 
# 004723                          Move the executable to its final expected location: 



mv -v $LFS/usr/bin/gzip $LFS/bin



# 004731 
# 004732                          Details on this package are located in Section 8.60.2, "Contents of Gzip." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'make-*')
tar xf $(find -maxdepth 1 -type f -name 'make-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'make-*')
read -p "Chapter 6.12"
 
# 004733        6.12. Make-4.3 
# 004734 
# 004735                          The Make package contains a program for controlling the generation of executables
# 004736                        and other non-source files of a package from source files. 
# 004737           Approximate build time: 0.1 SBU
# 004738           Required disk space: 16 MB 
# 004739          6.12.1. Installation of Make 
# 004740 
# 004741                          Prepare Make for compilation: 



./configure --prefix=/usr   \
            --without-guile \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)



# 004752 
# 004753                          The meaning of the new configure option: 
# 004754 
# 004755                --without-guile  
# 004756 
# 004757                          Although we are cross-compiling, configure tries to use guile from the build host
# 004758                        if it finds it. This makes compilation fail, so this switch prevents using it. 
# 004759 
# 004760                          Compile the package: 



make



# 004768 
# 004769                          Install the package: 



make DESTDIR=$LFS install



# 004777 
# 004778                          Details on this package are located in Section 8.64.2, "Contents of Make." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'patch-*')
tar xf $(find -maxdepth 1 -type f -name 'patch-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'patch-*')
read -p "Chapter 6.13"
 
# 004779        6.13. Patch-2.7.6 
# 004780 
# 004781                          The Patch package contains a program for modifying or creating files by applying
# 004782                        a "patch " file typically created by the diff  program. 
# 004783           Approximate build time: 0.1 SBU
# 004784           Required disk space: 13 MB 
# 004785          6.13.1. Installation of Patch 
# 004786 
# 004787                          Prepare Patch for compilation: 



./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)



# 004797 
# 004798                          Compile the package: 



make



# 004806 
# 004807                          Install the package: 



make DESTDIR=$LFS install



# 004815 
# 004816                          Details on this package are located in Section 8.65.2, "Contents of Patch." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'sed-*')
tar xf $(find -maxdepth 1 -type f -name 'sed-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'sed-*')
read -p "Chapter 6.14"
 
# 004817        6.14. Sed-4.8 
# 004818 
# 004819                          The Sed package contains a stream editor. 
# 004820           Approximate build time: 0.1 SBU
# 004821           Required disk space: 21 MB 
# 004822          6.14.1. Installation of Sed 
# 004823 
# 004824                          Prepare Sed for compilation: 



./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --bindir=/bin



# 004834 
# 004835                          Compile the package: 



make



# 004843 
# 004844                          Install the package: 



make DESTDIR=$LFS install



# 004852 
# 004853                          Details on this package are located in Section 8.29.2, "Contents of Sed." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'tar-*')
tar xf $(find -maxdepth 1 -type f -name 'tar-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'tar-*')
read -p "Chapter 6.15"
 
# 004854        6.15. Tar-1.34 
# 004855 
# 004856                          The Tar package provides the ability to create tar archives as well as perform various
# 004857                        other kinds of archive manipulation. Tar can be used on previously created archives
# 004858                        to extract files, to store additional files, or to update or list files which were
# 004859                        already stored. 
# 004860           Approximate build time: 0.2 SBU
# 004861           Required disk space: 40 MB 
# 004862          6.15.1. Installation of Tar 
# 004863 
# 004864                          Prepare Tar for compilation: 



./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --bindir=/bin



# 004875 
# 004876                          Compile the package: 



make



# 004884 
# 004885                          Install the package: 



make DESTDIR=$LFS install



# 004893 
# 004894                          Details on this package are located in Section 8.67.2, "Contents of Tar." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'xz-*')
tar xf $(find -maxdepth 1 -type f -name 'xz-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'xz-*')
read -p "Chapter 6.16"
 
# 004895        6.16. Xz-5.2.5 
# 004896 
# 004897                          The Xz package contains programs for compressing and decompressing files. It provides
# 004898                        capabilities for the lzma and the newer xz compression formats. Compressing text
# 004899                        files with xz  yields a better compression percentage than with the traditional gzip  or
# 004900                        bzip2  commands. 
# 004901           Approximate build time: 0.1 SBU
# 004902           Required disk space: 16 MB 
# 004903          6.16.1. Installation of Xz 
# 004904 
# 004905                          Prepare Xz for compilation: 



./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.2.5



# 004917 
# 004918                          Compile the package: 



make



# 004926 
# 004927                          Install the package: 



make DESTDIR=$LFS install



# 004935 
# 004936                          Make sure that all essential files are in the correct directory: 



mv -v $LFS/usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat}  $LFS/bin
mv -v $LFS/usr/lib/liblzma.so.*                       $LFS/lib
ln -svf ../../lib/$(readlink $LFS/usr/lib/liblzma.so) $LFS/usr/lib/liblzma.so



# 004946 
# 004947                          Details on this package are located in Section 8.8.2, "Contents of Xz." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'binutils-*')
tar xf $(find -maxdepth 1 -type f -name 'binutils-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'binutils-*')
read -p "Chapter 6.17"
 
# 004948        6.17. Binutils-2.36.1 - Pass 2 
# 004949 
# 004950                          The Binutils package contains a linker, an assembler, and other tools for handling
# 004951                        object files. 
# 004952           Approximate build time: 1.3 SBU
# 004953           Required disk space: 517 MB 
# 004954          6.17.1. Installation of Binutils 
# 004955 
# 004956                          Create a separate build directory again: 



mkdir -v build
cd       build



# 004965 
# 004966                          Prepare Binutils for compilation: 



../configure                   \
    --prefix=/usr              \
    --build=$(../config.guess) \
    --host=$LFS_TGT            \
    --disable-nls              \
    --enable-shared            \
    --disable-werror           \
    --enable-64-bit-bfd



# 004981 
# 004982                          The meaning of the new configure options: 
# 004983 
# 004984                --enable-shared  
# 004985 
# 004986                          Builds libbfdas a shared library. 
# 004987 
# 004988                --enable-64-bit-bfd  
# 004989 
# 004990                          Enables 64-bit support (on hosts with narrower word sizes). May not be needed on
# 004991                        64-bit systems, but does no harm. 
# 004992 
# 004993                          Compile the package: 



make



# 005001 
# 005002                          Install the package, and workaround an issue causing libctf.soto link against zlib
# 005003                        from the host distribution: 



make DESTDIR=$LFS install
install -vm755 libctf/.libs/libctf.so.0.0.0 $LFS/usr/lib



# 005012 
# 005013                          Details on this package are located in Section 8.18.2, "Contents of Binutils." 


cd $LFS/sources
rm -rf $(find -maxdepth 1 -type d -name 'gcc-*')
tar xf $(find -maxdepth 1 -type f -name 'gcc-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'gcc-*')
read -p "Chapter 6.18"
 
# 005014        6.18. GCC-10.2.0 - Pass 2 
# 005015 
# 005016                          The GCC package contains the GNU compiler collection, which includes the C and C++
# 005017                        compilers. 
# 005018           Approximate build time: 11 SBU
# 005019           Required disk space: 3.7 GB 
# 005020          6.18.1. Installation of GCC 
# 005021 
# 005022                          As in the first build of GCC, the GMP, MPFR, and MPC packages are required. Unpack
# 005023                        the tarballs and move them into the required directory names: 



tar -xf ../mpfr-4.1.0.tar.xz
mv -v mpfr-4.1.0 mpfr
tar -xf ../gmp-6.2.1.tar.xz
mv -v gmp-6.2.1 gmp
tar -xf ../mpc-1.2.1.tar.gz
mv -v mpc-1.2.1 mpc



# 005036 
# 005037                          If building on x86_64, change the default directory name for 64-bit libraries to
# 005038                        "lib " : 



case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
  ;;
esac



# 005050 
# 005051                          Create a separate build directory again: 



mkdir -v build
cd       build



# 005060 
# 005061                          Create a symlink that allows libgcc to be built with posix threads support: 



mkdir -pv $LFS_TGT/libgcc
ln -s ../../../libgcc/gthr-posix.h $LFS_TGT/libgcc/gthr-default.h



# 005070 
# 005071                          Before starting to build GCC, remember to unset any environment variables that override
# 005072                        the default optimization flags. 
# 005073 
# 005074                          Now prepare GCC for compilation: 



../configure                                       \
    --build=$(../config.guess)                     \
    --host=$LFS_TGT                                \
    --prefix=/usr                                  \
    CC_FOR_TARGET=$LFS_TGT-gcc                     \
    --with-build-sysroot=$LFS                      \
    --enable-initfini-array                        \
    --disable-nls                                  \
    --disable-multilib                             \
    --disable-decimal-float                        \
    --disable-libatomic                            \
    --disable-libgomp                              \
    --disable-libquadmath                          \
    --disable-libssp                               \
    --disable-libvtv                               \
    --disable-libstdcxx                            \
    --enable-languages=c,c++



# 005098 
# 005099                          The meaning of the new configure options: 
# 005100 
# 005101                -with-build-sysroot=$LFS  
# 005102 
# 005103                          Normally, using --host ensures that a cross-compiler is used for building GCC, and
# 005104                        that compiler knows that it has to look for headers and libraries in $LFS. But the
# 005105                        build system of GCC uses other tools, which are not aware of this location. This
# 005106                        switch is needed to have them find the needed files in $LFS, and not on the host.
# 005107                        
# 005108 
# 005109                --enable-initfini-array  
# 005110 
# 005111                          This option is automatically enabled when building a native compiler with a native
# 005112                        compiler on x86. But here, we build with a cross compiler, so we need to explicitly
# 005113                        set this option. 
# 005114 
# 005115                          Compile the package: 



make



# 005123 
# 005124                          Install the package: 



make DESTDIR=$LFS install



# 005132 
# 005133                          As a finishing touch, create a utility symlink. Many programs and scripts run cc  instead
# 005134                        of gcc  , which is used to keep programs generic and therefore usable on all kinds
# 005135                        of UNIX systems where the GNU C compiler is not always installed. Running cc  leaves
# 005136                        the system administrator free to decide which C compiler to install: 



ln -sv gcc $LFS/usr/bin/cc



# 005144 
# 005145                          Details on this package are located in Section 8.26.2, "Contents of GCC." 
