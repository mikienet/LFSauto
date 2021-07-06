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
read -p "at end ... run = sudo ./LFS-10.1_step-4.sh"

#----------------------------------------------
# not in LFS book ... need to untar.
cd $LFS/sources
wget http://www.linuxfromscratch.org/lfs/downloads/stable/wget-list --continue
wget --input-file=wget-list --continue 
wget http://www.linuxfromscratch.org/lfs/downloads/stable/md5sums --continue
wget https://sourceforge.net/projects/expat/files/expat/2.4.1/expat-2.4.1.tar.xz --continue
for file in *.tar.*; do tar xvf "$file"; done

#        4.5. About SBUs  
# 
#                          Many people would like to know beforehand approximately how long it takes to compile
#                        and install each package. Because Linux From Scratch can be built on many different
#                        systems, it is impossible to provide accurate time estimates. The biggest package
#                        (Glibc) will take approximately 20 minutes on the fastest systems, but could take
#                        up to three days on slower systems! Instead of providing actual times, the Standard
#                        Build Unit (SBU) measure will be used instead. 
# 
#                          The SBU measure works as follows. The first package to be compiled from this book
#                        is binutils in Chapter 5. The time it takes to compile this package is what will
#                        be referred to as the Standard Build Unit or SBU. All other compile times will be
#                        expressed relative to this time.  
# 
#                          For example, consider a package whose compilation time is 4.5 SBUs. This means that
#                        if a system took 10 minutes to compile and install the first pass of binutils, it
#                        will take approximately 45 minutes to build this example package. Fortunately, most
#                        build times are shorter than the one for binutils. 
# 
#                          In general, SBUs are not entirely accurate because they depend on many factors,
#                        including the host system's version of GCC. They are provided here to give an estimate
#                        of how long it might take to install a package, but the numbers can vary by as much
#                        as dozens of minutes in some cases. 
#          Note 
# 
#                          For many modern systems with multiple processors (or cores) the compilation time
#                        for a package can be reduced by performing a "parallel make" by either setting an
#                        environment variable or telling the  make program how many processors are available.
#                        For instance, an Intel i5-6500 CPU can support four simultaneous processes with:
#                        



# export MAKEFLAGS='-j4'
# 


# 
#                          or just building with: 



# make -j4
# 


# 
#                          When multiple processors are used in this way, the SBU units in the book will vary
#                        even more than they normally would. In some cases, the make step will simply fail.
#                        Analyzing the output of the build process will also be more difficult because the
#                        lines of different processes will be interleaved. If you run into a problem with
#                        a build step, revert back to a single processor build to properly analyze the error
#                        messages.  
#        4.6. About the Test Suites  
# 
#                          Most packages provide a test suite. Running the test suite for a newly built package
#                        is a good idea because it can provide a "sanity check"indicating that everything
#                        compiled correctly. A test suite that passes its set of checks usually proves that
#                        the package is functioning as the developer intended. It does not, however, guarantee
#                        that the package is totally bug free. 
# 
#                          Some test suites are more important than others. For example, the test suites for
#                        the core toolchain packages;GCC, binutils, and glibc;are of the utmost importance
#                        due to their central role in a properly functioning system. The test suites for
#                        GCC and glibc can take a very long time to complete, especially on slower hardware,
#                        but are strongly recommended. 
#          Note 
# 
#                          Running the test suites in Chapter 5and Chapter 6is impossible, since the programs
#                        are compiled with a cross-compiler, so are not supposed to be able to run on the
#                        build host.  
# 
#                          A common issue with running the test suites for binutils and GCC is running out
#                        of pseudo terminals (PTYs). This can result in a high number of failing tests. This
#                        may happen for several reasons, but the most likely cause is that the host system
#                        does not have the devptsfile system set up correctly. This issue is discussed in
#                        greater detail at http://www.linuxfromscratch.org/lfs/faq.html#no-ptys.  
# 
#                          Sometimes package test suites will fail, but for reasons which the developers are
#                        aware of and have deemed non-critical. Consult the logs located at http://www.linuxfromscratch.org/lfs/build-logs/10.1/to
#                        verify whether or not these failures are expected. This site is valid for all tests
#                        throughout this book.   
#      Part III. Building the LFS Cross Toolchain and Temporary Tools  
#        Important Preliminary Material  
#        Introduction  
# 
#                          This part is divided into three stages: first building a cross compiler and its
#                        associated libraries; second, use this cross toolchain to build several utilities
#                        in a way that isolates them from the host distribution; third, enter the chroot
#                        environment, which further improves host isolation, and build the remaining tools
#                        needed to build the final system. 
#          Important 
# 
#                          With this part begins the real work of building a new system. It requires much care
#                        in ensuring that the instructions are followed exactly as the book shows them. You
#                        should try to understand what they do, and whatever your eagerness to finish your
#                        build, you should refrain from blindly type them as shown, but rather read documentation
#                        when there is something you do not understand. Also, keep track of your typing and
#                        of the output of commands, by sending them to a file, using the tee utility. This
#                        allows for better diagnosing if something gets wrong. 
# 
#                          The next section gives a technical introduction to the build process, while the
#                        following one contains  very important general instructions.  
#        Toolchain Technical Notes  
# 
#                          This section explains some of the rationale and technical details behind the overall
#                        build method. It is not essential to immediately understand everything in this section.
#                        Most of this information will be clearer after performing an actual build. This
#                        section can be referred to at any time during the process. 
# 
#                          The overall goal of Chapter 5and Chapter 6is to produce a temporary area that contains
#                        a known-good set of tools that can be isolated from the host system. By using  chroot ,
#                        the commands in the remaining chapters will be contained within that environment,
#                        ensuring a clean, trouble-free build of the target LFS system. The build process
#                        has been designed to minimize the risks for new readers and to provide the most
#                        educational value at the same time. 
# 
#                          The build process is based on the process of  cross-compilation . Cross-compilation
#                        is normally used for building a compiler and its toolchain for a machine different
#                        from the one that is used for the build. This is not strictly needed for LFS, since
#                        the machine where the new system will run is the same as the one used for the build.
#                        But cross-compilation has the great advantage that anything that is cross-compiled
#                        cannot depend on the host environment.  
#          About Cross-Compilation  
# 
#                          Cross-compilation involves some concepts that deserve a section on their own. Although
#                        this section may be omitted in a first reading, it is strongly suggested to come
#                        back to it later in order to get a full grasp of the build process. 
# 
#                          Let us first define some terms used in this context: 
# 
#                build
# 
#                          is the machine where we build programs. Note that this machine is referred to as
#                        the "host"in other sections. 
# 
#                host
# 
#                          is the machine/system where the built programs will run. Note that this use of "host"is
#                        not the same as in other sections. 
# 
#                target
# 
#                          is only used for compilers. It is the machine the compiler produces code for. It
#                        may be different from both build and host. 
# 
#                          As an example, let us imagine the following scenario (sometimes referred to as "Canadian
#                        Cross"): we may have a compiler on a slow machine only, let's call the machine A,
#                        and the compiler ccA. We may have also a fast machine (B), but with no compiler,
#                        and we may want to produce code for another slow machine (C). To build a compiler
#                        for machine C, we would have three stages: 
# 
#                Stage Build Host Target Action 1 A A B build cross-compiler cc1 using ccA on machine A 2 A B C build cross-compiler cc2 using cc1 on machine A 3 B C C build compiler ccC using cc2 on machine B 
# 
#                          Then, all the other programs needed by machine C can be compiled using cc2 on the
#                        fast machine B. Note that unless B can run programs produced for C, there is no
#                        way to test the built programs until machine C itself is running. For example, for
#                        testing ccC, we may want to add a fourth stage: 
# 
#                Stage Build Host Target Action 4 C C C rebuild and test ccC using itself on machine C 
# 
#                          In the example above, only cc1 and cc2 are cross-compilers, that is, they produce
#                        code for a machine different from the one they are run on. The other compilers ccA
#                        and ccC produce code for the machine they are run on. Such compilers are called
#                         native compilers.  
#          Implementation of Cross-Compilation for LFS  
#          Note 
# 
#                          Almost all the build systems use names of the form cpu-vendor-kernel-os referred
#                        to as the machine triplet. An astute reader may wonder why a "triplet"refers to
#                        a four component name. The reason is history: initially, three component names were
#                        enough to designate unambiguously a machine, but with new machines and systems appearing,
#                        that proved insufficient. The word "triplet"remained. A simple way to determine
#                        your machine triplet is to run the  config.guess script that comes with the source
#                        for many packages. Unpack the binutils sources and run the script:  ./config.guessand
#                        note the output. For example, for a 32-bit Intel processor the output will be  i686-pc-linux-gnu .
#                        On a 64-bit system it will be  x86_64-pc-linux-gnu . 
# 
#                          Also be aware of the name of the platform's dynamic linker, often referred to as
#                        the dynamic loader (not to be confused with the standard linker  ld that is part of
#                        binutils). The dynamic linker provided by Glibc finds and loads the shared libraries
#                        needed by a program, prepares the program to run, and then runs it. The name of
#                        the dynamic linker for a 32-bit Intel machine will be ld-linux.so.2(ld-linux-x86-64.so.2for
#                        64-bit systems). A sure-fire way to determine the name of the dynamic linker is
#                        to inspect a random binary from the host system by running:  readelf -l <name of
#                        binary> | grep interpreterand noting the output. The authoritative reference covering
#                        all platforms is in the shlib-versionsfile in the root of the Glibc source tree.
#                         
# 
#                          In order to fake a cross compilation, the name of the host triplet is slightly adjusted
#                        by changing the "vendor" field in the LFS_TGTvariable. We also use the --with-sysrootoption
#                        when building the cross linker and cross compiler to tell them where to find the
#                        needed host files. This ensures that none of the other programs built in Chapter
#                        6can link to libraries on the build machine. Only two stages are mandatory, and
#                        one more for tests:   
# 
#                Stage Build Host Target Action 1 pc pc lfs build cross-compiler cc1 using cc-pc on pc 2 pc lfs lfs build compiler cc-lfs using cc1 on pc 3 lfs lfs lfs rebuild and test cc-lfs using itself on lfs 
# 
#                          In the above table, "on pc"means the commands are run on a machine using the already
#                        installed distribution. "On lfs"means the commands are run in a chrooted environment.
#                        
# 
#                          Now, there is more about cross-compiling: the C language is not just a compiler,
#                        but also defines a standard library. In this book, the GNU C library, named glibc,
#                        is used. This library must be compiled for the lfs machine, that is, using the cross
#                        compiler cc1. But the compiler itself uses an internal library implementing complex
#                        instructions not available in the assembler instruction set. This internal library
#                        is named libgcc, and must be linked to the glibc library to be fully functional!
#                        Furthermore, the standard library for C++ (libstdc++) also needs being linked to
#                        glibc. The solution to this chicken and egg problem is to first build a degraded
#                        cc1 based libgcc, lacking some functionalities such as threads and exception handling,
#                        then build glibc using this degraded compiler (glibc itself is not degraded), then
#                        build libstdc++. But this last library will lack the same functionalities as libgcc.
#                        
# 
#                          This is not the end of the story: the conclusion of the preceding paragraph is that
#                        cc1 is unable to build a fully functional libstdc++, but this is the only compiler
#                        available for building the C/C++ libraries during stage 2! Of course, the compiler
#                        built during stage 2, cc-lfs, would be able to build those libraries, but (1) the
#                        build system of GCC does not know that it is usable on pc, and (2) using it on pc
#                        would be at risk of linking to the pc libraries, since cc-lfs is a native compiler.
#                        So we have to build libstdc++ later, in chroot.  
#          Other procedural details  
# 
#                          The cross-compiler will be installed in a separate $LFS/toolsdirectory, since it
#                        will not be part of the final system. 
# 
#                          Binutils is installed first because the configure runs of both GCC and Glibc perform
#                        various feature tests on the assembler and linker to determine which software features
#                        to enable or disable. This is more important than one might first realize. An incorrectly
#                        configured GCC or Glibc can result in a subtly broken toolchain, where the impact
#                        of such breakage might not show up until near the end of the build of an entire
#                        distribution. A test suite failure will usually highlight this error before too
#                        much additional work is performed. 
# 
#                          Binutils installs its assembler and linker in two locations, $LFS/tools/binand $LFS/tools/$LFS_TGT/bin.
#                        The tools in one location are hard linked to the other. An important facet of the
#                        linker is its library search order. Detailed information can be obtained from  ld by
#                        passing it the  --verboseflag. For example,  $LFS_TGT-ld --verbose | grep SEARCH will
#                        illustrate the current search paths and their order. It shows which files are linked
#                        by  ld by compiling a dummy program and passing the  --verboseswitch to the linker.
#                        For example,  $LFS_TGT-gcc dummy.c -Wl,--verbose 2>&1 | grep succeeded will show all
#                        the files successfully opened during the linking. 
# 
#                          The next package installed is GCC. An example of what can be seen during its run
#                        of  configure is: 



# checking what assembler to use... /mnt/lfs/tools/i686-lfs-linux-gnu/bin/as
# checking what linker to use... /mnt/lfs/tools/i686-lfs-linux-gnu/bin/ld
# 


# 
#                          This is important for the reasons mentioned above. It also demonstrates that GCC's
#                        configure script does not search the PATH directories to find which tools to use.
#                        However, during the actual operation of  gcc itself, the same search paths are not
#                        necessarily used. To find out which standard linker  gcc will use, run:  $LFS_TGT-gcc
#                        -print-prog-name=ld . 
# 
#                          Detailed information can be obtained from  gcc by passing it the  -vcommand line option
#                        while compiling a dummy program. For example,  gcc -v dummy.c will show detailed information
#                        about the preprocessor, compilation, and assembly stages, including  gcc 's included
#                        search paths and their order. 
# 
#                          Next installed are sanitized Linux API headers. These allow the standard C library
#                        (Glibc) to interface with features that the Linux kernel will provide. 
# 
#                          The next package installed is Glibc. The most important considerations for building
#                        Glibc are the compiler, binary tools, and kernel headers. The compiler is generally
#                        not an issue since Glibc will always use the compiler relating to the  --hostparameter
#                        passed to its configure script; e.g. in our case, the compiler will be  $LFS_TGT-gcc .
#                        The binary tools and kernel headers can be a bit more complicated. Therefore, take
#                        no risks and use the available configure switches to enforce the correct selections.
#                        After the run of  configure , check the contents of the config.makefile in the builddirectory
#                        for all important details. Note the use of  CC="$LFS_TGT-gcc"(with $LFS_TGTexpanded)
#                        to control which binary tools are used and the use of the  -nostdincand  -isystemflags
#                        to control the compiler's include search path. These items highlight an important
#                        aspect of the Glibc package;it is very self-sufficient in terms of its build machinery
#                        and generally does not rely on toolchain defaults.  
# 
#                          As said above, the standard C++ library is compiled next, followed in Chapter 6by
#                        all the programs that need themselves to be built. The install step of all those
#                        packages uses the DESTDIRvariable to have the programs land into the LFS filesystem.
#                         
# 
#                          At the end of Chapter 6the native lfs compiler is installed. First binutils-pass2
#                        is built, with the same DESTDIRinstall as the other programs, then the second pass
#                        of GCC is constructed, omitting libstdc++ and other non-important libraries. Due
#                        to some weird logic in GCC's configure script, CC_FOR_TARGETends up as  cc when the
#                        host is the same as the target, but is different from the build system. This is
#                        why  CC_FOR_TARGET=$LFS_TGT-gccis put explicitly into the configure options.  
# 
#                          Upon entering the chroot environment in Chapter 7, the first task is to install
#                        libstdc++. Then temporary installations of programs needed for the proper operation
#                        of the toolchain are performed. From this point onwards, the core toolchain is self-contained
#                        and self-hosted. In Chapter 8, final versions of all the packages needed for a fully
#                        functional system are built, tested and installed.  
#        General Compilation Instructions  
# 
#                          When building packages there are several assumptions made within the instructions:
#                        
# 
#                          Several of the packages are patched before compilation, but only when the patch
#                        is needed to circumvent a problem. A patch is often needed in both this and the
#                        following chapters, but sometimes in only one location. Therefore, do not be concerned
#                        if instructions for a downloaded patch seem to be missing. Warning messages about
#                        offset or  fuzz may also be encountered when applying a patch. Do not worry about these
#                        warnings, as the patch was still successfully applied. 
# 
#                          During the compilation of most packages, there will be several warnings that scroll
#                        by on the screen. These are normal and can safely be ignored. These warnings are
#                        as they appear;warnings about deprecated, but not invalid, use of the C or C++ syntax.
#                        C standards change fairly often, and some packages still use the older standard.
#                        This is not a problem, but does prompt the warning. 
# 
#                          Check one last time that the LFSenvironment variable is set up properly: 



# echo $LFS
# 


# 
#                          Make sure the output shows the path to the LFS partition's mount point, which is
#                        /mnt/lfs, using our example. 
# 
#                          Finally, two important items must be emphasized: 
#          Important 
# 
#                          The build instructions assume that the Host System Requirements, including symbolic
#                        links, have been set properly:   
# 
#                          bash is the shell in use.  
# 
#                          sh is a symbolic link to  bash .  
# 
#                          /usr/bin/awk is a symbolic link to  gawk .  
# 
#                          /usr/bin/yacc is a symbolic link to  bison or a small script that executes bison. 
#          Important 
# 
#                          To re-emphasize the build process: 
# 
#                          Place all the sources and patches in a directory that will be accessible from the
#                        chroot environment such as /mnt/lfs/sources/. 
# 
#                          Change to the sources directory.  
# 
#                          For each package:  
# 
#                          Using the tar program, extract the package to be built. In Chapter 5and Chapter 6,
#                        ensure you are the   lfs user when extracting the package. 
# 
#                          Change to the directory created when the package was extracted. 
# 
#                          Follow the book's instructions for building the package. 
# 
#                          Change back to the sources directory. 
# 
#                          Delete the extracted source directory unless instructed otherwise.  
#        Chapter 5. Compiling a Cross-Toolchain  
#        5.1. Introduction  
# 
#                          This chapter shows how to build a cross-compiler and its associated tools. Although
#                        here cross-compilation is faked, the principles are the same as for a real cross-toolchain.
#                        
# 
#                          The programs compiled in this chapter will be installed under the $LFS/toolsdirectory
#                        to keep them separate from the files installed in the following chapters. The libraries,
#                        on the other hand, are installed into their final place, since they pertain to the
#                        system we want to build. 


cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'binutils-*' | cut -c 2-)"


read -p "Chapter 5.2"

#        5.2. Binutils-2.36.1 - Pass 1  
# 
#                          The Binutils package contains a linker, an assembler, and other tools for handling
#                        object files. 
#           Approximate build time: 1 SBU
#           Required disk space: 640 MB
#          5.2.1. Installation of Cross Binutils 
#          Note 
# 
#                          Go back and re-read the notes in the section titled General Compilation Instructions.
#                        Understanding the notes labeled important can save you a lot of problems later.
#                         
# 
#                          It is important that Binutils be the first package compiled because both Glibc and
#                        GCC perform various tests on the available linker and assembler to determine which
#                        of their own features to enable. 
# 
#                          The Binutils documentation recommends building Binutils in a dedicated build directory:
#                        



mkdir -v build
cd       build



#          Note 
# 
#                          In order for the SBU values listed in the rest of the book to be of any use, measure
#                        the time it takes to build this package from the configuration, up to and including
#                        the first install. To achieve this easily, wrap the commands in a  time command like
#                        this:  time { ../configure ... && make && make install; }.  
# 
#                          Now prepare Binutils for compilation: 



../configure --prefix=$LFS/tools       \
             --with-sysroot=$LFS        \
             --target=$LFS_TGT          \
             --disable-nls              \
             --disable-werror



# 
#                          The meaning of the configure options: 
# 
#                --prefix=$LFS/tools 
# 
#                          This tells the configure script to prepare to install the binutils programs in the
#                        $LFS/toolsdirectory. 
# 
#                --with-sysroot=$LFS 
# 
#                          For cross compilation, this tells the build system to look in $LFS for the target
#                        system libraries as needed. 
# 
#                --target=$LFS_TGT
# 
#                          Because the machine description in the LFS_TGTvariable is slightly different than
#                        the value returned by the  config.guess script, this switch will tell the  configure script
#                        to adjust binutil's build system for building a cross linker. 
# 
#                --disable-nls 
# 
#                          This disables internationalization as i18n is not needed for the temporary tools.
#                        
# 
#                --disable-werror 
# 
#                          This prevents the build from stopping in the event that there are warnings from
#                        the host's compiler. 
# 
#                          Continue with compiling the package: 



make



# 
#                          Install the package: 



make install



# 
#                          Details on this package are located in Section 8.18.2, "Contents of Binutils."  


cd ..
rm -rf ./build
cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'gcc-*' | cut -c 2-)"


read -p "Chapter 5.3"

#        5.3. GCC-10.2.0 - Pass 1  
# 
#                          The GCC package contains the GNU compiler collection, which includes the C and C++
#                        compilers. 
#           Approximate build time: 11 SBU
#           Required disk space: 3.7 GB
#          5.3.1. Installation of Cross GCC 
# 
#                          GCC requires the GMP, MPFR and MPC packages. As these packages may not be included
#                        in your host distribution, they will be built with GCC. Unpack each package into
#                        the GCC source directory and rename the resulting directories so the GCC build procedures
#                        will automatically use them: 
#          Note 
# 
#                          There are frequent misunderstandings about this chapter. The procedures are the
#                        same as every other chapter as explained earlier (Package build instructions). First
#                        extract the gcc tarball from the sources directory and then change to the directory
#                        created. Only then should you proceed with the instructions below.  



tar -xf ../mpfr-4.1.0.tar.xz
mv -v mpfr-4.1.0 mpfr
tar -xf ../gmp-6.2.1.tar.xz
mv -v gmp-6.2.1 gmp
tar -xf ../mpc-1.2.1.tar.gz
mv -v mpc-1.2.1 mpc



# 
#                          On x86_64 hosts, set the default directory name for 64-bit libraries to "lib": 



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


 
# 
#                          The meaning of the configure options: 
# 
#                --with-glibc-version=2.11 
# 
#                          This option ensures the package will be compatible with the host's version of glibc.
#                        It is set to the minimum glibc requirement specified in the Host System Requirements.
#                         
# 
#                --with-newlib 
# 
#                          Since a working C library is not yet available, this ensures that the inhibit_libc
#                        constant is defined when building libgcc. This prevents the compiling of any code
#                        that requires libc support. 
# 
#                --without-headers 
# 
#                          When creating a complete cross-compiler, GCC requires standard headers compatible
#                        with the target system. For our purposes these headers will not be needed. This
#                        switch prevents GCC from looking for them. 
# 
#                --enable-initfini-array 
# 
#                          This switch forces the use of some internal data structures that are needed but
#                        cannot be detected when building a cross compiler. 
# 
#                --disable-shared 
# 
#                          This switch forces GCC to link its internal libraries statically. We need this because
#                        the shared libraries require glibc, which is not yet installed on the target system.
#                        
# 
#                --disable-multilib 
# 
#                          On x86_64, LFS does not support a multilib configuration. This switch is harmless
#                        for x86. 
# 
#                --disable-decimal-float, --disable-threads, --disable-libatomic, --disable-libgomp, --disable-libquadmath, --disable-libssp, --disable-libvtv, --disable-libstdcxx 
# 
#                          These switches disable support for the decimal floating point extension, threading,
#                        libatomic, libgomp, libquadmath, libssp, libvtv, and the C++ standard library respectively.
#                        These features will fail to compile when building a cross-compiler and are not necessary
#                        for the task of cross-compiling the temporary libc. 
# 
#                --enable-languages=c,c++ 
# 
#                          This option ensures that only the C and C++ compilers are built. These are the only
#                        languages needed now. 
# 
#                          Compile GCC by running: 



make



# 
#                          Install the package: 



make install



# 
#                          This build of GCC has installed a couple of internal system headers. Normally one
#                        of them, limits.h, would in turn include the corresponding system limits.hheader,
#                        in this case, $LFS/usr/include/limits.h. However, at the time of this build of GCC
#                        $LFS/usr/include/limits.hdoes not exist, so the internal header that has just been
#                        installed is a partial, self-contained file and does not include the extended features
#                        of the system header. This is adequate for building glibc, but the full internal
#                        header will be needed later. Create a full version of the internal header using
#                        a command that is identical to what the GCC build system does in normal circumstances:
#                        



cd ..
cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
  `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/install-tools/include/limits.h



# 
#                          Details on this package are located in Section 8.26.2, "Contents of GCC."  


rm -rf ./build
cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'linux-*' | cut -c 2-)"


read -p "Chapter 5.4"

#        5.4. Linux-5.10.17 API Headers  
# 
#                          The Linux API Headers (in linux-5.10.17.tar.xz) expose the kernel's API for use
#                        by Glibc. 
#           Approximate build time: 0.1 SBU
#           Required disk space: 1.1 GB
#          5.4.1. Installation of Linux API Headers 
# 
#                          The Linux kernel needs to expose an Application Programming Interface (API) for
#                        the system's C library (Glibc in LFS) to use. This is done by way of sanitizing
#                        various C header files that are shipped in the Linux kernel source tarball. 
# 
#                          Make sure there are no stale files embedded in the package: 



make mrproper



# 
#                          Now extract the user-visible kernel headers from the source. The recommended make
#                        target "headers_install"cannot be used, because it requires rsync, which may not
#                        be available. The headers are first placed in ./usr, then copied to the needed location.
#                        



make headers
find usr/include -name '.*' -delete
rm usr/include/Makefile
cp -rv usr/include $LFS/usr


 
#          5.4.2. Contents of Linux API Headers  
#           Installed headers: /usr/include/asm/*.h, /usr/include/asm-generic/*.h, /usr/include/drm/*.h, /usr/include/linux/*.h, /usr/include/misc/*.h, /usr/include/mtd/*.h, /usr/include/rdma/*.h, /usr/include/scsi/*.h, /usr/include/sound/*.h, /usr/include/video/*.h, and /usr/include/xen/*.h
#           Installed directories: /usr/include/asm, /usr/include/asm-generic, /usr/include/drm, /usr/include/linux, /usr/include/misc, /usr/include/mtd, /usr/include/rdma, /usr/include/scsi, /usr/include/sound, /usr/include/video, and /usr/include/xen 
#            Short Descriptions   
# 
#                          
# 
#                /usr/include/asm/*.h 
# 
#                          The Linux API ASM Headers  
# 
#                          /usr/include/asm-generic/*.h 
# 
#                          The Linux API ASM Generic Headers  
# 
#                          /usr/include/drm/*.h 
# 
#                          The Linux API DRM Headers  
# 
#                          /usr/include/linux/*.h 
# 
#                          The Linux API Linux Headers  
# 
#                          /usr/include/misc/*.h 
# 
#                          The Linux API Miscellaneous Headers  
# 
#                          /usr/include/mtd/*.h 
# 
#                          The Linux API MTD Headers  
# 
#                          /usr/include/rdma/*.h 
# 
#                          The Linux API RDMA Headers  
# 
#                          /usr/include/scsi/*.h 
# 
#                          The Linux API SCSI Headers  
# 
#                          /usr/include/sound/*.h 
# 
#                          The Linux API Sound Headers  
# 
#                          /usr/include/video/*.h 
# 
#                          The Linux API Video Headers  
# 
#                          /usr/include/xen/*.h 
# 
#                          The Linux API Xen Headers 


cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'glibc-*' | cut -c 2-)"


read -p "Chapter 5.5"

#        5.5. Glibc-2.33  
# 
#                          The Glibc package contains the main C library. This library provides the basic routines
#                        for allocating memory, searching directories, opening and closing files, reading
#                        and writing files, string handling, pattern matching, arithmetic, and so on. 
#           Approximate build time: 4.2 SBU
#           Required disk space: 770 MB
#          5.5.1. Installation of Glibc 
# 
#                          First, create a symbolic link for LSB compliance. Additionally, for x86_64, create
#                        a compatibility symbolic link required for proper operation of the dynamic library
#                        loader: 



case $(uname -m) in
    i?86)   ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3
    ;;
    x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
            ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
    ;;
esac



# 
#                          Some of the Glibc programs use the non-FHS compliant /var/dbdirectory to store their
#                        runtime data. Apply the following patch to make such programs store their runtime
#                        data in the FHS-compliant locations: 



patch -Np1 -i ../glibc-2.33-fhs-1.patch



# 
#                          The Glibc documentation recommends building Glibc in a dedicated build directory:
#                        



mkdir -v build
cd       build



# 
#                          Next, prepare Glibc for compilation: 



../configure                             \
      --prefix=/usr                      \
      --host=$LFS_TGT                    \
      --build=$(../scripts/config.guess) \
      --enable-kernel=3.2                \
      --with-headers=$LFS/usr/include    \
      libc_cv_slibdir=/lib


 
# 
#                          The meaning of the configure options: 
# 
#                --host=$LFS_TGT, --build=$(../scripts/config.guess) 
# 
#                          The combined effect of these switches is that Glibc's build system configures itself
#                        to be cross-compiled, using the cross-linker and cross-compiler in $LFS/tools. 
# 
#                --enable-kernel=3.2 
# 
#                          This tells Glibc to compile the library with support for 3.2 and later Linux kernels.
#                        Workarounds for older kernels are not enabled. 
# 
#                --with-headers=$LFS/usr/include 
# 
#                          This tells Glibc to compile itself against the headers recently installed to the
#                        $LFS/usr/include directory, so that it knows exactly what features the kernel has
#                        and can optimize itself accordingly. 
# 
#                libc_cv_slibdir=/lib 
# 
#                          This ensures that the library is installed in /lib instead of the default /lib64
#                        on 64 bit machines. 
# 
#                libc_cv_include_x86_isa_level=no
# 
#                          This disables "x86 ISA needed"property in Glibc libraries. Use it  if you are building
#                        Glibc with -marchoption in CFLAGS, to workaround an issue in Glibc-2.33 breaking
#                        it. 
# 
#                          During this stage the following warning might appear: 



configure: WARNING:
*** These auxiliary programs are missing or
*** incompatible versions: msgfmt
*** some features will be disabled.
*** Check the INSTALL file for required versions.



# 
#                          The missing or incompatible  msgfmt program is generally harmless. This  msgfmt program
#                        is part of the Gettext package which the host distribution should provide. 
#          Note 
# 
#                          There have been reports that this package may fail when building as a "parallel
#                        make". If this occurs, rerun the make command with a "-j1" option. 
# 
#                          Compile the package: 



make



# 
#                          Install the package: 
#          Warning 
# 
#                          If LFSis not properly set, and despite the recommendations, you are building as
#                        root, the next command will install the newly built glibc to your host system, which
#                        most likely will render it unusable. So double check that the environment is correctly
#                        set, before running the following command. 



make DESTDIR=$LFS install


 
# 
#                          The meaning of the make install option:  
# 
#                DESTDIR=$LFS 
# 
#                          The DESTDIRmake variable is used by almost all packages to define the location where
#                        the package should be installed. If it is not set, it defaults to the root (/) directory.
#                        Here we specify that the package be installed in $LFS, which will become the root
#                        after Section 7.4, "Entering the Chroot Environment".  
#          Caution 
# 
#                          At this point, it is imperative to stop and ensure that the basic functions (compiling
#                        and linking) of the new toolchain are working as expected. To perform a sanity check,
#                        run the following commands: 



echo 'int main(){}' > dummy.c
$LFS_TGT-gcc dummy.c
readelf -l a.out | grep '/ld-linux'



# 
#                          If everything is working correctly, there should be no errors, and the output of
#                        the last command will be of the form: 



[Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]



# 
#                          Note that for 32-bit machines, the interpreter name will be /lib/ld-linux.so.2.
#                        
# 
#                          If the output is not shown as above or there was no output at all, then something
#                        is wrong. Investigate and retrace the steps to find out where the problem is and
#                        correct it. This issue must be resolved before continuing on. 
# 
#                          Once all is well, clean up the test files: 



rm -v dummy.c a.out



#          Note 
# 
#                          Building packages in the next chapter will serve as an additional check that the
#                        toolchain has been built properly. If some package, especially binutils-pass2 or
#                        gcc-pass2, fails to build, it is an indication that something has gone wrong with
#                        the previous Binutils, GCC, or Glibc installations. 
# 
#                          Now that our cross-toolchain is complete, finalize the installation of the limits.h
#                        header. For doing so, run a utility provided by the GCC developers: 



$LFS/tools/libexec/gcc/$LFS_TGT/10.2.0/install-tools/mkheaders



# 
#                          Details on this package are located in Section 8.5.3, "Contents of Glibc."  


cd ..
rm -rf ./build
cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'gcc-*' | cut -c 2-)"


read -p "Chapter 5.6"

#        5.6. Libstdc++ from GCC-10.2.0, Pass 1  
# 
#                          Libstdc++ is the standard C++ library. It is needed to compile C++ code (part of
#                        GCC is written in C++), but we had to defer its installation when we built gcc-pass1because
#                        it depends on glibc, which was not yet available in the target directory.  
#           Approximate build time: 0.4 SBU
#           Required disk space: 953 MB
#          5.6.1. Installation of Target Libstdc++ 
#          Note  
# 
#                          Libstdc++is part of the GCC sources. You should first unpack the GCC tarball and
#                        change to the gcc-10.2.0directory. 
# 
#                          Create a separate build directory for libstdc++ and enter it: 



mkdir -v build
cd       build



# 
#                          Prepare libstdc++ for compilation: 



../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --build=$(../config.guess)      \
    --prefix=/usr                   \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/10.2.0


 
# 
#                          The meaning of the configure options: 
# 
#                --host=... 
# 
#                          Specifies the use the cross compiler we have just built instead of the one in /usr/bin.
#                        
# 
#                --disable-libstdcxx-pch 
# 
#                          This switch prevents the installation of precompiled include files, which are not
#                        needed at this stage. 
# 
#                --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/10.2.0 
# 
#                          This is the location where the C++ compiler should search for the standard include
#                        files. In a normal build, this information is automatically passed to the libstdc++
#                         configure options from the top level directory. In our case, this information must
#                        be explicitly given. 
# 
#                          Compile libstdc++ by running: 



make



# 
#                          Install the library: 



make DESTDIR=$LFS install



# 
#                          Details on this package are located in Section 8.26.2, "Contents of GCC."  


cd ..
rm -rf ./build

#        Chapter 6. Cross Compiling Temporary Tools  
#        6.1. Introduction  
# 
#                          This chapter shows how to cross-compile basic utilities using the just built cross-toolchain.
#                        Those utilities are installed into their final location, but cannot be used yet.
#                        Basic tasks still rely on the host's tools. Nevertheless, the installed libraries
#                        are used when linking. 
# 
#                          Using the utilities will be possible in next chapter after entering the "chroot"environment.
#                        But all the packages built in the present chapter need to be built before we do
#                        that. Therefore we cannot be independent of the host system yet. 
# 
#                          Once again, let us recall that improper setting of LFStogether with building as
#                        root, may render your computer unusable. This whole chapter must be done as user
#                        lfs, with the environment as described in Section 4.4, "Setting Up the Environment".
#                          


cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'm4-*' | cut -c 2-)"


read -p "Chapter 6.2"

#        6.2. M4-1.4.18  
# 
#                          The M4 package contains a macro processor. 
#           Approximate build time: 0.1 SBU
#           Required disk space: 22 MB
#          6.2.1. Installation of M4 
# 
#                          First, make some fixes introduced by glibc-2.28: 



sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h



# 
#                          Prepare M4 for compilation: 



./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)



# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make DESTDIR=$LFS install



# 
#                          Details on this package are located in Section 8.12.2, "Contents of M4."  


cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'ncurses-*' | cut -c 2-)"


read -p "Chapter 6.3"

#        6.3. Ncurses-6.2  
# 
#                          The Ncurses package contains libraries for terminal-independent handling of character
#                        screens. 
#           Approximate build time: 0.7 SBU
#           Required disk space: 48 MB
#          6.3.1. Installation of Ncurses 
# 
#                          First, ensure that  gawk is found first during configuration: 



sed -i s/mawk// configure



# 
#                          Then, run the following commands to build the "tic"program on the build host: 



mkdir build
pushd build
  ../configure
  make -C include
  make -C progs tic
popd



# 
#                          Prepare Ncurses for compilation: 



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


 
# 
#                          The meaning of the new configure options: 
# 
#                --with-manpage-format=normal 
# 
#                          This prevents Ncurses installing compressed manual pages, which may happen if the
#                        host distribution itself has compressed manual pages. 
# 
#                --without-ada 
# 
#                          This ensures that Ncurses does not build support for the Ada compiler which may
#                        be present on the host but will not be available once we enter the  chroot environment.
#                        
# 
#                --enable-widec 
# 
#                          This switch causes wide-character libraries (e.g., libncursesw.so.6.2) to be built
#                        instead of normal ones (e.g., libncurses.so.6.2). These wide-character libraries
#                        are usable in both multibyte and traditional 8-bit locales, while normal libraries
#                        work properly only in 8-bit locales. Wide-character and normal libraries are source-compatible,
#                        but not binary-compatible. 
# 
#                --without-normal 
# 
#                          This switch disables building and installing most static libraries. 
# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic install
echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so


 
# 
#                          The meaning of the install options: 
# 
#                TIC_PATH=$(pwd)/build/progs/tic 
# 
#                          We need to pass the path of the just built  tic able to run on the building machine,
#                        so that the terminal database can be created without errors. 
# 
#                
#           echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so 
# 
#                          The libncurses.solibrary is needed by a few packages we will build soon. We create
#                        this small linker script, as this is what is done in Chapter 8.  
# 
#                          Move the shared libraries to the /libdirectory, where they are expected to reside:
#                        



mv -v $LFS/usr/lib/libncursesw.so.6* $LFS/lib



# 
#                          Because the libraries have been moved, one symlink points to a non-existent file.
#                        Recreate it: 



ln -sfv ../../lib/$(readlink $LFS/usr/lib/libncursesw.so) $LFS/usr/lib/libncursesw.so



# 
#                          Details on this package are located in Section 8.28.2, "Contents of Ncurses."  


cd ..
rm -rf ./build
cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'bash-*' | cut -c 2-)"


read -p "Chapter 6.4"

#        6.4. Bash-5.1  
# 
#                          The Bash package contains the Bourne-Again SHell. 
#           Approximate build time: 0.4 SBU
#           Required disk space: 66 MB
#          6.4.1. Installation of Bash 
# 
#                          Prepare Bash for compilation: 



./configure --prefix=/usr                   \
            --build=$(support/config.guess) \
            --host=$LFS_TGT                 \
            --without-bash-malloc


 
# 
#                          The meaning of the configure options: 
# 
#                --without-bash-malloc 
# 
#                          This option turns off the use of Bash's memory allocation (malloc) function which
#                        is known to cause segmentation faults. By turning this option off, Bash will use
#                        the mallocfunctions from Glibc which are more stable. 
# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make DESTDIR=$LFS install



# 
#                          Move the executable to where it is expected: 



mv $LFS/usr/bin/bash $LFS/bin/bash



# 
#                          Make a link for the programs that use  sh for a shell: 



ln -sv bash $LFS/bin/sh



# 
#                          Details on this package are located in Section 8.34.2, "Contents of Bash."  


cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'coreutils-*' | cut -c 2-)"


read -p "Chapter 6.5"

#        6.5. Coreutils-8.32  
# 
#                          The Coreutils package contains utilities for showing and setting the basic system
#                        characteristics. 
#           Approximate build time: 0.5 SBU
#           Required disk space: 170 MB
#          6.5.1. Installation of Coreutils 
# 
#                          Prepare Coreutils for compilation: 



./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --enable-install-program=hostname \
            --enable-no-install-program=kill,uptime


 
# 
#                          The meaning of the configure options: 
# 
#                --enable-install-program=hostname
# 
#                          This enables the  hostname binary to be built and installed - it is disabled by default
#                        but is required by the Perl test suite. 
# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make DESTDIR=$LFS install



# 
#                          Move programs to their final expected locations. Although this is not necessary
#                        in this temporary environment, we must do so because some programs harcode executable
#                        locations: 



mv -v $LFS/usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} $LFS/bin
mv -v $LFS/usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm}        $LFS/bin
mv -v $LFS/usr/bin/{rmdir,stty,sync,true,uname}               $LFS/bin
mv -v $LFS/usr/bin/{head,nice,sleep,touch}                    $LFS/bin
mv -v $LFS/usr/bin/chroot                                     $LFS/usr/sbin
mkdir -pv $LFS/usr/share/man/man8
mv -v $LFS/usr/share/man/man1/chroot.1                        $LFS/usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/'                                           $LFS/usr/share/man/man8/chroot.8



# 
#                          Details on this package are located in Section 8.52.2, "Contents of Coreutils."  


cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'diffutils-*' | cut -c 2-)"


read -p "Chapter 6.6"

#        6.6. Diffutils-3.7  
# 
#                          The Diffutils package contains programs that show the differences between files
#                        or directories. 
#           Approximate build time: 0.1 SBU
#           Required disk space: 26 MB
#          6.6.1. Installation of Diffutils 
# 
#                          Prepare Diffutils for compilation: 



./configure --prefix=/usr --host=$LFS_TGT



# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make DESTDIR=$LFS install



# 
#                          Details on this package are located in Section 8.54.2, "Contents of Diffutils."  


cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'file-*' | cut -c 2-)"


read -p "Chapter 6.7"

#        6.7. File-5.39  
# 
#                          The File package contains a utility for determining the type of a given file or
#                        files. 
#           Approximate build time: 0.2 SBU
#           Required disk space: 31 MB
#          6.7.1. Installation of File 
# 
#                          The  file command on the build host needs to be same version as the one we are building
#                        in order to create the signature file. Run the following commands to build it: 



mkdir build
pushd build
  ../configure --disable-bzlib      \
               --disable-libseccomp \
               --disable-xzlib      \
               --disable-zlib
  make
popd


 
# 
#                          The meaning of the new configure option: 
# 
#                --disable-* 
# 
#                          The configuration script attempts to use some packages from the host distribution
#                        if the corresponding library files exist. It may cause compilation failure if a
#                        library file exists, but the corresponding header files do not. These options prevent
#                        using these unneeded capabilities from the host. 
# 
#                          Prepare File for compilation: 



./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)



# 
#                          Compile the package: 



make FILE_COMPILE=$(pwd)/build/src/file



# 
#                          Install the package: 



make DESTDIR=$LFS install



# 
#                          Details on this package are located in Section 8.10.2, "Contents of File."  


cd ..
rm -rf ./build
cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'findutils-*' | cut -c 2-)"


read -p "Chapter 6.8"

#        6.8. Findutils-4.8.0  
# 
#                          The Findutils package contains programs to find files. These programs are provided
#                        to recursively search through a directory tree and to create, maintain, and search
#                        a database (often faster than the recursive find, but is unreliable if the database
#                        has not been recently updated). 
#           Approximate build time: 0.2 SBU
#           Required disk space: 42 MB
#          6.8.1. Installation of Findutils 
# 
#                          Prepare Findutils for compilation: 



./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)



# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make DESTDIR=$LFS install



# 
#                          Move the executable to its final expected location: 



mv -v $LFS/usr/bin/find $LFS/bin
sed -i 's|find:=${BINDIR}|find:=/bin|' $LFS/usr/bin/updatedb



# 
#                          Details on this package are located in Section 8.56.2, "Contents of Findutils."  


cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'gawk-*' | cut -c 2-)"


read -p "Chapter 6.9"

#        6.9. Gawk-5.1.0  
# 
#                          The Gawk package contains programs for manipulating text files. 
#           Approximate build time: 0.2 SBU
#           Required disk space: 46 MB
#          6.9.1. Installation of Gawk 
# 
#                          First, ensure some unneeded files are not installed: 



sed -i 's/extras//' Makefile.in



# 
#                          Prepare Gawk for compilation: 



./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(./config.guess)



# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make DESTDIR=$LFS install



# 
#                          Details on this package are located in Section 8.55.2, "Contents of Gawk."  


cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'grep-*' | cut -c 2-)"


read -p "Chapter 6.10"

#        6.10. Grep-3.6  
# 
#                          The Grep package contains programs for searching through the contents of files.
#                        
#           Approximate build time: 0.2 SBU
#           Required disk space: 26 MB
#          6.10.1. Installation of Grep 
# 
#                          Prepare Grep for compilation: 



./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --bindir=/bin



# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make DESTDIR=$LFS install



# 
#                          Details on this package are located in Section 8.33.2, "Contents of Grep."  


cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'gzip-*' | cut -c 2-)"


read -p "Chapter 6.11"

#        6.11. Gzip-1.10  
# 
#                          The Gzip package contains programs for compressing and decompressing files. 
#           Approximate build time: 0.1 SBU
#           Required disk space: 10 MB
#          6.11.1. Installation of Gzip 
# 
#                          Prepare Gzip for compilation: 



./configure --prefix=/usr --host=$LFS_TGT



# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make DESTDIR=$LFS install



# 
#                          Move the executable to its final expected location: 



mv -v $LFS/usr/bin/gzip $LFS/bin



# 
#                          Details on this package are located in Section 8.60.2, "Contents of Gzip."  


cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'make-*' | cut -c 2-)"


read -p "Chapter 6.12"

#        6.12. Make-4.3  
# 
#                          The Make package contains a program for controlling the generation of executables
#                        and other non-source files of a package from source files. 
#           Approximate build time: 0.1 SBU
#           Required disk space: 16 MB
#          6.12.1. Installation of Make 
# 
#                          Prepare Make for compilation: 



./configure --prefix=/usr   \
            --without-guile \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)


 
# 
#                          The meaning of the new configure option: 
# 
#                --without-guile 
# 
#                          Although we are cross-compiling, configure tries to use guile from the build host
#                        if it finds it. This makes compilation fail, so this switch prevents using it. 
# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make DESTDIR=$LFS install



# 
#                          Details on this package are located in Section 8.64.2, "Contents of Make."  


cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'patch-*' | cut -c 2-)"


read -p "Chapter 6.13"

#        6.13. Patch-2.7.6  
# 
#                          The Patch package contains a program for modifying or creating files by applying
#                        a "patch"file typically created by the  diff program. 
#           Approximate build time: 0.1 SBU
#           Required disk space: 13 MB
#          6.13.1. Installation of Patch 
# 
#                          Prepare Patch for compilation: 



./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --build=$(build-aux/config.guess)



# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make DESTDIR=$LFS install



# 
#                          Details on this package are located in Section 8.65.2, "Contents of Patch."  


cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'sed-*' | cut -c 2-)"


read -p "Chapter 6.14"

#        6.14. Sed-4.8  
# 
#                          The Sed package contains a stream editor. 
#           Approximate build time: 0.1 SBU
#           Required disk space: 21 MB
#          6.14.1. Installation of Sed 
# 
#                          Prepare Sed for compilation: 



./configure --prefix=/usr   \
            --host=$LFS_TGT \
            --bindir=/bin



# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make DESTDIR=$LFS install



# 
#                          Details on this package are located in Section 8.29.2, "Contents of Sed."  


cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'tar-*' | cut -c 2-)"


read -p "Chapter 6.15"

#        6.15. Tar-1.34  
# 
#                          The Tar package provides the ability to create tar archives as well as perform various
#                        other kinds of archive manipulation. Tar can be used on previously created archives
#                        to extract files, to store additional files, or to update or list files which were
#                        already stored. 
#           Approximate build time: 0.2 SBU
#           Required disk space: 40 MB
#          6.15.1. Installation of Tar 
# 
#                          Prepare Tar for compilation: 



./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --bindir=/bin



# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make DESTDIR=$LFS install



# 
#                          Details on this package are located in Section 8.67.2, "Contents of Tar."  


cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'xz-*' | cut -c 2-)"


read -p "Chapter 6.16"

#        6.16. Xz-5.2.5  
# 
#                          The Xz package contains programs for compressing and decompressing files. It provides
#                        capabilities for the lzma and the newer xz compression formats. Compressing text
#                        files with xz yields a better compression percentage than with the traditional  gzip or
#                         bzip2 commands. 
#           Approximate build time: 0.1 SBU
#           Required disk space: 16 MB
#          6.16.1. Installation of Xz 
# 
#                          Prepare Xz for compilation: 



./configure --prefix=/usr                     \
            --host=$LFS_TGT                   \
            --build=$(build-aux/config.guess) \
            --disable-static                  \
            --docdir=/usr/share/doc/xz-5.2.5



# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make DESTDIR=$LFS install



# 
#                          Make sure that all essential files are in the correct directory: 



mv -v $LFS/usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat}  $LFS/bin
mv -v $LFS/usr/lib/liblzma.so.*                       $LFS/lib
ln -svf ../../lib/$(readlink $LFS/usr/lib/liblzma.so) $LFS/usr/lib/liblzma.so



# 
#                          Details on this package are located in Section 8.8.2, "Contents of Xz."  


cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'binutils-*' | cut -c 2-)"

rm -rf ./build

read -p "Chapter 6.17"

#        6.17. Binutils-2.36.1 - Pass 2  
# 
#                          The Binutils package contains a linker, an assembler, and other tools for handling
#                        object files. 
#           Approximate build time: 1.3 SBU
#           Required disk space: 517 MB
#          6.17.1. Installation of Binutils 
# 
#                          Create a separate build directory again: 



mkdir -v build
cd       build



# 
#                          Prepare Binutils for compilation: 



../configure                   \
    --prefix=/usr              \
    --build=$(../config.guess) \
    --host=$LFS_TGT            \
    --disable-nls              \
    --enable-shared            \
    --disable-werror           \
    --enable-64-bit-bfd


 
# 
#                          The meaning of the new configure options: 
# 
#                --enable-shared 
# 
#                          Builds libbfdas a shared library. 
# 
#                --enable-64-bit-bfd 
# 
#                          Enables 64-bit support (on hosts with narrower word sizes). May not be needed on
#                        64-bit systems, but does no harm. 
# 
#                          Compile the package: 



make



# 
#                          Install the package, and workaround an issue causing libctf.soto link against zlib
#                        from the host distribution: 



make DESTDIR=$LFS install
install -vm755 libctf/.libs/libctf.so.0.0.0 $LFS/usr/lib



# 
#                          Details on this package are located in Section 8.18.2, "Contents of Binutils."  


cd ..
rm -rf ./build
cd $LFS/sources
cd "$LFS/sources$(find -maxdepth 1 -type d -name 'gcc-*' | cut -c 2-)"


read -p "Chapter 6.18"

#        6.18. GCC-10.2.0 - Pass 2  
# 
#                          The GCC package contains the GNU compiler collection, which includes the C and C++
#                        compilers. 
#           Approximate build time: 11 SBU
#           Required disk space: 3.7 GB
#          6.18.1. Installation of GCC 
# 
#                          As in the first build of GCC, the GMP, MPFR, and MPC packages are required. Unpack
#                        the tarballs and move them into the required directory names: 



tar -xf ../mpfr-4.1.0.tar.xz
mv -v mpfr-4.1.0 mpfr
tar -xf ../gmp-6.2.1.tar.xz
mv -v gmp-6.2.1 gmp
tar -xf ../mpc-1.2.1.tar.gz
mv -v mpc-1.2.1 mpc



# 
#                          If building on x86_64, change the default directory name for 64-bit libraries to
#                        "lib": 



case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
  ;;
esac



# 
#                          Create a separate build directory again: 



mkdir -v build
cd       build



# 
#                          Create a symlink that allows libgcc to be built with posix threads support: 



mkdir -pv $LFS_TGT/libgcc
ln -s ../../../libgcc/gthr-posix.h $LFS_TGT/libgcc/gthr-default.h



# 
#                          Before starting to build GCC, remember to unset any environment variables that override
#                        the default optimization flags. 
# 
#                          Now prepare GCC for compilation: 



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


 
# 
#                          The meaning of the new configure options: 
# 
#                -with-build-sysroot=$LFS 
# 
#                          Normally, using  --hostensures that a cross-compiler is used for building GCC, and
#                        that compiler knows that it has to look for headers and libraries in $LFS. But the
#                        build system of GCC uses other tools, which are not aware of this location. This
#                        switch is needed to have them find the needed files in $LFS, and not on the host.
#                         
# 
#                --enable-initfini-array 
# 
#                          This option is automatically enabled when building a native compiler with a native
#                        compiler on x86. But here, we build with a cross compiler, so we need to explicitly
#                        set this option. 
# 
#                          Compile the package: 



make



# 
#                          Install the package: 



make DESTDIR=$LFS install



# 
#                          As a finishing touch, create a utility symlink. Many programs and scripts run  cc instead
#                        of  gcc , which is used to keep programs generic and therefore usable on all kinds
#                        of UNIX systems where the GNU C compiler is not always installed. Running  cc leaves
#                        the system administrator free to decide which C compiler to install: 



ln -sv gcc $LFS/usr/bin/cc



# 
#                          Details on this package are located in Section 8.26.2, "Contents of GCC."  


cd ..
rm -rf ./build

#        Chapter 7. Entering Chroot and Building Additional Temporary Tools  
