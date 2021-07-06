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



cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'libtool-*' | cut -c 2-)"

read -p "Chapter 8.35"

#        8.35. Libtool-2.4.6  
# 
#                          The Libtool package contains the GNU generic library support script. It wraps the
#                        complexity of using shared libraries in a consistent, portable interface. 
#           Approximate build time: 1.6 SBU
#           Required disk space: 43 MB
#          8.35.1. Installation of Libtool 
# 
#                          Prepare Libtool for compilation: 



./configure --prefix=/usr



# 
#                          Compile the package: 



make



# 
#                          To test the results, issue: 



make check



#          Note 
# 
#                          The test time for libtool can be reduced significantly on a system with multiple
#                        cores. To do this, append  TESTSUITEFLAGS=-j<N> to the line above. For instance, using
#                        -j4 can reduce the test time by over 60 percent. 
# 
#                          Five tests are known to fail in the LFS build environment due to a circular dependency,
#                        but all tests pass if rechecked after automake is installed. 
# 
#                          Install the package: 



make install



# 
#                          Remove an useless static library: 



rm -fv /usr/lib/libltdl.a


 
#          8.35.2. Contents of Libtool  
#           Installed programs: libtool and libtoolize
#           Installed libraries: libltdl.so
#           Installed directories: /usr/include/libltdl and /usr/share/libtool 
#            Short Descriptions   
# 
#                          
# 
#                libtool   
# 
#                          Provides generalized library-building support services  
# 
#                          libtoolize   
# 
#                          Provides a standard way to add libtool support to a package   
# 
#                          libltdl 
# 
#                          Hides the various difficulties of dlopening libraries 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'gdbm-*' | cut -c 2-)"

read -p "Chapter 8.36"

#        8.36. GDBM-1.19  
# 
#                          The GDBM package contains the GNU Database Manager. It is a library of database
#                        functions that use extensible hashing and works similar to the standard UNIX dbm.
#                        The library provides primitives for storing key/data pairs, searching and retrieving
#                        the data by its key and deleting a key along with its data. 
#           Approximate build time: 0.2 SBU
#           Required disk space: 11 MB
#          8.36.1. Installation of GDBM 
# 
#                          Prepare GDBM for compilation: 



./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat


 
# 
#                          The meaning of the configure option: 
# 
#                --enable-libgdbm-compat
# 
#                          This switch enables building the libgdbm compatibility library. Some packages outside
#                        of LFS may require the older DBM routines it provides. 
# 
#                          Compile the package: 



make



# 
#                          To test the results, issue: 



make check



# 
#                          One test, VERSION, is known to fail. 
# 
#                          Install the package: 



make install


 
#          8.36.2. Contents of GDBM  
#           Installed programs: gdbm_dump, gdbm_load, and gdbmtool
#           Installed libraries: libgdbm.so and libgdbm_compat.so 
#            Short Descriptions   
# 
#                          
# 
#                gdbm_dump   
# 
#                          Dumps a GDBM database to a file  
# 
#                          gdbm_load   
# 
#                          Recreates a GDBM database from a dump file  
# 
#                          gdbmtool   
# 
#                          Tests and modifies a GDBM database  
# 
#                          libgdbm 
# 
#                          Contains functions to manipulate a hashed database  
# 
#                          libgdbm_compat 
# 
#                          Compatibility library containing older DBM functions 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'gperf-*' | cut -c 2-)"

read -p "Chapter 8.37"

#        8.37. Gperf-3.1  
# 
#                          Gperf generates a perfect hash function from a key set. 
#           Approximate build time: less than 0.1 SBU
#           Required disk space: 6.4 MB
#          8.37.1. Installation of Gperf 
# 
#                          Prepare Gperf for compilation: 



./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1



# 
#                          Compile the package: 



make



# 
#                          The tests are known to fail if running multiple simultaneous tests (-j option greater
#                        than 1). To test the results, issue: 



make -j1 check



# 
#                          Install the package: 



make install


 
#          8.37.2. Contents of Gperf  
#           Installed program: gperf
#           Installed directory: /usr/share/doc/gperf-3.1 
#            Short Descriptions   
# 
#                          
# 
#                gperf   
# 
#                          Generates a perfect hash from a key set 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'expat-*' | cut -c 2-)"

read -p "Chapter 8.38"

#        8.38. Expat-2.2.10  
# 
#                          The Expat package contains a stream oriented C library for parsing XML. 
#           Approximate build time: 0.1 SBU
#           Required disk space: 14 MB
#          8.38.1. Installation of Expat 
# 
#                          Prepare Expat for compilation: 



./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.2.10



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
#                          If desired, install the documentation: 



install -v -m644 doc/*.{html,png,css} /usr/share/doc/expat-2.2.10


 
#          8.38.2. Contents of Expat  
#           Installed program: xmlwf
#           Installed libraries: libexpat.so
#           Installed directory: /usr/share/doc/expat-2.2.10 
#            Short Descriptions   
# 
#                          
# 
#                xmlwf   
# 
#                          Is a non-validating utility to check whether or not XML documents are well formed
#                         
# 
#                          libexpat 
# 
#                          Contains API functions for parsing XML 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'inetutils-*' | cut -c 2-)"

read -p "Chapter 8.39"

#        8.39. Inetutils-2.0  
# 
#                          The Inetutils package contains programs for basic networking. 
#           Approximate build time: 0.3 SBU
#           Required disk space: 31 MB
#          8.39.1. Installation of Inetutils 
# 
#                          Prepare Inetutils for compilation: 



./configure --prefix=/usr        \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers


 
# 
#                          The meaning of the configure options: 
# 
#                --disable-logger 
# 
#                          This option prevents Inetutils from installing the  logger program, which is used
#                        by scripts to pass messages to the System Log Daemon. Do not install it because
#                        Util-linux installs a more recent version. 
# 
#                --disable-whois 
# 
#                          This option disables the building of the Inetutils  whois client, which is out of
#                        date. Instructions for a better  whois client are in the BLFS book. 
# 
#                --disable-r* 
# 
#                          These parameters disable building obsolete programs that should not be used due
#                        to security issues. The functions provided by these programs can be provided by
#                        the opensshpackage in the BLFS book. 
# 
#                --disable-servers 
# 
#                          This disables the installation of the various network servers included as part of
#                        the Inetutils package. These servers are deemed not appropriate in a basic LFS system.
#                        Some are insecure by nature and are only considered safe on trusted networks. Note
#                        that better replacements are available for many of these servers. 
# 
#                          Compile the package: 



make



# 
#                          To test the results, issue: 



make check



#          Note 
# 
#                          One test, libls.sh, may fail in the initial chroot environment but will pass if
#                        the test is rerun after the LFS system is complete. One test, ping-localhost.sh,
#                        will fail if the host system does not have ipv6 capability. 
# 
#                          Install the package: 



make install



# 
#                          Move some programs so they are available if /usris not accessible: 



mv -v /usr/bin/{hostname,ping,ping6,traceroute} /bin
mv -v /usr/bin/ifconfig /sbin


 
#          8.39.2. Contents of Inetutils  
#           Installed programs: dnsdomainname, ftp, ifconfig, hostname, ping, ping6, talk, telnet, tftp, and traceroute 
#            Short Descriptions   
# 
#                          
# 
#                dnsdomainname   
# 
#                          Show the system's DNS domain name  
# 
#                          ftp   
# 
#                          Is the file transfer protocol program  
# 
#                          hostname   
# 
#                          Reports or sets the name of the host  
# 
#                          ifconfig   
# 
#                          Manages network interfaces  
# 
#                          ping   
# 
#                          Sends echo-request packets and reports how long the replies take  
# 
#                          ping6   
# 
#                          A version of ping for IPv6 networks   
# 
#                          talk   
# 
#                          Is used to chat with another user  
# 
#                          telnet   
# 
#                          An interface to the TELNET protocol  
# 
#                          tftp   
# 
#                          A trivial file transfer program  
# 
#                          traceroute   
# 
#                          Traces the route your packets take from the host you are working on to another host
#                        on a network, showing all the intermediate hops (gateways) along the way 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'perl-*' | cut -c 2-)"

read -p "Chapter 8.40"

#        8.40. Perl-5.32.1  
# 
#                          The Perl package contains the Practical Extraction and Report Language. 
#           Approximate build time: 10 SBU
#           Required disk space: 222 MB
#          8.40.1. Installation of Perl 
# 
#                          This version of Perl now builds the Compress::Raw::Zlib and Compress::Raw::BZip2
#                        modules. By default Perl will use an internal copy of the sources for the build.
#                        Issue the following command so that Perl will use the libraries installed on the
#                        system: 



export BUILD_ZLIB=False
export BUILD_BZIP2=0



# 
#                          To have full control over the way Perl is set up, you can remove the "-des"options
#                        from the following command and hand-pick the way this package is built. Alternatively,
#                        use the command exactly as below to use the defaults that Perl auto-detects: 



sh Configure -des                                         \
             -Dprefix=/usr                                \
             -Dvendorprefix=/usr                          \
             -Dprivlib=/usr/lib/perl5/5.32/core_perl      \
             -Darchlib=/usr/lib/perl5/5.32/core_perl      \
             -Dsitelib=/usr/lib/perl5/5.32/site_perl      \
             -Dsitearch=/usr/lib/perl5/5.32/site_perl     \
             -Dvendorlib=/usr/lib/perl5/5.32/vendor_perl  \
             -Dvendorarch=/usr/lib/perl5/5.32/vendor_perl \
             -Dman1dir=/usr/share/man/man1                \
             -Dman3dir=/usr/share/man/man3                \
             -Dpager="/usr/bin/less -isR"                 \
             -Duseshrplib                                 \
             -Dusethreads


 
# 
#                          The meaning of the configure options: 
# 
#                -Dvendorprefix=/usr 
# 
#                          This ensures  perl knows how to tell packages where they should install their perl
#                        modules. 
# 
#                -Dpager="/usr/bin/less -isR" 
# 
#                          This ensures that  lessis used instead of  more.  
# 
#                -Dman1dir=/usr/share/man/man1 -Dman3dir=/usr/share/man/man3 
# 
#                          Since Groff is not installed yet,  Configure thinks that we do not want man pages
#                        for Perl. Issuing these parameters overrides this decision. 
# 
#                -Duseshrplib 
# 
#                          Build a shared libperl needed by some perl modules. 
# 
#                -Dusethreads 
# 
#                          Build perl with support for threads. 
# 
#                -Dprivlib,-Darchlib,-Dsitelib,... 
# 
#                          These settings define where Perl is looking for installed modules. The LFS editors
#                        chose to put them in a directory structure based on the Major.Minor version of Perl
#                        (5.32) which allows upgrading Perl to newer Patch levels (5.32.1) without the need
#                        to reinstall all of the modules again. 
# 
#                          Compile the package: 



make



# 
#                          To test the results (approximately 11 SBU), issue: 



make test



# 
#                          Install the package and clean up: 



make install
unset BUILD_ZLIB BUILD_BZIP2


 
#          8.40.2. Contents of Perl  
#           Installed programs: corelist, cpan, enc2xs, encguess, h2ph, h2xs, instmodsh, json_pp, libnetcfg, perl, perl5.32.1 (hard link to perl), perlbug, perldoc, perlivp, perlthanks (hard link to perlbug), piconv, pl2pm, pod2html, pod2man, pod2text, pod2usage, podchecker, podselect, prove, ptar, ptardiff, ptargrep, shasum, splain, xsubpp, and zipdetails
#           Installed libraries: Many which cannot all be listed here
#           Installed directory: /usr/lib/perl5 
#            Short Descriptions   
# 
#                          
# 
#                corelist   
# 
#                          A commandline frontend to Module::CoreList  
# 
#                          cpan   
# 
#                          Interact with the Comprehensive Perl Archive Network (CPAN) from the command line
#                         
# 
#                          enc2xs   
# 
#                          Builds a Perl extension for the Encode module from either Unicode Character Mappings
#                        or Tcl Encoding Files  
# 
#                          encguess   
# 
#                          Guess the encoding type of one or several files  
# 
#                          h2ph   
# 
#                          Converts .hC header files to .phPerl header files  
# 
#                          h2xs   
# 
#                          Converts .hC header files to Perl extensions  
# 
#                          instmodsh   
# 
#                          Shell script for examining installed Perl modules, and can create a tarball from
#                        an installed module  
# 
#                          json_pp   
# 
#                          Converts data between certain input and output formats  
# 
#                          libnetcfg   
# 
#                          Can be used to configure the libnetPerl module  
# 
#                          perl   
# 
#                          Combines some of the best features of C, sed ,  awk and  sh into a single swiss-army
#                        language   
# 
#                          perl5.32.1   
# 
#                          A hard link to perl   
# 
#                          perlbug   
# 
#                          Used to generate bug reports about Perl, or the modules that come with it, and mail
#                        them  
# 
#                          perldoc   
# 
#                          Displays a piece of documentation in pod format that is embedded in the Perl installation
#                        tree or in a Perl script  
# 
#                          perlivp   
# 
#                          The Perl Installation Verification Procedure; it can be used to verify that Perl
#                        and its libraries have been installed correctly  
# 
#                          perlthanks   
# 
#                          Used to generate thank you messages to mail to the Perl developers  
# 
#                          piconv   
# 
#                          A Perl version of the character encoding converter iconv   
# 
#                          pl2pm   
# 
#                          A rough tool for converting Perl4 .plfiles to Perl5 .pmmodules  
# 
#                          pod2html   
# 
#                          Converts files from pod format to HTML format  
# 
#                          pod2man   
# 
#                          Converts pod data to formatted *roff input  
# 
#                          pod2text   
# 
#                          Converts pod data to formatted ASCII text  
# 
#                          pod2usage   
# 
#                          Prints usage messages from embedded pod docs in files  
# 
#                          podchecker   
# 
#                          Checks the syntax of pod format documentation files  
# 
#                          podselect   
# 
#                          Displays selected sections of pod documentation  
# 
#                          prove   
# 
#                          Command line tool for running tests against the Test::Harness module  
# 
#                          ptar   
# 
#                          A tar -like program written in Perl   
# 
#                          ptardiff   
# 
#                          A Perl program that compares an extracted archive with an unextracted one  
# 
#                          ptargrep   
# 
#                          A Perl program that applies pattern matching to the contents of files in a tar archive
#                         
# 
#                          shasum   
# 
#                          Prints or checks SHA checksums  
# 
#                          splain   
# 
#                          Is used to force verbose warning diagnostics in Perl  
# 
#                          xsubpp   
# 
#                          Converts Perl XS code into C code  
# 
#                          zipdetails   
# 
#                          Displays details about the internal structure of a Zip file 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'XML-P*' | cut -c 2-)"

read -p "Chapter 8.41"

#        8.41. XML::Parser-2.46  
# 
#                          The XML::Parser module is a Perl interface to James Clark's XML parser, Expat. 
#           Approximate build time: less than 0.1 SBU
#           Required disk space: 2.4 MB
#          8.41.1. Installation of XML::Parser 
# 
#                          Prepare XML::Parser for compilation: 



perl Makefile.PL



# 
#                          Compile the package: 



make



# 
#                          To test the results, issue: 



make test



# 
#                          Install the package: 



make install


 
#          8.41.2. Contents of XML::Parser  
#           Installed module: Expat.so 
#            Short Descriptions   
# 
#                          
# 
#                Expat 
# 
#                          provides the Perl Expat interface 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'intltool-*' | cut -c 2-)"

read -p "Chapter 8.42"

#        8.42. Intltool-0.51.0  
# 
#                          The Intltool is an internationalization tool used for extracting translatable strings
#                        from source files. 
#           Approximate build time: less than 0.1 SBU
#           Required disk space: 1.5 MB
#          8.42.1. Installation of Intltool 
# 
#                          First fix a warning that is caused by perl-5.22 and later: 



sed -i 's:\\\${:\\\$\\{:' intltool-update.in



#          Note 
# 
#                          The above regular expression looks unusual because of all the backslashes. What
#                        it does is add a backslash before the right brace character in the sequence '\${'
#                        resulting in '\$\{'. 
# 
#                          Prepare Intltool for compilation: 



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
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO


 
#          8.42.2. Contents of Intltool  
#           Installed programs: intltool-extract, intltool-merge, intltool-prepare, intltool-update, and intltoolize
#           Installed directories: /usr/share/doc/intltool-0.51.0 and /usr/share/intltool 
#            Short Descriptions   
# 
#                          
# 
#                intltoolize   
# 
#                          Prepares a package to use intltool  
# 
#                          intltool-extract   
# 
#                          Generates header files that can be read by gettext   
# 
#                          intltool-merge   
# 
#                          Merges translated strings into various file types  
# 
#                          intltool-prepare   
# 
#                          Updates pot files and merges them with translation files  
# 
#                          intltool-update   
# 
#                          Updates the po template files and merges them with the translations 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'autoconf-*' | cut -c 2-)"

read -p "Chapter 8.43"

#        8.43. Autoconf-2.71  
# 
#                          The Autoconf package contains programs for producing shell scripts that can automatically
#                        configure source code. 
#           Approximate build time: less than 0.1 SBU (about 7.2 SBU with tests)
#           Required disk space: 24 MB
#          8.43.1. Installation of Autoconf 
# 
#                          Prepare Autoconf for compilation: 



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


 
#          8.43.2. Contents of Autoconf  
#           Installed programs: autoconf, autoheader, autom4te, autoreconf, autoscan, autoupdate, and ifnames
#           Installed directory: /usr/share/autoconf 
#            Short Descriptions   
# 
#                          
# 
#                autoconf   
# 
#                          Produces shell scripts that automatically configure software source code packages
#                        to adapt to many kinds of Unix-like systems; the configuration scripts it produces
#                        are independent;running them does not require the autoconf program   
# 
#                          autoheader   
# 
#                          A tool for creating template files of C #define statements for configure to use   
# 
#                          autom4te   
# 
#                          A wrapper for the M4 macro processor  
# 
#                          autoreconf   
# 
#                          Automatically runs autoconf ,  autoheader ,  aclocal ,  automake ,  gettextize , and  libtoolize in
#                        the correct order to save time when changes are made to  autoconf and  automake template
#                        files   
# 
#                          autoscan   
# 
#                          Helps to create a configure.infile for a software package; it examines the source
#                        files in a directory tree, searching them for common portability issues, and creates
#                        a configure.scanfile that serves as as a preliminary configure.infile for the package
#                         
# 
#                          autoupdate   
# 
#                          Modifies a configure.infile that still calls autoconf macros by their old names to
#                        use the current macro names   
# 
#                          ifnames   
# 
#                          Helps when writing configure.infiles for a software package; it prints the identifiers
#                        that the package uses in C preprocessor conditionals [If a package has already been
#                        set up to have some portability, this program can help determine what configure needs
#                        to check for. It can also fill in gaps in a configure.infile generated by  autoscan .]
#                         


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'automake-*' | cut -c 2-)"

read -p "Chapter 8.44"

#        8.44. Automake-1.16.3  
# 
#                          The Automake package contains programs for generating Makefiles for use with Autoconf.
#                        
#           Approximate build time: less than 0.1 SBU (about 9.1 SBU with tests)
#           Required disk space: 115 MB
#          8.44.1. Installation of Automake 
# 
#                          Fix a failing test: 



sed -i "s/''/etags/" t/tags-lisp-space.sh



# 
#                          Prepare Automake for compilation: 



./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.3



# 
#                          Compile the package: 



make



# 
#                          Using the -j4 make option speeds up the tests, even on systems with only one processor,
#                        due to internal delays in individual tests. To test the results, issue: 



make -j4 check



# 
#                          The tests t/subobj.sh, t/deprecated-acinit.sh, and t/init.sh are known to fail in
#                        the LFS environment. 
# 
#                          Install the package: 



make install


 
#          8.44.2. Contents of Automake  
#           Installed programs: aclocal, aclocal-1.16 (hard linked with aclocal), automake, and automake-1.16 (hard linked with automake)
#           Installed directories: /usr/share/aclocal-1.16, /usr/share/automake-1.16, and /usr/share/doc/automake-1.16.3 
#            Short Descriptions   
# 
#                          
# 
#                aclocal   
# 
#                          Generates aclocal.m4files based on the contents of configure.infiles  
# 
#                          aclocal-1.16   
# 
#                          A hard link to aclocal   
# 
#                          automake   
# 
#                          A tool for automatically generating Makefile.infiles from Makefile.amfiles [To create
#                        all the Makefile.infiles for a package, run this program in the top-level directory.
#                        By scanning the configure.infile, it automatically finds each appropriate Makefile.amfile
#                        and generates the corresponding Makefile.infile.]  
# 
#                          automake-1.16   
# 
#                          A hard link to automake  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'kmod-*' | cut -c 2-)"

read -p "Chapter 8.45"

#        8.45. Kmod-28  
# 
#                          The Kmod package contains libraries and utilities for loading kernel modules 
#           Approximate build time: 0.1 SBU
#           Required disk space: 13 MB
#          8.45.1. Installation of Kmod 
# 
#                          Prepare Kmod for compilation: 



./configure --prefix=/usr          \
            --bindir=/bin          \
            --sysconfdir=/etc      \
            --with-rootlibdir=/lib \
            --with-xz              \
            --with-zstd            \
            --with-zlib


 
# 
#                          The meaning of the configure options: 
# 
#                --with-xz, --with-zlib, --with-zstd 
# 
#                          These options enable Kmod to handle compressed kernel modules. 
# 
#                --with-rootlibdir=/lib 
# 
#                          This option ensures different library related files are placed in the correct directories.
#                        
# 
#                          Compile the package: 



make



# 
#                          This package does not come with a test suite that can be run in the LFS chroot environment.
#                        At a minimum the git program is required and several tests will not run outside
#                        of a git repository. 
# 
#                          Install the package and create symlinks for compatibility with Module-Init-Tools
#                        (the package that previously handled Linux kernel modules): 



make install

for target in depmod insmod lsmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /sbin/$target
done

ln -sfv kmod /bin/lsmod


 
#          8.45.2. Contents of Kmod  
#           Installed programs: depmod (link to kmod), insmod (link to kmod), kmod, lsmod (link to kmod), modinfo (link to kmod), modprobe (link to kmod), and rmmod (link to kmod)
#           Installed library: libkmod.so 
#            Short Descriptions   
# 
#                          
# 
#                depmod   
# 
#                          Creates a dependency file based on the symbols it finds in the existing set of modules;
#                        this dependency file is used by modprobe to automatically load the required modules
#                          
# 
#                          insmod   
# 
#                          Installs a loadable module in the running kernel  
# 
#                          kmod   
# 
#                          Loads and unloads kernel modules  
# 
#                          lsmod   
# 
#                          Lists currently loaded modules  
# 
#                          modinfo   
# 
#                          Examines an object file associated with a kernel module and displays any information
#                        that it can glean  
# 
#                          modprobe   
# 
#                          Uses a dependency file, created by depmod , to automatically load relevant modules
#                          
# 
#                          rmmod   
# 
#                          Unloads modules from the running kernel  
# 
#                          libkmod 
# 
#                          This library is used by other programs to load and unload kernel modules 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'elfutils-*' | cut -c 2-)"

read -p "Chapter 8.46"

#        8.46. Libelf from Elfutils-0.183  
# 
#                          Libelf is a library for handling ELF (Executable and Linkable Format) files. 
#           Approximate build time: 0.9 SBU
#           Required disk space: 121 MB
#          8.46.1. Installation of Libelf 
# 
#                          Libelf is part of elfutils-0.183 package. Use the elfutils-0.183.tar.bz2 as the
#                        source tarball. 
# 
#                          Prepare Libelf for compilation: 



./configure --prefix=/usr                \
            --disable-debuginfod         \
            --enable-libdebuginfod=dummy \
            --libdir=/lib



# 
#                          Compile the package: 



make



# 
#                          To test the results, issue: 



make check



# 
#                          Install only Libelf: 



make -C libelf install
install -vm644 config/libelf.pc /usr/lib/pkgconfig
rm /lib/libelf.a


 
#          8.46.2. Contents of Libelf  
#           Installed Library: libelf.so (symlink) and libelf-0.183.so
#           Installed Directory: /usr/include/elfutils 
#            Short Descriptions   
# 
#                          
# 
#                libelf 
# 
#                          Contains API functions to handle ELF object files 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'libffi-*' | cut -c 2-)"

read -p "Chapter 8.47"

#        8.47. Libffi-3.3  
# 
#                          The Libffi library provides a portable, high level programming interface to various
#                        calling conventions. This allows a programmer to call any function specified by
#                        a call interface description at run time. 
#           Approximate build time: 1.9 SBU
#           Required disk space: 10 MB
#          8.47.1. Installation of Libffi 
#          Note 
# 
#                          Similar to GMP, libffi builds with optimizations specific to the proccesor in use.
#                        If building for another system, export CFLAGS and CXXFLAGS to specify a generic
#                        build for your architecture. If this is not done, all applications that link to
#                        libffi will trigger Illegal Operation Errors. 
# 
#                          Prepare libffi for compilation: 



./configure --prefix=/usr --disable-static --with-gcc-arch=native


 
# 
#                          The meaning of the configure option: 
# 
#                --with-gcc-arch=native 
# 
#                          Ensure GCC optimizes for the current system. If this is not specified, the system
#                        is guessed and the code generated may not be correct for some systems. If the generated
#                        code will be copied from the native system to a less capable system, use the less
#                        capable system as a parameter. For details about alternative system types, see the
#                        x86 options in the GCC manual.  
# 
#                          Compile the package: 



make



# 
#                          To test the results, issue: 



make check



# 
#                          Install the package: 



make install


 
#          8.47.2. Contents of Libffi  
#           Installed library: libffi.so 
#            Short Descriptions   
# 
#                          
# 
#                libffi 
# 
#                          contains the foreign function interface API functions 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'openssl-*' | cut -c 2-)"

read -p "Chapter 8.48"

#        8.48. OpenSSL-1.1.1j  
# 
#                          The OpenSSL package contains management tools and libraries relating to cryptography.
#                        These are useful for providing cryptographic functions to other packages, such as
#                        OpenSSH, email applications, and web browsers (for accessing HTTPS sites). 
#           Approximate build time: 2.2 SBU
#           Required disk space: 154 MB
#          8.48.1. Installation of OpenSSL 
# 
#                          Prepare OpenSSL for compilation: 



./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic



# 
#                          Compile the package: 



make



# 
#                          To test the results, issue: 



make test



# 
#                          One test 30-test_afalg.t is known to fail on some kernel configurations (it apparently
#                        assumes certain unspecified crypto options have been selected). 
# 
#                          Install the package: 



sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install



# 
#                          Add the version to the documentation directory name, to be consistent with other
#                        packages: 



mv -v /usr/share/doc/openssl /usr/share/doc/openssl-1.1.1j



# 
#                          If desired, install some additional documentation: 



cp -vfr doc/* /usr/share/doc/openssl-1.1.1j


 
#          8.48.2. Contents of OpenSSL  
#           Installed programs: c_rehash and openssl
#           Installed libraries: libcrypto.so and libssl.so
#           Installed directories: /etc/ssl, /usr/include/openssl, /usr/lib/engines and /usr/share/doc/openssl-1.1.1j 
#            Short Descriptions   
# 
#                          
# 
#                c_rehash   
# 
#                          is a Perlscript that scans all files in a directory and adds symbolic links to their
#                        hash values   
# 
#                          openssl   
# 
#                          is a command-line tool for using the various cryptography functions of OpenSSL's
#                        crypto library from the shell. It can be used for various functions which are documented
#                        in  man 1 openssl   
# 
#                          libcrypto.so 
# 
#                          implements a wide range of cryptographic algorithms used in various Internet standards.
#                        The services provided by this library are used by the OpenSSLimplementations of
#                        SSL, TLS and S/MIME, and they have also been used to implement OpenSSH, OpenPGP,
#                        and other cryptographic standards   
# 
#                          libssl.so 
# 
#                          implements the Transport Layer Security (TLS v1) protocol. It provides a rich API,
#                        documentation on which can be found by running man 3 ssl  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'Python-*' | cut -c 2-)"

read -p "Chapter 8.49"

#        8.49. Python-3.9.2  
# 
#                          The Python 3 package contains the Python development environment. It is useful for
#                        object-oriented programming, writing scripts, prototyping large programs, or developing
#                        entire applications. 
#           Approximate build time: 2.8 SBU
#           Required disk space: 294 MB
#          8.49.1. Installation of Python 3 
# 
#                          Prepare Python for compilation: 



./configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --with-ensurepip=yes


 
# 
#                          The meaning of the configure options: 
# 
#                --with-system-expat 
# 
#                          This switch enables linking against system version of Expat. 
# 
#                --with-system-ffi 
# 
#                          This switch enables linking against system version of libffi. 
# 
#                --with-ensurepip=yes 
# 
#                          This switch enables building  pip and  setuptools packaging programs. 
# 
#                          Compile the package: 



make



# 
#                          To test the results, issue: 



make test



# 
#                          Some tests requiring a network connection or additional packages are skipped. The
#                        test named test_normalization is known to fail. For more comprehensive results,
#                        the tests can be rerun when Python 3 is reinstalled in BLFS. 
# 
#                          Install the package: 



make install



# 
#                          If desired, install the preformatted documentation: 



install -v -dm755 /usr/share/doc/python-3.9.2/html 

tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.9.2/html \
    -xvf ../python-3.9.2-docs-html.tar.bz2


 
# 
#                          The meaning of the documentation install commands: 
# 
#                --no-same-ownerand --no-same-permissions
# 
#                          Ensure the installed files have the correct ownership and permissions. Without these
#                        options, using tarwill install the package files with the upstream creator's values.
#                         
#          8.49.2. Contents of Python 3  
#           Installed Programs: 2to3, idle3, pip3, pydoc3, python3, and python3-config
#           Installed Library: libpython3.9.so and libpython3.so
#           Installed Directories: /usr/include/python3.9, /usr/lib/python3, and /usr/share/doc/python-3.9.2 
#            Short Descriptions   
# 
#                          
# 
#                2to3   
# 
#                          is a Pythonprogram that reads Python 2.xsource code and applies a series of fixes
#                        to transform it into valid Python 3.xcode   
# 
#                          idle3   
# 
#                          is a wrapper script that opens a Pythonaware GUI editor. For this script to run,
#                        you must have installed Tkbefore Python so that the Tkinter Python module is built
#                          
# 
#                          pip3   
# 
#                          The package installer for Python. You can use pip to install packages from Python
#                        Package Index and other indexes  
# 
#                          pydoc3   
# 
#                          is the Pythondocumentation tool   
# 
#                          python3   
# 
#                          is an interpreted, interactive, object-oriented programming language 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'ninja-*' | cut -c 2-)"

read -p "Chapter 8.50"

#        8.50. Ninja-1.10.2  
# 
#                          Ninja is a small build system with a focus on speed. 
#           Approximate build time: 0.2 SBU
#           Required disk space: 79 MB
#          Tip 
# 
#                          This section is not strictly required for LFS if not using systemd. On the other
#                        hand, ninja associated to meson makes a powerful build system combination, which
#                        is expected to be used more and more often. It is required for several packages
#                        in the BLFS book.  
#          8.50.1. Installation of Ninja 
# 
#                          When run, ninja normally runs a maximum number of processes in parallel. By default
#                        this is the number of cores on the system plus two. In some cases this can overheat
#                        a CPU or run a system out of memory. If run from the command line, passing a -jN
#                        parameter will limit the number of parallel processes, but some packages embed the
#                        execution of ninja and do not pass a -j parameter. 
# 
#                          Using the  optional procedure below allows a user to limit the number of parallel
#                        processes via an environment variable, NINJAJOBS.  For example , setting: 



export NINJAJOBS=4



# 
#                          will limit ninja to four parallel processes. 
# 
#                          If desired, add the capability to use the environment variable NINJAJOBS by running:
#                        



sed -i '/int Guess/a \
  int   j = 0;\
  char* jobs = getenv( "NINJAJOBS" );\
  if ( jobs != NULL ) j = atoi( jobs );\
  if ( j > 0 ) return j;\
' src/ninja.cc



# 
#                          Build Ninja with: 



python3 configure.py --bootstrap


 
# 
#                          The meaning of the build option: 
# 
#                --bootstrap 
# 
#                          This parameter forces ninja to rebuild itself for the current system. 
# 
#                          To test the results, issue: 



./ninja ninja_test
./ninja_test --gtest_filter=-SubprocessTest.SetWithLots



# 
#                          Install the package: 



install -vm755 ninja /usr/bin/
install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
install -vDm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja


 
#          8.50.2. Contents of Ninja  
#           Installed programs: ninja 
#            Short Descriptions   
# 
#                          
# 
#                ninja   
# 
#                          is the Ninja build system 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'meson-*' | cut -c 2-)"

read -p "Chapter 8.51"

#        8.51. Meson-0.57.1  
# 
#                          Meson is an open source build system meant to be both extremely fast and as user
#                        friendly as possible. 
#           Approximate build time: less than 0.1 SBU
#           Required disk space: 37 MB
#          Tip 
# 
#                          This section is not strictly required for LFS if not using systemd. On the other
#                        hand, meson/ninja is a powerful build system, which is expected to be used more
#                        and more often. It is required for several packages in the BLFS book.  
#          8.51.1. Installation of Meson 
# 
#                          Compile Meson with the following command: 



python3 setup.py build



# 
#                          This package does not come with a test suite. 
# 
#                          Install the package: 



python3 setup.py install --root=dest
cp -rv dest/* /


 
# 
#                          The meaning of the install parameters: 
# 
#                --root=dest 
# 
#                          By default  python3 setup.py install installs various files (such as man pages) into
#                        Python Eggs. With a specified root location,  setup.py installs these files into a
#                        standard hierarchy. Then the hierarchy can just be copied to the standard location.
#                         
#          8.51.2. Contents of Meson  
#           Installed programs: meson
#           Installed directory: /usr/lib/python3.9/site-packages/meson-0.57.1-py3.9.egg-info and /usr/lib/python3.9/site-packages/mesonbuild 
#            Short Descriptions   
# 
#                          
# 
#                meson   
# 
#                          A high productivity build system 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'coreutils-*' | cut -c 2-)"

read -p "Chapter 8.52"

#        8.52. Coreutils-8.32  
# 
#                          The Coreutils package contains utilities for showing and setting the basic system
#                        characteristics. 
#           Approximate build time: 2.5 SBU
#           Required disk space: 164 MB
#          8.52.1. Installation of Coreutils 
# 
#                          POSIX requires that programs from Coreutils recognize character boundaries correctly
#                        even in multibyte locales. The following patch fixes this non-compliance and other
#                        internationalization-related bugs. 



patch -Np1 -i ../coreutils-8.32-i18n-1.patch



#          Note 
# 
#                          In the past, many bugs were found in this patch. When reporting new bugs to Coreutils
#                        maintainers, please check first if they are reproducible without this patch. 
# 
#                          Suppress a test which on some machines can loop forever: 



sed -i '/test.lock/s/^/#/' gnulib-tests/gnulib.mk



# 
#                          Now prepare Coreutils for compilation: 



autoreconf -fiv
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime


 
# 
#                          The meaning of the configure options: 
# 
#                
#           autoreconf 
# 
#                          The patch for internationalization has modified the building system of the package,
#                        so the configuration files have to be regenerated. 
# 
#                FORCE_UNSAFE_CONFIGURE=1
# 
#                          This environment variable allows the package to be built as the rootuser. 
# 
#                --enable-no-install-program=kill,uptime 
# 
#                          The purpose of this switch is to prevent Coreutils from installing binaries that
#                        will be installed by other packages later. 
# 
#                          Compile the package: 



make



# 
#                          Skip down to "Install the package"if not running the test suite. 
# 
#                          Now the test suite is ready to be run. First, run the tests that are meant to be
#                        run as user root: 



make NON_ROOT_USERNAME=tester check-root



# 
#                          We're going to run the remainder of the tests as the testeruser. Certain tests require
#                        that the user be a member of more than one group. So that these tests are not skipped,
#                        add a temporary group and make the user testera part of it: 



echo "dummy:x:102:tester" >> /etc/group



# 
#                          Fix some of the permissions so that the non-root user can compile and run the tests:
#                        



chown -Rv tester . 



# 
#                          Now run the tests: 



su tester -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check"



# 
#                          The test-getlogin test is known to fail in the LFS chroot environment. 
# 
#                          Remove the temporary group: 



sed -i '/dummy/d' /etc/group



# 
#                          Install the package: 



make install



# 
#                          Move programs to the locations specified by the FHS: 



mv -v /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin
mv -v /usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm} /bin
mv -v /usr/bin/{rmdir,stty,sync,true,uname} /bin
mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8



# 
#                          Some of the scripts in the LFS-Bootscripts package depend on  head ,  nice ,  sleep ,
#                        and  touch . As /usrmay not be available during the early and late stages of booting,
#                        those binaries need to be on the root partition to maintain FHS compliance: 



mv -v /usr/bin/{head,nice,sleep,touch} /bin


 
#          8.52.2. Contents of Coreutils  
#           Installed programs: [, b2sum, base32, base64, basename, basenc, cat, chcon, chgrp, chmod, chown, chroot, cksum, comm, cp, csplit, cut, date, dd, df, dir, dircolors, dirname, du, echo, env, expand, expr, factor, false, fmt, fold, groups, head, hostid, id, install, join, link, ln, logname, ls, md5sum, mkdir, mkfifo, mknod, mktemp, mv, nice, nl, nohup, nproc, numfmt, od, paste, pathchk, pinky, pr, printenv, printf, ptx, pwd, readlink, realpath, rm, rmdir, runcon, seq, sha1sum, sha224sum, sha256sum, sha384sum, sha512sum, shred, shuf, sleep, sort, split, stat, stdbuf, stty, sum, sync, tac, tail, tee, test, timeout, touch, tr, true, truncate, tsort, tty, uname, unexpand, uniq, unlink, users, vdir, wc, who, whoami, and yes
#           Installed library: libstdbuf.so (in /usr/libexec/coreutils)
#           Installed directory: /usr/libexec/coreutils 
#            Short Descriptions   
# 
#                          
# 
#                [   
# 
#                          Is an actual command, /usr/bin/[, that is a synonym for the test command.   
# 
#                          base32   
# 
#                          Encodes and decodes data according to the base32 specification (RFC 4648)  
# 
#                          base64   
# 
#                          Encodes and decodes data according to the base64 specification (RFC 4648)  
# 
#                          b2sum   
# 
#                          Prints or checks BLAKE2 (512-bit) checksums  
# 
#                          basename   
# 
#                          Strips any path and a given suffix from a file name  
# 
#                          basenc   
# 
#                          Encodes or decodes data using various algorithms  
# 
#                          cat   
# 
#                          Concatenates files to standard output  
# 
#                          chcon   
# 
#                          Changes security context for files and directories  
# 
#                          chgrp   
# 
#                          Changes the group ownership of files and directories  
# 
#                          chmod   
# 
#                          Changes the permissions of each file to the given mode; the mode can be either a
#                        symbolic representation of the changes to make or an octal number representing the
#                        new permissions  
# 
#                          chown   
# 
#                          Changes the user and/or group ownership of files and directories  
# 
#                          chroot   
# 
#                          Runs a command with the specified directory as the /directory  
# 
#                          cksum   
# 
#                          Prints the Cyclic Redundancy Check (CRC) checksum and the byte counts of each specified
#                        file  
# 
#                          comm   
# 
#                          Compares two sorted files, outputting in three columns the lines that are unique
#                        and the lines that are common  
# 
#                          cp   
# 
#                          Copies files  
# 
#                          csplit   
# 
#                          Splits a given file into several new files, separating them according to given patterns
#                        or line numbers and outputting the byte count of each new file  
# 
#                          cut   
# 
#                          Prints sections of lines, selecting the parts according to given fields or positions
#                         
# 
#                          date   
# 
#                          Displays the current time in the given format, or sets the system date  
# 
#                          dd   
# 
#                          Copies a file using the given block size and count, while optionally performing
#                        conversions on it  
# 
#                          df   
# 
#                          Reports the amount of disk space available (and used) on all mounted file systems,
#                        or only on the file systems holding the selected files  
# 
#                          dir   
# 
#                          Lists the contents of each given directory (the same as the ls command)   
# 
#                          dircolors   
# 
#                          Outputs commands to set the LS_COLORenvironment variable to change the color scheme
#                        used by ls   
# 
#                          dirname   
# 
#                          Strips the non-directory suffix from a file name  
# 
#                          du   
# 
#                          Reports the amount of disk space used by the current directory, by each of the given
#                        directories (including all subdirectories) or by each of the given files  
# 
#                          echo   
# 
#                          Displays the given strings  
# 
#                          env   
# 
#                          Runs a command in a modified environment  
# 
#                          expand   
# 
#                          Converts tabs to spaces  
# 
#                          expr   
# 
#                          Evaluates expressions  
# 
#                          factor   
# 
#                          Prints the prime factors of all specified integer numbers  
# 
#                          false   
# 
#                          Does nothing, unsuccessfully; it always exits with a status code indicating failure
#                         
# 
#                          fmt   
# 
#                          Reformats the paragraphs in the given files  
# 
#                          fold   
# 
#                          Wraps the lines in the given files  
# 
#                          groups   
# 
#                          Reports a user's group memberships  
# 
#                          head   
# 
#                          Prints the first ten lines (or the given number of lines) of each given file  
# 
#                          hostid   
# 
#                          Reports the numeric identifier (in hexadecimal) of the host  
# 
#                          id   
# 
#                          Reports the effective user ID, group ID, and group memberships of the current user
#                        or specified user  
# 
#                          install   
# 
#                          Copies files while setting their permission modes and, if possible, their owner
#                        and group  
# 
#                          join   
# 
#                          Joins the lines that have identical join fields from two separate files  
# 
#                          link   
# 
#                          Creates a hard link with the given name to a file  
# 
#                          ln   
# 
#                          Makes hard links or soft (symbolic) links between files  
# 
#                          logname   
# 
#                          Reports the current user's login name  
# 
#                          ls   
# 
#                          Lists the contents of each given directory  
# 
#                          md5sum   
# 
#                          Reports or checks Message Digest 5 (MD5) checksums  
# 
#                          mkdir   
# 
#                          Creates directories with the given names  
# 
#                          mkfifo   
# 
#                          Creates First-In, First-Outs (FIFOs), a "named pipe" in UNIX parlance, with the
#                        given names  
# 
#                          mknod   
# 
#                          Creates device nodes with the given names; a device node is a character special
#                        file, a block special file, or a FIFO  
# 
#                          mktemp   
# 
#                          Creates temporary files in a secure manner; it is used in scripts  
# 
#                          mv   
# 
#                          Moves or renames files or directories  
# 
#                          nice   
# 
#                          Runs a program with modified scheduling priority  
# 
#                          nl   
# 
#                          Numbers the lines from the given files  
# 
#                          nohup   
# 
#                          Runs a command immune to hangups, with its output redirected to a log file  
# 
#                          nproc   
# 
#                          Prints the number of processing units available to a process  
# 
#                          numfmt   
# 
#                          Converts numbers to or from human-readable strings  
# 
#                          od   
# 
#                          Dumps files in octal and other formats  
# 
#                          paste   
# 
#                          Merges the given files, joining sequentially corresponding lines side by side, separated
#                        by tab characters  
# 
#                          pathchk   
# 
#                          Checks if file names are valid or portable  
# 
#                          pinky   
# 
#                          Is a lightweight finger client; it reports some information about the given users
#                         
# 
#                          pr   
# 
#                          Paginates and columnates files for printing  
# 
#                          printenv   
# 
#                          Prints the environment  
# 
#                          printf   
# 
#                          Prints the given arguments according to the given format, much like the C printf
#                        function  
# 
#                          ptx   
# 
#                          Produces a permuted index from the contents of the given files, with each keyword
#                        in its context  
# 
#                          pwd   
# 
#                          Reports the name of the current working directory  
# 
#                          readlink   
# 
#                          Reports the value of the given symbolic link  
# 
#                          realpath   
# 
#                          Prints the resolved path  
# 
#                          rm   
# 
#                          Removes files or directories  
# 
#                          rmdir   
# 
#                          Removes directories if they are empty  
# 
#                          runcon   
# 
#                          Runs a command with specified security context  
# 
#                          seq   
# 
#                          Prints a sequence of numbers within a given range and with a given increment  
# 
#                          sha1sum   
# 
#                          Prints or checks 160-bit Secure Hash Algorithm 1 (SHA1) checksums  
# 
#                          sha224sum   
# 
#                          Prints or checks 224-bit Secure Hash Algorithm checksums  
# 
#                          sha256sum   
# 
#                          Prints or checks 256-bit Secure Hash Algorithm checksums  
# 
#                          sha384sum   
# 
#                          Prints or checks 384-bit Secure Hash Algorithm checksums  
# 
#                          sha512sum   
# 
#                          Prints or checks 512-bit Secure Hash Algorithm checksums  
# 
#                          shred   
# 
#                          Overwrites the given files repeatedly with complex patterns, making it difficult
#                        to recover the data  
# 
#                          shuf   
# 
#                          Shuffles lines of text  
# 
#                          sleep   
# 
#                          Pauses for the given amount of time  
# 
#                          sort   
# 
#                          Sorts the lines from the given files  
# 
#                          split   
# 
#                          Splits the given file into pieces, by size or by number of lines  
# 
#                          stat   
# 
#                          Displays file or filesystem status  
# 
#                          stdbuf   
# 
#                          Runs commands with altered buffering operations for its standard streams  
# 
#                          stty   
# 
#                          Sets or reports terminal line settings  
# 
#                          sum   
# 
#                          Prints checksum and block counts for each given file  
# 
#                          sync   
# 
#                          Flushes file system buffers; it forces changed blocks to disk and updates the super
#                        block  
# 
#                          tac   
# 
#                          Concatenates the given files in reverse  
# 
#                          tail   
# 
#                          Prints the last ten lines (or the given number of lines) of each given file  
# 
#                          tee   
# 
#                          Reads from standard input while writing both to standard output and to the given
#                        files  
# 
#                          test   
# 
#                          Compares values and checks file types  
# 
#                          timeout   
# 
#                          Runs a command with a time limit  
# 
#                          touch   
# 
#                          Changes file timestamps, setting the access and modification times of the given
#                        files to the current time; files that do not exist are created with zero length
#                         
# 
#                          tr   
# 
#                          Translates, squeezes, and deletes the given characters from standard input  
# 
#                          true   
# 
#                          Does nothing, successfully; it always exits with a status code indicating success
#                         
# 
#                          truncate   
# 
#                          Shrinks or expands a file to the specified size  
# 
#                          tsort   
# 
#                          Performs a topological sort; it writes a completely ordered list according to the
#                        partial ordering in a given file  
# 
#                          tty   
# 
#                          Reports the file name of the terminal connected to standard input  
# 
#                          uname   
# 
#                          Reports system information  
# 
#                          unexpand   
# 
#                          Converts spaces to tabs  
# 
#                          uniq   
# 
#                          Discards all but one of successive identical lines  
# 
#                          unlink   
# 
#                          Removes the given file  
# 
#                          users   
# 
#                          Reports the names of the users currently logged on  
# 
#                          vdir   
# 
#                          Is the same as ls -l   
# 
#                          wc   
# 
#                          Reports the number of lines, words, and bytes for each given file, as well as a
#                        total line when more than one file is given  
# 
#                          who   
# 
#                          Reports who is logged on  
# 
#                          whoami   
# 
#                          Reports the user name associated with the current effective user ID  
# 
#                          yes   
# 
#                          Repeatedly outputs "y"or a given string until killed   
# 
#                          libstdbuf 
# 
#                          Library used by stdbuf  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'check-*' | cut -c 2-)"

read -p "Chapter 8.53"

#        8.53. Check-0.15.2  
# 
#                          Check is a unit testing framework for C. 
#           Approximate build time: 0.1 SBU (about 4.2 SBU with tests)
#           Required disk space: 12 MB
#          8.53.1. Installation of Check 
# 
#                          Prepare Check for compilation: 



./configure --prefix=/usr --disable-static



# 
#                          Build the package: 



make



# 
#                          Compilation is now complete. To run the Check test suite, issue the following command:
#                        



make check



# 
#                          Note that the Check test suite may take a relatively long (up to 4 SBU) time. 
# 
#                          Install the package: 



make docdir=/usr/share/doc/check-0.15.2 install


 
#          8.53.2. Contents of Check  
#           Installed program: checkmk
#           Installed library: libcheck.so 
#            Short Descriptions   
# 
#                          
# 
#                checkmk   
# 
#                          Awk script for generating C unit tests for use with the Check unit testing framework
#                         
# 
#                          libcheck.{a,so} 
# 
#                          Contains functions that allow Check to be called from a test program 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'diffutils-*' | cut -c 2-)"

read -p "Chapter 8.54"

#        8.54. Diffutils-3.7  
# 
#                          The Diffutils package contains programs that show the differences between files
#                        or directories. 
#           Approximate build time: 0.4 SBU
#           Required disk space: 33 MB
#          8.54.1. Installation of Diffutils 
# 
#                          Prepare Diffutils for compilation: 



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


 
#          8.54.2. Contents of Diffutils  
#           Installed programs: cmp, diff, diff3, and sdiff 
#            Short Descriptions   
# 
#                          
# 
#                cmp   
# 
#                          Compares two files and reports whether or in which bytes they differ  
# 
#                          diff   
# 
#                          Compares two files or directories and reports which lines in the files differ  
# 
#                          diff3   
# 
#                          Compares three files line by line  
# 
#                          sdiff   
# 
#                          Merges two files and interactively outputs the results 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'gawk-*' | cut -c 2-)"

read -p "Chapter 8.55"

#        8.55. Gawk-5.1.0  
# 
#                          The Gawk package contains programs for manipulating text files. 
#           Approximate build time: 0.4 SBU
#           Required disk space: 45 MB
#          8.55.1. Installation of Gawk 
# 
#                          First, ensure some unneeded files are not installed: 



sed -i 's/extras//' Makefile.in



# 
#                          Prepare Gawk for compilation: 



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
#                          If desired, install the documentation: 



mkdir -v /usr/share/doc/gawk-5.1.0
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.1.0


 
#          8.55.2. Contents of Gawk  
#           Installed programs: awk (link to gawk), gawk, and awk-5.1.0
#           Installed libraries: filefuncs.so, fnmatch.so, fork.so, inplace.so, intdiv.so, ordchr.so, readdir.so, readfile.so, revoutput.so, revtwoway.so, rwarray.so, and time.so (all in /usr/lib/gawk)
#           Installed directories: /usr/lib/gawk, /usr/libexec/awk, /usr/share/awk, and /usr/share/doc/gawk-5.1.0 
#            Short Descriptions   
# 
#                          
# 
#                awk   
# 
#                          A link to gawk   
# 
#                          gawk   
# 
#                          A program for manipulating text files; it is the GNU implementation of awk   
# 
#                          gawk-5.1.0   
# 
#                          A hard link to gawk  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'findutils-*' | cut -c 2-)"

read -p "Chapter 8.56"

#        8.56. Findutils-4.8.0  
# 
#                          The Findutils package contains programs to find files. These programs are provided
#                        to recursively search through a directory tree and to create, maintain, and search
#                        a database (often faster than the recursive find, but is unreliable if the database
#                        has not been recently updated). 
#           Approximate build time: 0.9 SBU
#           Required disk space: 55 MB
#          8.56.1. Installation of Findutils 
# 
#                          Prepare Findutils for compilation: 



./configure --prefix=/usr --localstatedir=/var/lib/locate


 
# 
#                          The meaning of the configure options: 
# 
#                --localstatedir 
# 
#                          This option changes the location of the  locate database to be in /var/lib/locate,
#                        which is FHS-compliant. 
# 
#                          Compile the package: 



make



# 
#                          To test the results, issue: 



chown -Rv tester .
su tester -c "PATH=$PATH make check"



# 
#                          Install the package: 



make install



# 
#                          Some of the scripts in the LFS-Bootscripts package depend on  find . As /usrmay not
#                        be available during the early stages of booting, this program needs to be on the
#                        root partition. The  updatedb script also needs to be modified to correct an explicit
#                        path: 



mv -v /usr/bin/find /bin
sed -i 's|find:=${BINDIR}|find:=/bin|' /usr/bin/updatedb


 
#          8.56.2. Contents of Findutils  
#           Installed programs: find, locate, updatedb, and xargs
#           Installed directory: /var/lib/locate 
#            Short Descriptions   
# 
#                          
# 
#                find   
# 
#                          Searches given directory trees for files matching the specified criteria  
# 
#                          locate   
# 
#                          Searches through a database of file names and reports the names that contain a given
#                        string or match a given pattern  
# 
#                          updatedb   
# 
#                          Updates the locate database; it scans the entire file system (including other file
#                        systems that are currently mounted, unless told not to) and puts every file name
#                        it finds into the database   
# 
#                          xargs   
# 
#                          Can be used to apply a given command to a list of files 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'groff-*' | cut -c 2-)"

read -p "Chapter 8.57"

#        8.57. Groff-1.22.4  
# 
#                          The Groff package contains programs for processing and formatting text. 
#           Approximate build time: 0.5 SBU
#           Required disk space: 96 MB
#          8.57.1. Installation of Groff 
# 
#                          Groff expects the environment variable PAGEto contain the default paper size. For
#                        users in the United States,  PAGE=letteris appropriate. Elsewhere,  PAGE=A4may be
#                        more suitable. While the default paper size is configured during compilation, it
#                        can be overridden later by echoing either "A4"or "letter"to the /etc/papersizefile.
#                         
# 
#                          Prepare Groff for compilation: 



PAGE=<paper_size> ./configure --prefix=/usr


 
# 
#                          This package does not support parallel build. Compile the package: 



make -j1



# 
#                          This package does not come with a test suite. 
# 
#                          Install the package: 



make install


 
#          8.57.2. Contents of Groff  
#           Installed programs: addftinfo, afmtodit, chem, eqn, eqn2graph, gdiffmk, glilypond, gperl, gpinyin, grap2graph, grn, grodvi, groff, groffer, grog, grolbp, grolj4, gropdf, grops, grotty, hpftodit, indxbib, lkbib, lookbib, mmroff, neqn, nroff, pdfmom, pdfroff, pfbtops, pic, pic2graph, post-grohtml, preconv, pre-grohtml, refer, roff2dvi, roff2html, roff2pdf, roff2ps, roff2text, roff2x, soelim, tbl, tfmtodit, and troff
#           Installed directories: /usr/lib/groff and /usr/share/doc/groff-1.22.4, /usr/share/groff 
#            Short Descriptions   
# 
#                          
# 
#                addftinfo   
# 
#                          Reads a troff font file and adds some additional font-metric information that is
#                        used by the groff system   
# 
#                          afmtodit   
# 
#                          Creates a font file for use with groff and  grops   
# 
#                          chem   
# 
#                          Groff preprocessor for producing chemical structure diagrams  
# 
#                          eqn   
# 
#                          Compiles descriptions of equations embedded within troff input files into commands
#                        that are understood by troff   
# 
#                          eqn2graph   
# 
#                          Converts a troff EQN (equation) into a cropped image  
# 
#                          gdiffmk   
# 
#                          Marks differences between groff/nroff/troff files  
# 
#                          glilypond   
# 
#                          Transforms sheet music written in the lilypond language into the groff language
#                         
# 
#                          gperl   
# 
#                          Preprocesor for groff, allowing addition of perl code into groff files  
# 
#                          gpinyin   
# 
#                          Preprocesor for groff, allowing addition of Chinese European-like language Pinyin
#                        into groff files.  
# 
#                          grap2graph   
# 
#                          Converts a grap diagram into a cropped bitmap image  
# 
#                          grn   
# 
#                          A groff preprocessor for gremlin files   
# 
#                          grodvi   
# 
#                          A driver for groff that produces TeX dvi format   
# 
#                          groff   
# 
#                          A front-end to the groff document formatting system; normally, it runs the troff program
#                        and a post-processor appropriate for the selected device   
# 
#                          groffer   
# 
#                          Displays groff files and man pages on X and tty terminals  
# 
#                          grog   
# 
#                          Reads files and guesses which of the groff options -e, -man, -me, -mm, -ms, -p, -s,
#                        and -tare required for printing files, and reports the  groff command including those
#                        options   
# 
#                          grolbp   
# 
#                          Is a groff driver for Canon CAPSL printers (LBP-4 and LBP-8 series laser printers)
#                          
# 
#                          grolj4   
# 
#                          Is a driver for groff that produces output in PCL5 format suitable for an HP LaserJet
#                        4 printer   
# 
#                          gropdf   
# 
#                          Translates the output of GNU troff to PDF   
# 
#                          grops   
# 
#                          Translates the output of GNU troff to PostScript   
# 
#                          grotty   
# 
#                          Translates the output of GNU troff into a form suitable for typewriter-like devices
#                          
# 
#                          hpftodit   
# 
#                          Creates a font file for use with groff -Tlj4 from an HP-tagged font metric file   
# 
#                          indxbib   
# 
#                          Creates an inverted index for the bibliographic databases with a specified file
#                        for use with refer ,  lookbib , and  lkbib   
# 
#                          lkbib   
# 
#                          Searches bibliographic databases for references that contain specified keys and
#                        reports any references found  
# 
#                          lookbib   
# 
#                          Prints a prompt on the standard error (unless the standard input is not a terminal),
#                        reads a line containing a set of keywords from the standard input, searches the
#                        bibliographic databases in a specified file for references containing those keywords,
#                        prints any references found on the standard output, and repeats this process until
#                        the end of input  
# 
#                          mmroff   
# 
#                          A simple preprocessor for groff   
# 
#                          neqn   
# 
#                          Formats equations for American Standard Code for Information Interchange (ASCII)
#                        output  
# 
#                          nroff   
# 
#                          A script that emulates the nroff command using  groff   
# 
#                          pdfmom   
# 
#                          Is a wrapper around groff that facilitates the production of PDF documents from
#                        files formatted with the mom macros.  
# 
#                          pdfroff   
# 
#                          Creates pdf documents using groff  
# 
#                          pfbtops   
# 
#                          Translates a PostScript font in .pfbformat to ASCII  
# 
#                          pic   
# 
#                          Compiles descriptions of pictures embedded within troff or TeX input files into
#                        commands understood by TeX or troff   
# 
#                          pic2graph   
# 
#                          Converts a PIC diagram into a cropped image  
# 
#                          post-grohtml   
# 
#                          Translates the output of GNU troff to HTML   
# 
#                          preconv   
# 
#                          Converts encoding of input files to something GNU troff understands   
# 
#                          pre-grohtml   
# 
#                          Translates the output of GNU troff to HTML   
# 
#                          refer   
# 
#                          Copies the contents of a file to the standard output, except that lines between
#                        .[ and  .] are interpreted as citations, and lines between  .R1 and  .R2 are interpreted
#                        as commands for how citations are to be processed   
# 
#                          roff2dvi   
# 
#                          Transforms roff files into DVI format  
# 
#                          roff2html   
# 
#                          Transforms roff files into HTML format  
# 
#                          roff2pdf   
# 
#                          Transforms roff files into PDFs  
# 
#                          roff2ps   
# 
#                          Transforms roff files into ps files  
# 
#                          roff2text   
# 
#                          Transforms roff files into text files  
# 
#                          roff2x   
# 
#                          Transforms roff files into other formats  
# 
#                          soelim   
# 
#                          Reads files and replaces lines of the form .so file by the contents of the mentioned
#                         file   
# 
#                          tbl   
# 
#                          Compiles descriptions of tables embedded within troff input files into commands
#                        that are understood by troff   
# 
#                          tfmtodit   
# 
#                          Creates a font file for use with groff -Tdvi   
# 
#                          troff   
# 
#                          Is highly compatible with Unix troff ; it should usually be invoked using the  groff command,
#                        which will also run preprocessors and post-processors in the appropriate order and
#                        with the appropriate options  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'grub-*' | cut -c 2-)"

read -p "Chapter 8.58"

#        8.58. GRUB-2.04  
# 
#                          The GRUB package contains the GRand Unified Bootloader. 
#           Approximate build time: 0.7 SBU
#           Required disk space: 154 MB
#          8.58.1. Installation of GRUB 
# 
#                          First, fix an issue introduced by binutils-2.36: 



sed "s/gold-version/& -R .note.gnu.property/" \
    -i Makefile.in grub-core/Makefile.in



# 
#                          Prepare GRUB for compilation: 



./configure --prefix=/usr          \
            --sbindir=/sbin        \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror


 
# 
#                          The meaning of the new configure options: 
# 
#                --disable-werror 
# 
#                          This allows the build to complete with warnings introduced by more recent Flex versions.
#                        
# 
#                --disable-efiemu 
# 
#                          This option minimizes what is built by disabling a feature and testing programs
#                        not needed for LFS. 
# 
#                          Compile the package: 



make



# 
#                          This package does not come with a test suite. 
# 
#                          Install the package: 



make install
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions



# 
#                          Using GRUB to make your LFS system bootable will be discussed in Section 10.4, "Using
#                        GRUB to Set Up the Boot Process".   
#          8.58.2. Contents of GRUB  
#           Installed programs: grub-bios-setup, grub-editenv, grub-file, grub-fstest, grub-glue-efi, grub-install, grub-kbdcomp, grub-macbless, grub-menulst2cfg, grub-mkconfig, grub-mkimage, grub-mklayout, grub-mknetdir, grub-mkpasswd-pbkdf2, grub-mkrelpath, grub-mkrescue, grub-mkstandalone, grub-ofpathname, grub-probe, grub-reboot, grub-render-label, grub-script-check, grub-set-default, grub-sparc64-setup, and grub-syslinux2cfg
#           Installed directories: /usr/lib/grub, /etc/grub.d, /usr/share/grub, and /boot/grub (when grub-install is first run) 
#            Short Descriptions   
# 
#                          
# 
#                grub-bios-setup   
# 
#                          Is a helper program for grub-install  
# 
#                          grub-editenv   
# 
#                          A tool to edit the environment block  
# 
#                          grub-file   
# 
#                          Checks if FILE is of the specified type.  
# 
#                          grub-fstest   
# 
#                          Tool to debug the filesystem driver  
# 
#                          grub-glue-efi   
# 
#                          Processes ia32 and amd64 EFI images and glues them according to Apple format.  
# 
#                          grub-install   
# 
#                          Install GRUB on your drive  
# 
#                          grub-kbdcomp   
# 
#                          Script that converts an xkb layout into one recognized by GRUB  
# 
#                          grub-macbless   
# 
#                          Mac-style bless on HFS or HFS+ files  
# 
#                          grub-menulst2cfg   
# 
#                          Converts a GRUB Legacy menu.lstinto a grub.cfgfor use with GRUB 2  
# 
#                          grub-mkconfig   
# 
#                          Generate a grub config file  
# 
#                          grub-mkimage   
# 
#                          Make a bootable image of GRUB  
# 
#                          grub-mklayout   
# 
#                          Generates a GRUB keyboard layout file  
# 
#                          grub-mknetdir   
# 
#                          Prepares a GRUB netboot directory  
# 
#                          grub-mkpasswd-pbkdf2   
# 
#                          Generates an encrypted PBKDF2 password for use in the boot menu  
# 
#                          grub-mkrelpath   
# 
#                          Makes a system pathname relative to its root  
# 
#                          grub-mkrescue   
# 
#                          Make a bootable image of GRUB suitable for a floppy disk or CDROM/DVD  
# 
#                          grub-mkstandalone   
# 
#                          Generates a standalone image  
# 
#                          grub-ofpathname   
# 
#                          Is a helper program that prints the path of a GRUB device  
# 
#                          grub-probe   
# 
#                          Probe device information for a given path or device  
# 
#                          grub-reboot   
# 
#                          Sets the default boot entry for GRUB for the next boot only  
# 
#                          grub-render-label   
# 
#                          Render Apple .disk_label for Apple Macs  
# 
#                          grub-script-check   
# 
#                          Checks GRUB configuration script for syntax errors  
# 
#                          grub-set-default   
# 
#                          Sets the default boot entry for GRUB  
# 
#                          grub-sparc64-setup   
# 
#                          Is a helper program for grub-setup  
# 
#                          grub-syslinux2cfg   
# 
#                          Transform a syslinux config file into grub.cfg format 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'less-*' | cut -c 2-)"

read -p "Chapter 8.59"

#        8.59. Less-563  
# 
#                          The Less package contains a text file viewer. 
#           Approximate build time: less than 0.1 SBU
#           Required disk space: 4.1 MB
#          8.59.1. Installation of Less 
# 
#                          Prepare Less for compilation: 



./configure --prefix=/usr --sysconfdir=/etc


 
# 
#                          The meaning of the configure options: 
# 
#                --sysconfdir=/etc 
# 
#                          This option tells the programs created by the package to look in /etcfor the configuration
#                        files. 
# 
#                          Compile the package: 



make



# 
#                          This package does not come with a test suite. 
# 
#                          Install the package: 



make install


 
#          8.59.2. Contents of Less  
#           Installed programs: less, lessecho, and lesskey 
#            Short Descriptions   
# 
#                          
# 
#                less   
# 
#                          A file viewer or pager; it displays the contents of the given file, letting the
#                        user scroll, find strings, and jump to marks  
# 
#                          lessecho   
# 
#                          Needed to expand meta-characters, such as * and  ? , in filenames on Unix systems   
# 
#                          lesskey   
# 
#                          Used to specify the key bindings for less  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'gzip-*' | cut -c 2-)"

read -p "Chapter 8.60"

#        8.60. Gzip-1.10  
# 
#                          The Gzip package contains programs for compressing and decompressing files. 
#           Approximate build time: 0.1 SBU
#           Required disk space: 19 MB
#          8.60.1. Installation of Gzip 
# 
#                          Prepare Gzip for compilation: 



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
#                          Move a program that needs to be on the root filesystem: 



mv -v /usr/bin/gzip /bin


 
#          8.60.2. Contents of Gzip  
#           Installed programs: gunzip, gzexe, gzip, uncompress (hard link with gunzip), zcat, zcmp, zdiff, zegrep, zfgrep, zforce, zgrep, zless, zmore, and znew 
#            Short Descriptions   
# 
#                          
# 
#                gunzip   
# 
#                          Decompresses gzipped files  
# 
#                          gzexe   
# 
#                          Creates self-decompressing executable files  
# 
#                          gzip   
# 
#                          Compresses the given files using Lempel-Ziv (LZ77) coding  
# 
#                          uncompress   
# 
#                          Decompresses compressed files  
# 
#                          zcat   
# 
#                          Decompresses the given gzipped files to standard output  
# 
#                          zcmp   
# 
#                          Runs cmp on gzipped files   
# 
#                          zdiff   
# 
#                          Runs diff on gzipped files   
# 
#                          zegrep   
# 
#                          Runs egrep on gzipped files   
# 
#                          zfgrep   
# 
#                          Runs fgrep on gzipped files   
# 
#                          zforce   
# 
#                          Forces a .gzextension on all given files that are gzipped files, so that gzip will
#                        not compress them again; this can be useful when file names were truncated during
#                        a file transfer   
# 
#                          zgrep   
# 
#                          Runs grep on gzipped files   
# 
#                          zless   
# 
#                          Runs less on gzipped files   
# 
#                          zmore   
# 
#                          Runs more on gzipped files   
# 
#                          znew   
# 
#                          Re-compresses files from compress format to  gzip format;.Zto .gz 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'iproute2-*' | cut -c 2-)"

read -p "Chapter 8.61"

#        8.61. IPRoute2-5.10.0  
# 
#                          The IPRoute2 package contains programs for basic and advanced IPV4-based networking.
#                        
#           Approximate build time: 0.2 SBU
#           Required disk space: 15 MB
#          8.61.1. Installation of IPRoute2 
# 
#                          The  arpd program included in this package will not be built since it is dependent
#                        on Berkeley DB, which is not installed in LFS. However, a directory for  arpd and
#                        a man page will still be installed. Prevent this by running the commands below.
#                        If the  arpd binary is needed, instructions for compiling Berkeley DB can be found
#                        in the BLFS Book at http://www.linuxfromscratch.org/blfs/view/10.1/server/db.html.
#                         



sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8



# 
#                          It is also necessary to disable building two modules that require http://www.linuxfromscratch.org/blfs/view/10.1/postlfs/iptables.html.
#                         



sed -i 's/.m_ipt.o//' tc/Makefile



# 
#                          Compile the package: 



make



# 
#                          This package does not have a working test suite. 
# 
#                          Install the package: 



make DOCDIR=/usr/share/doc/iproute2-5.10.0 install


 
#          8.61.2. Contents of IPRoute2  
#           Installed programs: bridge, ctstat (link to lnstat), genl, ifcfg, ifstat, ip, lnstat, nstat, routef, routel, rtacct, rtmon, rtpr, rtstat (link to lnstat), ss, and tc
#           Installed directories: /etc/iproute2, /usr/lib/tc, and /usr/share/doc/iproute2-5.10.0 
#            Short Descriptions   
# 
#                          
# 
#                bridge   
# 
#                          Configures network bridges  
# 
#                          ctstat   
# 
#                          Connection status utility  
# 
#                          genl   
# 
#                          Generic netlink utility frontend  
# 
#                          ifcfg   
# 
#                          A shell script wrapper for the ip command [Note that it requires the  arping and  rdisk programs
#                        from the iputils package found at http://www.skbuff.net/iputils/.]    
# 
#                          ifstat   
# 
#                          Shows the interface statistics, including the amount of transmitted and received
#                        packets by interface  
# 
#                          ip   
# 
#                          The main executable. It has several different functions: 
# 
#                          ip link <device>  allows users to look at the state of devices and to make changes
#                         
# 
#                          ip addr allows users to look at addresses and their properties, add new addresses,
#                        and delete old ones  
# 
#                          ip neighbor allows users to look at neighbor bindings and their properties, add new
#                        neighbor entries, and delete old ones  
# 
#                          ip rule allows users to look at the routing policies and change them  
# 
#                          ip route allows users to look at the routing table and change routing table rules
#                         
# 
#                          ip tunnel allows users to look at the IP tunnels and their properties, and change
#                        them  
# 
#                          ip maddr allows users to look at the multicast addresses and their properties, and
#                        change them  
# 
#                          ip mroute allows users to set, change, or delete the multicast routing  
# 
#                          ip monitor allows users to continuously monitor the state of devices, addresses and
#                        routes   
# 
#                          lnstat   
# 
#                          Provides Linux network statistics; it is a generalized and more feature-complete
#                        replacement for the old rtstat program   
# 
#                          nstat   
# 
#                          Shows network statistics  
# 
#                          routef   
# 
#                          A component of ip route . This is for flushing the routing tables   
# 
#                          routel   
# 
#                          A component of ip route . This is for listing the routing tables   
# 
#                          rtacct   
# 
#                          Displays the contents of /proc/net/rt_acct 
# 
#                          rtmon   
# 
#                          Route monitoring utility  
# 
#                          rtpr   
# 
#                          Converts the output of ip -o back into a readable form   
# 
#                          rtstat   
# 
#                          Route status utility  
# 
#                          ss   
# 
#                          Similar to the netstat command; shows active connections   
# 
#                          tc   
# 
#                          Traffic Controlling Executable; this is for Quality Of Service (QOS) and Class Of
#                        Service (COS) implementations 
# 
#                          tc qdisc allows users to setup the queueing discipline  
# 
#                          tc class allows users to setup classes based on the queuing discipline scheduling
#                         
# 
#                          tc estimator allows users to estimate the network flow into a network  
# 
#                          tc filter allows users to setup the QOS/COS packet filtering  
# 
#                          tc policy allows users to setup the QOS/COS policies  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'kbd-*' | cut -c 2-)"

read -p "Chapter 8.62"

#        8.62. Kbd-2.4.0  
# 
#                          The Kbd package contains key-table files, console fonts, and keyboard utilities.
#                        
#           Approximate build time: 0.1 SBU
#           Required disk space: 33 MB
#          8.62.1. Installation of Kbd 
# 
#                          The behaviour of the backspace and delete keys is not consistent across the keymaps
#                        in the Kbd package. The following patch fixes this issue for i386 keymaps: 



patch -Np1 -i ../kbd-2.4.0-backspace-1.patch



# 
#                          After patching, the backspace key generates the character with code 127, and the
#                        delete key generates a well-known escape sequence. 
# 
#                          Remove the redundant  resizecons program (it requires the defunct svgalib to provide
#                        the video mode files - for normal use  setfont sizes the console appropriately) together
#                        with its manpage. 



sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in



# 
#                          Prepare Kbd for compilation: 



./configure --prefix=/usr --disable-vlock


 
# 
#                          The meaning of the configure option: 
# 
#                --disable-vlock 
# 
#                          This option prevents the vlock utility from being built because it requires the
#                        PAM library, which isn't available in the chroot environment. 
# 
#                          Compile the package: 



make



# 
#                          To test the results, issue: 



make check



# 
#                          Install the package: 



make install



#          Note 
# 
#                          For some languages (e.g., Belarusian) the Kbd package doesn't provide a useful keymap
#                        where the stock "by"keymap assumes the ISO-8859-5 encoding, and the CP1251 keymap
#                        is normally used. Users of such languages have to download working keymaps separately.
#                        
# 
#                          If desired, install the documentation: 



mkdir -v            /usr/share/doc/kbd-2.4.0
cp -R -v docs/doc/* /usr/share/doc/kbd-2.4.0


 
#          8.62.2. Contents of Kbd  
#           Installed programs: chvt, deallocvt, dumpkeys, fgconsole, getkeycodes, kbdinfo, kbd_mode, kbdrate, loadkeys, loadunimap, mapscrn, openvt, psfaddtable (link to psfxtable), psfgettable (link to psfxtable), psfstriptable (link to psfxtable), psfxtable, setfont, setkeycodes, setleds, setmetamode, setvtrgb, showconsolefont, showkey, unicode_start, and unicode_stop
#           Installed directories: /usr/share/consolefonts, /usr/share/consoletrans, /usr/share/keymaps, /usr/share/doc/kbd-2.4.0, and /usr/share/unimaps 
#            Short Descriptions   
# 
#                          
# 
#                chvt   
# 
#                          Changes the foreground virtual terminal  
# 
#                          deallocvt   
# 
#                          Deallocates unused virtual terminals  
# 
#                          dumpkeys   
# 
#                          Dumps the keyboard translation tables  
# 
#                          fgconsole   
# 
#                          Prints the number of the active virtual terminal  
# 
#                          getkeycodes   
# 
#                          Prints the kernel scancode-to-keycode mapping table  
# 
#                          kbdinfo   
# 
#                          Obtains information about the status of a console  
# 
#                          kbd_mode   
# 
#                          Reports or sets the keyboard mode  
# 
#                          kbdrate   
# 
#                          Sets the keyboard repeat and delay rates  
# 
#                          loadkeys   
# 
#                          Loads the keyboard translation tables  
# 
#                          loadunimap   
# 
#                          Loads the kernel unicode-to-font mapping table  
# 
#                          mapscrn   
# 
#                          An obsolete program that used to load a user-defined output character mapping table
#                        into the console driver; this is now done by setfont   
# 
#                          openvt   
# 
#                          Starts a program on a new virtual terminal (VT)  
# 
#                          psfaddtable   
# 
#                          Adds a Unicode character table to a console font  
# 
#                          psfgettable   
# 
#                          Extracts the embedded Unicode character table from a console font  
# 
#                          psfstriptable   
# 
#                          Removes the embedded Unicode character table from a console font  
# 
#                          psfxtable   
# 
#                          Handles Unicode character tables for console fonts  
# 
#                          setfont   
# 
#                          Changes the Enhanced Graphic Adapter (EGA) and Video Graphics Array (VGA) fonts
#                        on the console  
# 
#                          setkeycodes   
# 
#                          Loads kernel scancode-to-keycode mapping table entries; this is useful if there
#                        are unusual keys on the keyboard  
# 
#                          setleds   
# 
#                          Sets the keyboard flags and Light Emitting Diodes (LEDs)  
# 
#                          setmetamode   
# 
#                          Defines the keyboard meta-key handling  
# 
#                          setvtrgb   
# 
#                          Sets the console color map in all virtual terminals  
# 
#                          showconsolefont   
# 
#                          Shows the current EGA/VGA console screen font  
# 
#                          showkey   
# 
#                          Reports the scancodes, keycodes, and ASCII codes of the keys pressed on the keyboard
#                         
# 
#                          unicode_start   
# 
#                          Puts the keyboard and console in UNICODE mode [Don't use this program unless your
#                        keymap file is in the ISO-8859-1 encoding. For other encodings, this utility produces
#                        incorrect results.]  
# 
#                          unicode_stop   
# 
#                          Reverts keyboard and console from UNICODE mode 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'libpipeline-*' | cut -c 2-)"

read -p "Chapter 8.63"

#        8.63. Libpipeline-1.5.3  
# 
#                          The Libpipeline package contains a library for manipulating pipelines of subprocesses
#                        in a flexible and convenient way. 
#           Approximate build time: 0.1 SBU
#           Required disk space: 9.3 MB
#          8.63.1. Installation of Libpipeline 
# 
#                          Prepare Libpipeline for compilation: 



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


 
#          8.63.2. Contents of Libpipeline  
#           Installed library: libpipeline.so 
#            Short Descriptions   
# 
#                          
# 
#                libpipeline 
# 
#                          This library is used to safely construct pipelines between subprocesses 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'make-*' | cut -c 2-)"

read -p "Chapter 8.64"

#        8.64. Make-4.3  
# 
#                          The Make package contains a program for controlling the generation of executables
#                        and other non-source files of a package from source files. 
#           Approximate build time: 0.6 SBU
#           Required disk space: 14 MB
#          8.64.1. Installation of Make 
# 
#                          Prepare Make for compilation: 



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


 
#          8.64.2. Contents of Make  
#           Installed program: make 
#            Short Descriptions   
# 
#                          
# 
#                make   
# 
#                          Automatically determines which pieces of a package need to be (re)compiled and then
#                        issues the relevant commands 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'patch-*' | cut -c 2-)"

read -p "Chapter 8.65"

#        8.65. Patch-2.7.6  
# 
#                          The Patch package contains a program for modifying or creating files by applying
#                        a "patch"file typically created by the  diff program. 
#           Approximate build time: 0.2 SBU
#           Required disk space: 12 MB
#          8.65.1. Installation of Patch 
# 
#                          Prepare Patch for compilation: 



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


 
#          8.65.2. Contents of Patch  
#           Installed program: patch 
#            Short Descriptions   
# 
#                          
# 
#                patch   
# 
#                          Modifies files according to a patch file (A patch file is normally a difference
#                        listing created with the diff program. By applying these differences to the original
#                        files,  patch creates the patched versions.)  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'man-db-*' | cut -c 2-)"

read -p "Chapter 8.66"

#        8.66. Man-DB-2.9.4  
# 
#                          The Man-DB package contains programs for finding and viewing man pages. 
#           Approximate build time: 0.4 SBU
#           Required disk space: 40 MB
#          8.66.1. Installation of Man-DB 
# 
#                          Prepare Man-DB for compilation: 



./configure --prefix=/usr                        \
            --docdir=/usr/share/doc/man-db-2.9.4 \
            --sysconfdir=/etc                    \
            --disable-setuid                     \
            --enable-cache-owner=bin             \
            --with-browser=/usr/bin/lynx         \
            --with-vgrind=/usr/bin/vgrind        \
            --with-grap=/usr/bin/grap            \
            --with-systemdtmpfilesdir=           \
            --with-systemdsystemunitdir=


 
# 
#                          The meaning of the configure options: 
# 
#                --disable-setuid 
# 
#                          This disables making the  man program setuid to user man. 
# 
#                --enable-cache-owner=bin 
# 
#                          This makes the system-wide cache files be owned by user bin. 
# 
#                --with-... 
# 
#                          These three parameters are used to set some default programs.  lynx is a text-based
#                        web browser (see BLFS for installation instructions),  vgrind converts program sources
#                        to Groff input, and  grap is useful for typesetting graphs in Groff documents. The
#                         vgrind and  grap programs are not normally needed for viewing manual pages. They are
#                        not part of LFS or BLFS, but you should be able to install them yourself after finishing
#                        LFS if you wish to do so. 
# 
#                --with-systemd... 
# 
#                          These parameters prevent installing unneeded systemd directories and files. 
# 
#                          Compile the package: 



make



# 
#                          To test the results, issue: 



make check



# 
#                          Install the package: 



make install



#          8.66.2. Non-English Manual Pages in LFS 
# 
#                          The following table shows the character set that Man-DB assumes manual pages installed
#                        under /usr/share/man/<ll>will be encoded with. In addition to this, Man-DB correctly
#                        determines if manual pages installed in that directory are UTF-8 encoded.   
# 
#                          Table 8.1. Expected character encoding of legacy 8-bit manual pages 
# 
#                Language (code) Encoding Language (code) Encoding Danish (da) ISO-8859-1 Croatian (hr) ISO-8859-2 German (de) ISO-8859-1 Hungarian (hu) ISO-8859-2 English (en) ISO-8859-1 Japanese (ja) EUC-JP Spanish (es) ISO-8859-1 Korean (ko) EUC-KR Estonian (et) ISO-8859-1 Lithuanian (lt) ISO-8859-13 Finnish (fi) ISO-8859-1 Latvian (lv) ISO-8859-13 French (fr) ISO-8859-1 Macedonian (mk) ISO-8859-5 Irish (ga) ISO-8859-1 Polish (pl) ISO-8859-2 Galician (gl) ISO-8859-1 Romanian (ro) ISO-8859-2 Indonesian (id) ISO-8859-1 Russian (ru) KOI8-R Icelandic (is) ISO-8859-1 Slovak (sk) ISO-8859-2 Italian (it) ISO-8859-1 Slovenian (sl) ISO-8859-2 Norwegian Bokmal (nb) ISO-8859-1 Serbian Latin (sr@latin) ISO-8859-2 Dutch (nl) ISO-8859-1 Serbian (sr) ISO-8859-5 Norwegian Nynorsk (nn) ISO-8859-1 Turkish (tr) ISO-8859-9 Norwegian (no) ISO-8859-1 Ukrainian (uk) KOI8-U Portuguese (pt) ISO-8859-1 Vietnamese (vi) TCVN5712-1 Swedish (sv) ISO-8859-1 Simplified Chinese (zh_CN) GBK Belarusian (be) CP1251 Simplified Chinese, Singapore (zh_SG) GBK Bulgarian (bg) CP1251 Traditional Chinese, Hong Kong (zh_HK) BIG5HKSCS Czech (cs) ISO-8859-2 Traditional Chinese (zh_TW) BIG5 Greek (el) ISO-8859-7 
#          Note 
# 
#                          Manual pages in languages not in the list are not supported. 
#          8.66.3. Contents of Man-DB  
#           Installed programs: accessdb, apropos (link to whatis), catman, lexgrog, man, mandb, manpath, and whatis
#           Installed libraries: libman.so and libmandb.so (both in /usr/lib/man-db)
#           Installed directories: /usr/lib/man-db, /usr/libexec/man-db, and /usr/share/doc/man-db-2.9.4 
#            Short Descriptions   
# 
#                          
# 
#                accessdb   
# 
#                          Dumps the whatis database contents in human-readable form   
# 
#                          apropos   
# 
#                          Searches the whatis database and displays the short descriptions of system commands
#                        that contain a given string   
# 
#                          catman   
# 
#                          Creates or updates the pre-formatted manual pages  
# 
#                          lexgrog   
# 
#                          Displays one-line summary information about a given manual page  
# 
#                          man   
# 
#                          Formats and displays the requested manual page  
# 
#                          mandb   
# 
#                          Creates or updates the whatis database   
# 
#                          manpath   
# 
#                          Displays the contents of $MANPATH or (if $MANPATH is not set) a suitable search
#                        path based on the settings in man.conf and the user's environment  
# 
#                          whatis   
# 
#                          Searches the whatis database and displays the short descriptions of system commands
#                        that contain the given keyword as a separate word   
# 
#                          libman 
# 
#                          Contains run-time support for man   
# 
#                          libmandb 
# 
#                          Contains run-time support for man  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'tar-*' | cut -c 2-)"

read -p "Chapter 8.67"

#        8.67. Tar-1.34  
# 
#                          The Tar package provides the ability to create tar archives as well as perform various
#                        other kinds of archive manipulation. Tar can be used on previously created archives
#                        to extract files, to store additional files, or to update or list files which were
#                        already stored. 
#           Approximate build time: 2.0 SBU
#           Required disk space: 41 MB
#          8.67.1. Installation of Tar 
# 
#                          Prepare Tar for compilation: 



FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr \
            --bindir=/bin


 
# 
#                          The meaning of the configure option: 
# 
#                FORCE_UNSAFE_CONFIGURE=1
# 
#                          This forces the test for mknodto be run as root. It is generally considered dangerous
#                        to run this test as the rootuser, but as it is being run on a system that has only
#                        been partially built, overriding it is OK. 
# 
#                          Compile the package: 



make



# 
#                          To test the results (about 3 SBU), issue: 



make check



# 
#                          One test, capabilities: binary store/restore, is known to fail. 
# 
#                          Install the package: 



make install
make -C doc install-html docdir=/usr/share/doc/tar-1.34


 
#          8.67.2. Contents of Tar  
#           Installed programs: tar
#           Installed directory: /usr/share/doc/tar-1.34 
#            Short Descriptions   
# 
#                          
# 
#                tar   
# 
#                          Creates, extracts files from, and lists the contents of archives, also known as
#                        tarballs 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'texinfo-*' | cut -c 2-)"

read -p "Chapter 8.68"

#        8.68. Texinfo-6.7  
# 
#                          The Texinfo package contains programs for reading, writing, and converting info
#                        pages. 
#           Approximate build time: 0.7 SBU
#           Required disk space: 105 MB
#          8.68.1. Installation of Texinfo 
# 
#                          Prepare Texinfo for compilation: 



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
#                          Optionally, install the components belonging in a TeX installation: 



make TEXMF=/usr/share/texmf install-tex


 
# 
#                          The meaning of the make parameter: 
# 
#                TEXMF=/usr/share/texmf 
# 
#                          The TEXMFmakefile variable holds the location of the root of the TeX tree if, for
#                        example, a TeX package will be installed later. 
# 
#                          The Info documentation system uses a plain text file to hold its list of menu entries.
#                        The file is located at /usr/share/info/dir. Unfortunately, due to occasional problems
#                        in the Makefiles of various packages, it can sometimes get out of sync with the
#                        info pages installed on the system. If the /usr/share/info/dirfile ever needs to
#                        be recreated, the following optional commands will accomplish the task: 



pushd /usr/share/info
  rm -v dir
  for f in *
    do install-info $f dir 2>/dev/null
  done
popd


 
#          8.68.2. Contents of Texinfo  
#           Installed programs: info, install-info, makeinfo (link to texi2any), pdftexi2dvi, pod2texi, texi2any, texi2dvi, texi2pdf, and texindex
#           Installed library: MiscXS.so, Parsetexi.so, and XSParagraph.so (all in /usr/lib/texinfo)
#           Installed directories: /usr/share/texinfo and /usr/lib/texinfo 
#            Short Descriptions   
# 
#                          
# 
#                info   
# 
#                          Used to read info pages which are similar to man pages, but often go much deeper
#                        than just explaining all the available command line options [For example, compare
#                        man bison and  info bison .]   
# 
#                          install-info   
# 
#                          Used to install info pages; it updates entries in the info index file   
# 
#                          makeinfo   
# 
#                          Translates the given Texinfo source documents into info pages, plain text, or HTML
#                         
# 
#                          pdftexi2dvi   
# 
#                          Used to format the given Texinfo document into a Portable Document Format (PDF)
#                        file  
# 
#                          pod2texi   
# 
#                          Converts Pod to Texinfo format  
# 
#                          texi2any   
# 
#                          Translate Texinfo source documentation to various other formats  
# 
#                          texi2dvi   
# 
#                          Used to format the given Texinfo document into a device-independent file that can
#                        be printed  
# 
#                          texi2pdf   
# 
#                          Used to format the given Texinfo document into a Portable Document Format (PDF)
#                        file  
# 
#                          texindex   
# 
#                          Used to sort Texinfo index files 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'vim-*' | cut -c 2-)"

read -p "Chapter 8.69"

#        8.69. Vim-8.2.2433  
# 
#                          The Vim package contains a powerful text editor. 
#           Approximate build time: 2.0 SBU
#           Required disk space: 208 MB
#          Alternatives to Vim 
# 
#                          If you prefer another editor;such as Emacs, Joe, or Nano;please refer to http://www.linuxfromscratch.org/blfs/view/10.1/postlfs/editors.htmlfor
#                        suggested installation instructions.  
#          8.69.1. Installation of Vim 
# 
#                          First, change the default location of the vimrcconfiguration file to /etc: 



echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h



# 
#                          Prepare vim for compilation: 



./configure --prefix=/usr



# 
#                          Compile the package: 



make



# 
#                          To prepare the tests, ensure that user testercan write to the source tree: 



chown -Rv tester .



# 
#                          Now run the tests as user tester: 



su tester -c "LANG=en_US.UTF-8 make -j1 test" &> vim-test.log



# 
#                          The test suite outputs a lot of binary data to the screen. This can cause issues
#                        with the settings of the current terminal. The problem can be avoided by redirecting
#                        the output to a log file as shown above. A successful test will result in the words
#                        "ALL DONE" in the log file at completion. 
# 
#                          Install the package: 



make install



# 
#                          Many users are used to using  vi instead of  vim . To allow execution of  vim when users
#                        habitually enter  vi , create a symlink for both the binary and the man page in the
#                        provided languages: 



ln -sv vim /usr/bin/vi
for L in  /usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1
done



# 
#                          By default, vim's documentation is installed in /usr/share/vim. The following symlink
#                        allows the documentation to be accessed via /usr/share/doc/vim-8.2.2433, making
#                        it consistent with the location of documentation for other packages: 



ln -sv ../vim/vim82/doc /usr/share/doc/vim-8.2.2433



# 
#                          If an X Window System is going to be installed on the LFS system, it may be necessary
#                        to recompile vim after installing X. Vim comes with a GUI version of the editor
#                        that requires X and some additional libraries to be installed. For more information
#                        on this process, refer to the vim documentation and the vim installation page in
#                        the BLFS book at http://www.linuxfromscratch.org/blfs/view/10.1/postlfs/vim.html.
#                          
#          8.69.2. Configuring Vim  
# 
#                          By default, vim runs in vi-incompatible mode. This may be new to users who have used
#                        other editors in the past. The "nocompatible"setting is included below to highlight
#                        the fact that a new behavior is being used. It also reminds those who would change
#                        to "compatible"mode that it should be the first setting in the configuration file.
#                        This is necessary because it changes other settings, and overrides must come after
#                        this setting. Create a default  vim configuration file by running the following: 



cat > /etc/vimrc << "EOF"
" Begin /etc/vimrc

" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1 

set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
  set background=dark
endif

" End /etc/vimrc
EOF



# 
#                          The  set nocompatiblesetting makes  vim behave in a more useful way (the default) than
#                        the vi-compatible manner. Remove the "no"to keep the old  vi behavior. The  set backspace=2setting
#                        allows backspacing over line breaks, autoindents, and the start of an insert. The
#                         syntax onparameter enables vim's syntax highlighting. The  set mouse=setting enables
#                        proper pasting of text with the mouse when working in chroot or over a remote connection.
#                        Finally, the  if statement with the  set background=darksetting corrects  vim 's guess
#                        about the background color of some terminal emulators. This gives the highlighting
#                        a better color scheme for use on the black background of these programs. 
# 
#                          Documentation for other available options can be obtained by running the following
#                        command: 



vim -c ':options'



#          Note 
# 
#                          By default, vim only installs spell files for the English language. To install spell
#                        files for your preferred language, download the *.spland optionally, the *.sugfiles
#                        for your language and character encoding from ftp://ftp.vim.org/pub/vim/runtime/spell/and
#                        save them to /usr/share/vim/vim82/spell/.  
# 
#                          To use these spell files, some configuration in /etc/vimrcis needed, e.g.: 



set spelllang=en,ru
set spell



# 
#                          For more information, see the appropriate README file located at the URL above.
#                         
#          8.69.3. Contents of Vim  
#           Installed programs: ex (link to vim), rview (link to vim), rvim (link to vim), vi (link to vim), view (link to vim), vim, vimdiff (link to vim), vimtutor, and xxd
#           Installed directory: /usr/share/vim 
#            Short Descriptions   
# 
#                          
# 
#                ex   
# 
#                          Starts vim in ex mode   
# 
#                          rview   
# 
#                          Is a restricted version of view ; no shell commands can be started and  view cannot
#                        be suspended   
# 
#                          rvim   
# 
#                          Is a restricted version of vim ; no shell commands can be started and  vim cannot be
#                        suspended   
# 
#                          vi   
# 
#                          Link to vim   
# 
#                          view   
# 
#                          Starts vim in read-only mode   
# 
#                          vim   
# 
#                          Is the editor  
# 
#                          vimdiff   
# 
#                          Edits two or three versions of a file with vim and shows differences   
# 
#                          vimtutor   
# 
#                          Teaches the basic keys and commands of vim   
# 
#                          xxd   
# 
#                          Creates a hex dump of the given file; it can also do the reverse, so it can be used
#                        for binary patching 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'eudev-*' | cut -c 2-)"

read -p "Chapter 8.70"

#        8.70. Eudev-3.2.10  
# 
#                          The Eudev package contains programs for dynamic creation of device nodes. 
#           Approximate build time: 0.2 SBU
#           Required disk space: 82 MB
#          8.70.1. Installation of Eudev 
# 
#                          Prepare Eudev for compilation: 



./configure --prefix=/usr           \
            --bindir=/sbin          \
            --sbindir=/sbin         \
            --libdir=/usr/lib       \
            --sysconfdir=/etc       \
            --libexecdir=/lib       \
            --with-rootprefix=      \
            --with-rootlibdir=/lib  \
            --enable-manpages       \
            --disable-static



# 
#                          Compile the package: 



make



# 
#                          Create some directories now that are needed for tests, but will also be used as
#                        a part of installation: 



mkdir -pv /lib/udev/rules.d
mkdir -pv /etc/udev/rules.d



# 
#                          To test the results, issue: 



make check



# 
#                          Install the package: 



make install



# 
#                          Install some custom rules and support files useful in an LFS environment: 



tar -xvf ../udev-lfs-20171102.tar.xz
make -f udev-lfs-20171102/Makefile.lfs install


 
#          8.70.2. Configuring Eudev  
# 
#                          Information about hardware devices is maintained in the /etc/udev/hwdb.dand /lib/udev/hwdb.ddirectories.
#                        Eudevneeds that information to be compiled into a binary database /etc/udev/hwdb.bin.
#                        Create the initial database: 



udevadm hwdb --update



# 
#                          This command needs to be run each time the hardware information is updated.  
#          8.70.3. Contents of Eudev  
#           Installed programs: udevadm and udevd
#           Installed libraries: libudev.so
#           Installed directories: /etc/udev, /lib/udev, and /usr/share/doc/udev-udev-lfs-20171102 
#            Short Descriptions   
# 
#                          
# 
#                udevadm   
# 
#                          Generic udev administration tool: controls the udevd daemon, provides info from
#                        the Udev database, monitors uevents, waits for uevents to finish, tests Udev configuration,
#                        and triggers uevents for a given device  
# 
#                          udevd   
# 
#                          A daemon that listens for uevents on the netlink socket, creates devices and runs
#                        the configured external programs in response to these uevents  
# 
#                          libudev 
# 
#                          A library interface to udev device information  
# 
#                          /etc/udev 
# 
#                          Contains Udev configuration files, device permissions, and rules for device naming
#                        


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'procps-*' | cut -c 2-)"

read -p "Chapter 8.71"

#        8.71. Procps-ng-3.3.17  
# 
#                          The Procps-ng package contains programs for monitoring processes. 
#          Note 
# 
#                          This package extracts to the directory procps-3.3.17, not the expected procps-ng-3.3.17.
#                        
#           Approximate build time: 0.5 SBU
#           Required disk space: 20 MB
#          8.71.1. Installation of Procps-ng 
# 
#                          Prepare procps-ng for compilation: 



./configure --prefix=/usr                            \
            --exec-prefix=                           \
            --libdir=/usr/lib                        \
            --docdir=/usr/share/doc/procps-ng-3.3.17 \
            --disable-static                         \
            --disable-kill


 
# 
#                          The meaning of the configure option: 
# 
#                --disable-kill 
# 
#                          This switch disables building the  kill command that will be installed by the Util-linux
#                        package. 
# 
#                          Compile the package: 



make



# 
#                          To run the test suite, run: 



make check



# 
#                          Five tests related to pkill are known to fail due to a problem with tests that were
#                        not updated. 
# 
#                          Install the package: 



make install



# 
#                          Finally, move essential libraries to a location that can be found if /usris not
#                        mounted. 



mv -v /usr/lib/libprocps.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libprocps.so) /usr/lib/libprocps.so


 
#          8.71.2. Contents of Procps-ng  
#           Installed programs: free, pgrep, pidof, pkill, pmap, ps, pwdx, slabtop, sysctl, tload, top, uptime, vmstat, w, and watch
#           Installed library: libprocps.so
#           Installed directories: /usr/include/proc and /usr/share/doc/procps-ng-3.3.17 
#            Short Descriptions   
# 
#                          
# 
#                free   
# 
#                          Reports the amount of free and used memory (both physical and swap memory) in the
#                        system  
# 
#                          pgrep   
# 
#                          Looks up processes based on their name and other attributes  
# 
#                          pidof   
# 
#                          Reports the PIDs of the given programs  
# 
#                          pkill   
# 
#                          Signals processes based on their name and other attributes  
# 
#                          pmap   
# 
#                          Reports the memory map of the given process  
# 
#                          ps   
# 
#                          Lists the current running processes  
# 
#                          pwait   
# 
#                          Waits for a process to finish before executing.  
# 
#                          pwdx   
# 
#                          Reports the current working directory of a process  
# 
#                          slabtop   
# 
#                          Displays detailed kernel slab cache information in real time  
# 
#                          sysctl   
# 
#                          Modifies kernel parameters at run time  
# 
#                          tload   
# 
#                          Prints a graph of the current system load average  
# 
#                          top   
# 
#                          Displays a list of the most CPU intensive processes; it provides an ongoing look
#                        at processor activity in real time  
# 
#                          uptime   
# 
#                          Reports how long the system has been running, how many users are logged on, and
#                        the system load averages  
# 
#                          vmstat   
# 
#                          Reports virtual memory statistics, giving information about processes, memory, paging,
#                        block Input/Output (IO), traps, and CPU activity  
# 
#                          w   
# 
#                          Shows which users are currently logged on, where, and since when  
# 
#                          watch   
# 
#                          Runs a given command repeatedly, displaying the first screen-full of its output;
#                        this allows a user to watch the output change over time  
# 
#                          libprocps 
# 
#                          Contains the functions used by most programs in this package 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'util-linux-*' | cut -c 2-)"

read -p "Chapter 8.72"

#        8.72. Util-linux-2.36.2  
# 
#                          The Util-linux package contains miscellaneous utility programs. Among them are utilities
#                        for handling file systems, consoles, partitions, and messages. 
#           Approximate build time: 1.1 SBU
#           Required disk space: 262 MB
#          8.72.1. Installation of Util-linux 
# 
#                          Prepare Util-linux for compilation: 



./configure ADJTIME_PATH=/var/lib/hwclock/adjtime   \
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
            --without-systemd    \
            --without-systemdsystemunitdir \
            runstatedir=/run



# 
#                          The --disable and --without options prevent warnings about building components that
#                        require packages not in LFS or are inconsistent with programs installed by other
#                        packages. 
# 
#                          Compile the package: 



make



# 
#                          If desired, run the test suite as a non-root user: 
#          Warning 
# 
#                          Running the test suite as the rootuser can be harmful to your system. To run it,
#                        the CONFIG_SCSI_DEBUG option for the kernel must be available in the currently running
#                        system and must be built as a module. Building it into the kernel will prevent booting.
#                        For complete coverage, other BLFS packages must be installed. If desired, this test
#                        can be run after rebooting into the completed LFS system and running: 



bash tests/run.sh --srcdir=$PWD --builddir=$PWD






chown -Rv tester .
su tester -c "make -k check"



# 
#                          Install the package: 



make install


 
#          8.72.2. Contents of Util-linux  
#           Installed programs: addpart, agetty, blkdiscard, blkid, blkzone, blockdev, cal, cfdisk, chcpu, chmem, choom, chrt, col, colcrt, colrm, column, ctrlaltdel, delpart, dmesg, eject, fallocate, fdformat, fdisk, fincore, findfs, findmnt, flock, fsck, fsck.cramfs, fsck.minix, fsfreeze, fstrim, getopt, hexdump, hwclock, i386, ionice, ipcmk, ipcrm, ipcs, isosize, kill, last, lastb (link to last), ldattach, linux32, linux64, logger, look, losetup, lsblk, lscpu, lsipc, lslocks, lslogins, lsmem, lsns, mcookie, mesg, mkfs, mkfs.bfs, mkfs.cramfs, mkfs.minix, mkswap, more, mount, mountpoint, namei, nsenter, partx, pivot_root, prlimit, raw, readprofile, rename, renice, resizepart, rev, rfkill, rtcwake, script, scriptreplay, setarch, setsid, setterm, sfdisk, sulogin, swaplabel, swapoff (link to swapon), swapon, switch_root, taskset, ul, umount, uname26, unshare, utmpdump, uuidd, uuidgen, uuidparse, wall, wdctl, whereis, wipefs, x86_64, and zramctl
#           Installed libraries: libblkid.so, libfdisk.so, libmount.so, libsmartcols.so, and libuuid.so
#           Installed directories: /usr/include/blkid, /usr/include/libfdisk, /usr/include/libmount, /usr/include/libsmartcols, /usr/include/uuid, /usr/share/doc/util-linux-2.36.2, and /var/lib/hwclock 
#            Short Descriptions   
# 
#                          
# 
#                addpart   
# 
#                          Informs the Linux kernel of new partitions  
# 
#                          agetty   
# 
#                          Opens a tty port, prompts for a login name, and then invokes the login program   
# 
#                          blkdiscard   
# 
#                          Discards sectors on a device  
# 
#                          blkid   
# 
#                          A command line utility to locate and print block device attributes  
# 
#                          blkzone   
# 
#                          Runs zone command on the given block device  
# 
#                          blockdev   
# 
#                          Allows users to call block device ioctls from the command line  
# 
#                          cal   
# 
#                          Displays a simple calendar  
# 
#                          cfdisk   
# 
#                          Manipulates the partition table of the given device  
# 
#                          chcpu   
# 
#                          Modifies the state of CPUs  
# 
#                          chmem   
# 
#                          Configures memory  
# 
#                          choom   
# 
#                          Displays and adjusts OOM-killer score  
# 
#                          chrt   
# 
#                          Manipulates real-time attributes of a process  
# 
#                          col   
# 
#                          Filters out reverse line feeds  
# 
#                          colcrt   
# 
#                          Filters nroff output for terminals that lack some capabilities, such as overstriking
#                        and half-lines   
# 
#                          colrm   
# 
#                          Filters out the given columns  
# 
#                          column   
# 
#                          Formats a given file into multiple columns  
# 
#                          ctrlaltdel   
# 
#                          Sets the function of the Ctrl+Alt+Del key combination to a hard or a soft reset
#                         
# 
#                          delpart   
# 
#                          Asks the Linux kernel to remove a partition  
# 
#                          dmesg   
# 
#                          Dumps the kernel boot messages  
# 
#                          eject   
# 
#                          Ejects removable media  
# 
#                          fallocate   
# 
#                          Preallocates space to a file  
# 
#                          fdformat   
# 
#                          Low-level formats a floppy disk  
# 
#                          fdisk   
# 
#                          Manipulates the partition table of the given device  
# 
#                          fincore   
# 
#                          Counts pages of file contents in core  
# 
#                          findfs   
# 
#                          Finds a file system by label or Universally Unique Identifier (UUID)  
# 
#                          findmnt   
# 
#                          Is a command line interface to the libmount library for work with mountinfo, fstab
#                        and mtab files  
# 
#                          flock   
# 
#                          Acquires a file lock and then executes a command with the lock held  
# 
#                          fsck   
# 
#                          Is used to check, and optionally repair, file systems  
# 
#                          fsck.cramfs   
# 
#                          Performs a consistency check on the Cramfs file system on the given device  
# 
#                          fsck.minix   
# 
#                          Performs a consistency check on the Minix file system on the given device  
# 
#                          fsfreeze   
# 
#                          Is a very simple wrapper around FIFREEZE/FITHAW ioctl kernel driver operations  
# 
#                          fstrim   
# 
#                          Discards unused blocks on a mounted filesystem  
# 
#                          getopt   
# 
#                          Parses options in the given command line  
# 
#                          hexdump   
# 
#                          Dumps the given file in hexadecimal or in another given format  
# 
#                          hwclock   
# 
#                          Reads or sets the system's hardware clock, also called the Real-Time Clock (RTC)
#                        or Basic Input-Output System (BIOS) clock  
# 
#                          i386   
# 
#                          A symbolic link to setarch  
# 
#                          ionice   
# 
#                          Gets or sets the io scheduling class and priority for a program  
# 
#                          ipcmk   
# 
#                          Creates various IPC resources  
# 
#                          ipcrm   
# 
#                          Removes the given Inter-Process Communication (IPC) resource  
# 
#                          ipcs   
# 
#                          Provides IPC status information  
# 
#                          isosize   
# 
#                          Reports the size of an iso9660 file system  
# 
#                          kill   
# 
#                          Sends signals to processes  
# 
#                          last   
# 
#                          Shows which users last logged in (and out), searching back through the /var/log/wtmpfile;
#                        it also shows system boots, shutdowns, and run-level changes  
# 
#                          lastb   
# 
#                          Shows the failed login attempts, as logged in /var/log/btmp 
# 
#                          ldattach   
# 
#                          Attaches a line discipline to a serial line  
# 
#                          linux32   
# 
#                          A symbolic link to setarch  
# 
#                          linux64   
# 
#                          A symbolic link to setarch  
# 
#                          logger   
# 
#                          Enters the given message into the system log  
# 
#                          look   
# 
#                          Displays lines that begin with the given string  
# 
#                          losetup   
# 
#                          Sets up and controls loop devices  
# 
#                          lsblk   
# 
#                          Lists information about all or selected block devices in a tree-like format  
# 
#                          lscpu   
# 
#                          Prints CPU architecture information  
# 
#                          lsipc   
# 
#                          Prints information on IPC facilities currently employed in the system  
# 
#                          lslocks   
# 
#                          Lists local system locks  
# 
#                          lslogins   
# 
#                          Lists information about users, groups and system accounts  
# 
#                          lsmem   
# 
#                          Lists the ranges of available memory with their online status  
# 
#                          lsns   
# 
#                          Lists namespaces  
# 
#                          mcookie   
# 
#                          Generates magic cookies (128-bit random hexadecimal numbers) for xauth   
# 
#                          mesg   
# 
#                          Controls whether other users can send messages to the current user's terminal  
# 
#                          mkfs   
# 
#                          Builds a file system on a device (usually a hard disk partition)  
# 
#                          mkfs.bfs   
# 
#                          Creates a Santa Cruz Operations (SCO) bfs file system  
# 
#                          mkfs.cramfs   
# 
#                          Creates a cramfs file system  
# 
#                          mkfs.minix   
# 
#                          Creates a Minix file system  
# 
#                          mkswap   
# 
#                          Initializes the given device or file to be used as a swap area  
# 
#                          more   
# 
#                          A filter for paging through text one screen at a time  
# 
#                          mount   
# 
#                          Attaches the file system on the given device to a specified directory in the file-system
#                        tree  
# 
#                          mountpoint   
# 
#                          Checks if the directory is a mountpoint  
# 
#                          namei   
# 
#                          Shows the symbolic links in the given pathnames  
# 
#                          nsenter   
# 
#                          Runs a program with namespaces of other processes  
# 
#                          partx   
# 
#                          Tells the kernel about the presence and numbering of on-disk partitions  
# 
#                          pivot_root   
# 
#                          Makes the given file system the new root file system of the current process  
# 
#                          prlimit   
# 
#                          Get and set a process' resource limits  
# 
#                          raw   
# 
#                          Bind a Linux raw character device to a block device  
# 
#                          readprofile   
# 
#                          Reads kernel profiling information  
# 
#                          rename   
# 
#                          Renames the given files, replacing a given string with another  
# 
#                          renice   
# 
#                          Alters the priority of running processes  
# 
#                          resizepart   
# 
#                          Asks the Linux kernel to resize a partition  
# 
#                          rev   
# 
#                          Reverses the lines of a given file  
# 
#                          rkfill   
# 
#                          Tool for enabling and disabling wireless devices  
# 
#                          rtcwake   
# 
#                          Used to enter a system sleep state until specified wakeup time  
# 
#                          script   
# 
#                          Makes a typescript of a terminal session  
# 
#                          scriptreplay   
# 
#                          Plays back typescripts using timing information  
# 
#                          setarch   
# 
#                          Changes reported architecture in a new program environment and sets personality
#                        flags  
# 
#                          setsid   
# 
#                          Runs the given program in a new session  
# 
#                          setterm   
# 
#                          Sets terminal attributes  
# 
#                          sfdisk   
# 
#                          A disk partition table manipulator  
# 
#                          sulogin   
# 
#                          Allows rootto log in; it is normally invoked by init when the system goes into single
#                        user mode   
# 
#                          swaplabel   
# 
#                          Allows to change swaparea UUID and label  
# 
#                          swapoff   
# 
#                          Disables devices and files for paging and swapping  
# 
#                          swapon   
# 
#                          Enables devices and files for paging and swapping and lists the devices and files
#                        currently in use  
# 
#                          switch_root   
# 
#                          Switches to another filesystem as the root of the mount tree  
# 
#                          tailf   
# 
#                          Tracks the growth of a log file; displays the last 10 lines of a log file, then
#                        continues displaying any new entries in the log file as they are created  
# 
#                          taskset   
# 
#                          Retrieves or sets a process' CPU affinity  
# 
#                          ul   
# 
#                          A filter for translating underscores into escape sequences indicating underlining
#                        for the terminal in use  
# 
#                          umount   
# 
#                          Disconnects a file system from the system's file tree  
# 
#                          uname26   
# 
#                          A symbolic link to setarch  
# 
#                          unshare   
# 
#                          Runs a program with some namespaces unshared from parent  
# 
#                          utmpdump   
# 
#                          Displays the content of the given login file in a more user-friendly format  
# 
#                          uuidd   
# 
#                          A daemon used by the UUID library to generate time-based UUIDs in a secure and guaranteed-unique
#                        fashion  
# 
#                          uuidgen   
# 
#                          Creates new UUIDs. Each new UUID can reasonably be considered unique among all UUIDs
#                        created, on the local system and on other systems, in the past and in the future
#                         
# 
#                          uuidparse   
# 
#                          An utility to parse unique identifiers  
# 
#                          wall   
# 
#                          Displays the contents of a file or, by default, its standard input, on the terminals
#                        of all currently logged in users  
# 
#                          wdctl   
# 
#                          Shows hardware watchdog status  
# 
#                          whereis   
# 
#                          Reports the location of the binary, source, and man page for the given command  
# 
#                          wipefs   
# 
#                          Wipes a filesystem signature from a device  
# 
#                          x86_64   
# 
#                          A symbolic link to setarch  
# 
#                          zramctl   
# 
#                          A program to set up and control zram (compressed ram disk) devices  
# 
#                          libblkid 
# 
#                          Contains routines for device identification and token extraction  
# 
#                          libfdisk 
# 
#                          Contains routines for manipulating partition tables  
# 
#                          libmount 
# 
#                          Contains routines for block device mounting and unmounting  
# 
#                          libsmartcols 
# 
#                          Contains routines for aiding screen output in tabular form  
# 
#                          libuuid 
# 
#                          Contains routines for generating unique identifiers for objects that may be accessible
#                        beyond the local system 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'e2fsprogs-*' | cut -c 2-)"

read -p "Chapter 8.73"

#        8.73. E2fsprogs-1.46.1  
# 
#                          The e2fsprogs package contains the utilities for handling the ext2file system. It
#                        also supports the ext3and ext4journaling file systems. 
#           Approximate build time: 4.4 SBU on a spinning disk, 1.5 SBU on an SSD
#           Required disk space: 102 MB
#          8.73.1. Installation of E2fsprogs 
# 
#                          The e2fsprogs documentation recommends that the package be built in a subdirectory
#                        of the source tree: 



mkdir -v build
cd       build



# 
#                          Prepare e2fsprogs for compilation: 



../configure --prefix=/usr           \
             --bindir=/bin           \
             --with-root-prefix=""   \
             --enable-elf-shlibs     \
             --disable-libblkid      \
             --disable-libuuid       \
             --disable-uuidd         \
             --disable-fsck


 
# 
#                          The meaning of the configure options: 
# 
#                --with-root-prefix=""and  --bindir=/bin 
# 
#                          Certain programs (such as the  e2fsck program) are considered essential programs.
#                        When, for example, /usris not mounted, these programs still need to be available.
#                        They belong in directories like /liband /sbin. If this option is not passed to configure,
#                        the programs are installed into the /usrdirectory. 
# 
#                --enable-elf-shlibs 
# 
#                          This creates the shared libraries which some programs in this package use. 
# 
#                --disable-* 
# 
#                          This prevents e2fsprogs from building and installing the libuuidand libblkidlibraries,
#                        the uuidddaemon, and the  fsck wrapper, as util-linux installs more recent versions.
#                        
# 
#                          Compile the package: 



make



# 
#                          To run the tests, issue: 



make check



# 
#                          One test, m_rootdir_acl, is known to fail. 
# 
#                          On a spinning disk, the tests take a little more than 4 SBUs. They can be much shorter
#                        on an SSD (down to about 1.5 SBUs). 
# 
#                          Install the package: 



make install



# 
#                          Remove useless static libraries: 



rm -fv /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a



# 
#                          This package installs a gzipped .infofile but doesn't update the system-wide dirfile.
#                        Unzip this file and then update the system dirfile using the following commands:
#                        



gunzip -v /usr/share/info/libext2fs.info.gz
install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info



# 
#                          If desired, create and install some additional documentation by issuing the following
#                        commands: 



makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo
install -v -m644 doc/com_err.info /usr/share/info
install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info


 
#          8.73.2. Contents of E2fsprogs  
#           Installed programs: badblocks, chattr, compile_et, debugfs, dumpe2fs, e2freefrag, e2fsck, e2image, e2label, e2mmpstatus, e2scrub, e2scrub_all, e2undo, e4crypt, e4defrag, filefrag, fsck.ext2, fsck.ext3, fsck.ext4, logsave, lsattr, mk_cmds, mke2fs, mkfs.ext2, mkfs.ext3, mkfs.ext4, mklost+found, resize2fs, and tune2fs
#           Installed libraries: libcom_err.so, libe2p.so, libext2fs.so, and libss.so
#           Installed directories: /usr/include/e2p, /usr/include/et, /usr/include/ext2fs, /usr/include/ss, /usr/lib/e2fsprogs, /usr/share/et, and /usr/share/ss 
#            Short Descriptions   
# 
#                          
# 
#                badblocks   
# 
#                          Searches a device (usually a disk partition) for bad blocks  
# 
#                          chattr   
# 
#                          Changes the attributes of files on an ext2file system; it also changes ext3file
#                        systems, the journaling version of ext2file systems  
# 
#                          compile_et   
# 
#                          An error table compiler; it converts a table of error-code names and messages into
#                        a C source file suitable for use with the com_errlibrary  
# 
#                          debugfs   
# 
#                          A file system debugger; it can be used to examine and change the state of an ext2file
#                        system  
# 
#                          dumpe2fs   
# 
#                          Prints the super block and blocks group information for the file system present
#                        on a given device  
# 
#                          e2freefrag   
# 
#                          Reports free space fragmentation information  
# 
#                          e2fsck   
# 
#                          Is used to check, and optionally repair ext2file systems and ext3file systems  
# 
#                          e2image   
# 
#                          Is used to save critical ext2file system data to a file  
# 
#                          e2label   
# 
#                          Displays or changes the file system label on the ext2file system present on a given
#                        device  
# 
#                          e2mmpstatus   
# 
#                          Checks MMP status of an ext4 filesystem  
# 
#                          e2scrub   
# 
#                          Checks the contents of a mounted ext[234] filesystem  
# 
#                          e2scrub_all   
# 
#                          Checks all mounted ext[234] filesystems for errors  
# 
#                          e2undo   
# 
#                          Replays the undo log undo_log for an ext2/ext3/ext4 filesystem found on a device
#                        [This can be used to undo a failed operation by an e2fsprogs program.]  
# 
#                          e4crypt   
# 
#                          Ext4 filesystem encryption utility  
# 
#                          e4defrag   
# 
#                          Online defragmenter for ext4 filesystems  
# 
#                          filefrag   
# 
#                          Reports on how badly fragmented a particular file might be  
# 
#                          fsck.ext2   
# 
#                          By default checks ext2file systems and is a hard link to e2fsck   
# 
#                          fsck.ext3   
# 
#                          By default checks ext3file systems and is a hard link to e2fsck   
# 
#                          fsck.ext4   
# 
#                          By default checks ext4file systems and is a hard link to e2fsck   
# 
#                          logsave   
# 
#                          Saves the output of a command in a log file  
# 
#                          lsattr   
# 
#                          Lists the attributes of files on a second extended file system  
# 
#                          mk_cmds   
# 
#                          Converts a table of command names and help messages into a C source file suitable
#                        for use with the libsssubsystem library  
# 
#                          mke2fs   
# 
#                          Creates an ext2or ext3file system on the given device  
# 
#                          mkfs.ext2   
# 
#                          By default creates ext2file systems and is a hard link to mke2fs   
# 
#                          mkfs.ext3   
# 
#                          By default creates ext3file systems and is a hard link to mke2fs   
# 
#                          mkfs.ext4   
# 
#                          By default creates ext4file systems and is a hard link to mke2fs   
# 
#                          mklost+found   
# 
#                          Used to create a lost+founddirectory on an ext2file system; it pre-allocates disk
#                        blocks to this directory to lighten the task of e2fsck   
# 
#                          resize2fs   
# 
#                          Can be used to enlarge or shrink an ext2file system  
# 
#                          tune2fs   
# 
#                          Adjusts tunable file system parameters on an ext2file system  
# 
#                          libcom_err 
# 
#                          The common error display routine  
# 
#                          libe2p 
# 
#                          Used by dumpe2fs ,  chattr , and  lsattr   
# 
#                          libext2fs 
# 
#                          Contains routines to enable user-level programs to manipulate an ext2file system
#                         
# 
#                          libss 
# 
#                          Used by debugfs  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'sysklogd-*' | cut -c 2-)"

read -p "Chapter 8.74"

#        8.74. Sysklogd-1.5.1  
# 
#                          The sysklogd package contains programs for logging system messages, such as those
#                        given by the kernel when unusual things happen. 
#           Approximate build time: less than 0.1 SBU
#           Required disk space: 0.6 MB
#          8.74.1. Installation of Sysklogd 
# 
#                          First, fix problems that causes a segmentation fault under some conditions in klogd
#                        and fix an obsolete program construct: 



sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c
sed -i 's/union wait/int/' syslogd.c



# 
#                          Compile the package: 



make



# 
#                          This package does not come with a test suite. 
# 
#                          Install the package: 



make BINDIR=/sbin install


 
#          8.74.2. Configuring Sysklogd  
# 
#                          Create a new /etc/syslog.conffile by running the following: 



cat > /etc/syslog.conf << "EOF"
# Begin /etc/syslog.conf

auth,authpriv.* -/var/log/auth.log
*.*;auth,authpriv.none -/var/log/sys.log
daemon.* -/var/log/daemon.log
kern.* -/var/log/kern.log
mail.* -/var/log/mail.log
user.* -/var/log/user.log
*.emerg *

# End /etc/syslog.conf
EOF



#          8.74.3. Contents of Sysklogd  
#           Installed programs: klogd and syslogd 
#            Short Descriptions   
# 
#                          
# 
#                klogd   
# 
#                          A system daemon for intercepting and logging kernel messages  
# 
#                          syslogd   
# 
#                          Logs the messages that system programs offer for logging [Every logged message contains
#                        at least a date stamp and a hostname, and normally the program's name too, but that
#                        depends on how trusting the logging daemon is told to be.] 


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name 'sysvinit-*' | cut -c 2-)"

read -p "Chapter 8.75"

#        8.75. Sysvinit-2.98  
# 
#                          The Sysvinit package contains programs for controlling the startup, running, and
#                        shutdown of the system. 
#           Approximate build time: less than 0.1 SBU
#           Required disk space: 1.4 MB
#          8.75.1. Installation of Sysvinit 
# 
#                          First, apply a patch that removes several programs installed by other packages,
#                        clarifies a message, and fixes a compiler warning: 



patch -Np1 -i ../sysvinit-2.98-consolidated-1.patch



# 
#                          Compile the package: 



make



# 
#                          This package does not come with a test suite. 
# 
#                          Install the package: 



make install


 
#          8.75.2. Contents of Sysvinit  
#           Installed programs: bootlogd, fstab-decode, halt, init, killall5, poweroff (link to halt), reboot (link to halt), runlevel, shutdown, and telinit (link to init) 
#            Short Descriptions   
# 
#                          
# 
#                bootlogd   
# 
#                          Logs boot messages to a log file  
# 
#                          fstab-decode   
# 
#                          Run a command with fstab-encoded arguments  
# 
#                          halt   
# 
#                          Normally invokes shutdown with the  -hoption, except when already in run-level 0,
#                        then it tells the kernel to halt the system; it notes in the file /var/log/wtmpthat
#                        the system is being brought down   
# 
#                          init   
# 
#                          The first process to be started when the kernel has initialized the hardware which
#                        takes over the boot process and starts all the proceses specified in its configuration
#                        file  
# 
#                          killall5   
# 
#                          Sends a signal to all processes, except the processes in its own session so it will
#                        not kill its parent shell  
# 
#                          poweroff   
# 
#                          Tells the kernel to halt the system and switch off the computer (see halt )   
# 
#                          reboot   
# 
#                          Tells the kernel to reboot the system (see halt )   
# 
#                          runlevel   
# 
#                          Reports the previous and the current run-level, as noted in the last run-level record
#                        in /run/utmp 
# 
#                          shutdown   
# 
#                          Brings the system down in a secure way, signaling all processes and notifying all
#                        logged-in users  
# 
#                          telinit   
# 
#                          Tells init which run-level to change to  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name '-*' | cut -c 2-)"

read -p "Chapter 8.76"

#        8.76. About Debugging Symbols  
# 
#                          Most programs and libraries are, by default, compiled with debugging symbols included
#                        (with gcc 's  -goption). This means that when debugging a program or library that
#                        was compiled with debugging information, the debugger can provide not only memory
#                        addresses, but also the names of the routines and variables.  
# 
#                          However, the inclusion of these debugging symbols enlarges a program or library
#                        significantly. The following is an example of the amount of space these symbols
#                        occupy: 
# 
#                          A bash binary with debugging symbols: 1200 KB 
# 
#                          A  bash binary without debugging symbols: 480 KB 
# 
#                          Glibc and GCC files (/liband /usr/lib) with debugging symbols: 87 MB 
# 
#                          Glibc and GCC files without debugging symbols: 16 MB 
# 
#                          Sizes may vary depending on which compiler and C library were used, but when comparing
#                        programs with and without debugging symbols, the difference will usually be a factor
#                        between two and five. 
# 
#                          Because most users will never use a debugger on their system software, a lot of
#                        disk space can be regained by removing these symbols. The next section shows how
#                        to strip all debugging symbols from the programs and libraries.  
#        8.77. Stripping Again  
# 
#                          This section is optional. If the intended user is not a programmer and does not
#                        plan to do any debugging on the system software, the system size can be decreased
#                        by about 2 GB by removing the debugging symbols from binaries and libraries. This
#                        causes no inconvenience other than not being able to debug the software fully anymore.
#                        
# 
#                          Most people who use the commands mentioned below do not experience any difficulties.
#                        However, it is easy to make a typo and render the new system unusable, so before
#                        running the strip commands, it is a good idea to make a backup of the LFS system
#                        in its current state. 
# 
#                          First place the debugging symbols for selected libraries in separate files. This
#                        debugging information is needed if running regression tests that use valgrindor
#                        gdblater in BLFS.  



# save_lib="ld-2.33.so libc-2.33.so libpthread-2.33.so libthread_db-1.0.so"
# 
# cd /lib
# 
# for LIB in $save_lib; do
#     objcopy --only-keep-debug $LIB $LIB.dbg 
#     strip --strip-unneeded $LIB
#     objcopy --add-gnu-debuglink=$LIB.dbg $LIB 
# done    
# 
# save_usrlib="libquadmath.so.0.0.0 libstdc++.so.6.0.28
#              libitm.so.1.0.0 libatomic.so.1.2.0" 
# 
# cd /usr/lib
# 
# for LIB in $save_usrlib; do
#     objcopy --only-keep-debug $LIB $LIB.dbg
#     strip --strip-unneeded $LIB
#     objcopy --add-gnu-debuglink=$LIB.dbg $LIB
# done
# 
# unset LIB save_lib save_usrlib
# 


# 
#                          Now the binaries and libraries can be stripped: 



# find /usr/lib -type f -name \*.a \
#    -exec strip --strip-debug {} ';'
# 
# find /lib /usr/lib -type f -name \*.so* ! -name \*dbg \
#    -exec strip --strip-unneeded {} ';'
# 
# find /{bin,sbin} /usr/{bin,sbin,libexec} -type f \
#     -exec strip --strip-all {} ';'
# 


# 
#                          A large number of files will be reported as having their file format not recognized.
#                        These warnings can be safely ignored. These warnings indicate that those files are
#                        scripts instead of binaries.  


cd /sources
cd "/sources$(find -maxdepth 1 -type d -name '-*' | cut -c 2-)"

read -p "Chapter 8.78"

#        8.78. Cleaning Up  
# 
#                          Finally, clean up some extra files left around from running tests: 



rm -rf /tmp/*



# 
#                          Now log out and reenter the chroot environment with an updated chroot command. From
#                        now on, use this updated chroot command any time you need to reenter the chroot
#                        environment after exiting: 



logout

chroot "$LFS" /usr/bin/env -i          \
    HOME=/root TERM="$TERM"            \
    PS1='(lfs chroot) \u:\w\$ '        \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash --login



# 
#                          Here the +hoption is not used anymore, since all the previous programs have been
#                        replaced: hashing is therefore possible.  
# 
#                          If the virtual kernel file systems have been unmounted, either manually or through
#                        a reboot, ensure that the virtual kernel file systems are mounted when reentering
#                        the chroot. This process was explained in Section 7.3.2, "Mounting and Populating
#                        /dev"and Section 7.3.3, "Mounting Virtual Kernel File Systems".  
# 
#                          There are also several files installed in the /usr/lib and /usr/libexec directories
#                        with a file name extension of .la. These are "libtool archive" files. As already
#                        said, they are only useful when linking with static libraries. They are unneeded,
#                        and potentially harmful, when using dynamic shared libraries, specially when using
#                        also non-autotools build systems. To remove them, run: 



find /usr/lib /usr/libexec -name \*.la -delete



# 
#                          For more information about libtool archive files, see the BLFS section "About Libtool
#                        Archive (.la) files".  
# 
#                          The compiler built in Chapter 6and Chapter 7is still partially installed and not
#                        needed anymore. Remove it with:  



find /usr -depth -name $(uname -m)-lfs-linux-gnu\* | xargs rm -rf



# 
#                          The /toolsdirectory can also be removed to further gain some space: 



rm -rf /tools



# 
#                          Finally, remove the temporary 'tester' user account created at the beginning of
#                        the previous chapter. 



userdel -r tester



#        Chapter 9. System Configuration  
#        9.1. Introduction  
# 
#                          Booting a Linux system involves several tasks. The process must mount both virtual
#                        and real file systems, initialize devices, activate swap, check file systems for
#                        integrity, mount any swap partitions or files, set the system clock, bring up networking,
#                        start any daemons required by the system, and accomplish any other custom tasks
#                        needed by the user. This process must be organized to ensure the tasks are performed
#                        in the correct order but, at the same time, be executed as fast as possible. 
#          9.1.1. System V  
# 
#                          System V is the classic boot process that has been used in Unix and Unix-like systems
#                        such as Linux since about 1983. It consists of a small program, init , that sets
#                        up basic programs such as  login (via getty) and runs a script. This script, usually
#                        named  rc , controls the execution of a set of additional scripts that perform the
#                        tasks required to initialize the system. 
# 
#                          The  init program is controlled by the /etc/inittabfile and is organized into run
#                        levels that can be run by the user: 
# 
#                          0 ; halt1 ; Single user mode2 ; Multiuser, without networking3 ; Full multiuser
#                        mode4 ; User definable5 ; Full multiuser mode with display manager6 ; reboot 
# 
#                          The usual default run level is 3 or 5.  
#            Advantages  
# 
#                          Established, well understood system. 
# 
#                          Easy to customize. 
#            Disadvantages  
# 
#                          May be slower to boot. A medium speed base LFS system takes 8-12 seconds where the
#                        boot time is measured from the first kernel message to the login prompt. Network
#                        connectivity is typically established about 2 seconds after the login prompt. 
# 
#                          Serial processing of boot tasks. This is related to the previous point. A delay
#                        in any process such as a file system check, will delay the entire boot process.
#                        
# 
#                          Does not directly support advanced features like control groups (cgroups), and per-user
#                        fair share scheduling. 
# 
#                          Adding scripts requires manual, static sequencing decisions. 
#        9.2. LFS-Bootscripts-20210201  
# 
#                          The LFS-Bootscripts package contains a set of scripts to start/stop the LFS system
#                        at bootup/shutdown. The configuration files and procedures needed to customize the
#                        boot process are described in the following sections. 
#           Approximate build time: less than 0.1 SBU
#           Required disk space: 244 KB
#          9.2.1. Installation of LFS-Bootscripts 
# 
#                          Install the package: 



# make install
# 

 
#          9.2.2. Contents of LFS-Bootscripts  
#           Installed scripts: checkfs, cleanfs, console, functions, halt, ifdown, ifup, localnet, modules, mountfs, mountvirtfs, network, rc, reboot, sendsignals, setclock, ipv4-static, swap, sysctl, sysklogd, template, udev, and udev_retry
#           Installed directories: /etc/rc.d, /etc/init.d (symbolic link), /etc/sysconfig, /lib/services, /lib/lsb (symbolic link) 
#            Short Descriptions   
# 
#                          
# 
#                checkfs   
# 
#                          Checks the integrity of the file systems before they are mounted (with the exception
#                        of journal and network based file systems)  
# 
#                          cleanfs   
# 
#                          Removes files that should not be preserved between reboots, such as those in /run/and
#                        /var/lock/; it re-creates /run/utmpand removes the possibly present /etc/nologin,
#                        /fastboot, and /forcefsckfiles  
# 
#                          console   
# 
#                          Loads the correct keymap table for the desired keyboard layout; it also sets the
#                        screen font  
# 
#                          functions   
# 
#                          Contains common functions, such as error and status checking, that are used by several
#                        bootscripts  
# 
#                          halt   
# 
#                          Halts the system  
# 
#                          ifdown   
# 
#                          Stops a network device  
# 
#                          ifup   
# 
#                          Initializes a network device  
# 
#                          localnet   
# 
#                          Sets up the system's hostname and local loopback device  
# 
#                          modules   
# 
#                          Loads kernel modules listed in /etc/sysconfig/modules, using arguments that are
#                        also given there  
# 
#                          mountfs   
# 
#                          Mounts all file systems, except ones that are marked noauto or are network based
#                          
# 
#                          mountvirtfs   
# 
#                          Mounts virtual kernel file systems, such as proc 
# 
#                          network   
# 
#                          Sets up network interfaces, such as network cards, and sets up the default gateway
#                        (where applicable)  
# 
#                          rc   
# 
#                          The master run-level control script; it is responsible for running all the other
#                        bootscripts one-by-one, in a sequence determined by the name of the symbolic links
#                        being processed  
# 
#                          reboot   
# 
#                          Reboots the system  
# 
#                          sendsignals   
# 
#                          Makes sure every process is terminated before the system reboots or halts  
# 
#                          setclock   
# 
#                          Resets the kernel clock to local time in case the hardware clock is not set to UTC
#                        time  
# 
#                          ipv4-static   
# 
#                          Provides the functionality needed to assign a static Internet Protocol (IP) address
#                        to a network interface  
# 
#                          swap   
# 
#                          Enables and disables swap files and partitions  
# 
#                          sysctl   
# 
#                          Loads system configuration values from /etc/sysctl.conf, if that file exists, into
#                        the running kernel  
# 
#                          sysklogd   
# 
#                          Starts and stops the system and kernel log daemons  
# 
#                          template   
# 
#                          A template to create custom bootscripts for other daemons  
# 
#                          udev   
# 
#                          Prepares the /devdirectory and starts Udev  
# 
#                          udev_retry   
# 
#                          Retries failed udev uevents, and copies generated rules files from /run/udevto /etc/udev/rules.dif
#                        required 
#        9.3. Overview of Device and Module Handling  
# 
#                          In Chapter 8, we installed the udev package when eudevwas built. Before we go into
#                        the details regarding how this works, a brief history of previous methods of handling
#                        devices is in order.  
# 
#                          Linux systems in general traditionally used a static device creation method, whereby
#                        a great many device nodes were created under /dev(sometimes literally thousands
#                        of nodes), regardless of whether the corresponding hardware devices actually existed.
#                        This was typically done via a  MAKEDEV script, which contains a number of calls to
#                        the  mknod program with the relevant major and minor device numbers for every possible
#                        device that might exist in the world. 
# 
#                          Using the udev method, only those devices which are detected by the kernel get device
#                        nodes created for them. Because these device nodes will be created each time the
#                        system boots, they will be stored on a devtmpfsfile system (a virtual file system
#                        that resides entirely in system memory). Device nodes do not require much space,
#                        so the memory that is used is negligible. 
#          9.3.1. History 
# 
#                          In February 2000, a new filesystem called devfswas merged into the 2.3.46 kernel
#                        and was made available during the 2.4 series of stable kernels. Although it was
#                        present in the kernel source itself, this method of creating devices dynamically
#                        never received overwhelming support from the core kernel developers. 
# 
#                          The main problem with the approach adopted by devfswas the way it handled device
#                        detection, creation, and naming. The latter issue, that of device node naming, was
#                        perhaps the most critical. It is generally accepted that if device names are allowed
#                        to be configurable, then the device naming policy should be up to a system administrator,
#                        not imposed on them by any particular developer(s). The devfsfile system also suffered
#                        from race conditions that were inherent in its design and could not be fixed without
#                        a substantial revision to the kernel. It was marked as deprecated for a long period
#                        - due to a lack of maintenance - and was finally removed from the kernel in June,
#                        2006. 
# 
#                          With the development of the unstable 2.5 kernel tree, later released as the 2.6
#                        series of stable kernels, a new virtual filesystem called sysfscame to be. The job
#                        of sysfsis to export a view of the system's hardware configuration to userspace
#                        processes. With this userspace-visible representation, the possibility of developing
#                        a userspace replacement for devfsbecame much more realistic. 
#          9.3.2. Udev Implementation  
#            9.3.2.1. Sysfs  
# 
#                          The sysfsfilesystem was mentioned briefly above. One may wonder how sysfsknows about
#                        the devices present on a system and what device numbers should be used for them.
#                        Drivers that have been compiled into the kernel directly register their objects
#                        with a sysfs(devtmpfs internally) as they are detected by the kernel. For drivers
#                        compiled as modules, this registration will happen when the module is loaded. Once
#                        the sysfsfilesystem is mounted (on /sys), data which the drivers register with sysfsare
#                        available to userspace processes and to udevd for processing (including modifications
#                        to device nodes). 
#            9.3.2.2. Device Node Creation  
# 
#                          Device files are created by the kernel by the devtmpfsfilesystem. Any driver that
#                        wishes to register a device node will go through the devtmpfs(via the driver core)
#                        to do it. When a devtmpfsinstance is mounted on /dev, the device node will initially
#                        be created with a fixed name, permissions, and owner. 
# 
#                          A short time later, the kernel will send a uevent to udevd . Based on the rules specified
#                        in the files within the /etc/udev/rules.d, /lib/udev/rules.d, and /run/udev/rules.ddirectories,
#                         udevd will create additional symlinks to the device node, or change its permissions,
#                        owner, or group, or modify the internal  udevd database entry (name) for that object.
#                        
# 
#                          The rules in these three directories are numbered and all three directories are
#                        merged together. If  udevd can't find a rule for the device it is creating, it will
#                        leave the permissions and ownership at whatever devtmpfsused initially.  
#            9.3.2.3. Module Loading  
# 
#                          Device drivers compiled as modules may have aliases built into them. Aliases are
#                        visible in the output of the modinfo program and are usually related to the bus-specific
#                        identifiers of devices supported by a module. For example, the  snd-fm801 driver supports
#                        PCI devices with vendor ID 0x1319 and device ID 0x0801, and has an alias of "pci:v00001319d00000801sv*sd*bc04sc01i*".
#                        For most devices, the bus driver exports the alias of the driver that would handle
#                        the device via sysfs. E.g., the /sys/bus/pci/devices/0000:00:0d.0/modaliasfile might
#                        contain the string "pci:v00001319d00000801sv00001319sd00001319bc04sc01i00". The
#                        default rules provided with udev will cause  udevd to call out to  /sbin/modprobe with
#                        the contents of the MODALIASuevent environment variable (which should be the same
#                        as the contents of the modaliasfile in sysfs), thus loading all modules whose aliases
#                        match this string after wildcard expansion. 
# 
#                          In this example, this means that, in addition to  snd-fm801 , the obsolete (and unwanted)
#                         forte driver will be loaded if it is available. See below for ways in which the loading
#                        of unwanted drivers can be prevented. 
# 
#                          The kernel itself is also able to load modules for network protocols, filesystems,
#                        and NLS support on demand.  
#            9.3.2.4. Handling Hotpluggable/Dynamic Devices  
# 
#                          When you plug in a device, such as a Universal Serial Bus (USB) MP3 player, the
#                        kernel recognizes that the device is now connected and generates a uevent. This
#                        uevent is then handled by udevd as described above. 
#          9.3.3. Problems with Loading Modules and Creating Devices 
# 
#                          There are a few possible problems when it comes to automatically creating device
#                        nodes.  
#            9.3.3.1. A kernel module is not loaded automatically  
# 
#                          Udev will only load a module if it has a bus-specific alias and the bus driver properly
#                        exports the necessary aliases to sysfs. In other cases, one should arrange module
#                        loading by other means. With Linux-5.10.17, udev is known to load properly-written
#                        drivers for INPUT, IDE, PCI, USB, SCSI, SERIO, and FireWire devices. 
# 
#                          To determine if the device driver you require has the necessary support for udev,
#                        run modinfo with the module name as the argument. Now try locating the device directory
#                        under /sys/busand check whether there is a modaliasfile there. 
# 
#                          If the modaliasfile exists in sysfs, the driver supports the device and can talk
#                        to it directly, but doesn't have the alias, it is a bug in the driver. Load the
#                        driver without the help from udev and expect the issue to be fixed later. 
# 
#                          If there is no modaliasfile in the relevant directory under /sys/bus, this means
#                        that the kernel developers have not yet added modalias support to this bus type.
#                        With Linux-5.10.17, this is the case with ISA busses. Expect this issue to be fixed
#                        in later kernel versions. 
# 
#                          Udev is not intended to load "wrapper"drivers such as  snd-pcm-oss and non-hardware
#                        drivers such as  loop at all.  
#            9.3.3.2. A kernel module is not loaded automatically, and udev is not intended to load it  
# 
#                          If the "wrapper"module only enhances the functionality provided by some other module
#                        (e.g.,  snd-pcm-oss enhances the functionality of  snd-pcm by making the sound cards
#                        available to OSS applications), configure  modprobe to load the wrapper after udev
#                        loads the wrapped module. To do this, add a "softdep"line to the corresponding /etc/modprobe.d/ <filename>.conffile.
#                        For example:  



# softdep snd-pcm post: snd-pcm-oss
# 


# 
#                          Note that the "softdep"command also allows pre:dependencies, or a mixture of both
#                        pre:and post:dependencies. See the modprobe.d(5)manual page for more information
#                        on "softdep"syntax and capabilities. 
# 
#                          If the module in question is not a wrapper and is useful by itself, configure the
#                         modules bootscript to load this module on system boot. To do this, add the module
#                        name to the /etc/sysconfig/modulesfile on a separate line. This works for wrapper
#                        modules too, but is suboptimal in that case.  
#            9.3.3.3. Udev loads some unwanted module  
# 
#                          Either don't build the module, or blacklist it in a /etc/modprobe.d/blacklist.conffile
#                        as done with the forte module in the example below: 



# blacklist forte
# 


# 
#                          Blacklisted modules can still be loaded manually with the explicit  modprobe command.
#                         
#            9.3.3.4. Udev creates a device incorrectly, or makes a wrong symlink  
# 
#                          This usually happens if a rule unexpectedly matches a device. For example, a poorly-written
#                        rule can match both a SCSI disk (as desired) and the corresponding SCSI generic
#                        device (incorrectly) by vendor. Find the offending rule and make it more specific,
#                        with the help of the udevadm info command.  
#            9.3.3.5. Udev rule works unreliably  
# 
#                          This may be another manifestation of the previous problem. If not, and your rule
#                        uses sysfsattributes, it may be a kernel timing issue, to be fixed in later kernels.
#                        For now, you can work around it by creating a rule that waits for the used sysfsattribute
#                        and appending it to the /etc/udev/rules.d/10-wait_for_sysfs.rulesfile (create this
#                        file if it does not exist). Please notify the LFS Development list if you do so
#                        and it helps. 
#            9.3.3.6. Udev does not create a device  
# 
#                          Further text assumes that the driver is built statically into the kernel or already
#                        loaded as a module, and that you have already checked that udev doesn't create a
#                        misnamed device. 
# 
#                          Udev has no information needed to create a device node if a kernel driver does not
#                        export its data to sysfs. This is most common with third party drivers from outside
#                        the kernel tree. Create a static device node in /lib/udev/deviceswith the appropriate
#                        major/minor numbers (see the file devices.txtinside the kernel documentation or
#                        the documentation provided by the third party driver vendor). The static device
#                        node will be copied to /devby udev .  
#            9.3.3.7. Device naming order changes randomly after rebooting  
# 
#                          This is due to the fact that udev, by design, handles uevents and loads modules
#                        in parallel, and thus in an unpredictable order. This will never be "fixed". You
#                        should not rely upon the kernel device names being stable. Instead, create your
#                        own rules that make symlinks with stable names based on some stable attributes of
#                        the device, such as a serial number or the output of various *_id utilities installed
#                        by udev. See Section 9.4, "Managing Devices"and Section 9.5, "General Network Configuration"for
#                        examples.  
#          9.3.4. Useful Reading 
# 
#                          Additional helpful documentation is available at the following sites: 
# 
#                          A Userspace Implementation of devfs http://www.kroah.com/linux/talks/ols_2003_udev_paper/Reprint-Kroah-Hartman-OLS2003.pdf 
# 
#                          The sysfsFilesystem http://www.kernel.org/pub/linux/kernel/people/mochel/doc/papers/ols-2005/mochel.pdf 
#        9.4. Managing Devices  
#          9.4.1. Network Devices 
# 
#                          Udev, by default, names network devices according to Firmware/BIOS data or physical
#                        characteristics like the bus, slot, or MAC address. The purpose of this naming convention
#                        is to ensure that network devices are named consistently and not based on the time
#                        the network card was discovered. For example, on a computer having two network cards
#                        made by Intel and Realtek, the network card manufactured by Intel may become eth0
#                        and the Realtek card becomes eth1. In some cases, after a reboot the cards could
#                        get renumbered the other way around. 
# 
#                          In the new naming scheme, typical network device names would then be something like
#                        enp5s0 or wlp3s0. If this naming convention is not desired, the traditional naming
#                        scheme or a custom scheme can be implemented. 
#            9.4.1.1. Disabling Persistent Naming on the Kernel Command Line  
# 
#                          The traditional naming scheme using eth0, eth1, etc can be restored by adding net.ifnames=0on
#                        the kernel command line. This is most appropriate for those systems that have only
#                        one ethernet device of the same type. Laptops often have multiple ethernet connections
#                        that are named eth0 and wlan0 and are also candidates for this method. The command
#                        line is passed in the GRUB configuration file. See Section 10.4.4, "Creating the
#                        GRUB Configuration File".   
#            9.4.1.2. Creating Custom Udev Rules  
# 
#                          The naming scheme can be customized by creating custom udev rules. A script has
#                        been included that generates the initial rules. Generate these rules by running:
#                        



# bash /lib/udev/init-net-rules.sh
# 


# 
#                          Now, inspect the /etc/udev/rules.d/70-persistent-net.rulesfile, to find out which
#                        name was assigned to which network device: 



# cat /etc/udev/rules.d/70-persistent-net.rules
# 


#          Note 
# 
#                          In some cases such as when MAC addresses have been assigned to a network card manually
#                        or in a virtual environment such as Qemu or Xen, the network rules file may not
#                        have been generated because addresses are not consistently assigned. In these cases,
#                        this method cannot be used. 
# 
#                          The file begins with a comment block followed by two lines for each NIC. The first
#                        line for each NIC is a commented description showing its hardware IDs (e.g. its
#                        PCI vendor and device IDs, if it's a PCI card), along with its driver in parentheses,
#                        if the driver can be found. Neither the hardware ID nor the driver is used to determine
#                        which name to give an interface; this information is only for reference. The second
#                        line is the udev rule that matches this NIC and actually assigns it a name. 
# 
#                          All udev rules are made up of several keys, separated by commas and optional whitespace.
#                        This rule's keys and an explanation of each of them are as follows: 
# 
#                          SUBSYSTEM=="net"- This tells udev to ignore devices that are not network cards.
#                        
# 
#                          ACTION=="add"- This tells udev to ignore this rule for a uevent that isn't an add
#                        ("remove" and "change" uevents also happen, but don't need to rename network interfaces).
#                        
# 
#                          DRIVERS=="?*"- This exists so that udev will ignore VLAN or bridge sub-interfaces
#                        (because these sub-interfaces do not have drivers). These sub-interfaces are skipped
#                        because the name that would be assigned would collide with their parent devices.
#                        
# 
#                          ATTR{address}- The value of this key is the NIC's MAC address. 
# 
#                          ATTR{type}=="1"- This ensures the rule only matches the primary interface in the
#                        case of certain wireless drivers which create multiple virtual interfaces. The secondary
#                        interfaces are skipped for the same reason that VLAN and bridge sub-interfaces are
#                        skipped: there would be a name collision otherwise. 
# 
#                          NAME- The value of this key is the name that udev will assign to this interface.
#                        
# 
#                          The value of NAMEis the important part. Make sure you know which name has been assigned
#                        to each of your network cards before proceeding, and be sure to use that NAMEvalue
#                        when creating your configuration files below. 
#          9.4.2. CD-ROM symlinks 
# 
#                          Some software that you may want to install later (e.g., various media players) expect
#                        the /dev/cdromand /dev/dvdsymlinks to exist, and to point to a CD-ROM or DVD-ROM
#                        device. Also, it may be convenient to put references to those symlinks into /etc/fstab.
#                        Udev comes with a script that will generate rules files to create these symlinks
#                        for you, depending on the capabilities of each device, but you need to decide which
#                        of two modes of operation you wish to have the script use. 
# 
#                          First, the script can operate in "by-path"mode (used by default for USB and FireWire
#                        devices), where the rules it creates depend on the physical path to the CD or DVD
#                        device. Second, it can operate in "by-id"mode (default for IDE and SCSI devices),
#                        where the rules it creates depend on identification strings stored on the CD or
#                        DVD device itself. The path is determined by udev's  path_id script, and the identification
#                        strings are read from the hardware by its  ata_id or  scsi_id programs, depending on
#                        which type of device you have. 
# 
#                          There are advantages to each approach; the correct approach to use will depend on
#                        what kinds of device changes may happen. If you expect the physical path to the
#                        device (that is, the ports and/or slots that it plugs into) to change, for example
#                        because you plan on moving the drive to a different IDE port or a different USB
#                        connector, then you should use the "by-id"mode. On the other hand, if you expect
#                        the device's identification to change, for example because it may die, and you would
#                        replace it with a different device with the same capabilities and which is plugged
#                        into the same connectors, then you should use the "by-path"mode. 
# 
#                          If either type of change is possible with your drive, then choose a mode based on
#                        the type of change you expect to happen more often. 
#          Important 
# 
#                          External devices (for example, a USB-connected CD drive) should not use by-path
#                        persistence, because each time the device is plugged into a new external port, its
#                        physical path will change. All externally-connected devices will have this problem
#                        if you write udev rules to recognize them by their physical path; the problem is
#                        not limited to CD and DVD drives. 
# 
#                          If you wish to see the values that the udev scripts will use, then for the appropriate
#                        CD-ROM device, find the corresponding directory under /sys(e.g., this can be /sys/block/hdd)
#                        and run a command similar to the following: 



# udevadm test /sys/block/hdd
# 


# 
#                          Look at the lines containing the output of various *_id programs. The "by-id"mode
#                        will use the ID_SERIAL value if it exists and is not empty, otherwise it will use
#                        a combination of ID_MODEL and ID_REVISION. The "by-path"mode will use the ID_PATH
#                        value. 
# 
#                          If the default mode is not suitable for your situation, then the following modification
#                        can be made to the /etc/udev/rules.d/83-cdrom-symlinks.rulesfile, as follows (where
#                         modeis one of "by-id"or "by-path"):  



# sed -e 's/"write_cd_rules"/"write_cd_rules mode"/' \
#     -i /etc/udev/rules.d/83-cdrom-symlinks.rules
# 

 
# 
#                          Note that it is not necessary to create the rules files or symlinks at this time
#                        because you have bind-mounted the host's /devdirectory into the LFS system and we
#                        assume the symlinks exist on the host. The rules and symlinks will be created the
#                        first time you boot your LFS system. 
# 
#                          However, if you have multiple CD-ROM devices, then the symlinks generated at that
#                        time may point to different devices than they point to on your host because devices
#                        are not discovered in a predictable order. The assignments created when you first
#                        boot the LFS system will be stable, so this is only an issue if you need the symlinks
#                        on both systems to point to the same device. If you need that, then inspect (and
#                        possibly edit) the generated /etc/udev/rules.d/70-persistent-cd.rulesfile after
#                        booting, to make sure the assigned symlinks match what you need. 
#          9.4.3. Dealing with duplicate devices 
# 
#                          As explained in Section 9.3, "Overview of Device and Module Handling", the order
#                        in which devices with the same function appear in /devis essentially random. E.g.,
#                        if you have a USB web camera and a TV tuner, sometimes /dev/video0refers to the
#                        camera and /dev/video1refers to the tuner, and sometimes after a reboot the order
#                        changes. For all classes of hardware except sound cards and network cards, this
#                        is fixable by creating udev rules for custom persistent symlinks. The case of network
#                        cards is covered separately in Section 9.5, "General Network Configuration", and
#                        sound card configuration can be found in BLFS.  
# 
#                          For each of your devices that is likely to have this problem (even if the problem
#                        doesn't exist in your current Linux distribution), find the corresponding directory
#                        under /sys/classor /sys/block. For video devices, this may be /sys/class/video4linux/video X .
#                        Figure out the attributes that identify the device uniquely (usually, vendor and
#                        product IDs and/or serial numbers work): 



# udevadm info -a -p /sys/class/video4linux/video0
# 


# 
#                          Then write rules that create the symlinks, e.g.: 



# cat > /etc/udev/rules.d/83-duplicate_devs.rules << "EOF"
# 
# # Persistent symlinks for webcam and tuner
# KERNEL=="video*", ATTRS{idProduct}=="1910", ATTRS{idVendor}=="0d81", SYMLINK+="webcam"
# KERNEL=="video*", ATTRS{device}=="0x036f",  ATTRS{vendor}=="0x109e", SYMLINK+="tvtuner"
# 
# EOF
# 


# 
#                          The result is that /dev/video0and /dev/video1devices still refer randomly to the
#                        tuner and the web camera (and thus should never be used directly), but there are
#                        symlinks /dev/tvtunerand /dev/webcamthat always point to the correct device. 
#        9.5. General Network Configuration  
#          9.5.1. Creating Network Interface Configuration Files 
# 
#                          Which interfaces are brought up and down by the network script usually depends on
#                        the files in /etc/sysconfig/. This directory should contain a file for each interface
#                        to be configured, such as ifconfig.xyz, where "xyz"should describe the network card.
#                        The interface name (e.g. eth0) is usually appropriate. Inside this file are attributes
#                        to this interface, such as its IP address(es), subnet masks, and so forth. It is
#                        necessary that the stem of the filename be  ifconfig . 
#          Note 
# 
#                          If the procedure in the previous section was not used, udev will assign network
#                        card interface names based on system physical characteristics such as enp2s1. If
#                        you are not sure what your interface name is, you can always run  ip link or  ls /sys/class/net after
#                        you have booted your system. 
# 
#                          The following command creates a sample file for the  eth0 device with a static IP
#                        address: 



# cd /etc/sysconfig/
# cat > ifconfig.eth0 << "EOF"
# ONBOOT=yes
# IFACE=eth0
# SERVICE=ipv4-static
# IP=192.168.1.2
# GATEWAY=192.168.1.1
# PREFIX=24
# BROADCAST=192.168.1.255
# EOF
# 

 
# 
#                          The values in italics must be changed in every file to match the proper setup. 
# 
#                          If the ONBOOTvariable is set to "yes"the System V network script will bring up the
#                        Network Interface Card (NIC) during the system boot process. If set to anything
#                        but "yes"the NIC will be ignored by the network script and not be automatically
#                        brought up. The interface can be manually started or stopped with the  ifup and  ifdown commands.
#                        
# 
#                          The IFACEvariable defines the interface name, for example, eth0. It is required
#                        for all network device configuration files. The filename extension must match this
#                        value. 
# 
#                          The SERVICEvariable defines the method used for obtaining the IP address. The LFS-Bootscripts
#                        package has a modular IP assignment format, and creating additional files in the
#                        /lib/services/directory allows other IP assignment methods. This is commonly used
#                        for Dynamic Host Configuration Protocol (DHCP), which is addressed in the BLFS book.
#                        
# 
#                          The GATEWAYvariable should contain the default gateway IP address, if one is present.
#                        If not, then comment out the variable entirely. 
# 
#                          The PREFIXvariable contains the number of bits used in the subnet. Each octet in
#                        an IP address is 8 bits. If the subnet's netmask is 255.255.255.0, then it is using
#                        the first three octets (24 bits) to specify the network number. If the netmask is
#                        255.255.255.240, it would be using the first 28 bits. Prefixes longer than 24 bits
#                        are commonly used by DSL and cable-based Internet Service Providers (ISPs). In this
#                        example (PREFIX=24), the netmask is 255.255.255.0. Adjust the PREFIXvariable according
#                        to your specific subnet. If omitted, the PREFIX defaults to 24. 
# 
#                          For more information see the  ifup man page.  
#          9.5.2. Creating the /etc/resolv.conf File  
# 
#                          The system will need some means of obtaining Domain Name Service (DNS) name resolution
#                        to resolve Internet domain names to IP addresses, and vice versa. This is best achieved
#                        by placing the IP address of the DNS server, available from the ISP or network administrator,
#                        into /etc/resolv.conf. Create the file by running the following: 



# cat > /etc/resolv.conf << "EOF"
# # Begin /etc/resolv.conf
# 
# domain <Your Domain Name>
# nameserver <IP address of your primary nameserver>
# nameserver <IP address of your secondary nameserver>
# 
# # End /etc/resolv.conf
# EOF
# 

 
# 
#                          The domainstatement can be omitted or replaced with a searchstatement. See the man
#                        page for resolv.conf for more details. 
# 
#                          Replace <IP address of the nameserver>with the IP address of the DNS most appropriate
#                        for the setup. There will often be more than one entry (requirements demand secondary
#                        servers for fallback capability). If you only need or want one DNS server, remove
#                        the second  nameserver line from the file. The IP address may also be a router on
#                        the local network. 
#          Note 
# 
#                          The Google Public IPv4 DNS addresses are 8.8.8.8 and 8.8.4.4.  
#          9.5.3. Configuring the system hostname  
# 
#                          During the boot process, the file /etc/hostnameis used for establishing the system's
#                        hostname. 
# 
#                          Create the /etc/hostnamefile and enter a hostname by running: 



# echo "<lfs>" > /etc/hostname
# 

 
# 
#                          <lfs>needs to be replaced with the name given to the computer. Do not enter the
#                        Fully Qualified Domain Name (FQDN) here. That information is put in the /etc/hostsfile.
#                         
#          9.5.4. Customizing the /etc/hosts File  
# 
#                          Decide on the IP address, fully-qualified domain name (FQDN), and possible aliases
#                        for use in the /etc/hostsfile. The syntax is: 



# IP_address myhost.example.org aliases
# 


# 
#                          Unless the computer is to be visible to the Internet (i.e., there is a registered
#                        domain and a valid block of assigned IP addresses;most users do not have this),
#                        make sure that the IP address is in the private network IP address range. Valid
#                        ranges are: 



# Private Network Address Range      Normal Prefix
# 10.0.0.1 - 10.255.255.254           8
# 172.x.0.1 - 172.x.255.254           16
# 192.168.y.1 - 192.168.y.254         24
# 


# 
#                          x can be any number in the range 16-31. y can be any number in the range 0-255.
#                        
# 
#                          A valid private IP address could be 192.168.1.1. A valid FQDN for this IP could
#                        be lfs.example.org. 
# 
#                          Even if not using a network card, a valid FQDN is still required. This is necessary
#                        for certain programs to operate correctly. 
# 
#                          Create the /etc/hostsfile by running: 



# cat > /etc/hosts << "EOF"
# # Begin /etc/hosts
# 
# 127.0.0.1 localhost.localdomain localhost
# 127.0.1.1 <FQDN> <HOSTNAME>
# <192.168.1.1> <FQDN> <HOSTNAME> [alias1] [alias2 ...]
# ::1       localhost ip6-localhost ip6-loopback
# ff02::1   ip6-allnodes
# ff02::2   ip6-allrouters
# 
# # End /etc/hosts
# EOF
# 

 
# 
#                          The <192.168.1.1>,  <FQDN>, and  <HOSTNAME>values need to be changed for specific
#                        uses or requirements (if assigned an IP address by a network/system administrator
#                        and the machine will be connected to an existing network). The optional alias name(s)
#                        can be omitted.  
#        9.6. System V Bootscript Usage and Configuration  
#          9.6.1. How Do the System V Bootscripts Work? 
# 
#                          Linux uses a special booting facility named SysVinit that is based on a concept
#                        of run-levels . It can be quite different from one system to another, so it cannot
#                        be assumed that because things worked in one particular Linux distribution, they
#                        should work the same in LFS too. LFS has its own way of doing things, but it respects
#                        generally accepted standards. 
# 
#                          SysVinit (which will be referred to as "init"from now on) works using a run-levels
#                        scheme. There are seven (numbered 0 to 6) run-levels (actually, there are more run-levels,
#                        but they are for special cases and are generally not used. See init(8)for more details),
#                        and each one of those corresponds to the actions the computer is supposed to perform
#                        when it starts up. The default run-level is 3. Here are the descriptions of the
#                        different run-levels as they are implemented: 
# 
#                          0: halt the computer1: single-user mode2: multi-user mode without networking3: multi-user
#                        mode with networking4: reserved for customization, otherwise does the same as 35:
#                        same as 4, it is usually used for GUI login (like X's  xdm  or KDE's  kdm )6: reboot
#                        the computer  
#          9.6.2. Configuring Sysvinit  
# 
#                          During the kernel initialization, the first program that is run is either specified
#                        on the command line or, by default init . This program reads the initialization file
#                        /etc/inittab. Create this file with: 



# cat > /etc/inittab << "EOF"
# # Begin /etc/inittab
# 
# id:3:initdefault:
# 
# si::sysinit:/etc/rc.d/init.d/rc S
# 
# l0:0:wait:/etc/rc.d/init.d/rc 0
# l1:S1:wait:/etc/rc.d/init.d/rc 1
# l2:2:wait:/etc/rc.d/init.d/rc 2
# l3:3:wait:/etc/rc.d/init.d/rc 3
# l4:4:wait:/etc/rc.d/init.d/rc 4
# l5:5:wait:/etc/rc.d/init.d/rc 5
# l6:6:wait:/etc/rc.d/init.d/rc 6
# 
# ca:12345:ctrlaltdel:/sbin/shutdown -t1 -a -r now
# 
# su:S016:once:/sbin/sulogin
# 
# 1:2345:respawn:/sbin/agetty --noclear tty1 9600
# 2:2345:respawn:/sbin/agetty tty2 9600
# 3:2345:respawn:/sbin/agetty tty3 9600
# 4:2345:respawn:/sbin/agetty tty4 9600
# 5:2345:respawn:/sbin/agetty tty5 9600
# 6:2345:respawn:/sbin/agetty tty6 9600
# 
# # End /etc/inittab
# EOF
# 


# 
#                          An explanation of this initialization file is in the man page for  inittab . For LFS,
#                        the key command that is run is  rc . The initialization file above will instruct  rc to
#                        run all the scripts starting with an S in the /etc/rc.d/rcS.ddirectory followed
#                        by all the scripts starting with an S in the /etc/rc.d/rc?.ddirectory where the
#                        question mark is specified by the initdefault value. 
# 
#                          As a convenience, the  rc script reads a library of functions in /lib/lsb/init-functions.
#                        This library also reads an optional configuration file, /etc/sysconfig/rc.site.
#                        Any of the system configuration file parameters described in subsequent sections
#                        can be alternatively placed in this file allowing consolidation of all system parameters
#                        in this one file. 
# 
#                          As a debugging convenience, the functions script also logs all output to /run/var/bootlog.
#                        Since the /rundirectory is a tmpfs, this file is not persistent across boots, however
#                        it is appended to the more permanent file /var/log/boot.logat the end of the boot
#                        process.  
#            9.6.2.1. Changing Run Levels  
# 
#                          Changing run-levels is done with init <runlevel>  , where  <runlevel>is the target
#                        run-level. For example, to reboot the computer, a user could issue the  init 6 command,
#                        which is an alias for the  reboot command. Likewise,  init 0 is an alias for the  halt command.
#                        
# 
#                          There are a number of directories under /etc/rc.dthat look like rc?.d(where ? is
#                        the number of the run-level) and rcsysinit.d, all containing a number of symbolic
#                        links. Some begin with a  K , the others begin with an  S , and all of them have two
#                        numbers following the initial letter. The K means to stop (kill) a service and the
#                        S means to start a service. The numbers determine the order in which the scripts
#                        are run, from 00 to 99;the lower the number the earlier it gets executed. When  init switches
#                        to another run-level, the appropriate services are either started or stopped, depending
#                        on the runlevel chosen. 
# 
#                          The real scripts are in /etc/rc.d/init.d. They do the actual work, and the symlinks
#                        all point to them. K links and S links point to the same script in /etc/rc.d/init.d.
#                        This is because the scripts can be called with different parameters like  start,
#                         stop,  restart,  reload, and  status. When a K link is encountered, the appropriate
#                        script is run with the  stopargument. When an S link is encountered, the appropriate
#                        script is run with the  startargument.  
# 
#                          There is one exception to this explanation. Links that start with an S in the rc0.dand
#                        rc6.ddirectories will not cause anything to be started. They will be called with
#                        the parameter  stopto stop something. The logic behind this is that when a user is
#                        going to reboot or halt the system, nothing needs to be started. The system only
#                        needs to be stopped.  
# 
#                          These are descriptions of what the arguments make the scripts do: 
# 
#                start 
# 
#                          The service is started. 
# 
#                stop 
# 
#                          The service is stopped. 
# 
#                restart 
# 
#                          The service is stopped and then started again. 
# 
#                reload 
# 
#                          The configuration of the service is updated. This is used after the configuration
#                        file of a service was modified, when the service does not need to be restarted.
#                        
# 
#                status 
# 
#                          Tells if the service is running and with which PIDs. 
# 
#                          Feel free to modify the way the boot process works (after all, it is your own LFS
#                        system). The files given here are an example of how it can be done. 
#          9.6.3. Udev Bootscripts 
# 
#                          The /etc/rc.d/init.d/udevinitscript starts  udevd , triggers any "coldplug" devices
#                        that have already been created by the kernel and waits for any rules to complete.
#                        The script also unsets the uevent handler from the default of /sbin/hotplug. This
#                        is done because the kernel no longer needs to call out to an external binary. Instead
#                         udevd will listen on a netlink socket for uevents that the kernel raises. 
# 
#                          The  /etc/rc.d/init.d/udev_retry initscript takes care of re-triggering events for
#                        subsystems whose rules may rely on filesystems that are not mounted until the  mountfs script
#                        is run (in particular, /usrand /varmay cause this). This script runs after the  mountfs script,
#                        so those rules (if re-triggered) should succeed the second time around. It is configured
#                        from the /etc/sysconfig/udev_retryfile; any words in this file other than comments
#                        are considered subsystem names to trigger at retry time. To find the subsystem of
#                        a device, use  udevadm info --attribute-walk <device> where <device> is an absolute
#                        path in /dev or /sys such as /dev/sr0 or /sys/class/rtc. 
# 
#                          For information on kernel module loading and udev, see Section 9.3.2.3, "Module
#                        Loading".   
#          9.6.4. Configuring the System Clock  
# 
#                          The setclock script reads the time from the hardware clock, also known as the BIOS
#                        or the Complementary Metal Oxide Semiconductor (CMOS) clock. If the hardware clock
#                        is set to UTC, this script will convert the hardware clock's time to the local time
#                        using the /etc/localtimefile (which tells the  hwclock program which timezone to use).
#                        There is no way to detect whether or not the hardware clock is set to UTC, so this
#                        needs to be configured manually. 
# 
#                          The  setclock program is run via udevwhen the kernel detects the hardware capability
#                        upon boot. It can also be run manually with the stop parameter to store the system
#                        time to the CMOS clock. 
# 
#                          If you cannot remember whether or not the hardware clock is set to UTC, find out
#                        by running the  hwclock --localtime --showcommand. This will display what the current
#                        time is according to the hardware clock. If this time matches whatever your watch
#                        says, then the hardware clock is set to local time. If the output from  hwclock is
#                        not local time, chances are it is set to UTC time. Verify this by adding or subtracting
#                        the proper amount of hours for the timezone to the time shown by  hwclock . For example,
#                        if you are currently in the MST timezone, which is also known as GMT -0700, add
#                        seven hours to the local time. 
# 
#                          Change the value of the UTCvariable below to a value of  0(zero) if the hardware
#                        clock is  NOT set to UTC time. 
# 
#                          Create a new file /etc/sysconfig/clockby running the following: 



# cat > /etc/sysconfig/clock << "EOF"
# # Begin /etc/sysconfig/clock
# 
# UTC=1
# 
# # Set this to any options you might need to give to hwclock,
# # such as machine hardware clock type for Alphas.
# CLOCKPARAMS=
# 
# # End /etc/sysconfig/clock
# EOF
# 


# 
#                          A good hint explaining how to deal with time on LFS is available at http://www.linuxfromscratch.org/hints/downloads/files/time.txt.
#                        It explains issues such as time zones, UTC, and the TZenvironment variable.  
#          Note 
# 
#                          The CLOCKPARAMS and UTC paramaters may also be set in the /etc/sysconfig/rc.sitefile.
#                         
#          9.6.5. Configuring the Linux Console  
# 
#                          This section discusses how to configure the console bootscript that sets up the keyboard
#                        map, console font, and console kernel log level. If non-ASCII characters (e.g.,
#                        the copyright sign, the British pound sign and Euro symbol) will not be used and
#                        the keyboard is a U.S. one, much of this section can be skipped. Without the configuration
#                        file, (or equivalent settings in rc.site), the  console bootscript will do nothing.
#                        
# 
#                          The  console script reads the /etc/sysconfig/consolefile for configuration information.
#                        Decide which keymap and screen font will be used. Various language-specific HOWTOs
#                        can also help with this, see http://www.tldp.org/HOWTO/HOWTO-INDEX/other-lang.html.
#                        If still in doubt, look in the /usr/share/keymapsand /usr/share/consolefontsdirectories
#                        for valid keymaps and screen fonts. Read loadkeys(1)and setfont(8)manual pages to
#                        determine the correct arguments for these programs.  
# 
#                          The /etc/sysconfig/consolefile should contain lines of the form: VARIABLE="value".
#                        The following variables are recognized: 
# 
#                LOGLEVEL
# 
#                          This variable specifies the log level for kernel messages sent to the console as
#                        set by  dmesg -n . Valid levels are from "1" (no messages) to "8". The default level
#                        is "7". 
# 
#                KEYMAP
# 
#                          This variable specifies the arguments for the  loadkeys program, typically, the name
#                        of keymap to load, e.g., "it". If this variable is not set, the bootscript will
#                        not run the  loadkeys program, and the default kernel keymap will be used. Note that
#                        a few keymaps have multiple versions with the same name (cz and its variants in
#                        qwerty/ and qwertz/, es in olpc/ and qwerty/, and trf in fgGIod/ and qwerty/). In
#                        these cases the parent directory should also be specified (e.g. qwerty/es) to ensure
#                        the proper keymap is loaded. 
# 
#                KEYMAP_CORRECTIONS
# 
#                          This (rarely used) variable specifies the arguments for the second call to the  loadkeys program.
#                        This is useful if the stock keymap is not completely satisfactory and a small adjustment
#                        has to be made. E.g., to include the Euro sign into a keymap that normally doesn't
#                        have it, set this variable to "euro2". 
# 
#                FONT
# 
#                          This variable specifies the arguments for the  setfont program. Typically, this includes
#                        the font name, "-m", and the name of the application character map to load. E.g.,
#                        in order to load the "lat1-16"font together with the "8859-1"application character
#                        map (as it is appropriate in the USA), set this variable to "lat1-16 -m 8859-1".
#                        In UTF-8 mode, the kernel uses the application character map for conversion of composed
#                        8-bit key codes in the keymap to UTF-8, and thus the argument of the "-m" parameter
#                        should be set to the encoding of the composed key codes in the keymap. 
# 
#                UNICODE
# 
#                          Set this variable to "1", "yes"or "true"in order to put the console into UTF-8 mode.
#                        This is useful in UTF-8 based locales and harmful otherwise. 
# 
#                LEGACY_CHARSET
# 
#                          For many keyboard layouts, there is no stock Unicode keymap in the Kbd package.
#                        The  console bootscript will convert an available keymap to UTF-8 on the fly if this
#                        variable is set to the encoding of the available non-UTF-8 keymap. 
# 
#                          Some examples: 
# 
#                          For a non-Unicode setup, only the KEYMAP and FONT variables are generally needed.
#                        E.g., for a Polish setup, one would use: 



# cat > /etc/sysconfig/console << "EOF"
# # Begin /etc/sysconfig/console
# 
# KEYMAP="pl2"
# FONT="lat2a-16 -m 8859-2"
# 
# # End /etc/sysconfig/console
# EOF
# 


# 
#                          As mentioned above, it is sometimes necessary to adjust a stock keymap slightly.
#                        The following example adds the Euro symbol to the German keymap: 



# cat > /etc/sysconfig/console << "EOF"
# # Begin /etc/sysconfig/console
# 
# KEYMAP="de-latin1"
# KEYMAP_CORRECTIONS="euro2"
# FONT="lat0-16 -m 8859-15"
# UNICODE="1"
# 
# # End /etc/sysconfig/console
# EOF
# 


# 
#                          The following is a Unicode-enabled example for Bulgarian, where a stock UTF-8 keymap
#                        exists: 



# cat > /etc/sysconfig/console << "EOF"
# # Begin /etc/sysconfig/console
# 
# UNICODE="1"
# KEYMAP="bg_bds-utf8"
# FONT="LatArCyrHeb-16"
# 
# # End /etc/sysconfig/console
# EOF
# 


# 
#                          Due to the use of a 512-glyph LatArCyrHeb-16 font in the previous example, bright
#                        colors are no longer available on the Linux console unless a framebuffer is used.
#                        If one wants to have bright colors without a framebuffer and can live without characters
#                        not belonging to his language, it is still possible to use a language-specific 256-glyph
#                        font, as illustrated below: 



# cat > /etc/sysconfig/console << "EOF"
# # Begin /etc/sysconfig/console
# 
# UNICODE="1"
# KEYMAP="bg_bds-utf8"
# FONT="cyr-sun16"
# 
# # End /etc/sysconfig/console
# EOF
# 


# 
#                          The following example illustrates keymap autoconversion from ISO-8859-15 to UTF-8
#                        and enabling dead keys in Unicode mode: 



# cat > /etc/sysconfig/console << "EOF"
# # Begin /etc/sysconfig/console
# 
# UNICODE="1"
# KEYMAP="de-latin1"
# KEYMAP_CORRECTIONS="euro2"
# LEGACY_CHARSET="iso-8859-15"
# FONT="LatArCyrHeb-16 -m 8859-15"
# 
# # End /etc/sysconfig/console
# EOF
# 


# 
#                          Some keymaps have dead keys (i.e., keys that don't produce a character by themselves,
#                        but put an accent on the character produced by the next key) or define composition
#                        rules (such as: "press Ctrl+. A E to get Æ"in the default keymap). Linux-5.10.17
#                        interprets dead keys and composition rules in the keymap correctly only when the
#                        source characters to be composed together are not multibyte. This deficiency doesn't
#                        affect keymaps for European languages, because there accents are added to unaccented
#                        ASCII characters, or two ASCII characters are composed together. However, in UTF-8
#                        mode it is a problem; e.g., for the Greek language, where one sometimes needs to
#                        put an accent on the letter "alpha". The solution is either to avoid the use of
#                        UTF-8, or to install the X window system that doesn't have this limitation in its
#                        input handling. 
# 
#                          For Chinese, Japanese, Korean, and some other languages, the Linux console cannot
#                        be configured to display the needed characters. Users who need such languages should
#                        install the X Window System, fonts that cover the necessary character ranges, and
#                        the proper input method (e.g., SCIM, supports a wide variety of languages). 
#          Note 
# 
#                          The /etc/sysconfig/consolefile only controls the Linux text console localization.
#                        It has nothing to do with setting the proper keyboard layout and terminal fonts
#                        in the X Window System, with ssh sessions, or with a serial console. In such situations,
#                        limitations mentioned in the last two list items above do not apply.  
#          9.6.6. Creating Files at Boot  
# 
#                          At times, it is desirable to create files at boot time. For instance, the /tmp/.ICE-unixdirectory
#                        is often needed. This can be done by creating an entry in the /etc/sysconfig/createfilesconfiguration
#                        script. The format of this file is embedded in the comments of the default configuration
#                        file. 
#          9.6.7. Configuring the sysklogd Script  
# 
#                          The sysklogdscript invokes the syslogd program as a part of System V initialization.
#                        The  -m 0option turns off the periodic timestamp mark that  syslogd writes to the log
#                        files every 20 minutes by default. If you want to turn on this periodic timestamp
#                        mark, edit /etc/sysconfig/rc.siteand define the variable SYSKLOGD_PARMS to the desired
#                        value. For instance, to remove all parameters, set the variable to a null value:
#                        



# SYSKLOGD_PARMS=
# 


# 
#                          See  man syslogdfor more options.  
#          9.6.8. The rc.site File  
# 
#                          The optional /etc/sysconfig/rc.sitefile contains settings that are automatically
#                        set for each SystemV boot script. It can alternatively set the values specified
#                        in the hostname, console, and clockfiles in the /etc/sysconfig/directory. If the
#                        associated variables are present in both these separate files and rc.site, the values
#                        in the script specific files have precedence. 
# 
#                          rc.sitealso contains parameters that can customize other aspects of the boot process.
#                        Setting the IPROMPT variable will enable selective running of bootscripts. Other
#                        options are described in the file comments. The default version of the file is as
#                        follows: 



# # rc.site
# # Optional parameters for boot scripts.
# 
# # Distro Information
# # These values, if specified here, override the defaults
# #DISTRO="Linux From Scratch" # The distro name
# #DISTRO_CONTACT="lfs-dev@linuxfromscratch.org" # Bug report address
# #DISTRO_MINI="LFS" # Short name used in filenames for distro config
# 
# # Define custom colors used in messages printed to the screen
# 
# # Please consult `man console_codes` for more information
# # under the "ECMA-48 Set Graphics Rendition" section
# #
# # Warning: when switching from a 8bit to a 9bit font,
# # the linux console will reinterpret the bold (1;) to
# # the top 256 glyphs of the 9bit font.  This does
# # not affect framebuffer consoles
# 
# # These values, if specified here, override the defaults
# #BRACKET="\\033[1;34m" # Blue
# #FAILURE="\\033[1;31m" # Red
# #INFO="\\033[1;36m"    # Cyan
# #NORMAL="\\033[0;39m"  # Grey
# #SUCCESS="\\033[1;32m" # Green
# #WARNING="\\033[1;33m" # Yellow
# 
# # Use a colored prefix
# # These values, if specified here, override the defaults
# #BMPREFIX="      "
# #SUCCESS_PREFIX="${SUCCESS}  *  ${NORMAL} "
# #FAILURE_PREFIX="${FAILURE}*****${NORMAL} "
# #WARNING_PREFIX="${WARNING} *** ${NORMAL} "
# 
# # Manually seet the right edge of message output (characters)
# # Useful when resetting console font during boot to override
# # automatic screen width detection
# #COLUMNS=120
# 
# # Interactive startup
# #IPROMPT="yes" # Whether to display the interactive boot prompt
# #itime="3"    # The amount of time (in seconds) to display the prompt
# 
# # The total length of the distro welcome string, without escape codes
# #wlen=$(echo "Welcome to ${DISTRO}" | wc -c )
# #welcome_message="Welcome to ${INFO}${DISTRO}${NORMAL}"
# 
# # The total length of the interactive string, without escape codes
# #ilen=$(echo "Press 'I' to enter interactive startup" | wc -c )
# #i_message="Press '${FAILURE}I${NORMAL}' to enter interactive startup"
# 
# # Set scripts to skip the file system check on reboot
# #FASTBOOT=yes
# 
# # Skip reading from the console
# #HEADLESS=yes
# 
# # Write out fsck progress if yes
# #VERBOSE_FSCK=no
# 
# # Speed up boot without waiting for settle in udev
# #OMIT_UDEV_SETTLE=y
# 
# # Speed up boot without waiting for settle in udev_retry
# #OMIT_UDEV_RETRY_SETTLE=yes
# 
# # Skip cleaning /tmp if yes
# #SKIPTMPCLEAN=no
# 
# # For setclock
# #UTC=1
# #CLOCKPARAMS=
# 
# # For consolelog (Note that the default, 7=debug, is noisy)
# #LOGLEVEL=7
# 
# # For network
# #HOSTNAME=mylfs
# 
# # Delay between TERM and KILL signals at shutdown
# #KILLDELAY=3
# 
# # Optional sysklogd parameters
# #SYSKLOGD_PARMS="-m 0"
# 
# # Console parameters
# #UNICODE=1
# #KEYMAP="de-latin1"
# #KEYMAP_CORRECTIONS="euro2"
# #FONT="lat0-16 -m 8859-15"
# #LEGACY_CHARSET=
# 
# 


#            9.6.8.1. Customizing the Boot and Shutdown Scripts  
# 
#                          The LFS boot scripts boot and shut down a system in a fairly efficient manner, but
#                        there are a few tweaks that you can make in the rc.site file to improve speed even
#                        more and to adjust messages according to your preferences. To do this, adjust the
#                        settings in the /etc/sysconfig/rc.sitefile above. 
# 
#                          During the boot script udev, there is a call to udev settle that requires some time
#                        to complete. This time may or may not be required depending on devices present in
#                        the system. If you only have simple partitions and a single ethernet card, the boot
#                        process will probably not need to wait for this command. To skip it, set the variable
#                        OMIT_UDEV_SETTLE=y. 
# 
#                          The boot script udev_retryalso runs  udev settle by default. This command is only
#                        needed by default if the /vardirectory is separately mounted. This is because the
#                        clock needs the file /var/lib/hwclock/adjtime. Other customizations may also need
#                        to wait for udev to complete, but in many installations it is not needed. Skip the
#                        command by setting the variable OMIT_UDEV_RETRY_SETTLE=y. 
# 
#                          By default, the file system checks are silent. This can appear to be a delay during
#                        the bootup process. To turn on the  fsck output, set the variable VERBOSE_FSCK=y.
#                        
# 
#                          When rebooting, you may want to skip the filesystem check,  fsck , completely. To
#                        do this, either create the file /fastbootor reboot the system with the command  /sbin/shutdown
#                        -f -r now . On the other hand, you can force all file systems to be checked by creating
#                        /forcefsckor running  shutdown with the  -Fparameter instead of  -f.  
# 
#                          Setting the variable FASTBOOT=y will disable fsck during the boot process until it
#                        is removed. This is not recommended on a permanent basis. 
# 
#                          Normally, all files in the /tmpdirectory are deleted at boot time. Depending on
#                        the number of files or directories present, this can cause a noticeable delay in
#                        the boot process. To skip removing these files set the variable SKIPTMPCLEAN=y.
#                        
# 
#                          During shutdown, the  init program sends a TERM signal to each program it has started
#                        (e.g. agetty), waits for a set time (default 3 seconds), and sends each process
#                        a KILL signal and waits again. This process is repeated in the  sendsignals script
#                        for any processes that are not shut down by their own scripts. The delay for  init can
#                        be set by passing a parameter. For example to remove the delay in  init , pass the
#                        -t0 parameter when shutting down or rebooting (e.g.  /sbin/shutdown -t0 -r now ).
#                        The delay for the  sendsignals script can be skipped by setting the parameter KILLDELAY=0.
#                         
#        9.7. The Bash Shell Startup Files  
# 
#                          The shell program /bin/bash (hereafter referred to as "the shell") uses a collection
#                        of startup files to help create an environment to run in. Each file has a specific
#                        use and may affect login and interactive environments differently. The files in
#                        the /etcdirectory provide global settings. If an equivalent file exists in the home
#                        directory, it may override the global settings. 
# 
#                          An interactive login shell is started after a successful login, using  /bin/login ,
#                        by reading the /etc/passwdfile. An interactive non-login shell is started at the
#                        command-line (e.g., [prompt]$ /bin/bash ). A non-interactive shell is usually present
#                        when a shell script is running. It is non-interactive because it is processing a
#                        script and not waiting for user input between commands. 
# 
#                          For more information, see  info bash under the  Bash Startup Files and Interactive
#                        Shells section. 
# 
#                          The files /etc/profileand ~/.bash_profileare read when the shell is invoked as an
#                        interactive login shell. 
# 
#                          The base /etc/profilebelow sets some environment variables necessary for native
#                        language support. Setting them properly results in: 
# 
#                          The output of programs translated into the native language 
# 
#                          Correct classification of characters into letters, digits and other classes. This
#                        is necessary for  bash to properly accept non-ASCII characters in command lines in
#                        non-English locales 
# 
#                          The correct alphabetical sorting order for the country 
# 
#                          Appropriate default paper size 
# 
#                          Correct formatting of monetary, time, and date values 
# 
#                          Replace  <ll>below with the two-letter code for the desired language (e.g., "en")
#                        and   <CC>with the two-letter code for the appropriate country (e.g., "GB").   <charmap>should
#                        be replaced with the canonical charmap for your chosen locale. Optional modifiers
#                        such as "@euro"may also be present.  
# 
#                          The list of all locales supported by Glibc can be obtained by running the following
#                        command: 



# locale -a
# 


# 
#                          Charmaps can have a number of aliases, e.g., "ISO-8859-1"is also referred to as
#                        "iso8859-1"and "iso88591". Some applications cannot handle the various synonyms
#                        correctly (e.g., require that "UTF-8"is written as "UTF-8", not "utf8"), so it is
#                        safest in most cases to choose the canonical name for a particular locale. To determine
#                        the canonical name, run the following command, where  <locale name>is the output
#                        given by  locale -a for your preferred locale ("en_GB.iso88591"in our example). 



# LC_ALL=<locale name> locale charmap
# 

 
# 
#                          For the "en_GB.iso88591"locale, the above command will print: 



# ISO-8859-1
# 


# 
#                          This results in a final locale setting of "en_GB.ISO-8859-1". It is important that
#                        the locale found using the heuristic above is tested prior to it being added to
#                        the Bash startup files: 



# LC_ALL=<locale name> locale language
# LC_ALL=<locale name> locale charmap
# LC_ALL=<locale name> locale int_curr_symbol
# LC_ALL=<locale name> locale int_prefix
# 


# 
#                          The above commands should print the language name, the character encoding used by
#                        the locale, the local currency, and the prefix to dial before the telephone number
#                        in order to get into the country. If any of the commands above fail with a message
#                        similar to the one shown below, this means that your locale was either not installed
#                        in Section 8.5, "Glibc-2.33"or is not supported by the default installation of Glibc.
#                         



# locale: Cannot set LC_* to default locale: No such file or directory
# 


# 
#                          If this happens, you should either install the desired locale using the  localedef command,
#                        or consider choosing a different locale. Further instructions assume that there
#                        are no such error messages from Glibc. 
# 
#                          Other packages can also function incorrectly (but may not necessarily display any
#                        error messages) if the locale name does not meet their expectations. In those cases,
#                        investigating how other Linux distributions support your locale might provide some
#                        useful information. 
# 
#                          Once the proper locale settings have been determined, create the /etc/profilefile:
#                        



# cat > /etc/profile << "EOF"
# # Begin /etc/profile
# 
# export LANG=<ll>_<CC>.<charmap><@modifiers>
# 
# # End /etc/profile
# EOF
# 

 
# 
#                          The "C"(default) and "en_US.utf8"(the recommended one for United States English
#                        users) locales are different. "C"uses the US-ASCII 7-bit character set, and treats
#                        bytes with the high bit set as invalid characters. That's why, e.g., the  ls command
#                        substitutes them with question marks in that locale. Also, an attempt to send mail
#                        with such characters from Mutt or Pine results in non-RFC-conforming messages being
#                        sent (the charset in the outgoing mail is indicated as "unknown 8-bit"). So you
#                        can use the "C"locale only if you are sure that you will never need 8-bit characters.
#                        
# 
#                          UTF-8 based locales are not supported well by some programs. Work is in progress
#                        to document and, if possible, fix such problems, see http://www.linuxfromscratch.org/blfs/view/10.1/introduction/locale-issues.html.
#                          
#        9.8. Creating the /etc/inputrc File  
# 
#                          The inputrcfile is the configuration file for the readline library, which provides
#                        editing capabilities while the user is entering a line from the terminal. It works
#                        by translating keyboard inputs into specific actions. Readline is used by bash and
#                        most other shells as well as many other applications. 
# 
#                          Most people do not need user-specific functionality so the command below creates
#                        a global /etc/inputrcused by everyone who logs in. If you later decide you need
#                        to override the defaults on a per user basis, you can create a .inputrcfile in the
#                        user's home directory with the modified mappings. 
# 
#                          For more information on how to edit the inputrcfile, see info bash under the  Readline
#                        Init File section.  info readline is also a good source of information. 
# 
#                          Below is a generic global inputrcalong with comments to explain what the various
#                        options do. Note that comments cannot be on the same line as commands. Create the
#                        file using the following command: 



# cat > /etc/inputrc << "EOF"
# # Begin /etc/inputrc
# # Modified by Chris Lynn <roryo@roryo.dynup.net>
# 
# # Allow the command prompt to wrap to the next line
# set horizontal-scroll-mode Off
# 
# # Enable 8bit input
# set meta-flag On
# set input-meta On
# 
# # Turns off 8th bit stripping
# set convert-meta Off
# 
# # Keep the 8th bit for display
# set output-meta On
# 
# # none, visible or audible
# set bell-style none
# 
# # All of the following map the escape sequence of the value
# # contained in the 1st argument to the readline specific functions
# "\eOd": backward-word
# "\eOc": forward-word
# 
# # for linux console
# "\e[1~": beginning-of-line
# "\e[4~": end-of-line
# "\e[5~": beginning-of-history
# "\e[6~": end-of-history
# "\e[3~": delete-char
# "\e[2~": quoted-insert
# 
# # for xterm
# "\eOH": beginning-of-line
# "\eOF": end-of-line
# 
# # for Konsole
# "\e[H": beginning-of-line
# "\e[F": end-of-line
# 
# # End /etc/inputrc
# EOF
# 

 
#        9.9. Creating the /etc/shells File  
# 
#                          The shellsfile contains a list of login shells on the system. Applications use this
#                        file to determine whether a shell is valid. For each shell a single line should
#                        be present, consisting of the shell's path relative to the root of the directory
#                        structure (/). 
# 
#                          For example, this file is consulted by chsh to determine whether an unprivileged
#                        user may change the login shell for her own account. If the command name is not
#                        listed, the user will be denied the ability to change shells. 
# 
#                          It is a requirement for applications such as GDMwhich does not populate the face
#                        browser if it can't find /etc/shells, or FTP daemons which traditionally disallow
#                        access to users with shells not included in this file. 



# cat > /etc/shells << "EOF"
# # Begin /etc/shells
# 
# /bin/sh
# /bin/bash
# 
# # End /etc/shells
# EOF
# 

 
#        Chapter 10. Making the LFS System Bootable  
#        10.1. Introduction  
# 
#                          It is time to make the LFS system bootable. This chapter discusses creating the
#                        /etc/fstabfile, building a kernel for the new LFS system, and installing the GRUB
#                        boot loader so that the LFS system can be selected for booting at startup. 
#        10.2. Creating the /etc/fstab File  
# 
#                          The /etc/fstabfile is used by some programs to determine where file systems are
#                        to be mounted by default, in which order, and which must be checked (for integrity
#                        errors) prior to mounting. Create a new file systems table like this: 



# cat > /etc/fstab << "EOF"
# # Begin /etc/fstab
# 
# # file system  mount-point  type     options             dump  fsck
# #                                                              order
# 
# /dev/<xxx>     /            <fff>    defaults            1     1
# /dev/<yyy>     swap         swap     pri=1               0     0
# proc           /proc        proc     nosuid,noexec,nodev 0     0
# sysfs          /sys         sysfs    nosuid,noexec,nodev 0     0
# devpts         /dev/pts     devpts   gid=5,mode=620      0     0
# tmpfs          /run         tmpfs    defaults            0     0
# devtmpfs       /dev         devtmpfs mode=0755,nosuid    0     0
# 
# # End /etc/fstab
# EOF
# 

 
# 
#                          Replace <xxx>,  <yyy>, and  <fff>with the values appropriate for the system, for example,
#                        sda2, sda5, and ext4. For details on the six fields in this file, see  man 5 fstab .
#                        
# 
#                          Filesystems with MS-DOS or Windows origin (i.e. vfat, ntfs, smbfs, cifs, iso9660,
#                        udf) need a special option, utf8, in order for non-ASCII characters in file names
#                        to be interpreted properly. For non-UTF-8 locales, the value of iocharsetshould
#                        be set to be the same as the character set of the locale, adjusted in such a way
#                        that the kernel understands it. This works if the relevant character set definition
#                        (found under File systems -> Native Language Support when configuring the kernel)
#                        has been compiled into the kernel or built as a module. However, if the character
#                        set of the locale is UTF-8, the corresponding option iocharset=utf8would make the
#                        file system case sensitive. To fix this, use the special option utf8instead of iocharset=utf8,
#                        for UTF-8 locales. The "codepage"option is also needed for vfat and smbfs filesystems.
#                        It should be set to the codepage number used under MS-DOS in your country. For example,
#                        in order to mount USB flash drives, a ru_RU.KOI8-R user would need the following
#                        in the options portion of its mount line in /etc/fstab: 



# noauto,user,quiet,showexec,codepage=866,iocharset=koi8r
# 


# 
#                          The corresponding options fragment for ru_RU.UTF-8 users is: 



# noauto,user,quiet,showexec,codepage=866,utf8
# 


# 
#                          Note that using iocharsetis the default for iso8859-1(which keeps the file system
#                        case insensitive), and the utf8option tells the kernel to convert the file names
#                        using UTF-8 so they can be interpreted in the UTF-8 locale. 
# 
#                          It is also possible to specify default codepage and iocharset values for some filesystems
#                        during kernel configuration. The relevant parameters are named "Default NLS Option"(CONFIG_NLS_DEFAULT),
#                        "Default Remote NLS Option"(CONFIG_SMB_NLS_DEFAULT), "Default codepage for FAT"(CONFIG_FAT_DEFAULT_CODEPAGE),
#                        and "Default iocharset for FAT"(CONFIG_FAT_DEFAULT_IOCHARSET). There is no way to
#                        specify these settings for the ntfs filesystem at kernel compilation time. 
# 
#                          It is possible to make the ext3 filesystem reliable across power failures for some
#                        hard disk types. To do this, add the barrier=1mount option to the appropriate entry
#                        in /etc/fstab. To check if the disk drive supports this option, run hdparmon the
#                        applicable disk drive. For example, if:  



# hdparm -I /dev/sda | grep NCQ
# 


# 
#                          returns non-empty output, the option is supported. 
# 
#                          Note: Logical Volume Management (LVM) based partitions cannot use the barrieroption.
#                         
#        10.3. Linux-5.10.17  
# 
#                          The Linux package contains the Linux kernel. 
#           Approximate build time: 5.0 - 125.0 SBU (typically about 9 SBU)
#           Required disk space: 1200 - 6750 MB (typically about 1500 MB)
#          10.3.1. Installation of the kernel 
# 
#                          Building the kernel involves a few steps;configuration, compilation, and installation.
#                        Read the READMEfile in the kernel source tree for alternative methods to the way
#                        this book configures the kernel. 
# 
#                          Prepare for compilation by running the following command: 



# make mrproper
# 


# 
#                          This ensures that the kernel tree is absolutely clean. The kernel team recommends
#                        that this command be issued prior to each kernel compilation. Do not rely on the
#                        source tree being clean after un-tarring. 
# 
#                          There are several ways to configure the kernel options. Usually, This is done through
#                        a menu-driven interface, for example: 



# make menuconfig
# 

 
# 
#                          The meaning of optional make environment variables: 
# 
#                LANG=<host_LANG_value> LC_ALL= 
# 
#                          This establishes the locale setting to the one used on the host. This may be needed
#                        for a proper menuconfig ncurses interface line drawing on a UTF-8 linux text console.
#                        
# 
#                          If used, be sure to replace  <host_LANG_value>by the value of the $LANGvariable from
#                        your host. You can alternatively use instead the host's value of $LC_ALLor $LC_CTYPE.
#                         
# 
#                
#           make menuconfig 
# 
#                          This launches an ncurses menu-driven interface. For other (graphical) interfaces,
#                        type  make help . 
# 
#                          For general information on kernel configuration see http://www.linuxfromscratch.org/hints/downloads/files/kernel-configuration.txt.
#                        BLFS has some information regarding particular kernel configuration requirements
#                        of packages outside of LFS at http://www.linuxfromscratch.org/blfs/view/10.1/longindex.html#kernel-config-index.
#                        Additional information about configuring and building the kernel can be found at
#                        http://www.kroah.com/lkn/  
#          Note 
# 
#                          A good starting place for setting up the kernel configuration is to run make defconfig .
#                        This will set the base configuration to a good state that takes your current system
#                        architecture into account. 
# 
#                          Be sure to enable/disable/set the following features or the system might not work
#                        correctly or boot at all: 



# Device Drivers  --->
#   Generic Driver Options  --->
#    [ ] Support for uevent helper [CONFIG_UEVENT_HELPER]
#    [*] Maintain a devtmpfs filesystem to mount at /dev [CONFIG_DEVTMPFS]
# 


# 
#                          There are several other options that may be desired depending on the requirements
#                        for the system. For a list of options needed for BLFS packages, see the BLFS Index
#                        of Kernel Settings(http://www.linuxfromscratch.org/blfs/view/10.1/longindex.html#kernel-config-index).
#                         
#          Note 
# 
#                          If your host hardware is using UEFI, then the 'make defconfig' above should automatically
#                        add in some EFI-related kernel options. 
# 
#                          In order to allow your LFS kernel to be booted from within your host's UEFI boot
#                        environment, your kernel must have this option selected: 



# Processor type and features  --->
#    [*]   EFI stub support  [CONFIG_EFI_STUB]
# 


# 
#                          A fuller description of managing UEFI environments from within LFS is covered by
#                        the lfs-uefi.txt hint at http://www.linuxfromscratch.org/hints/downloads/files/lfs-uefi.txt.
#                          
# 
#                          The rationale for the above configuration items: 
# 
#                Support for uevent helper 
# 
#                          Having this option set may interfere with device management when using Udev/Eudev.
#                        
# 
#                Maintain a devtmpfs 
# 
#                          This will create automated device nodes which are populated by the kernel, even
#                        without Udev running. Udev then runs on top of this, managing permissions and adding
#                        symlinks. This configuration item is required for all users of Udev/Eudev. 
# 
#                          Alternatively,  make oldconfig may be more appropriate in some situations. See the
#                        READMEfile for more information. 
# 
#                          If desired, skip kernel configuration by copying the kernel config file, .config,
#                        from the host system (assuming it is available) to the unpacked linux-5.10.17directory.
#                        However, we do not recommend this option. It is often better to explore all the
#                        configuration menus and create the kernel configuration from scratch. 
# 
#                          Compile the kernel image and modules: 



# make
# 


# 
#                          If using kernel modules, module configuration in /etc/modprobe.dmay be required.
#                        Information pertaining to modules and kernel configuration is located in Section
#                        9.3, "Overview of Device and Module Handling"and in the kernel documentation in
#                        the linux-5.10.17/Documentationdirectory. Also, modprobe.d(5)may be of interest.
#                         
# 
#                          Unless module support has been disabled in the kernel configuration, install the
#                        modules with: 



# make modules_install
# 


# 
#                          After kernel compilation is complete, additional steps are required to complete
#                        the installation. Some files need to be copied to the /bootdirectory. 
#          Caution 
# 
#                          If the host system has a separate /boot partition, the files copied below should
#                        go there. The easiest way to do that is to bind /boot on the host (outside chroot)
#                        to /mnt/lfs/boot before proceeding. As the root user in the  host system : 



# mount --bind /boot /mnt/lfs/boot
# 


# 
#                          The path to the kernel image may vary depending on the platform being used. The
#                        filename below can be changed to suit your taste, but the stem of the filename should
#                        be  vmlinuz to be compatible with the automatic setup of the boot process described
#                        in the next section. The following command assumes an x86 architecture: 



# cp -iv arch/x86/boot/bzImage /boot/vmlinuz-5.10.17-lfs-10.1
# 

 
# 
#                          System.mapis a symbol file for the kernel. It maps the function entry points of
#                        every function in the kernel API, as well as the addresses of the kernel data structures
#                        for the running kernel. It is used as a resource when investigating kernel problems.
#                        Issue the following command to install the map file: 



# cp -iv System.map /boot/System.map-5.10.17
# 


# 
#                          The kernel configuration file .configproduced by the make menuconfig step above contains
#                        all the configuration selections for the kernel that was just compiled. It is a
#                        good idea to keep this file for future reference: 



# cp -iv .config /boot/config-5.10.17
# 


# 
#                          Install the documentation for the Linux kernel: 



# install -d /usr/share/doc/linux-5.10.17
# cp -r Documentation/* /usr/share/doc/linux-5.10.17
# 


# 
#                          It is important to note that the files in the kernel source directory are not owned
#                        by  root . Whenever a package is unpacked as user  root (like we did inside chroot),
#                        the files have the user and group IDs of whatever they were on the packager's computer.
#                        This is usually not a problem for any other package to be installed because the
#                        source tree is removed after the installation. However, the Linux source tree is
#                        often retained for a long time. Because of this, there is a chance that whatever
#                        user ID the packager used will be assigned to somebody on the machine. That person
#                        would then have write access to the kernel source. 
#          Note 
# 
#                          In many cases, the configuration of the kernel will need to be updated for packages
#                        that will be installed later in BLFS. Unlike other packages, it is not necessary
#                        to remove the kernel source tree after the newly built kernel is installed. 
# 
#                          If the kernel source tree is going to be retained, run  chown -R 0:0 on the linux-5.10.17directory
#                        to ensure all files are owned by user  root . 
#          Warning 
# 
#                          Some kernel documentation recommends creating a symlink from /usr/src/linuxpointing
#                        to the kernel source directory. This is specific to kernels prior to the 2.6 series
#                        and  must not be created on an LFS system as it can cause problems for packages you
#                        may wish to build once your base LFS system is complete. 
#          Warning 
# 
#                          The headers in the system's includedirectory (/usr/include) should  always be the
#                        ones against which Glibc was compiled, that is, the sanitised headers installed
#                        in Section 5.4, "Linux-5.10.17 API Headers". Therefore, they should   never be replaced
#                        by either the raw kernel headers or any other kernel sanitized headers.  
#          10.3.2. Configuring Linux Module Load Order  
# 
#                          Most of the time Linux modules are loaded automatically, but sometimes it needs
#                        some specific direction. The program that loads modules, modprobe or  insmod , uses
#                        /etc/modprobe.d/usb.conffor this purpose. This file needs to be created so that
#                        if the USB drivers (ehci_hcd, ohci_hcd and uhci_hcd) have been built as modules,
#                        they will be loaded in the correct order; ehci_hcd needs to be loaded prior to ohci_hcd
#                        and uhci_hcd in order to avoid a warning being output at boot time. 
# 
#                          Create a new file /etc/modprobe.d/usb.confby running the following: 



# install -v -m755 -d /etc/modprobe.d
# cat > /etc/modprobe.d/usb.conf << "EOF"
# # Begin /etc/modprobe.d/usb.conf
# 
# install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
# install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true
# 
# # End /etc/modprobe.d/usb.conf
# EOF
# 

 
#          10.3.3. Contents of Linux  
#           Installed files: config-5.10.17, vmlinuz-5.10.17-lfs-10.1,and System.map-5.10.17
#           Installed directories: /lib/modules, /usr/share/doc/linux-5.10.17 
#            Short Descriptions   
# 
#                          
# 
#                config-5.10.17 
# 
#                          Contains all the configuration selections for the kernel  
# 
#                          vmlinuz-5.10.17-lfs-10.1 
# 
#                          The engine of the Linux system. When turning on the computer, the kernel is the
#                        first part of the operating system that gets loaded. It detects and initializes
#                        all components of the computer's hardware, then makes these components available
#                        as a tree of files to the software and turns a single CPU into a multitasking machine
#                        capable of running scores of programs seemingly at the same time  
# 
#                          System.map-5.10.17 
# 
#                          A list of addresses and symbols; it maps the entry points and addresses of all the
#                        functions and data structures in the kernel 
#        10.4. Using GRUB to Set Up the Boot Process  
#          10.4.1. Introduction 
#          Warning 
# 
#                          Configuring GRUB incorrectly can render your system inoperable without an alternate
#                        boot device such as a CD-ROM or bootable USB drive. This section is not required
#                        to boot your LFS system. You may just want to modify your current boot loader, e.g.
#                        Grub-Legacy, GRUB2, or LILO. 
# 
#                          Ensure that an emergency boot disk is ready to "rescue"the computer if the computer
#                        becomes unusable (un-bootable). If you do not already have a boot device, you can
#                        create one. In order for the procedure below to work, you need to jump ahead to
#                        BLFS and install  xorrisofrom the libisoburnpackage.   



# cd /tmp 
# grub-mkrescue --output=grub-img.iso 
# xorriso -as cdrecord -v dev=/dev/cdrw blank=as_needed grub-img.iso
# 


#          Note 
# 
#                          To boot LFS on host systems that have UEFI enabled, the kernel needs to have been
#                        built with the CONFIG_EFI_STUB capability described in the previous section. However,
#                        LFS can be booted using GRUB2 without such an addition. To do this, the UEFI Mode
#                        and Secure Boot capabilities in the host system's BIOS need to be turned off. For
#                        details, see the lfs-uefi.txt hintat http://www.linuxfromscratch.org/hints/downloads/files/lfs-uefi.txt.
#                         
#          10.4.2. GRUB Naming Conventions 
# 
#                          GRUB uses its own naming structure for drives and partitions in the form of (hdn,m) ,
#                        where  n is the hard drive number and  m is the partition number. The hard drive number
#                        starts from zero, but the partition number starts from one for normal partitions
#                        and five for extended partitions. Note that this is different from earlier versions
#                        where both numbers started from zero. For example, partition sda1is  (hd0,1) to GRUB
#                        and sdb3is  (hd1,3) . In contrast to Linux, GRUB does not consider CD-ROM drives to
#                        be hard drives. For example, if using a CD on hdband a second hard drive on hdc,
#                        that second hard drive would still be  (hd1) . 
#          10.4.3. Setting Up the Configuration 
# 
#                          GRUB works by writing data to the first physical track of the hard disk. This area
#                        is not part of any file system. The programs there access GRUB modules in the boot
#                        partition. The default location is /boot/grub/. 
# 
#                          The location of the boot partition is a choice of the user that affects the configuration.
#                        One recommendation is to have a separate small (suggested size is 200 MB) partition
#                        just for boot information. That way each build, whether LFS or some commercial distro,
#                        can access the same boot files and access can be made from any booted system. If
#                        you choose to do this, you will need to mount the separate partition, move all files
#                        in the current /bootdirectory (e.g. the linux kernel you just built in the previous
#                        section) to the new partition. You will then need to unmount the partition and remount
#                        it as /boot. If you do this, be sure to update /etc/fstab. 
# 
#                          Using the current lfs partition will also work, but configuration for multiple systems
#                        is more difficult. 
# 
#                          Using the above information, determine the appropriate designator for the root partition
#                        (or boot partition, if a separate one is used). For the following example, it is
#                        assumed that the root (or separate boot) partition is sda2. 
# 
#                          Install the GRUB files into /boot/gruband set up the boot track: 
#          Warning 
# 
#                          The following command will overwrite the current boot loader. Do not run the command
#                        if this is not desired, for example, if using a third party boot manager to manage
#                        the Master Boot Record (MBR). 



# grub-install /dev/sda
# 


#          Note 
# 
#                          If the system has been booted using UEFI,  grub-install will try to install files
#                        for the  x86_64-efi target, but those files have not been installed in chapter 6.
#                        If this is the case, add --target i386-pcto the command above.  
#          10.4.4. Creating the GRUB Configuration File  
# 
#                          Generate /boot/grub/grub.cfg: 



# cat > /boot/grub/grub.cfg << "EOF"
# # Begin /boot/grub/grub.cfg
# set default=0
# set timeout=5
# 
# insmod ext2
# set root=(hd0,2)
# 
# menuentry "GNU/Linux, Linux 5.10.17-lfs-10.1" {
#         linux   /boot/vmlinuz-5.10.17-lfs-10.1 root=/dev/sda2 ro
# }
# EOF
# 


#          Note 
# 
#                          From GRUB's perspective, the kernel files are relative to the partition used. If
#                        you used a separate /boot partition, remove /boot from the above  linux line. You
#                        will also need to change the  set root line to point to the boot partition. 
# 
#                          GRUB is an extremely powerful program and it provides a tremendous number of options
#                        for booting from a wide variety of devices, operating systems, and partition types.
#                        There are also many options for customization such as graphical splash screens,
#                        playing sounds, mouse input, etc. The details of these options are beyond the scope
#                        of this introduction. 
#          Caution 
# 
#                          There is a command, grub-mkconfig, that can write a configuration file automatically.
#                        It uses a set of scripts in /etc/grub.d/ and will destroy any customizations that
#                        you make. These scripts are designed primarily for non-source distributions and
#                        are not recommended for LFS. If you install a commercial Linux distribution, there
#                        is a good chance that this program will be run. Be sure to back up your grub.cfg
#                        file.  
#        Chapter 11. The End  
#        11.1. The End  
# 
#                          Well done! The new LFS system is installed! We wish you much success with your shiny
#                        new custom-built Linux system. 
# 
#                          It may be a good idea to create an /etc/lfs-releasefile. By having this file, it
#                        is very easy for you (and for us if you need to ask for help at some point) to find
#                        out which LFS version is installed on the system. Create this file by running: 



# echo 10.1 > /etc/lfs-release
# 


# 
#                          Two files describing the installed system may be used by packages that can be installed
#                        on the system later, either in binary form or by building them. 
# 
#                          The first one shows the status of your new system with respect to the Linux Standards
#                        Base (LSB). To create this file, run: 



# cat > /etc/lsb-release << "EOF"
# DISTRIB_ID="Linux From Scratch"
# DISTRIB_RELEASE="10.1"
# DISTRIB_CODENAME="<your name here>"
# DISTRIB_DESCRIPTION="Linux From Scratch"
# EOF
# 


# 
#                          The second one contains roughly the same information, and is used by systemd and
#                        some graphical desktop environments. To create this file, run: 



# cat > /etc/os-release << "EOF"
# NAME="Linux From Scratch"
# VERSION="10.1"
# ID=lfs
# PRETTY_NAME="Linux From Scratch 10.1"
# VERSION_CODENAME="<your name here>"
# EOF
# 


# 
#                          Be sure to put some sort of customization for the fields 'DISTRIB_CODENAME' and
#                        'VERSION_CODENAME' to make the system uniquely yours. 
#        11.2. Get Counted  
# 
#                          Now that you have finished the book, do you want to be counted as an LFS user? Head
#                        over to http://www.linuxfromscratch.org/cgi-bin/lfscounter.phpand register as an
#                        LFS user by entering your name and the first LFS version you have used.  
# 
#                          Let's reboot into LFS now. 
#        11.3. Rebooting the System  
# 
#                          Now that all of the software has been installed, it is time to reboot your computer.
#                        However, you should be aware of a few things. The system you have created in this
#                        book is quite minimal, and most likely will not have the functionality you would
#                        need to be able to continue forward. By installing a few extra packages from the
#                        BLFS book while still in our current chroot environment, you can leave yourself
#                        in a much better position to continue on once you reboot into your new LFS installation.
#                        Here are some suggestions: 
# 
#                          A text mode browser such as Lynxwill allow you to easily view the BLFS book in one
#                        virtual terminal, while building packages in another.  
# 
#                          The GPMpackage will allow you to perform copy/paste actions in your virtual terminals.
#                         
# 
#                          If you are in a situation where static IP configuration does not meet your networking
#                        requirements, installing a package such as dhcpcdor the client portion of dhcpmay
#                        be useful.  
# 
#                          Installing sudomay be useful for building packages as a non-root user and easily
#                        installing the resulting packages in your new system.  
# 
#                          If you want to access your new system from a remote system within a comfortable
#                        GUI environment, install openssh.  
# 
#                          To make fetching files over the internet easier, install wget.  
# 
#                          Finally, a review of the following configuration files is also appropriate at this
#                        point. 
# 
#                          /etc/bashrc 
# 
#                          /etc/dircolors 
# 
#                          /etc/fstab 
# 
#                          /etc/hosts 
# 
#                          /etc/inputrc 
# 
#                          /etc/profile 
# 
#                          /etc/resolv.conf 
# 
#                          /etc/vimrc 
# 
#                          /root/.bash_profile 
# 
#                          /root/.bashrc 
# 
#                          /etc/sysconfig/ifconfig.eth0 
# 
#                          Now that we have said that, let's move on to booting our shiny new LFS installation
#                        for the first time! First exit from the chroot environment: 



# logout
# 


# 
#                          Unmount the LFS file system hierarchy: 



# umount -Rv $LFS
# 


# 
#                          Now, reboot the system with: 



# shutdown -r now
# 


# 
#                          Assuming the GRUB boot loader was set up as outlined earlier, the menu is set to
#                        boot LFS 10.1 automatically. 
# 
#                          When the reboot is complete, the LFS system is ready for use and more software may
#                        be added to suit your needs.  
#        11.4. What Now?  
# 
#                          Thank you for reading this LFS book. We hope that you have found this book helpful
#                        and have learned more about the system creation process. 
# 
#                          Now that the LFS system is installed, you may be wondering "What next?"To answer
#                        that question, we have compiled a list of resources for you. 
# 
#                          Maintenance 
# 
#                          Bugs and security notices are reported regularly for all software. Since an LFS
#                        system is compiled from source, it is up to you to keep abreast of such reports.
#                        There are several online resources that track such reports, some of which are shown
#                        below:  
# 
#                          CERT(Computer Emergency Response Team)  
# 
#                          CERT has a mailing list that publishes security alerts concerning various operating
#                        systems and applications. Subscription information is available at http://www.us-cert.gov/cas/signup.html.
#                         
# 
#                          Bugtraq 
# 
#                          Bugtraq is a full-disclosure computer security mailing list. It publishes newly
#                        discovered security issues, and occasionally potential fixes for them. Subscription
#                        information is available at http://www.securityfocus.com/archive.  
# 
#                          Beyond Linux From Scratch 
# 
#                          The Beyond Linux From Scratch book covers installation procedures for a wide range
#                        of software beyond the scope of the LFS Book. The BLFS project is located at http://www.linuxfromscratch.org/blfs/view/10.1/.
#                         
# 
#                          LFS Hints 
# 
#                          The LFS Hints are a collection of educational documents submitted by volunteers
#                        in the LFS community. The hints are available at http://www.linuxfromscratch.org/hints/downloads/files/.
#                         
# 
#                          Mailing lists 
# 
#                          There are several LFS mailing lists you may subscribe to if you are in need of help,
#                        want to stay current with the latest developments, want to contribute to the project,
#                        and more. See Chapter 1 - Mailing Listsfor more information.  
# 
#                          The Linux Documentation Project 
# 
#                          The goal of The Linux Documentation Project (TLDP) is to collaborate on all of the
#                        issues of Linux documentation. The TLDP features a large collection of HOWTOs, guides,
#                        and man pages. It is located at http://www.tldp.org/.  
#      Part V. Appendices  
#        Appendix A. Acronyms and Terms  
# 
#                          
# 
#                ABI   
# 
#                          Application Binary Interface 
# 
#                          ALFS   
# 
#                          Automated Linux From Scratch 
# 
#                          API   
# 
#                          Application Programming Interface 
# 
#                          ASCII   
# 
#                          American Standard Code for Information Interchange 
# 
#                          BIOS   
# 
#                          Basic Input/Output System 
# 
#                          BLFS   
# 
#                          Beyond Linux From Scratch 
# 
#                          BSD   
# 
#                          Berkeley Software Distribution 
# 
#                          chroot   
# 
#                          change root 
# 
#                          CMOS   
# 
#                          Complementary Metal Oxide Semiconductor 
# 
#                          COS   
# 
#                          Class Of Service 
# 
#                          CPU   
# 
#                          Central Processing Unit 
# 
#                          CRC   
# 
#                          Cyclic Redundancy Check 
# 
#                          CVS   
# 
#                          Concurrent Versions System 
# 
#                          DHCP   
# 
#                          Dynamic Host Configuration Protocol 
# 
#                          DNS   
# 
#                          Domain Name Service 
# 
#                          EGA   
# 
#                          Enhanced Graphics Adapter 
# 
#                          ELF   
# 
#                          Executable and Linkable Format 
# 
#                          EOF   
# 
#                          End of File 
# 
#                          EQN   
# 
#                          equation 
# 
#                          ext2   
# 
#                          second extended file system 
# 
#                          ext3   
# 
#                          third extended file system 
# 
#                          ext4   
# 
#                          fourth extended file system 
# 
#                          FAQ   
# 
#                          Frequently Asked Questions 
# 
#                          FHS   
# 
#                          Filesystem Hierarchy Standard 
# 
#                          FIFO   
# 
#                          First-In, First Out 
# 
#                          FQDN   
# 
#                          Fully Qualified Domain Name 
# 
#                          FTP   
# 
#                          File Transfer Protocol 
# 
#                          GB   
# 
#                          Gigabytes 
# 
#                          GCC   
# 
#                          GNU Compiler Collection 
# 
#                          GID   
# 
#                          Group Identifier 
# 
#                          GMT   
# 
#                          Greenwich Mean Time 
# 
#                          HTML   
# 
#                          Hypertext Markup Language 
# 
#                          IDE   
# 
#                          Integrated Drive Electronics 
# 
#                          IEEE   
# 
#                          Institute of Electrical and Electronic Engineers 
# 
#                          IO   
# 
#                          Input/Output 
# 
#                          IP   
# 
#                          Internet Protocol 
# 
#                          IPC   
# 
#                          Inter-Process Communication 
# 
#                          IRC   
# 
#                          Internet Relay Chat 
# 
#                          ISO   
# 
#                          International Organization for Standardization 
# 
#                          ISP   
# 
#                          Internet Service Provider 
# 
#                          KB   
# 
#                          Kilobytes 
# 
#                          LED   
# 
#                          Light Emitting Diode 
# 
#                          LFS   
# 
#                          Linux From Scratch 
# 
#                          LSB   
# 
#                          Linux Standard Base 
# 
#                          MB   
# 
#                          Megabytes 
# 
#                          MBR   
# 
#                          Master Boot Record 
# 
#                          MD5   
# 
#                          Message Digest 5 
# 
#                          NIC   
# 
#                          Network Interface Card 
# 
#                          NLS   
# 
#                          Native Language Support 
# 
#                          NNTP   
# 
#                          Network News Transport Protocol 
# 
#                          NPTL   
# 
#                          Native POSIX Threading Library 
# 
#                          OSS   
# 
#                          Open Sound System 
# 
#                          PCH   
# 
#                          Pre-Compiled Headers 
# 
#                          PCRE   
# 
#                          Perl Compatible Regular Expression 
# 
#                          PID   
# 
#                          Process Identifier 
# 
#                          PTY   
# 
#                          pseudo terminal 
# 
#                          QOS   
# 
#                          Quality Of Service 
# 
#                          RAM   
# 
#                          Random Access Memory 
# 
#                          RPC   
# 
#                          Remote Procedure Call 
# 
#                          RTC   
# 
#                          Real Time Clock 
# 
#                          SBU   
# 
#                          Standard Build Unit 
# 
#                          SCO   
# 
#                          The Santa Cruz Operation 
# 
#                          SHA1   
# 
#                          Secure-Hash Algorithm 1 
# 
#                          TLDP   
# 
#                          The Linux Documentation Project 
# 
#                          TFTP   
# 
#                          Trivial File Transfer Protocol 
# 
#                          TLS   
# 
#                          Thread-Local Storage 
# 
#                          UID   
# 
#                          User Identifier 
# 
#                          umask   
# 
#                          user file-creation mask 
# 
#                          USB   
# 
#                          Universal Serial Bus 
# 
#                          UTC   
# 
#                          Coordinated Universal Time 
# 
#                          UUID   
# 
#                          Universally Unique Identifier 
# 
#                          VC   
# 
#                          Virtual Console 
# 
#                          VGA   
# 
#                          Video Graphics Array 
# 
#                          VT   
# 
#                          Virtual Terminal 
#        Appendix B. Acknowledgments  
# 
#                          We would like to thank the following people and organizations for their contributions
#                        to the Linux From Scratch Project. 
# 
#                          Gerard Beekmans<gerard AT linuxfromscratch D0T org> - LFS Creator  
# 
#                          Bruce Dubbs<bdubbs AT linuxfromscratch D0T org> - LFS Managing Editor  
# 
#                          Jim Gifford<jim AT linuxfromscratch D0T org> - CLFS Project Co-Leader  
# 
#                          Pierre Labastie<pierre AT linuxfromscratch D0T org> - BLFS Editor and ALFS Lead
#                         
# 
#                          DJ Lucas<dj AT linuxfromscratch D0T org> - LFS and BLFS Editor  
# 
#                          Ken Moffat<ken AT linuxfromscratch D0T org> - BLFS Editor  
# 
#                          Countless other people on the various LFS and BLFS mailing lists who helped make
#                        this book possible by giving their suggestions, testing the book, and submitting
#                        bug reports, instructions, and their experiences with installing various packages.
#                        
#          Translators  
# 
#                          Manuel Canales Esparcia<macana AT macana-es D0T com> - Spanish LFS translation project
#                         
# 
#                          Johan Lenglet<johan AT linuxfromscratch D0T org> - French LFS translation project
#                        until 2008  
# 
#                          Jean-Philippe Mengual<jmengual AT linuxfromscratch D0T org> - French LFS translation
#                        project 2008-2016  
# 
#                          Julien Lepiller<jlepiller AT linuxfromscratch D0T org> - French LFS translation
#                        project 2017-present  
# 
#                          Anderson Lizardo<lizardo AT linuxfromscratch D0T org> - Portuguese LFS translation
#                        project  
# 
#                          Thomas Reitelbach<tr AT erdfunkstelle D0T de> - German LFS translation project  
# 
#                          Anton Maisak<info AT linuxfromscratch D0T org D0T ru> - Russian LFS translation
#                        project  
# 
#                          Elena Shevcova<helen AT linuxfromscratch D0T org D0T ru> - Russian LFS translation
#                        project  
#          Mirror Maintainers  
#            North American Mirrors  
# 
#                          Scott Kveton<scott AT osuosl D0T org> - lfs.oregonstate.edu mirror  
# 
#                          William Astle<lost AT l-w D0T net> - ca.linuxfromscratch.org mirror  
# 
#                          Eujon Sellers<jpolen@rackspace.com> - lfs.introspeed.com mirror  
# 
#                          Justin Knierim<tim@idge.net> - lfs-matrix.net mirror  
#            South American Mirrors  
# 
#                          Manuel Canales Esparcia<manuel AT linuxfromscratch D0T org> - lfsmirror.lfs-es.info
#                        mirror  
# 
#                          Luis Falcon<Luis Falcon> - torredehanoi.org mirror  
#            European Mirrors  
# 
#                          Guido Passet<guido AT primerelay D0T net> - nl.linuxfromscratch.org mirror  
# 
#                          Bastiaan Jacques<baafie AT planet D0T nl> - lfs.pagefault.net mirror  
# 
#                          Sven Cranshoff<sven D0T cranshoff AT lineo D0T be> - lfs.lineo.be mirror  
# 
#                          Scarlet Belgium - lfs.scarlet.be mirror 
# 
#                          Sebastian Faulborn<info AT aliensoft D0T org> - lfs.aliensoft.org mirror  
# 
#                          Stuart Fox<stuart AT dontuse D0T ms> - lfs.dontuse.ms mirror  
# 
#                          Ralf Uhlemann<admin AT realhost D0T de> - lfs.oss-mirror.org mirror  
# 
#                          Antonin Sprinzl<Antonin D0T Sprinzl AT tuwien D0T ac D0T at> - at.linuxfromscratch.org
#                        mirror  
# 
#                          Fredrik Danerklint<fredan-lfs AT fredan D0T org> - se.linuxfromscratch.org mirror
#                         
# 
#                          Franck<franck AT linuxpourtous D0T com> - lfs.linuxpourtous.com mirror  
# 
#                          Philippe Baque<baque AT cict D0T fr> - lfs.cict.fr mirror  
# 
#                          Vitaly Chekasin<gyouja AT pilgrims D0T ru> - lfs.pilgrims.ru mirror  
# 
#                          Benjamin Heil<kontakt AT wankoo D0T org> - lfs.wankoo.org mirror  
# 
#                          Anton Maisak<info AT linuxfromscratch D0T org D0T ru> - linuxfromscratch.org.ru
#                        mirror  
#            Asian Mirrors  
# 
#                          Satit Phermsawang<satit AT wbac D0T ac D0T th> - lfs.phayoune.org mirror  
# 
#                          Shizunet Co.,Ltd.<info AT shizu-net D0T jp> - lfs.mirror.shizu-net.jp mirror  
# 
#                          Init World<http://www.initworld.com/> - lfs.initworld.com mirror  
#            Australian Mirrors  
# 
#                          Jason Andrade<jason AT dstc D0T edu D0T au> - au.linuxfromscratch.org mirror  
#          Former Project Team Members  
# 
#                          Christine Barczak<theladyskye AT linuxfromscratch D0T org> - LFS Book Editor  
# 
#                          Archaic <archaic@linuxfromscratch.org> - LFS Technical Writer/Editor, HLFS Project
#                        Leader, BLFS Editor, Hints and Patches Project Maintainer 
# 
#                          Matthew Burgess<matthew AT linuxfromscratch D0T org> - LFS Project Leader, LFS Technical
#                        Writer/Editor  
# 
#                          Nathan Coulson<nathan AT linuxfromscratch D0T org> - LFS-Bootscripts Maintainer
#                         
# 
#                          Timothy Bauscher 
# 
#                          Robert Briggs 
# 
#                          Ian Chilton 
# 
#                          Jeroen Coumans<jeroen AT linuxfromscratch D0T org> - Website Developer, FAQ Maintainer
#                         
# 
#                          Manuel Canales Esparcia<manuel AT linuxfromscratch D0T org> - LFS/BLFS/HLFS XML
#                        and XSL Maintainer  
# 
#                          Alex Groenewoud - LFS Technical Writer 
# 
#                          Marc Heerdink 
# 
#                          Jeremy Huntwork<jhuntwork AT linuxfromscratch D0T org> - LFS Technical Writer, LFS
#                        LiveCD Maintainer  
# 
#                          Bryan Kadzban<bryan AT linuxfromscratch D0T org> - LFS Technical Writer  
# 
#                          Mark Hymers 
# 
#                          Seth W. Klein - FAQ maintainer 
# 
#                          Nicholas Leippe<nicholas AT linuxfromscratch D0T org> - Wiki Maintainer  
# 
#                          Anderson Lizardo<lizardo AT linuxfromscratch D0T org> - Website Backend-Scripts
#                        Maintainer  
# 
#                          Randy McMurchy<randy AT linuxfromscratch D0T org> - BLFS Project Leader, LFS Editor
#                         
# 
#                          Dan Nicholson<dnicholson AT linuxfromscratch D0T org> - LFS and BLFS Editor  
# 
#                          Alexander E. Patrakov<alexander AT linuxfromscratch D0T org> - LFS Technical Writer,
#                        LFS Internationalization Editor, LFS Live CD Maintainer  
# 
#                          Simon Perreault 
# 
#                          Scot Mc Pherson<scot AT linuxfromscratch D0T org> - LFS NNTP Gateway Maintainer
#                         
# 
#                          Douglas R. Reno<renodr AT linuxfromscratch D0T org> - Systemd Editor  
# 
#                          Ryan Oliver<ryan AT linuxfromscratch D0T org> - CLFS Project Co-Leader  
# 
#                          Greg Schafer<gschafer AT zip D0T com D0T au> - LFS Technical Writer and Architect
#                        of the Next Generation 64-bit-enabling Build Method  
# 
#                          Jesse Tie-Ten-Quee - LFS Technical Writer 
# 
#                          James Robertson<jwrober AT linuxfromscratch D0T org> - Bugzilla Maintainer  
# 
#                          Tushar Teredesai<tushar AT linuxfromscratch D0T org> - BLFS Book Editor, Hints and
#                        Patches Project Leader  
# 
#                          Jeremy Utley<jeremy AT linuxfromscratch D0T org> - LFS Technical Writer, Bugzilla
#                        Maintainer, LFS-Bootscripts Maintainer  
# 
#                          Zack Winkles<zwinkles AT gmail D0T com> - LFS Technical Writer  
#        Appendix C. Dependencies  
# 
#                          Every package built in LFS relies on one or more other packages in order to build
#                        and install properly. Some packages even participate in circular dependencies, that
#                        is, the first package depends on the second which in turn depends on the first.
#                        Because of these dependencies, the order in which packages are built in LFS is very
#                        important. The purpose of this page is to document the dependencies of each package
#                        built in LFS. 
# 
#                          For each package we build, we have listed three, and sometimes four, types of dependencies.
#                        The first lists what other packages need to be available in order to compile and
#                        install the package in question. The second lists what packages, in addition to
#                        those on the first list, need to be available in order to run the test suites. The
#                        third list of dependencies are packages that require this package to be built and
#                        installed in its final location before they are built and installed. In most cases,
#                        this is because these packages will hard code paths to binaries within their scripts.
#                        If not built in a certain order, this could result in paths of /tools/bin/[binary]
#                        being placed inside scripts installed to the final system. This is obviously not
#                        desirable. 
# 
#                          The last list of dependencies are optional packages that are not addressed in LFS,
#                        but could be useful to the user. These packages may have additional mandatory or
#                        optional dependencies of their own. For these dependencies, the recommended practice
#                        is to install them after completion of the LFS book and then go back and rebuild
#                        the LFS package. In several cases, re-installation is addressed in BLFS. 
#          Acl  
#           Installation depends on: Attr, Bash, Binutils, Coreutils, GCC, Gettext, Grep, M4, Make, Perl, Sed, and Texinfo
#           Test suite depends on: Automake, Diffutils, Findutils, and Libtool
#           Must be installed before: Coreutils, Sed, Tar, and Vim
#           Optional dependencies: None 
#          Attr  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Grep, M4, Make, Perl, Sed, and Texinfo
#           Test suite depends on: Automake, Diffutils, Findutils, and Libtool
#           Must be installed before: Acl and Libcap
#           Optional dependencies: None 
#          Autoconf  
#           Installation depends on: Bash, Coreutils, Grep, M4, Make, Perl, Sed, and Texinfo
#           Test suite depends on: Automake, Diffutils, Findutils, GCC, and Libtool
#           Must be installed before: Automake
#           Optional dependencies: Emacs 
#          Automake  
#           Installation depends on: Autoconf, Bash, Coreutils, Gettext, Grep, M4, Make, Perl, Sed, and Texinfo
#           Test suite depends on: Binutils, Bison, Bzip2, DejaGNU, Diffutils, Expect, Findutils, Flex, GCC, Gettext, Gzip, Libtool, and Tar
#           Must be installed before: None
#           Optional dependencies: None 
#          Bash  
#           Installation depends on: Bash, Binutils, Bison, Coreutils, Diffutils, Gawk, GCC, Glibc, Grep, Make, Ncurses, Patch, Readline, Sed, and Texinfo
#           Test suite depends on: Shadow
#           Must be installed before: None
#           Optional dependencies: Xorg 
#          Bc  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, Grep, and Make
#           Test suite depends on: Gawk
#           Must be installed before: Linux Kernel
#           Optional dependencies: None 
#          Binutils  
#           Installation depends on: Bash, Binutils, Coreutils, Diffutils, File, Flex, Gawk, GCC, Glibc, Grep, Make, Perl, Sed, Texinfo and Zlib
#           Test suite depends on: DejaGNU and Expect
#           Must be installed before: None
#           Optional dependencies: Debuginfod 
#          Bison  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Glibc, Grep, M4, Make, Perl, and Sed
#           Test suite depends on: Diffutils, Findutils, and Flex
#           Must be installed before: Kbd and Tar
#           Optional dependencies: Doxygen (test suite) 
#          Bzip2  
#           Installation depends on: Bash, Binutils, Coreutils, Diffutils, GCC, Glibc, Make, and Patch
#           Test suite depends on: None
#           Must be installed before: File
#           Optional dependencies: None 
#          Check  
#           Installation depends on: GCC, Grep, Make, Sed, and Texinfo
#           Test suite depends on: None
#           Must be installed before: None
#           Optional dependencies: None 
#          Coreutils  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Glibc, GMP, Grep, Libcap, Make, Patch, Perl, Sed, and Texinfo
#           Test suite depends on: Diffutils, E2fsprogs, Findutils, Shadow, and Util-linux
#           Must be installed before: Bash, Diffutils, Eudev, Findutils, and Man-DB
#           Optional dependencies: Perl Expect and IO:Tty modules (for test suite) 
#          DejaGNU  
#           Installation depends on: Bash, Coreutils, Diffutils, GCC, Grep, Make, Sed, and Texinfo
#           Test suite depends on: None
#           Must be installed before: None
#           Optional dependencies: None 
#          Diffutils  
#           Installation depends on: Bash, Binutils, Coreutils, Gawk, GCC, Gettext, Glibc, Grep, Make, Sed, and Texinfo
#           Test suite depends on: Perl
#           Must be installed before: None
#           Optional dependencies: None 
#          E2fsprogs  
#           Installation depends on: Bash, Binutils, Coreutils, Diffutils, Gawk, GCC, Glibc, Grep, Gzip, Make, Sed, Texinfo, and Util-linux
#           Test suite depends on: Procps-ng and Psmisc
#           Must be installed before: None
#           Optional dependencies: None 
#          Eudev  
#           Installation depends on: Bash, Binutils, Coreutils, Gawk, GCC, Glibc, Grep, Gperf, Make, Sed, and Util-linux
#           Test suite depends on: None
#           Must be installed before: None
#           Optional dependencies: None 
#          Expat  
#           Installation depends on: Bash, Binutils, Coreutils, Gawk, GCC, Glibc, Grep, Make, and Sed
#           Test suite depends on: None
#           Must be installed before: Python and XML::Parser
#           Optional dependencies: None 
#          Expect  
#           Installation depends on: Bash, Binutils, Coreutils, Diffutils, GCC, Glibc, Grep, Make, Patch, Sed, and Tcl
#           Test suite depends on: None
#           Must be installed before: None
#           Optional dependencies: 
#                tk  
#          File  
#           Installation depends on: Bash, Binutils, Bzip2, Coreutils, Diffutils, Gawk, GCC, Glibc, Grep, Make, Sed, Xz, and Zlib
#           Test suite depends on: None
#           Must be installed before: None
#           Optional dependencies: None 
#          Findutils  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Glibc, Grep, Make, Sed, and Texinfo
#           Test suite depends on: DejaGNU, Diffutils, and Expect
#           Must be installed before: None
#           Optional dependencies: None 
#          Flex  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Glibc, Grep, M4, Make, Patch, Sed, and Texinfo
#           Test suite depends on: Bison and Gawk
#           Must be installed before: Binutils, IProute2, Kbd, Kmod, and Man-DB
#           Optional dependencies: None 
#          Gawk  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Glibc, GMP, Grep, Make, MPFR, Patch, Readline, Sed, and Texinfo
#           Test suite depends on: Diffutils
#           Must be installed before: None
#           Optional dependencies: libsigsegv 
#          GCC  
#           Installation depends on: Bash, Binutils, Coreutils, Diffutils, Findutils, Gawk, GCC, Gettext, Glibc, GMP, Grep, M4, Make, MPC, MPFR, Patch, Perl, Sed, Tar, Texinfo, and Zstd
#           Test suite depends on: DejaGNU, Expect, and Shadow
#           Must be installed before: None
#           Optional dependencies: 
#                GNATand 
#                ISL  
#          GDBM  
#           Installation depends on: Bash, Binutils, Coreutils, Diffutils, GCC, Grep, Make, and Sed
#           Test suite depends on: None
#           Must be installed before: None
#           Optional dependencies: None 
#          Gettext  
#           Installation depends on: Bash, Binutils, Coreutils, Gawk, GCC, Glibc, Grep, Make, Ncurses, Sed, and Texinfo
#           Test suite depends on: Diffutils, Perl, and Tcl
#           Must be installed before: Automake and Bison
#           Optional dependencies: None 
#          Glibc  
#           Installation depends on: Bash, Binutils, Bison, Coreutils, Diffutils, Gawk, GCC, Gettext, Grep, Gzip, Linux API Headers, Make, Perl, Python, Sed, and Texinfo
#           Test suite depends on: File
#           Must be installed before: None
#           Optional dependencies: None 
#          GMP  
#           Installation depends on: Bash, Binutils, Coreutils, Diffutils, Gawk, GCC, Glibc, Grep, M4, Make, Sed, and Texinfo
#           Test suite depends on: None
#           Must be installed before: MPFR and GCC
#           Optional dependencies: None 
#          Gperf  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, and Make
#           Test suite depends on: Diffutils and Expect
#           Must be installed before: None
#           Optional dependencies: None 
#          Grep  
#           Installation depends on: Bash, Binutils, Coreutils, Diffutils, GCC, Gettext, Glibc, Grep, Make, Patch, Sed, and Texinfo
#           Test suite depends on: Gawk
#           Must be installed before: Man-DB
#           Optional dependencies: Pcre and libsigsegv 
#          Groff  
#           Installation depends on: Bash, Binutils, Bison, Coreutils, Gawk, GCC, Glibc, Grep, Make, Patch, Sed, and Texinfo
#           Test suite depends on: No test suite available
#           Must be installed before: Man-DB and Perl
#           Optional dependencies: Ghostscript 
#          GRUB  
#           Installation depends on: Bash, Binutils, Bison, Coreutils, Diffutils, GCC, Gettext, Glibc, Grep, Make, Ncurses, Sed, Texinfo, and Xz
#           Test suite depends on: None
#           Must be installed before: None
#           Optional dependencies: None 
#          Gzip  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, Grep, Make, Sed, and Texinfo
#           Test suite depends on: Diffutils and Less
#           Must be installed before: Man-DB
#           Optional dependencies: None 
#          Iana-Etc  
#           Installation depends on: Coreutils, Gawk, and Make
#           Test suite depends on: No test suite available
#           Must be installed before: Perl
#           Optional dependencies: None 
#          Inetutils  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, Grep, Make, Ncurses, Patch, Sed, Texinfo, and Zlib
#           Test suite depends on: None
#           Must be installed before: Tar
#           Optional dependencies: None 
#          Intltool  
#           Installation depends on: Bash, Gawk, Glibc, Make, Perl, Sed, and XML::Parser
#           Test suite depends on: Perl
#           Must be installed before: None
#           Optional dependencies: None 
#          IProute2  
#           Installation depends on: Bash, Bison, Coreutils, Flex, GCC, Glibc, Make, Libcap, Libelf, and Linux API Headers
#           Test suite depends on: No test suite available
#           Must be installed before: None
#           Optional dependencies: Berkeley DB and Iptables 
#          Kbd  
#           Installation depends on: Bash, Binutils, Bison, Check, Coreutils, Flex, GCC, Gettext, Glibc, Gzip, Make, Patch, and Sed
#           Test suite depends on: None
#           Must be installed before: None
#           Optional dependencies: None 
#          Kmod  
#           Installation depends on: Bash, Binutils, Bison, Coreutils, Flex, GCC, Gettext, Glibc, Gzip, Make, Pkg-config, Sed, Xz-Utils, and Zlib
#           Test suite depends on: No test suite available
#           Must be installed before: Eudev
#           Optional dependencies: None 
#          Less  
#           Installation depends on: Bash, Binutils, Coreutils, Diffutils, GCC, Glibc, Grep, Make, Ncurses, and Sed
#           Test suite depends on: No test suite available
#           Must be installed before: Gzip
#           Optional dependencies: Pcre 
#          Libcap  
#           Installation depends on: Attr, Bash, Binutils, Coreutils, GCC, Glibc, Perl, Make, and Sed
#           Test suite depends on: None
#           Must be installed before: IProute2 and Shadow
#           Optional dependencies: Linux-PAM 
#          Libelf  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, and Make
#           Test suite depends on: None
#           Must be installed before: IProute2 and Linux Kernel
#           Optional dependencies: None 
#          Libffi  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, Make, and Sed
#           Test suite depends on: DejaGnu
#           Must be installed before: Python
#           Optional dependencies: None 
#          Libpipeline  
#           Installation depends on: Bash, Binutils, Coreutils, Diffutils, Gawk, GCC, Glibc, Grep, Make, Sed, and Texinfo
#           Test suite depends on: Check
#           Must be installed before: Man-DB
#           Optional dependencies: None 
#          Libtool  
#           Installation depends on: Bash, Binutils, Coreutils, Diffutils, Gawk, GCC, Glibc, Grep, Make, Sed, and Texinfo
#           Test suite depends on: Autoconf, Automake, and Findutils
#           Must be installed before: None
#           Optional dependencies: None 
#          Linux Kernel  
#           Installation depends on: Bash, Bc, Binutils, Coreutils, Diffutils, Findutils, GCC, Glibc, Grep, Gzip, Kmod, Libelf, Make, Ncurses, OpenSSL, Perl, and Sed
#           Test suite depends on: No test suite available
#           Must be installed before: None
#           Optional dependencies: None 
#          M4  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, Grep, Make, Sed, and Texinfo
#           Test suite depends on: Diffutils
#           Must be installed before: Autoconf and Bison
#           Optional dependencies: libsigsegv 
#          Make  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Glibc, Grep, Make, Sed, and Texinfo
#           Test suite depends on: Perl and Procps-ng
#           Must be installed before: None
#           Optional dependencies: None 
#          Man-DB  
#           Installation depends on: Bash, Binutils, Bzip2, Coreutils, Flex, GCC, GDBM, Gettext, Glibc, Grep, Groff, Gzip, Less, Libpipeline, Make, Sed, and Xz
#           Test suite depends on: Util-linux
#           Must be installed before: None
#           Optional dependencies: None 
#          Man-Pages  
#           Installation depends on: Bash, Coreutils, and Make
#           Test suite depends on: No test suite available
#           Must be installed before: None
#           Optional dependencies: None 
#          Meson  
#           Installation depends on: Ninja and Python
#           Test suite depends on: No test suite available
#           Must be installed before: Systemd
#           Optional dependencies: None 
#          MPC  
#           Installation depends on: Bash, Binutils, Coreutils, Diffutils, Gawk, GCC, Glibc, Grep, GMP, Make, MPFR, Sed, and Texinfo
#           Test suite depends on: None
#           Must be installed before: GCC
#           Optional dependencies: None 
#          MPFR  
#           Installation depends on: Bash, Binutils, Coreutils, Diffutils, Gawk, GCC, Glibc, Grep, GMP, Make, Sed, and Texinfo
#           Test suite depends on: None
#           Must be installed before: Gawk and GCC
#           Optional dependencies: None 
#          Ncurses  
#           Installation depends on: Bash, Binutils, Coreutils, Diffutils, Gawk, GCC, Glibc, Grep, Make, Patch, and Sed
#           Test suite depends on: No test suite available
#           Must be installed before: Bash, GRUB, Inetutils, Less, Procps-ng, Psmisc, Readline, Texinfo, Util-linux, and Vim
#           Optional dependencies: None 
#          Ninja  
#           Installation depends on: Binutils, Coreutils, GCC, and Python
#           Test suite depends on: None
#           Must be installed before: Meson
#           Optional dependencies: Asciidoc, Doxygen, Emacs, and re2c 
#          Openssl  
#           Installation depends on: Binutils, Coreutils, GCC, Make, and Perl
#           Test suite depends on: None
#           Must be installed before: Linux
#           Optional dependencies: None 
#          Patch  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, Grep, Make, and Sed
#           Test suite depends on: Diffutils
#           Must be installed before: None
#           Optional dependencies: Ed 
#          Perl  
#           Installation depends on: Bash, Binutils, Coreutils, Gawk, GCC, GDBM, Glibc, Grep, Groff, Make, Sed, and Zlib
#           Test suite depends on: Iana-Etc and Procps-ng
#           Must be installed before: Autoconf
#           Optional dependencies: None 
#          Pkg-config  
#           Installation depends on: Bash, Binutils, Coreutils, Gawk, GCC, Glibc, Grep, Make, Popt, and Sed
#           Test suite depends on: None
#           Must be installed before: Kmod
#           Optional dependencies: None 
#          Popt  
#           Installation depends on: Bash, Binutils, Coreutils, Gawk, GCC, Glibc, Grep, and Make
#           Test suite depends on: Diffutils and Sed
#           Must be installed before: Pkg-config
#           Optional dependencies: None 
#          Procps-ng  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, Make, and Ncurses
#           Test suite depends on: DejaGNU
#           Must be installed before: None
#           Optional dependencies: None 
#          Psmisc  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Glibc, Grep, Make, Ncurses, and Sed
#           Test suite depends on: No test suite available
#           Must be installed before: None
#           Optional dependencies: None 
#          Python  
#           Installation depends on: Bash, Binutils, Coreutils, Expat, GCC, Gdbm, Gettext, Glibc, Grep, Libffi, Make, Ncurses, Sed, and Util-linux
#           Test suite depends on: GDB and Valgrind
#           Must be installed before: Ninja
#           Optional dependencies: Berkeley DB, OpenSSL, SQLite, and Tk 
#          Readline  
#           Installation depends on: Bash, Binutils, Coreutils, Gawk, GCC, Glibc, Grep, Make, Ncurses, Patch, Sed, and Texinfo
#           Test suite depends on: No test suite available
#           Must be installed before: Bash and Gawk
#           Optional dependencies: None 
#          Sed  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Glibc, Grep, Make, Sed, and Texinfo
#           Test suite depends on: Diffutils and Gawk
#           Must be installed before: E2fsprogs, File, Libtool, and Shadow
#           Optional dependencies: None 
#          Shadow  
#           Installation depends on: Acl, Attr, Bash, Binutils, Coreutils, Diffutils, Findutils, Gawk, GCC, Gettext, Glibc, Grep, Libcap, Make, and Sed
#           Test suite depends on: No test suite available
#           Must be installed before: Coreutils
#           Optional dependencies: Cracklib and PAM 
#          Sysklogd  
#           Installation depends on: Binutils, Coreutils, GCC, Glibc, Make, and Patch
#           Test suite depends on: No test suite available
#           Must be installed before: None
#           Optional dependencies: None 
#          Systemd  
#           Installation depends on: Acl, Attr, Bash, Binutils, Coreutils, Diffutils, Expat, Gawk, GCC, Glibc, Gperf, Grep, Intltool, Libcap, Meson, Sed, and Util-linux
#           Test suite depends on: None
#           Must be installed before: None
#           Optional dependencies: Many, see 
#                BLFS systemd page  
#          Sysvinit  
#           Installation depends on: Binutils, Coreutils, GCC, Glibc, Make, and Sed
#           Test suite depends on: No test suite available
#           Must be installed before: None
#           Optional dependencies: None 
#          Tar  
#           Installation depends on: Acl, Attr, Bash, Binutils, Bison, Coreutils, GCC, Gettext, Glibc, Grep, Inetutils, Make, Sed, and Texinfo
#           Test suite depends on: Autoconf, Diffutils, Findutils, Gawk, and Gzip
#           Must be installed before: None
#           Optional dependencies: None 
#          Tcl  
#           Installation depends on: Bash, Binutils, Coreutils, Diffutils, GCC, Glibc, Grep, Make, and Sed
#           Test suite depends on: None
#           Must be installed before: None
#           Optional dependencies: None 
#          Texinfo  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Glibc, Grep, Make, Ncurses, Patch, and Sed
#           Test suite depends on: None
#           Must be installed before: None
#           Optional dependencies: None 
#          Util-linux  
#           Installation depends on: Bash, Binutils, Coreutils, Diffutils, Eudev, Findutils, Gawk, GCC, Gettext, Glibc, Grep, Make, Ncurses, Sed, and Zlib
#           Test suite depends on: None
#           Must be installed before: None
#           Optional dependencies: 
#                Libcap-ng  
#          Vim  
#           Installation depends on: Acl, Attr, Bash, Binutils, Coreutils, Diffutils, GCC, Glibc, Grep, Make, Ncurses, and Sed
#           Test suite depends on: None
#           Must be installed before: None
#           Optional dependencies: Xorg, GTK+2, LessTif, Python, Tcl, Ruby, and GPM 
#          XML::Parser  
#           Installation depends on: Bash, Binutils, Coreutils, Expat, GCC, Glibc, Make, and Perl
#           Test suite depends on: Perl
#           Must be installed before: Intltool
#           Optional dependencies: None 
#          Xz  
#           Installation depends on: Bash, Binutils, Coreutils, Diffutils, GCC, Glibc, and Make
#           Test suite depends on: None
#           Must be installed before: Eudev, File, GRUB, Kmod, and Man-DB
#           Optional dependencies: None 
#          Zlib  
#           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, Make, and Sed
#           Test suite depends on: None
#           Must be installed before: File, Kmod, Perl, and Util-linux
#           Optional dependencies: None 
#          Zstd  
#           Installation depends on: Binutils, Coreutils, GCC, Glibc, Gzip, Make, and Xz
#           Test suite depends on: None
#           Must be installed before: GCC
#           Optional dependencies: None 
#        Appendix D. Boot and sysconfig scripts version-20210201  
# 
#                          The scripts in this appendix are listed by the directory where they normally reside.
#                        The order is /etc/rc.d/init.d, /etc/sysconfig, /etc/sysconfig/network-devices, and
#                        /etc/sysconfig/network-devices/services. Within each section, the files are listed
#                        in the order they are normally called. 
#        D.1. /etc/rc.d/init.d/rc  
# 
#                          The rcscript is the first script called by initand initiates the boot process. 



# #!/bin/bash
# ########################################################################
# # Begin rc
# #
# # Description : Main Run Level Control Script
# #
# # Authors     : Gerard Beekmans  - gerard AT linuxfromscratch D0T org
# #             : DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# . /lib/lsb/init-functions
# 
# print_error_msg()
# {
#    log_failure_msg
#    # $i is set when called
#    MSG="FAILURE:\n\nYou should not be reading this error message.\n\n" 
#    MSG="${MSG}It means that an unforeseen error took place in\n"
#    MSG="${MSG}${i},\n"
#    MSG="${MSG}which exited with a return value of ${error_value}.\n"
#   
#    MSG="${MSG}If you're able to track this error down to a bug in one of\n"
#    MSG="${MSG}the files provided by the ${DISTRO_MINI} book,\n"
#    MSG="${MSG}please be so kind to inform us at ${DISTRO_CONTACT}.\n"
#    log_failure_msg "${MSG}"
# 
#    log_info_msg "Press Enter to continue..."
#    wait_for_user
# }
# 
# check_script_status()
# {
#    # $i is set when called
#    if [ ! -f ${i} ]; then
#       log_warning_msg "${i} is not a valid symlink." 
#       SCRIPT_STAT="1"
#    fi
# 
#    if [ ! -x ${i} ]; then
#       log_warning_msg "${i} is not executable, skipping."
#       SCRIPT_STAT="1"
#    fi
# }
# 
# run()
# {
#    if [ -z $interactive ]; then
#       ${1} ${2}
#       return $?
#    fi
# 
#    while true; do
#       read -p "Run ${1} ${2} (Yes/no/continue)? " -n 1 runit
#       echo
# 
#       case ${runit} in
#          c | C)
#             interactive=""
#             ${i} ${2}
#             ret=${?}
#             break;
#             ;;
# 
#          n | N)
#             return 0
#             ;;
# 
#          y | Y)
#             ${i} ${2}
#             ret=${?}
#             break
#             ;;
#       esac
#    done
# 
#    return $ret
# }
# 
# # Read any local settings/overrides
# [ -r /etc/sysconfig/rc.site ] && source /etc/sysconfig/rc.site
# 
# DISTRO=${DISTRO:-"Linux From Scratch"}
# DISTRO_CONTACT=${DISTRO_CONTACT:-"lfs-dev@linuxfromscratch.org (Registration required)"}
# DISTRO_MINI=${DISTRO_MINI:-"LFS"}
# IPROMPT=${IPROMPT:-"no"}
# 
# # These 3 signals will not cause our script to exit
# trap "" INT QUIT TSTP
# 
# [ "${1}" != "" ] && runlevel=${1}
# 
# if [ "${runlevel}" == "" ]; then
#    echo "Usage: ${0} <runlevel>" >&2
#    exit 1
# fi
# 
# previous=${PREVLEVEL}
# [ "${previous}" == "" ] && previous=N
# 
# if [ ! -d /etc/rc.d/rc${runlevel}.d ]; then
#    log_info_msg "/etc/rc.d/rc${runlevel}.d does not exist.\n" 
#    exit 1
# fi
# 
# if [ "$runlevel" == "6" -o "$runlevel" == "0" ]; then IPROMPT="no"; fi
# 
# # Note: In ${LOGLEVEL:-7}, it is ':' 'dash' '7', not minus 7
# if [ "$runlevel" == "S" ]; then 
#    [ -r /etc/sysconfig/console ] && source /etc/sysconfig/console 
#    dmesg -n "${LOGLEVEL:-7}" 
# fi
# 
# if [ "${IPROMPT}" == "yes" -a "${runlevel}" == "S" ]; then
#    # The total length of the distro welcome string, without escape codes
#    wlen=${wlen:-$(echo "Welcome to ${DISTRO}" | wc -c )}
#    welcome_message=${welcome_message:-"Welcome to ${INFO}${DISTRO}${NORMAL}"}
# 
#    # The total length of the interactive string, without escape codes
#    ilen=${ilen:-$(echo "Press 'I' to enter interactive startup" | wc -c )}
#    i_message=${i_message:-"Press '${FAILURE}I${NORMAL}' to enter interactive startup"}
# 
# 
#    # dcol and icol are spaces before the message to center the message
#    # on screen. itime is the amount of wait time for the user to press a key
#    wcol=$(( ( ${COLUMNS} - ${wlen} ) / 2 ))
#    icol=$(( ( ${COLUMNS} - ${ilen} ) / 2 ))
#    itime=${itime:-"3"}
# 
#    echo -e "\n\n"
#    echo -e "\\033[${wcol}G${welcome_message}"
#    echo -e "\\033[${icol}G${i_message}${NORMAL}"
#    echo ""
#    read -t "${itime}" -n 1 interactive 2>&1 > /dev/null
# fi
# 
# # Make lower case
# [ "${interactive}" == "I" ] && interactive="i"
# [ "${interactive}" != "i" ] && interactive=""
# 
# # Read the state file if it exists from runlevel S
# [ -r /run/interactive ] && source /run/interactive
# 
# # Attempt to stop all services started by the previous runlevel,
# # and killed in this runlevel
# if [ "${previous}" != "N" ]; then
#    for i in $(ls -v /etc/rc.d/rc${runlevel}.d/K* 2> /dev/null)
#    do
#       check_script_status
#       if [ "${SCRIPT_STAT}" == "1" ]; then
#          SCRIPT_STAT="0"
#          continue
#       fi
# 
#       suffix=${i#/etc/rc.d/rc$runlevel.d/K[0-9][0-9]}
#       prev_start=/etc/rc.d/rc$previous.d/S[0-9][0-9]$suffix
#       sysinit_start=/etc/rc.d/rcS.d/S[0-9][0-9]$suffix
# 
#       if [ "${runlevel}" != "0" -a "${runlevel}" != "6" ]; then
#          if [ ! -f ${prev_start} -a  ! -f ${sysinit_start} ]; then
#             MSG="WARNING:\n\n${i} can't be "
#             MSG="${MSG}executed because it was not "
#             MSG="${MSG}not started in the previous "
#             MSG="${MSG}runlevel (${previous})."
#             log_warning_msg "$MSG"
#             continue
#          fi
#       fi
# 
#       run ${i} stop
#       error_value=${?}
# 
#       if [ "${error_value}" != "0" ]; then print_error_msg; fi
#    done
# fi
# 
# if [ "${previous}" == "N" ]; then export IN_BOOT=1; fi
# 
# if [ "$runlevel" == "6" -a -n "${FASTBOOT}" ]; then
#    touch /fastboot
# fi
# 
# 
# # Start all functions in this runlevel
# for i in $( ls -v /etc/rc.d/rc${runlevel}.d/S* 2> /dev/null)
# do
#    if [ "${previous}" != "N" ]; then
#       suffix=${i#/etc/rc.d/rc$runlevel.d/S[0-9][0-9]}
#       stop=/etc/rc.d/rc$runlevel.d/K[0-9][0-9]$suffix
#       prev_start=/etc/rc.d/rc$previous.d/S[0-9][0-9]$suffix
# 
#       [ -f ${prev_start} -a ! -f ${stop} ] && continue
#    fi
# 
#    check_script_status
#       if [ "${SCRIPT_STAT}" == "1" ]; then
#          SCRIPT_STAT="0"
#          continue
#       fi
# 
#    case ${runlevel} in
#       0|6)
#          run ${i} stop
#          ;;
#       *)
#          run ${i} start
#          ;;
#    esac
# 
#    error_value=${?}
# 
#    if [ "${error_value}" != "0" ]; then print_error_msg; fi
# done
# 
# # Store interactive variable on switch from runlevel S and remove if not
# if [ "${runlevel}" == "S" -a "${interactive}" == "i" ]; then
#     echo "interactive=\"i\"" > /run/interactive
# else
#     rm -f /run/interactive 2> /dev/null
# fi
# 
# # Copy the boot log on initial boot only
# if [ "${previous}" == "N" -a  "${runlevel}" != "S" ]; then
#    cat $BOOTLOG >> /var/log/boot.log
#       
#    # Mark the end of boot
#    echo "--------" >> /var/log/boot.log
#    
#    # Remove the temporary file
#    rm -f $BOOTLOG 2> /dev/null
# fi
# 
# # End rc
# 

 
#        D.2. /lib/lsb/init-functions  



# #!/bin/sh
# ########################################################################
# # 
# # Begin /lib/lsb/init-funtions
# #
# # Description : Run Level Control Functions
# #
# # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# #             : DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# # Notes       : With code based on Matthias Benkmann's simpleinit-msb
# #               http://winterdrache.de/linux/newboot/index.html
# #
# #               The file should be located in /lib/lsb
# #
# ########################################################################
# 
# ## Environmental setup
# # Setup default values for environment
# umask 022
# export PATH="/bin:/usr/bin:/sbin:/usr/sbin"
# 
# ## Set color commands, used via echo
# # Please consult `man console_codes for more information
# # under the "ECMA-48 Set Graphics Rendition" section
# #
# # Warning: when switching from a 8bit to a 9bit font,
# # the linux console will reinterpret the bold (1;) to
# # the top 256 glyphs of the 9bit font.  This does
# # not affect framebuffer consoles
# 
# NORMAL="\\033[0;39m"         # Standard console grey
# SUCCESS="\\033[1;32m"        # Success is green
# WARNING="\\033[1;33m"        # Warnings are yellow
# FAILURE="\\033[1;31m"        # Failures are red
# INFO="\\033[1;36m"           # Information is light cyan
# BRACKET="\\033[1;34m"        # Brackets are blue
# 
# # Use a colored prefix
# BMPREFIX="      "
# SUCCESS_PREFIX="${SUCCESS}  *  ${NORMAL} "
# FAILURE_PREFIX="${FAILURE}*****${NORMAL} "
# WARNING_PREFIX="${WARNING} *** ${NORMAL} "
# SKIP_PREFIX="${INFO}  S   ${NORMAL}"
# 
# SUCCESS_SUFFIX="${BRACKET}[${SUCCESS}  OK  ${BRACKET}]${NORMAL}"
# FAILURE_SUFFIX="${BRACKET}[${FAILURE} FAIL ${BRACKET}]${NORMAL}"
# WARNING_SUFFIX="${BRACKET}[${WARNING} WARN ${BRACKET}]${NORMAL}"
# SKIP_SUFFIX="${BRACKET}[${INFO} SKIP ${BRACKET}]${NORMAL}"
# 
# BOOTLOG=/run/bootlog
# KILLDELAY=3
# SCRIPT_STAT="0"
# 
# # Set any user specified environment variables e.g. HEADLESS
# [ -r /etc/sysconfig/rc.site ]  && . /etc/sysconfig/rc.site
# 
# ## Screen Dimensions
# # Find current screen size
# if [ -z "${COLUMNS}" ]; then
#    COLUMNS=$(stty size)
#    COLUMNS=${COLUMNS##* }
# fi
# 
# # When using remote connections, such as a serial port, stty size returns 0
# if [ "${COLUMNS}" = "0" ]; then
#    COLUMNS=80
# fi
# 
# ## Measurements for positioning result messages
# COL=$((${COLUMNS} - 8))
# WCOL=$((${COL} - 2))
# 
# ## Set Cursor Position Commands, used via echo
# SET_COL="\\033[${COL}G"      # at the $COL char
# SET_WCOL="\\033[${WCOL}G"    # at the $WCOL char
# CURS_UP="\\033[1A\\033[0G"   # Up one line, at the 0'th char
# CURS_ZERO="\\033[0G"
# 
# ################################################################################
# # start_daemon()                                                               #
# # Usage: start_daemon [-f] [-n nicelevel] [-p pidfile] pathname [args...]      #
# #                                                                              #
# # Purpose: This runs the specified program as a daemon                         #
# #                                                                              #
# # Inputs: -f: (force) run the program even if it is already running.           #
# #         -n nicelevel: specify a nice level. See 'man nice(1)'.               #
# #         -p pidfile: use the specified file to determine PIDs.                #
# #         pathname: the complete path to the specified program                 #
# #         args: additional arguments passed to the program (pathname)          #
# #                                                                              #
# # Return values (as defined by LSB exit codes):                                #
# #       0 - program is running or service is OK                                #
# #       1 - generic or unspecified error                                       #
# #       2 - invalid or excessive argument(s)                                   #
# #       5 - program is not installed                                           #
# ################################################################################
# start_daemon()
# {
#     local force=""
#     local nice="0"
#     local pidfile=""
#     local pidlist=""
#     local retval=""
# 
#     # Process arguments
#     while true
#     do
#         case "${1}" in
# 
#             -f)
#                 force="1"
#                 shift 1
#                 ;;
# 
#             -n)
#                 nice="${2}"
#                 shift 2
#                 ;;
# 
#             -p)
#                 pidfile="${2}"
#                 shift 2
#                 ;;
# 
#             -*)
#                 return 2
#                 ;;
# 
#             *)
#                 program="${1}"
#                 break
#                 ;;
#         esac
#     done
# 
#     # Check for a valid program
#     if [ ! -e "${program}" ]; then return 5; fi
# 
#     # Execute
#     if [ -z "${force}" ]; then
#         if [ -z "${pidfile}" ]; then
#             # Determine the pid by discovery
#             pidlist=`pidofproc "${1}"`
#             retval="${?}"
#         else
#             # The PID file contains the needed PIDs
#             # Note that by LSB requirement, the path must be given to pidofproc,
#             # however, it is not used by the current implementation or standard.
#             pidlist=`pidofproc -p "${pidfile}" "${1}"`
#             retval="${?}"
#         fi
# 
#         # Return a value ONLY 
#         # It is the init script's (or distribution's functions) responsibilty
#         # to log messages!
#         case "${retval}" in
# 
#             0)
#                 # Program is already running correctly, this is a 
#                 # successful start.
#                 return 0
#                 ;;
# 
#             1)
#                 # Program is not running, but an invalid pid file exists
#                 # remove the pid file and continue
#                 rm -f "${pidfile}"
#                 ;;
# 
#             3)
#                 # Program is not running and no pidfile exists
#                 # do nothing here, let start_deamon continue.
#                 ;;
# 
#             *)
#                 # Others as returned by status values shall not be interpreted
#                 # and returned as an unspecified error.
#                 return 1
#                 ;;
#         esac
#     fi
# 
#     # Do the start!
#     nice -n "${nice}" "${@}"
# }
# 
# ################################################################################
# # killproc()                                                                   #
# # Usage: killproc [-p pidfile] pathname [signal]                               #
# #                                                                              #
# # Purpose: Send control signals to running processes                           #
# #                                                                              #
# # Inputs: -p pidfile, uses the specified pidfile                               #
# #         pathname, pathname to the specified program                          #
# #         signal, send this signal to pathname                                 #
# #                                                                              #
# # Return values (as defined by LSB exit codes):                                #
# #       0 - program (pathname) has stopped/is already stopped or a             #
# #           running program has been sent specified signal and stopped         #
# #           successfully                                                       #
# #       1 - generic or unspecified error                                       #
# #       2 - invalid or excessive argument(s)                                   #
# #       5 - program is not installed                                           #
# #       7 - program is not running and a signal was supplied                   #
# ################################################################################
# killproc()
# {
#     local pidfile
#     local program
#     local prefix
#     local progname
#     local signal="-TERM"
#     local fallback="-KILL"
#     local nosig
#     local pidlist
#     local retval
#     local pid
#     local delay="30"
#     local piddead
#     local dtime
# 
#     # Process arguments
#     while true; do
#         case "${1}" in
#             -p)
#                 pidfile="${2}"
#                 shift 2
#                 ;;
#  
#              *)
#                  program="${1}"
#                  if [ -n "${2}" ]; then
#                      signal="${2}"
#                      fallback=""
#                  else
#                      nosig=1
#                  fi
# 
#                  # Error on additional arguments
#                  if [ -n "${3}" ]; then
#                      return 2
#                  else 
#                      break
#                  fi                 
#                  ;;
#         esac
#     done
# 
#     # Check for a valid program
#     if [ ! -e "${program}" ]; then return 5; fi
# 
#     # Check for a valid signal
#     check_signal "${signal}"
#     if [ "${?}" -ne "0" ]; then return 2; fi
# 
#     # Get a list of pids
#     if [ -z "${pidfile}" ]; then
#         # determine the pid by discovery
#         pidlist=`pidofproc "${1}"`
#         retval="${?}"
#     else
#         # The PID file contains the needed PIDs
#         # Note that by LSB requirement, the path must be given to pidofproc,
#         # however, it is not used by the current implementation or standard.
#         pidlist=`pidofproc -p "${pidfile}" "${1}"`
#         retval="${?}"
#     fi
# 
#     # Return a value ONLY
#     # It is the init script's (or distribution's functions) responsibilty
#     # to log messages!
#     case "${retval}" in
# 
#         0)
#             # Program is running correctly
#             # Do nothing here, let killproc continue.
#             ;;
# 
#         1)
#             # Program is not running, but an invalid pid file exists
#             # Remove the pid file.
#             rm -f "${pidfile}"
# 
#             # This is only a success if no signal was passed.
#             if [ -n "${nosig}" ]; then
#                 return 0
#             else
#                 return 7
#             fi
#             ;;
# 
#         3)
#             # Program is not running and no pidfile exists
#             # This is only a success if no signal was passed.
#             if [ -n "${nosig}" ]; then
#                 return 0
#             else
#                 return 7
#             fi
#             ;;
# 
#         *)
#             # Others as returned by status values shall not be interpreted
#             # and returned as an unspecified error.
#             return 1
#             ;;
#     esac
# 
#     # Perform different actions for exit signals and control signals
#     check_sig_type "${signal}"
# 
#     if [ "${?}" -eq "0" ]; then # Signal is used to terminate the program
# 
#         # Account for empty pidlist (pid file still exists and no 
#         # signal was given)
#         if [ "${pidlist}" != "" ]; then
# 
#             # Kill the list of pids
#             for pid in ${pidlist}; do
# 
#                 kill -0 "${pid}" 2> /dev/null
# 
#                 if [ "${?}" -ne "0" ]; then
#                     # Process is dead, continue to next and assume all is well
#                     continue
#                 else
#                     kill "${signal}" "${pid}" 2> /dev/null
# 
#                     # Wait up to ${delay}/10 seconds to for "${pid}" to 
#                     # terminate in 10ths of a second
# 
#                     while [ "${delay}" -ne "0" ]; do
#                         kill -0 "${pid}" 2> /dev/null || piddead="1"
#                         if [ "${piddead}" = "1" ]; then break; fi
#                         sleep 0.1
#                         delay="$(( ${delay} - 1 ))"
#                     done
# 
#                     # If a fallback is set, and program is still running, then
#                     # use the fallback
#                     if [ -n "${fallback}" -a "${piddead}" != "1" ]; then
#                         kill "${fallback}" "${pid}" 2> /dev/null
#                         sleep 1
#                         # Check again, and fail if still running
#                         kill -0 "${pid}" 2> /dev/null && return 1
#                     fi
#                 fi
#             done
#         fi
# 
#         # Check for and remove stale PID files.
#         if [ -z "${pidfile}" ]; then
#             # Find the basename of $program
#             prefix=`echo "${program}" | sed 's/[^/]*$//'`
#             progname=`echo "${program}" | sed "s@${prefix}@@"`
# 
#             if [ -e "/run/${progname}.pid" ]; then
#                 rm -f "/run/${progname}.pid" 2> /dev/null
#             fi
#         else
#             if [ -e "${pidfile}" ]; then rm -f "${pidfile}" 2> /dev/null; fi
#         fi
# 
#     # For signals that do not expect a program to exit, simply
#     # let kill do its job, and evaluate kill's return for value
# 
#     else # check_sig_type - signal is not used to terminate program
#         for pid in ${pidlist}; do
#             kill "${signal}" "${pid}"
#             if [ "${?}" -ne "0" ]; then return 1; fi
#         done
#     fi
# }
# 
# ################################################################################
# # pidofproc()                                                                  #
# # Usage: pidofproc [-p pidfile] pathname                                       #
# #                                                                              #
# # Purpose: This function returns one or more pid(s) for a particular daemon    #
# #                                                                              #
# # Inputs: -p pidfile, use the specified pidfile instead of pidof               #
# #         pathname, path to the specified program                              #
# #                                                                              #
# # Return values (as defined by LSB status codes):                              #
# #       0 - Success (PIDs to stdout)                                           #
# #       1 - Program is dead, PID file still exists (remaining PIDs output)     #
# #       3 - Program is not running (no output)                                 #
# ################################################################################
# pidofproc()
# {
#     local pidfile
#     local program
#     local prefix
#     local progname
#     local pidlist
#     local lpids
#     local exitstatus="0"
# 
#     # Process arguments
#     while true; do
#         case "${1}" in
# 
#             -p)
#                 pidfile="${2}"
#                 shift 2
#                 ;;
# 
#             *)
#                 program="${1}"
#                 if [ -n "${2}" ]; then
#                     # Too many arguments
#                     # Since this is status, return unknown
#                     return 4
#                 else
#                     break
#                 fi
#                 ;;
#         esac
#     done
# 
#     # If a PID file is not specified, try and find one.
#     if [ -z "${pidfile}" ]; then
#         # Get the program's basename
#         prefix=`echo "${program}" | sed 's/[^/]*$//'`
# 
#         if [ -z "${prefix}" ]; then 
#            progname="${program}"
#         else
#            progname=`echo "${program}" | sed "s@${prefix}@@"`
#         fi
# 
#         # If a PID file exists with that name, assume that is it.
#         if [ -e "/run/${progname}.pid" ]; then
#             pidfile="/run/${progname}.pid"
#         fi
#     fi
# 
#     # If a PID file is set and exists, use it.
#     if [ -n "${pidfile}" -a -e "${pidfile}" ]; then
# 
#         # Use the value in the first line of the pidfile
#         pidlist=`/bin/head -n1 "${pidfile}"`
#         # This can optionally be written as 'sed 1q' to repalce 'head -n1'
#         # should LFS move /bin/head to /usr/bin/head
#     else
#         # Use pidof
#         pidlist=`pidof "${program}"`
#     fi
# 
#     # Figure out if all listed PIDs are running.
#     for pid in ${pidlist}; do
#         kill -0 ${pid} 2> /dev/null
# 
#         if [ "${?}" -eq "0" ]; then
#             lpids="${lpids}${pid} "
#         else
#             exitstatus="1"
#         fi
#     done
# 
#     if [ -z "${lpids}" -a ! -f "${pidfile}" ]; then
#         return 3
#     else
#         echo "${lpids}"
#         return "${exitstatus}"
#     fi
# }
# 
# ################################################################################
# # statusproc()                                                                 #
# # Usage: statusproc [-p pidfile] pathname                                      #
# #                                                                              #
# # Purpose: This function prints the status of a particular daemon to stdout    #
# #                                                                              #
# # Inputs: -p pidfile, use the specified pidfile instead of pidof               #
# #         pathname, path to the specified program                              #
# #                                                                              #
# # Return values:                                                               #
# #       0 - Status printed                                                     #
# #       1 - Input error. The daemon to check was not specified.                #
# ################################################################################
# statusproc()
# {
#    local pidfile
#    local pidlist
# 
#    if [ "${#}" = "0" ]; then
#       echo "Usage: statusproc [-p pidfle] {program}"
#       exit 1
#    fi
# 
#    # Process arguments
#    while true; do
#        case "${1}" in
# 
#            -p)
#                pidfile="${2}"
#                shift 2
#                ;;
# 
#            *)
#                if [ -n "${2}" ]; then
#                    echo "Too many arguments"
#                    return 1
#                else
#                    break
#                fi
#                ;;
#        esac
#    done
# 
#    if [ -n "${pidfile}" ]; then
#       pidlist=`pidofproc -p "${pidfile}" $@`
#    else
#       pidlist=`pidofproc $@`
#    fi
# 
#    # Trim trailing blanks
#    pidlist=`echo "${pidlist}" | sed -r 's/ +$//'`
# 
#    base="${1##*/}"
# 
#    if [ -n "${pidlist}" ]; then
#       /bin/echo -e "${INFO}${base} is running with Process" \
#          "ID(s) ${pidlist}.${NORMAL}"
#    else
#       if [ -n "${base}" -a -e "/run/${base}.pid" ]; then
#          /bin/echo -e "${WARNING}${1} is not running but" \
#             "/run/${base}.pid exists.${NORMAL}"
#       else
#          if [ -n "${pidfile}" -a -e "${pidfile}" ]; then
#             /bin/echo -e "${WARNING}${1} is not running" \
#                "but ${pidfile} exists.${NORMAL}"
#          else
#             /bin/echo -e "${INFO}${1} is not running.${NORMAL}"
#          fi
#       fi
#    fi
# }
# 
# ################################################################################
# # timespec()                                                                   #
# #                                                                              #
# # Purpose: An internal utility function to format a timestamp                  #
# #          a boot log file.  Sets the STAMP variable.                          #
# #                                                                              #
# # Return value: Not used                                                       #
# ################################################################################
# timespec()
# {
#    STAMP="$(echo `date +"%b %d %T %:z"` `hostname`) "
#    return 0
# }
# 
# ################################################################################
# # log_success_msg()                                                            #
# # Usage: log_success_msg ["message"]                                           #
# #                                                                              #
# # Purpose: Print a successful status message to the screen and                 #
# #          a boot log file.                                                    #
# #                                                                              #
# # Inputs: $@ - Message                                                         #
# #                                                                              #
# # Return values: Not used                                                      #
# ################################################################################
# log_success_msg()
# {
#     /bin/echo -n -e "${BMPREFIX}${@}"
#     /bin/echo -e "${CURS_ZERO}${SUCCESS_PREFIX}${SET_COL}${SUCCESS_SUFFIX}"
# 
#     # Strip non-printable characters from log file
#     logmessage=`echo "${@}" | sed 's/\\\033[^a-zA-Z]*.//g'`
# 
#     timespec
#     /bin/echo -e "${STAMP} ${logmessage} OK" >> ${BOOTLOG}
#     
#     return 0
# }
# 
# log_success_msg2()
# {
#     /bin/echo -n -e "${BMPREFIX}${@}"
#     /bin/echo -e "${CURS_ZERO}${SUCCESS_PREFIX}${SET_COL}${SUCCESS_SUFFIX}"
# 
#     echo " OK" >> ${BOOTLOG}
#     
#     return 0
# }
# 
# ################################################################################
# # log_failure_msg()                                                            #
# # Usage: log_failure_msg ["message"]                                           #
# #                                                                              #
# # Purpose: Print a failure status message to the screen and                    #
# #          a boot log file.                                                    #
# #                                                                              #
# # Inputs: $@ - Message                                                         #
# #                                                                              #
# # Return values: Not used                                                      #
# ################################################################################
# log_failure_msg()
# {
#     /bin/echo -n -e "${BMPREFIX}${@}"
#     /bin/echo -e "${CURS_ZERO}${FAILURE_PREFIX}${SET_COL}${FAILURE_SUFFIX}"
# 
#     # Strip non-printable characters from log file
# 
#     timespec
#     logmessage=`echo "${@}" | sed 's/\\\033[^a-zA-Z]*.//g'`
#     /bin/echo -e "${STAMP} ${logmessage} FAIL" >> ${BOOTLOG}
#     
#     return 0
# }
# 
# log_failure_msg2()
# {
#     /bin/echo -n -e "${BMPREFIX}${@}"
#     /bin/echo -e "${CURS_ZERO}${FAILURE_PREFIX}${SET_COL}${FAILURE_SUFFIX}"
# 
#     echo "FAIL" >> ${BOOTLOG}
#     
#     return 0
# }
# 
# ################################################################################
# # log_warning_msg()                                                            #
# # Usage: log_warning_msg ["message"]                                           #
# #                                                                              #
# # Purpose: Print a warning status message to the screen and                    #
# #          a boot log file.                                                    #
# #                                                                              #
# # Return values: Not used                                                      #
# ################################################################################
# log_warning_msg()
# {
#     /bin/echo -n -e "${BMPREFIX}${@}"
#     /bin/echo -e "${CURS_ZERO}${WARNING_PREFIX}${SET_COL}${WARNING_SUFFIX}"
# 
#     # Strip non-printable characters from log file
#     logmessage=`echo "${@}" | sed 's/\\\033[^a-zA-Z]*.//g'`
#     timespec
#     /bin/echo -e "${STAMP} ${logmessage} WARN" >> ${BOOTLOG}
#     
#     return 0
# }
# 
# log_skip_msg()
# {
#     /bin/echo -n -e "${BMPREFIX}${@}"
#     /bin/echo -e "${CURS_ZERO}${SKIP_PREFIX}${SET_COL}${SKIP_SUFFIX}"
# 
#     # Strip non-printable characters from log file
#     logmessage=`echo "${@}" | sed 's/\\\033[^a-zA-Z]*.//g'`
#     /bin/echo "SKIP" >> ${BOOTLOG}
#     
#     return 0
# }
# 
# ################################################################################
# # log_info_msg()                                                               #
# # Usage: log_info_msg message                                                  #
# #                                                                              #
# # Purpose: Print an information message to the screen and                      #
# #          a boot log file.  Does not print a trailing newline character.      #
# #                                                                              #
# # Return values: Not used                                                      #
# ################################################################################
# log_info_msg()
# {
#     /bin/echo -n -e "${BMPREFIX}${@}"
# 
#     # Strip non-printable characters from log file
#     logmessage=`echo "${@}" | sed 's/\\\033[^a-zA-Z]*.//g'`
#     timespec
#     /bin/echo -n -e "${STAMP} ${logmessage}" >> ${BOOTLOG}
#     
#     return 0
# }
# 
# log_info_msg2()
# {
#     /bin/echo -n -e "${@}"
# 
#     # Strip non-printable characters from log file
#     logmessage=`echo "${@}" | sed 's/\\\033[^a-zA-Z]*.//g'`
#     /bin/echo -n -e "${logmessage}" >> ${BOOTLOG}
#     
#     return 0
# }
# 
# ################################################################################
# # evaluate_retval()                                                            #
# # Usage: Evaluate a return value and print success or failyure as appropriate  #
# #                                                                              #
# # Purpose: Convenience function to terminate an info message                   #
# #                                                                              #
# # Return values: Not used                                                      #
# ################################################################################
# evaluate_retval()
# {
#    local error_value="${?}"
# 
#    if [ ${error_value} = 0 ]; then
#       log_success_msg2
#    else
#       log_failure_msg2
#    fi
# }
# 
# ################################################################################
# # check_signal()                                                               #
# # Usage: check_signal [ -{signal} | {signal} ]                                 #
# #                                                                              #
# # Purpose: Check for a valid signal.  This is not defined by any LSB draft,    #
# #          however, it is required to check the signals to determine if the    #
# #          signals chosen are invalid arguments to the other functions.        #
# #                                                                              #
# # Inputs: Accepts a single string value in the form or -{signal} or {signal}   #
# #                                                                              #
# # Return values:                                                               #
# #       0 - Success (signal is valid                                           #
# #       1 - Signal is not valid                                                #
# ################################################################################
# check_signal()
# {
#     local valsig
# 
#     # Add error handling for invalid signals
#     valsig="-ALRM -HUP -INT -KILL -PIPE -POLL -PROF -TERM -USR1 -USR2"
#     valsig="${valsig} -VTALRM -STKFLT -PWR -WINCH -CHLD -URG -TSTP -TTIN"
#     valsig="${valsig} -TTOU -STOP -CONT -ABRT -FPE -ILL -QUIT -SEGV -TRAP"
#     valsig="${valsig} -SYS -EMT -BUS -XCPU -XFSZ -0 -1 -2 -3 -4 -5 -6 -8 -9"
#     valsig="${valsig} -11 -13 -14 -15"
# 
#     echo "${valsig}" | grep -- " ${1} " > /dev/null
# 
#     if [ "${?}" -eq "0" ]; then
#         return 0
#     else
#         return 1
#     fi
# }
# 
# ################################################################################
# # check_sig_type()                                                             #
# # Usage: check_signal [ -{signal} | {signal} ]                                 #
# #                                                                              #
# # Purpose: Check if signal is a program termination signal or a control signal #
# #          This is not defined by any LSB draft, however, it is required to    #
# #          check the signals to determine if they are intended to end a        #
# #          program or simply to control it.                                    #
# #                                                                              #
# # Inputs: Accepts a single string value in the form or -{signal} or {signal}   #
# #                                                                              #
# # Return values:                                                               #
# #       0 - Signal is used for program termination                             #
# #       1 - Signal is used for program control                                 #
# ################################################################################
# check_sig_type()
# {
#     local valsig
# 
#     # The list of termination signals (limited to generally used items)
#     valsig="-ALRM -INT -KILL -TERM -PWR -STOP -ABRT -QUIT -2 -3 -6 -9 -14 -15"
# 
#     echo "${valsig}" | grep -- " ${1} " > /dev/null
# 
#     if [ "${?}" -eq "0" ]; then
#         return 0
#     else
#         return 1
#     fi
# }
# 
# ################################################################################
# # wait_for_user()                                                              #
# #                                                                              #
# # Purpose: Wait for the user to respond if not a headless system               #
# #                                                                              #
# ################################################################################
# wait_for_user()
# {
#    # Wait for the user by default
#    [ "${HEADLESS=0}" = "0" ] && read ENTER
#    return 0
# }
# 
# ################################################################################
# # is_true()                                                                    #
# #                                                                              #
# # Purpose: Utility to test if a variable is true | yes | 1                     #
# #                                                                              #
# ################################################################################
# is_true()
# {
#    [ "$1" = "1" ] || [ "$1" = "yes" ] || [ "$1" = "true" ] ||  [ "$1" = "y" ] ||
#    [ "$1" = "t" ]
# }
# 
# # End /lib/lsb/init-functions
# 


#        D.3. /etc/rc.d/init.d/mountvirtfs  



# #!/bin/sh
# ########################################################################
# # Begin mountvirtfs
# #
# # Description : Mount proc, sysfs, and run
# #
# # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# ### BEGIN INIT INFO
# # Provides:            mountvirtfs
# # Required-Start:      $first
# # Should-Start:
# # Required-Stop:
# # Should-Stop:
# # Default-Start:       S
# # Default-Stop:
# # Short-Description:   Mounts /sys and /proc virtual (kernel) filesystems.
# #                      Mounts /run (tmpfs) and /dev (devtmpfs).
# # Description:         Mounts /sys and /proc virtual (kernel) filesystems.
# #                      Mounts /run (tmpfs) and /dev (devtmpfs).
# # X-LFS-Provided-By:   LFS
# ### END INIT INFO
# 
# . /lib/lsb/init-functions
# 
# case "${1}" in
#    start)
#       # Make sure /run is available before logging any messages
#       if ! mountpoint /run >/dev/null; then
#          mount /run || failed=1
#       fi
# 
#       mkdir -p /run/lock /run/shm
#       chmod 1777 /run/shm /run/lock
# 
#       log_info_msg "Mounting virtual file systems: ${INFO}/run" 
# 
#       if ! mountpoint /proc >/dev/null; then
#          log_info_msg2 " ${INFO}/proc"
#          mount -o nosuid,noexec,nodev /proc || failed=1
#       fi
# 
#       if ! mountpoint /sys >/dev/null; then
#          log_info_msg2 " ${INFO}/sys" 
#          mount -o nosuid,noexec,nodev /sys || failed=1
#       fi
# 
#       if ! mountpoint /dev >/dev/null; then
#          log_info_msg2 " ${INFO}/dev" 
#          mount -o mode=0755,nosuid /dev  || failed=1
#       fi
# 
#       ln -sfn /run/shm /dev/shm
#       
#       (exit ${failed})
#       evaluate_retval
#       exit $failed
#       ;;
# 
#    *)
#       echo "Usage: ${0} {start}"
#       exit 1
#       ;;
# esac
# 
# # End mountvirtfs
# 


#        D.4. /etc/rc.d/init.d/modules  



# #!/bin/sh
# ########################################################################
# # Begin modules
# #
# # Description : Module auto-loading script
# #
# # Authors     : Zack Winkles
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# ### BEGIN INIT INFO
# # Provides:            modules
# # Required-Start:      mountvirtfs
# # Should-Start:
# # Required-Stop:
# # Should-Stop:
# # Default-Start:       S
# # Default-Stop:
# # Short-Description:   Loads required modules.
# # Description:         Loads modules listed in /etc/sysconfig/modules.
# # X-LFS-Provided-By:   LFS
# ### END INIT INFO
# 
# # Assure that the kernel has module support.
# [ -e /proc/modules ] || exit 0
# 
# . /lib/lsb/init-functions
# 
# case "${1}" in
#    start)
#       # Exit if there's no modules file or there are no
#       # valid entries
#       [ -r /etc/sysconfig/modules ]             || exit 0
#       egrep -qv '^($|#)' /etc/sysconfig/modules || exit 0
# 
#       log_info_msg "Loading modules:" 
# 
#       # Only try to load modules if the user has actually given us
#       # some modules to load.
# 
#       while read module args; do
# 
#          # Ignore comments and blank lines.
#          case "$module" in
#             ""|"#"*) continue ;;
#          esac
# 
#          # Attempt to load the module, passing any arguments provided.
#          modprobe ${module} ${args} >/dev/null
# 
#          # Print the module name if successful, otherwise take note.
#          if [ $? -eq 0 ]; then
#             log_info_msg2 " ${module}" 
#          else
#             failedmod="${failedmod} ${module}"
#          fi
#       done < /etc/sysconfig/modules
# 
#       # Print a message about successfully loaded modules on the correct line.
#       log_success_msg2
# 
#       # Print a failure message with a list of any modules that 
#       # may have failed to load.
#       if [ -n "${failedmod}" ]; then
#          log_failure_msg "Failed to load modules:${failedmod}" 
#          exit 1
#       fi
#       ;;
# 
#    *)
#       echo "Usage: ${0} {start}"
#       exit 1
#       ;;
# esac
# 
# exit 0
# 
# # End modules
# 


#        D.5. /etc/rc.d/init.d/udev  



# #!/bin/sh
# ########################################################################
# # Begin udev
# #
# # Description : Udev cold-plugging script
# #
# # Authors     : Zack Winkles, Alexander E. Patrakov
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# ### BEGIN INIT INFO
# # Provides:            udev $time
# # Required-Start:      localnet
# # Should-Start:        modules
# # Required-Stop:
# # Should-Stop:
# # Default-Start:       S
# # Default-Stop:
# # Short-Description:   Populates /dev with device nodes.
# # Description:         Mounts a tempfs on /dev and starts the udevd daemon.
# #                      Device nodes are created as defined by udev.
# # X-LFS-Provided-By:   LFS
# ### END INIT INFO
# 
# . /lib/lsb/init-functions
# 
# case "${1}" in
#    start)
#       log_info_msg "Populating /dev with device nodes... "
#       if ! grep -q '[[:space:]]sysfs' /proc/mounts; then
#          log_failure_msg2
#          msg="FAILURE:\n\nUnable to create "
#          msg="${msg}devices without a SysFS filesystem\n\n"
#          msg="${msg}After you press Enter, this system "
#          msg="${msg}will be halted and powered off.\n\n"
#          log_info_msg "$msg"
#          log_info_msg "Press Enter to continue..."
#          wait_for_user
#          /etc/rc.d/init.d/halt stop
#       fi
# 
#       # Start the udev daemon to continually watch for, and act on,
#       # uevents
#       /sbin/udevd --daemon
# 
#       # Now traverse /sys in order to "coldplug" devices that have
#       # already been discovered
#       /sbin/udevadm trigger --action=add    --type=subsystems
#       /sbin/udevadm trigger --action=add    --type=devices
#       /sbin/udevadm trigger --action=change --type=devices
# 
#       # Now wait for udevd to process the uevents we triggered
#       if ! is_true "$OMIT_UDEV_SETTLE"; then
#          /sbin/udevadm settle
#       fi
# 
#       # If any LVM based partitions are on the system, ensure they
#       # are activated so they can be used.
#       if [ -x /sbin/vgchange ]; then /sbin/vgchange -a y >/dev/null; fi 
# 
#       log_success_msg2 
#       ;;
# 
#    *)
#       echo "Usage ${0} {start}"
#       exit 1
#       ;;
# esac
# 
# exit 0
# 
# # End udev
# 


#        D.6. /etc/rc.d/init.d/swap  



# #!/bin/sh
# ########################################################################
# # Begin swap
# #
# # Description : Swap Control Script
# #
# # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# ### BEGIN INIT INFO
# # Provides:            swap
# # Required-Start:      udev
# # Should-Start:        modules
# # Required-Stop:       localnet
# # Should-Stop:         $local_fs
# # Default-Start:       S
# # Default-Stop:        0 6
# # Short-Description:   Mounts and unmounts swap partitions.
# # Description:         Mounts and unmounts swap partitions defined in
# #                      /etc/fstab.
# # X-LFS-Provided-By:   LFS
# ### END INIT INFO
# 
# . /lib/lsb/init-functions
# 
# case "${1}" in
#    start)
#       log_info_msg "Activating all swap files/partitions..."
#       swapon -a
#       evaluate_retval
#       ;;
# 
#    stop)
#       log_info_msg "Deactivating all swap files/partitions..."
#       swapoff -a
#       evaluate_retval
#       ;;
# 
#    restart)
#       ${0} stop
#       sleep 1
#       ${0} start
#       ;;
# 
#    status)
#       log_success_msg "Retrieving swap status." 
#       swapon -s
#       ;;
# 
#    *)
#       echo "Usage: ${0} {start|stop|restart|status}"
#       exit 1
#       ;;
# esac
# 
# exit 0
# 
# # End swap
# 


#        D.7. /etc/rc.d/init.d/setclock  



# #!/bin/sh
# ########################################################################
# # Begin setclock
# #
# # Description : Setting Linux Clock
# #
# # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# ### BEGIN INIT INFO
# # Provides:            
# # Required-Start:
# # Should-Start:        modules
# # Required-Stop:
# # Should-Stop:         $syslog
# # Default-Start:       S
# # Default-Stop:
# # Short-Description:   Stores and restores time from the hardware clock
# # Description:         On boot, system time is obtained from hwclock.  The
# #                      hardware clock can also be set on shutdown.
# # X-LFS-Provided-By:   LFS
# ### END INIT INFO
# 
# . /lib/lsb/init-functions
# 
# [ -r /etc/sysconfig/clock ] && . /etc/sysconfig/clock
# 
# 
# case "${UTC}" in
#    yes|true|1)
#       CLOCKPARAMS="${CLOCKPARAMS} --utc"
#       ;;
# 
#    no|false|0)
#       CLOCKPARAMS="${CLOCKPARAMS} --localtime"
#       ;;
# 
# esac
# 
# case ${1} in
#    start)
#       hwclock --hctosys ${CLOCKPARAMS} >/dev/null
#       ;;
# 
#    stop)
#       log_info_msg "Setting hardware clock..."
#       hwclock --systohc ${CLOCKPARAMS} >/dev/null
#       evaluate_retval
#       ;;
# 
#    *)
#       echo "Usage: ${0} {start|stop}"
#       exit 1
#       ;;
# 
# esac
# 
# exit 0
# 


#        D.8. /etc/rc.d/init.d/checkfs  



# #!/bin/sh
# ########################################################################
# # Begin checkfs
# #
# # Description : File System Check
# #
# # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# #               A. Luebke - luebke@users.sourceforge.net
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# # Based on checkfs script from LFS-3.1 and earlier.
# #
# # From man fsck
# # 0    - No errors
# # 1    - File system errors corrected
# # 2    - System should be rebooted
# # 4    - File system errors left uncorrected
# # 8    - Operational error
# # 16   - Usage or syntax error
# # 32   - Fsck canceled by user request
# # 128  - Shared library error
# #
# #########################################################################
# 
# ### BEGIN INIT INFO
# # Provides:            checkfs
# # Required-Start:      udev swap
# # Should-Start:
# # Required-Stop:
# # Should-Stop:
# # Default-Start:       S
# # Default-Stop:
# # Short-Description:   Checks local filesystems before mounting.
# # Description:         Checks local filesystmes before mounting.
# # X-LFS-Provided-By:   LFS
# ### END INIT INFO
# 
# . /lib/lsb/init-functions
# 
# case "${1}" in
#    start)
#       if [ -f /fastboot ]; then
#          msg="/fastboot found, will omit "
#          msg="${msg} file system checks as requested.\n"
#          log_info_msg "${msg}"
#          exit 0
#       fi
# 
#       log_info_msg "Mounting root file system in read-only mode... "
#       mount -n -o remount,ro / >/dev/null
# 
#       if [ ${?} != 0 ]; then
#          log_failure_msg2
#          msg="\n\nCannot check root "
#          msg="${msg}filesystem because it could not be mounted "
#          msg="${msg}in read-only mode.\n\n"
#          msg="${msg}After you press Enter, this system will be "
#          msg="${msg}halted and powered off.\n\n"
#          log_failure_msg "${msg}"
# 
#          log_info_msg "Press Enter to continue..." 
#          wait_for_user
#          /etc/rc.d/init.d/halt stop
#       else
#          log_success_msg2
#       fi
# 
#       if [ -f /forcefsck ]; then
#          msg="/forcefsck found, forcing file" 
#          msg="${msg} system checks as requested."
#          log_success_msg "$msg"
#          options="-f"
#       else
#          options=""
#       fi
# 
#       log_info_msg "Checking file systems..."
#       # Note: -a option used to be -p; but this fails e.g. on fsck.minix
#       if is_true "$VERBOSE_FSCK"; then
#         fsck ${options} -a -A -C -T
#       else
#         fsck ${options} -a -A -C -T >/dev/null
#       fi
# 
#       error_value=${?}
# 
#       if [ "${error_value}" = 0 ]; then
#          log_success_msg2
#       fi
# 
#       if [ "${error_value}" = 1 ]; then
#          msg="\nWARNING:\n\nFile system errors "
#          msg="${msg}were found and have been corrected.\n"
#          msg="${msg}      You may want to double-check that "
#          msg="${msg}everything was fixed properly."
#          log_warning_msg "$msg"
#       fi
# 
#       if [ "${error_value}" = 2 -o "${error_value}" = 3 ]; then
#          msg="\nWARNING:\n\nFile system errors "
#          msg="${msg}were found and have been been "
#          msg="${msg}corrected, but the nature of the "
#          msg="${msg}errors require this system to be rebooted.\n\n"
#          msg="${msg}After you press enter, "
#          msg="${msg}this system will be rebooted\n\n"
#          log_failure_msg "$msg"
# 
#          log_info_msg "Press Enter to continue..." 
#          wait_for_user
#          reboot -f
#       fi
# 
#       if [ "${error_value}" -gt 3 -a "${error_value}" -lt 16 ]; then
#          msg="\nFAILURE:\n\nFile system errors "
#          msg="${msg}were encountered that could not be "
#          msg="${msg}fixed automatically.\nThis system "
#          msg="${msg}cannot continue to boot and will "
#          msg="${msg}therefore be halted until those "
#          msg="${msg}errors are fixed manually by a "
#          msg="${msg}System Administrator.\n\n"
#          msg="${msg}After you press Enter, this system will be "
#          msg="${msg}halted and powered off.\n\n"
#          log_failure_msg "$msg"
# 
#          log_info_msg "Press Enter to continue..." 
#          wait_for_user
#          /etc/rc.d/init.d/halt stop
#       fi
# 
#       if [ "${error_value}" -ge 16 ]; then
#          msg="FAILURE:\n\nUnexpected failure "
#          msg="${msg}running fsck.  Exited with error "
#          msg="${msg} code: ${error_value}.\n"
#          log_info_msg $msg
#          exit ${error_value}
#       fi
# 
#       exit 0
#       ;;
#    *)
#       echo "Usage: ${0} {start}"
#       exit 1
#       ;;
# esac
# 
# # End checkfs
# 


#        D.9. /etc/rc.d/init.d/mountfs  



# #!/bin/sh
# ########################################################################
# # Begin mountfs
# #
# # Description : File System Mount Script
# #
# # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# ### BEGIN INIT INFO
# # Provides:            $local_fs
# # Required-Start:      udev checkfs
# # Should-Start:        modules
# # Required-Stop:       localnet
# # Should-Stop:
# # Default-Start:       S
# # Default-Stop:        0 6
# # Short-Description:   Mounts/unmounts local filesystems defined in /etc/fstab.
# # Description:         Remounts root filesystem read/write and mounts all
# #                      remaining local filesystems defined in /etc/fstab on
# #                      start.  Remounts root filesystem read-only and unmounts
# #                      remaining filesystems on stop.
# # X-LFS-Provided-By:   LFS
# ### END INIT INFO
# 
# . /lib/lsb/init-functions
# 
# case "${1}" in
#    start)
#       log_info_msg "Remounting root file system in read-write mode..."
#       mount --options remount,rw / >/dev/null
#       evaluate_retval
# 
#       # Remove fsck-related file system watermarks.
#       rm -f /fastboot /forcefsck
# 
#       # Make sure /dev/pts exists
#       mkdir -p /dev/pts
# 
#       # This will mount all filesystems that do not have _netdev in
#       # their option list.  _netdev denotes a network filesystem.
# 
#       log_info_msg "Mounting remaining file systems..."
#       failed=0
#       mount --all --test-opts no_netdev >/dev/null || failed=1
#       evaluate_retval
#       exit $failed
#       ;;
# 
#    stop)
#       # Don't unmount virtual file systems like /run
#       log_info_msg "Unmounting all other currently mounted file systems..."
#       # Ensure any loop devies are removed
#       losetup -D
#       umount --all --detach-loop --read-only \
#              --types notmpfs,nosysfs,nodevtmpfs,noproc,nodevpts >/dev/null
#       evaluate_retval
# 
#       # Make sure / is mounted read only (umount bug)
#       mount --options remount,ro /
# 
#       # Make all LVM volume groups unavailable, if appropriate
#       # This fails if swap or / are on an LVM partition
#       #if [ -x /sbin/vgchange ]; then /sbin/vgchange -an > /dev/null; fi
#       ;;
# 
#    *)
#       echo "Usage: ${0} {start|stop}"
#       exit 1
#       ;;
# esac
# 
# # End mountfs
# 


#        D.10. /etc/rc.d/init.d/udev_retry  



# #!/bin/sh
# ########################################################################
# # Begin udev_retry
# #
# # Description : Udev cold-plugging script (retry)
# #
# # Authors     : Alexander E. Patrakov
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #               Bryan Kadzban - 
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# ### BEGIN INIT INFO
# # Provides:            udev_retry
# # Required-Start:      udev
# # Should-Start:        $local_fs cleanfs
# # Required-Stop:
# # Should-Stop:
# # Default-Start:       S
# # Default-Stop:
# # Short-Description:   Replays failed uevents and creates additional devices.
# # Description:         Replays any failed uevents that were skipped due to
# #                      slow hardware initialization, and creates those needed
# #                      device nodes
# # X-LFS-Provided-By:   LFS
# ### END INIT INFO
# 
# . /lib/lsb/init-functions
# 
# case "${1}" in
#    start)
#       log_info_msg "Retrying failed uevents, if any..."
# 
#       # As of udev-186, the --run option is no longer valid
#       #rundir=$(/sbin/udevadm info --run)
#       rundir=/run/udev
#       # From Debian: "copy the rules generated before / was mounted
#       # read-write":
#     
#       for file in ${rundir}/tmp-rules--*; do
#          dest=${file##*tmp-rules--}
#          [ "$dest" = '*' ] && break
#          cat $file >> /etc/udev/rules.d/$dest
#          rm -f $file
#       done
# 
#       # Re-trigger the uevents that may have failed, 
#       # in hope they will succeed now
#       /bin/sed -e 's/#.*$//' /etc/sysconfig/udev_retry | /bin/grep -v '^$' | \
#       while read line ; do
#          for subsystem in $line ; do
#             /sbin/udevadm trigger --subsystem-match=$subsystem --action=add
#          done
#       done
# 
#       # Now wait for udevd to process the uevents we triggered
#       if ! is_true "$OMIT_UDEV_RETRY_SETTLE"; then
#          /sbin/udevadm settle
#       fi
# 
#       evaluate_retval
#       ;;
# 
#    *)
#       echo "Usage ${0} {start}"
#       exit 1
#       ;;
# esac
# 
# exit 0
# 
# # End udev_retry
# 


#        D.11. /etc/rc.d/init.d/cleanfs  



# #!/bin/sh
# ########################################################################
# # Begin cleanfs
# #
# # Description : Clean file system
# #
# # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# ### BEGIN INIT INFO
# # Provides:            cleanfs
# # Required-Start:      $local_fs
# # Should-Start:
# # Required-Stop:
# # Should-Stop:
# # Default-Start:       S
# # Default-Stop:
# # Short-Description:   Cleans temporary directories early in the boot process.
# # Description:         Cleans temporary directories /run, /var/lock, and
# #                      optionally, /tmp.  cleanfs also creates /run/utmp 
# #                      and any files defined in /etc/sysconfig/createfiles.
# # X-LFS-Provided-By:   LFS
# ### END INIT INFO
# 
# . /lib/lsb/init-functions
# 
# # Function to create files/directory on boot.
# create_files() 
# {
#    # Input to file descriptor 9 and output to stdin (redirection)
#    exec 9>&0 < /etc/sysconfig/createfiles
# 
#    while read name type perm usr grp dtype maj min junk
#    do
#       # Ignore comments and blank lines.
#       case "${name}" in
#          ""|\#*) continue ;;
#       esac
# 
#       # Ignore existing files.
#       if [ ! -e "${name}" ]; then
#          # Create stuff based on its type.
#          case "${type}" in
#             dir)
#                mkdir "${name}"
#                ;;
#             file)
#                :> "${name}"
#                ;;
#             dev)
#                case "${dtype}" in
#                   char)
#                      mknod "${name}" c ${maj} ${min}
#                      ;;
#                   block)
#                      mknod "${name}" b ${maj} ${min}
#                      ;;
#                   pipe)
#                      mknod "${name}" p
#                      ;;
#                   *) 
#                      log_warning_msg "\nUnknown device type: ${dtype}" 
#                      ;;
#                esac
#                ;;
#             *)
#                log_warning_msg "\nUnknown type: ${type}" 
#                continue
#                ;;
#          esac
# 
#          # Set up the permissions, too.
#          chown ${usr}:${grp} "${name}"
#          chmod ${perm} "${name}"
#       fi
#    done
# 
#    # Close file descriptor 9 (end redirection)
#    exec 0>&9 9>&-
#    return 0
# }
# 
# case "${1}" in
#    start)
#       log_info_msg "Cleaning file systems:" 
# 
#       if [ "${SKIPTMPCLEAN}" = "" ]; then
#          log_info_msg2 " /tmp" 
#          cd /tmp &&
#          find . -xdev -mindepth 1 ! -name lost+found -delete || failed=1
#       fi
# 
#       > /run/utmp
# 
#       if grep -q '^utmp:' /etc/group ; then
#          chmod 664 /run/utmp
#          chgrp utmp /run/utmp
#       fi
# 
#       (exit ${failed})
#       evaluate_retval
# 
#       if egrep -qv '^(#|$)' /etc/sysconfig/createfiles 2>/dev/null; then
#          log_info_msg "Creating files and directories... "
#          create_files      # Always returns 0
#          evaluate_retval
#       fi
# 
#       exit $failed
#       ;;
#    *)
#       echo "Usage: ${0} {start}"
#       exit 1
#       ;;
# esac
# 
# # End cleanfs
# 


#        D.12. /etc/rc.d/init.d/console  



# #!/bin/sh
# ########################################################################
# # Begin console
# #
# # Description : Sets keymap and screen font
# #
# # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# #               Alexander E. Patrakov
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# ### BEGIN INIT INFO
# # Provides:            console
# # Required-Start:      $local_fs
# # Should-Start:        udev_retry
# # Required-Stop:
# # Should-Stop:
# # Default-Start:       S
# # Default-Stop:
# # Short-Description:   Sets up a localised console.
# # Description:         Sets up fonts and language settings for the user's
# #                      local as defined by /etc/sysconfig/console.
# # X-LFS-Provided-By:   LFS
# ### END INIT INFO
# 
# . /lib/lsb/init-functions
# 
# # Native English speakers probably don't have /etc/sysconfig/console at all
# [ -r /etc/sysconfig/console ] && . /etc/sysconfig/console
# 
# is_true() 
# {
#    [ "$1" = "1" ] || [ "$1" = "yes" ] || [ "$1" = "true" ]
# }
# 
# failed=0
# 
# case "${1}" in
#    start)
#       # See if we need to do anything
#       if [ -z "${KEYMAP}"         ] && [ -z "${KEYMAP_CORRECTIONS}" ] &&
#          [ -z "${FONT}"           ] && [ -z "${LEGACY_CHARSET}"     ] &&     
#          ! is_true "${UNICODE}"; then 
#          exit 0
#       fi
# 
#       # There should be no bogus failures below this line!
#       log_info_msg "Setting up Linux console..."
# 
#       # Figure out if a framebuffer console is used
#       [ -d /sys/class/graphics/fb0 ] && use_fb=1 || use_fb=0
# 
#       # Figure out the command to set the console into the
#       # desired mode
#       is_true "${UNICODE}" &&
#          MODE_COMMAND="echo -en '\033%G' && kbd_mode -u" ||
#          MODE_COMMAND="echo -en '\033%@\033(K' && kbd_mode -a"
# 
#       # On framebuffer consoles, font has to be set for each vt in
#       # UTF-8 mode. This doesn't hurt in non-UTF-8 mode also.
# 
#       ! is_true "${use_fb}" || [ -z "${FONT}" ] ||
#          MODE_COMMAND="${MODE_COMMAND} && setfont ${FONT}"
# 
#       # Apply that command to all consoles mentioned in
#       # /etc/inittab. Important: in the UTF-8 mode this should
#       # happen before setfont, otherwise a kernel bug will
#       # show up and the unicode map of the font will not be
#       # used.
# 
#       for TTY in `grep '^[^#].*respawn:/sbin/agetty' /etc/inittab |
#          grep -o '\btty[[:digit:]]*\b'`
#       do
#          openvt -f -w -c ${TTY#tty} -- \
#             /bin/sh -c "${MODE_COMMAND}" || failed=1
#       done
# 
#       # Set the font (if not already set above) and the keymap
#       [ "${use_fb}" == "1" ] || [ -z "${FONT}" ] || setfont $FONT || failed=1
# 
#       [ -z "${KEYMAP}" ] ||
#          loadkeys ${KEYMAP} >/dev/null 2>&1 ||
#          failed=1
#       
#       [ -z "${KEYMAP_CORRECTIONS}" ] ||
#          loadkeys ${KEYMAP_CORRECTIONS} >/dev/null 2>&1 ||
#          failed=1
# 
#       # Convert the keymap from $LEGACY_CHARSET to UTF-8
#       [ -z "$LEGACY_CHARSET" ] ||
#          dumpkeys -c "$LEGACY_CHARSET" | loadkeys -u >/dev/null 2>&1 ||
#          failed=1
# 
#       # If any of the commands above failed, the trap at the
#       # top would set $failed to 1
#       ( exit $failed ) 
#       evaluate_retval
# 
#       exit $failed
#       ;;              
# 
#    *)                 
#       echo "Usage:  ${0} {start}"
#       exit 1          
#       ;;              
# esac
# 
# # End console
# 


#        D.13. /etc/rc.d/init.d/localnet  



# #!/bin/sh
# ########################################################################
# # Begin localnet
# #
# # Description : Loopback device
# #
# # Authors     : Gerard Beekmans  - gerard AT linuxfromscratch D0T org
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# ### BEGIN INIT INFO
# # Provides:            localnet
# # Required-Start:      mountvirtfs
# # Should-Start:        modules
# # Required-Stop:
# # Should-Stop:
# # Default-Start:       S
# # Default-Stop:        0 6
# # Short-Description:   Starts the local network.
# # Description:         Sets the hostname of the machine and starts the
# #                      loopback interface.
# # X-LFS-Provided-By:   LFS
# ### END INIT INFO
# 
# . /lib/lsb/init-functions
# [ -r /etc/sysconfig/network ] && . /etc/sysconfig/network
# [ -r /etc/hostname ] && HOSTNAME=`cat /etc/hostname`
# 
# case "${1}" in
#    start)
#       log_info_msg "Bringing up the loopback interface..."
#       ip addr add 127.0.0.1/8 label lo dev lo
#       ip link set lo up
#       evaluate_retval
# 
#       log_info_msg "Setting hostname to ${HOSTNAME}..."
#       hostname ${HOSTNAME}
#       evaluate_retval
#       ;;
# 
#    stop)
#       log_info_msg "Bringing down the loopback interface..."
#       ip link set lo down
#       evaluate_retval
#       ;;
# 
#    restart)
#       ${0} stop
#       sleep 1
#       ${0} start
#       ;;
# 
#    status)
#       echo "Hostname is: $(hostname)"
#       ip link show lo
#       ;;
# 
#    *)
#       echo "Usage: ${0} {start|stop|restart|status}"
#       exit 1
#       ;;
# esac
# 
# exit 0
# 
# # End localnet
# 


#        D.14. /etc/rc.d/init.d/sysctl  



# #!/bin/sh
# ########################################################################
# # Begin sysctl
# #
# # Description : File uses /etc/sysctl.conf to set kernel runtime
# #               parameters
# #
# # Authors     : Nathan Coulson (nathan AT linuxfromscratch D0T org)
# #               Matthew Burgress (matthew AT linuxfromscratch D0T org)
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# ### BEGIN INIT INFO
# # Provides:            sysctl
# # Required-Start:      mountvirtfs
# # Should-Start:        console
# # Required-Stop:
# # Should-Stop:
# # Default-Start:       S
# # Default-Stop:
# # Short-Description:   Makes changes to the proc filesystem
# # Description:         Makes changes to the proc filesystem as defined in
# #                      /etc/sysctl.conf.  See 'man sysctl(8)'.
# # X-LFS-Provided-By:   LFS
# ### END INIT INFO
# 
# . /lib/lsb/init-functions
# 
# case "${1}" in
#    start)
#       if [ -f "/etc/sysctl.conf" ]; then
#          log_info_msg "Setting kernel runtime parameters..."
#          sysctl -q -p
#          evaluate_retval
#       fi
#       ;;
# 
#    status)
#       sysctl -a
#       ;;
# 
#    *)
#       echo "Usage: ${0} {start|status}"
#       exit 1
#       ;;
# esac
# 
# exit 0
# 
# # End sysctl
# 


#        D.15. /etc/rc.d/init.d/sysklogd  



# #!/bin/sh
# ########################################################################
# # Begin sysklogd
# #
# # Description : Sysklogd loader
# #
# # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# ### BEGIN INIT INFO
# # Provides:            $syslog
# # Required-Start:      $first localnet
# # Should-Start:
# # Required-Stop:       $local_fs
# # Should-Stop:         sendsignals
# # Default-Start:       3 4 5
# # Default-Stop:        0 1 2 6
# # Short-Description:   Starts kernel and system log daemons.
# # Description:         Starts kernel and system log daemons.
# #                      /etc/fstab.
# # X-LFS-Provided-By:   LFS
# ### END INIT INFO
# 
# # Note: sysklogd is not started in runlevel 2 due to possible
# # remote logging configurations
# 
# . /lib/lsb/init-functions
# 
# case "${1}" in
#    start)
#       log_info_msg "Starting system log daemon..."
#       parms=${SYSKLOGD_PARMS-'-m 0'}
#       start_daemon /sbin/syslogd $parms
#       evaluate_retval
# 
#       log_info_msg "Starting kernel log daemon..."
#       start_daemon /sbin/klogd
#       evaluate_retval
#       ;;
# 
#    stop)
#       log_info_msg "Stopping kernel log daemon..."
#       killproc /sbin/klogd
#       evaluate_retval
# 
#       log_info_msg "Stopping system log daemon..."
#       killproc /sbin/syslogd
#       evaluate_retval
#       ;;
# 
#    reload)
#       log_info_msg "Reloading system log daemon config file..."
#       pid=`pidofproc syslogd`
#       kill -HUP "${pid}"
#       evaluate_retval
#       ;;
# 
#    restart)
#       ${0} stop
#       sleep 1
#       ${0} start
#       ;;
# 
#    status)
#       statusproc /sbin/syslogd
#       statusproc klogd
#       ;;
# 
#    *)
#       echo "Usage: ${0} {start|stop|reload|restart|status}"
#       exit 1
#       ;;
# esac
# 
# exit 0
# 
# # End sysklogd
# 


#        D.16. /etc/rc.d/init.d/network  



# #!/bin/sh
# ########################################################################
# # Begin network
# #
# # Description : Network Control Script
# #
# # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# #               Nathan Coulson - nathan AT linuxfromscratch D0T org
# #               Kevin P. Fleming - kpfleming@linuxfromscratch.org
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# ### BEGIN INIT INFO
# # Provides:            $network
# # Required-Start:      $local_fs localnet swap
# # Should-Start:        $syslog firewalld iptables nftables
# # Required-Stop:       $local_fs localnet swap
# # Should-Stop:         $syslog firewalld iptables nftables
# # Default-Start:       3 4 5
# # Default-Stop:        0 1 2 6
# # Short-Description:   Starts and configures network interfaces.
# # Description:         Starts and configures network interfaces.
# # X-LFS-Provided-By:   LFS
# ### END INIT INFO
# 
# case "${1}" in
#    start)
#       # Start all network interfaces
#       for file in /etc/sysconfig/ifconfig.*
#       do
#          interface=${file##*/ifconfig.}
# 
#          # Skip if $file is * (because nothing was found)
#          if [ "${interface}" = "*" ]
#          then
#             continue
#          fi
# 
#          /sbin/ifup ${interface}
#       done
#       ;;
# 
#    stop)
#       # Unmount any network mounted file systems
#        umount --all --force --types nfs,cifs,nfs4 
# 
#       # Reverse list
#       net_files=""
#       for file in  /etc/sysconfig/ifconfig.*
#       do
#          net_files="${file} ${net_files}"
#       done
# 
#       # Stop all network interfaces
#       for file in ${net_files}
#       do
#          interface=${file##*/ifconfig.}
# 
#          # Skip if $file is * (because nothing was found)
#          if [ "${interface}" = "*" ]
#          then
#             continue
#          fi
# 
#          /sbin/ifdown ${interface}
#       done
#       ;;
# 
#    restart)
#       ${0} stop
#       sleep 1
#       ${0} start
#       ;;
# 
#    *)
#       echo "Usage: ${0} {start|stop|restart}"
#       exit 1
#       ;;
# esac
# 
# exit 0
# 
# # End network
# 


#        D.17. /etc/rc.d/init.d/sendsignals  



# #!/bin/sh
# ########################################################################
# # Begin sendsignals
# #
# # Description : Sendsignals Script
# #
# # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# ### BEGIN INIT INFO
# # Provides:            sendsignals
# # Required-Start:
# # Should-Start:
# # Required-Stop:       $local_fs swap localnet
# # Should-Stop:
# # Default-Start:
# # Default-Stop:        0 6
# # Short-Description:   Attempts to kill remaining processes.
# # Description:         Attempts to kill remaining processes.
# # X-LFS-Provided-By:   LFS
# ### END INIT INFO
# 
# . /lib/lsb/init-functions
# 
# case "${1}" in
#    stop)
#       log_info_msg "Sending all processes the TERM signal..."
#       killall5 -15
#       error_value=${?}
# 
#       sleep ${KILLDELAY}
# 
#       if [ "${error_value}" = 0 -o "${error_value}" = 2 ]; then
#          log_success_msg
#       else
#          log_failure_msg
#       fi
# 
#       log_info_msg "Sending all processes the KILL signal..."
#       killall5 -9
#       error_value=${?}
# 
#       sleep ${KILLDELAY}
# 
#       if [ "${error_value}" = 0 -o "${error_value}" = 2 ]; then
#          log_success_msg
#       else
#          log_failure_msg
#       fi
#       ;;
# 
#    *)
#       echo "Usage: ${0} {stop}"
#       exit 1
#       ;;
# 
# esac
# 
# exit 0
# 
# # End sendsignals
# 


#        D.18. /etc/rc.d/init.d/reboot  



# #!/bin/sh
# ########################################################################
# # Begin reboot
# #
# # Description : Reboot Scripts
# #
# # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# ### BEGIN INIT INFO
# # Provides:            reboot
# # Required-Start:
# # Should-Start:
# # Required-Stop:
# # Should-Stop:
# # Default-Start:       6
# # Default-Stop:
# # Short-Description:   Reboots the system.
# # Description:         Reboots the System.
# # X-LFS-Provided-By:   LFS
# ### END INIT INFO
# 
# . /lib/lsb/init-functions
# 
# case "${1}" in
#    stop)
#       log_info_msg "Restarting system..."
#       reboot -d -f -i
#       ;;
# 
#    *)
#       echo "Usage: ${0} {stop}"
#       exit 1
#       ;;
# 
# esac
# 
# # End reboot
# 


#        D.19. /etc/rc.d/init.d/halt  



# #!/bin/sh
# ########################################################################
# # Begin halt
# #
# # Description : Halt Script
# #
# # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# ### BEGIN INIT INFO
# # Provides:            halt
# # Required-Start:
# # Should-Start:
# # Required-Stop:
# # Should-Stop:
# # Default-Start:       0
# # Default-Stop:
# # Short-Description:   Halts the system.
# # Description:         Halts the System.
# # X-LFS-Provided-By:   LFS
# ### END INIT INFO
# 
# case "${1}" in
#    stop)
#       halt -d -f -i -p
#       ;;
# 
#    *)
#       echo "Usage: {stop}"
#       exit 1
#       ;;
# esac
# 
# # End halt
# 


#        D.20. /etc/rc.d/init.d/template  



# #!/bin/sh
# ########################################################################
# # Begin scriptname
# #
# # Description :
# #
# # Authors     :
# #
# # Version     : LFS x.x
# #
# # Notes       :
# #
# ########################################################################
# 
# ### BEGIN INIT INFO
# # Provides:            template
# # Required-Start:
# # Should-Start:
# # Required-Stop:
# # Should-Stop:
# # Default-Start:
# # Default-Stop:
# # Short-Description:
# # Description:
# # X-LFS-Provided-By:
# ### END INIT INFO
# 
# . /lib/lsb/init-functions
# 
# case "${1}" in
#    start)
#       log_info_msg "Starting..."
#       start_daemon fully_qualified_path
#       ;;
# 
#    stop)
#       log_info_msg "Stopping..."
#       killproc fully_qualified_path
#       ;;
# 
#    restart)
#       ${0} stop
#       sleep 1
#       ${0} start
#       ;;
# 
#    *)
#       echo "Usage: ${0} {start|stop|restart}"
#       exit 1
#       ;;
# esac
# 
# exit 0
# 
# # End scriptname
# 


#        D.21. /etc/sysconfig/modules  



# ########################################################################
# # Begin /etc/sysconfig/modules
# #
# # Description : Module auto-loading configuration
# #
# # Authors     :
# #
# # Version     : 00.00
# #
# # Notes       : The syntax of this file is as follows:
# #          <module> [<arg1> <arg2> ...]
# #
# # Each module should be on its own line, and any options that you want
# # passed to the module should follow it.  The line deliminator is either
# # a space or a tab.
# ########################################################################
# 
# # End /etc/sysconfig/modules
# 


#        D.22. /etc/sysconfig/createfiles  



# ########################################################################
# # Begin /etc/sysconfig/createfiles
# #
# # Description : Createfiles script config file
# #
# # Authors     :
# #
# # Version     : 00.00
# #
# # Notes       : The syntax of this file is as follows:
# #         if type is equal to "file" or "dir"
# #          <filename> <type> <permissions> <user> <group>
# #         if type is equal to "dev"
# #          <filename> <type> <permissions> <user> <group> <devtype> 
# #             <major> <minor>
# #
# #         <filename> is the name of the file which is to be created
# #         <type> is either file, dir, or dev.
# #               file creates a new file
# #               dir creates a new directory
# #               dev creates a new device
# #         <devtype> is either block, char or pipe
# #               block creates a block device
# #               char creates a character deivce
# #               pipe creates a pipe, this will ignore the <major> and 
# #           <minor> fields
# #         <major> and <minor> are the major and minor numbers used for 
# #     the device.
# ########################################################################
# 
# # End /etc/sysconfig/createfiles
# 


#        D.23. /etc/sysconfig/udev-retry  



# ########################################################################
# # Begin /etc/sysconfig/udev_retry
# #
# # Description : udev_retry script configuration
# #
# # Authors     :
# #
# # Version     : 00.00
# #
# # Notes       : Each subsystem that may need to be re-triggered after mountfs
# #               runs should be listed in this file.  Probable subsystems to be
# #               listed here are rtc (due to /var/lib/hwclock/adjtime) and sound
# #               (due to both /var/lib/alsa/asound.state and /usr/sbin/alsactl).
# #               Entries are whitespace-separated.
# ########################################################################
# 
# rtc
# 
# # End /etc/sysconfig/udev_retry
# 


#        D.24. /sbin/ifup  



# #!/bin/sh
# ########################################################################
# # Begin /sbin/ifup
# #
# # Description : Interface Up
# #
# # Authors     : Nathan Coulson - nathan AT linuxfromscratch D0T org
# #               Kevin P. Fleming - kpfleming@linuxfromscratch.org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.7
# #
# # Notes       : The IFCONFIG variable is passed to the SERVICE script
# #               in the /lib/services directory, to indicate what file the
# #               service should source to get interface specifications.
# #
# ########################################################################
# 
# up()
# {
#   log_info_msg "Bringing up the ${1} interface..."
# 
#   if ip link show $1 > /dev/null 2>&1; then
#      link_status=`ip link show $1`
# 
#      if [ -n "${link_status}" ]; then
#         if ! echo "${link_status}" | grep -q UP; then
#            ip link set $1 up
#         fi
#      fi
# 
#   else
#      log_failure_msg "Interface ${IFACE} doesn't exist."
#      exit 1
#   fi
# 
#   evaluate_retval
# }
# 
# RELEASE="7.7"
# 
# USAGE="Usage: $0 [ -hV ] [--help] [--version] interface"
# VERSTR="LFS ifup, version ${RELEASE}"
# 
# while [ $# -gt 0 ]; do
#    case "$1" in
#       --help | -h)     help="y"; break ;;
# 
#       --version | -V)  echo "${VERSTR}"; exit 0 ;;
#    
#       -*)              echo "ifup: ${1}: invalid option" >&2
#                        echo "${USAGE}" >& 2
#                        exit 2 ;;
#                        
#       *)               break ;;
#    esac
# done
# 
# if [ -n "$help" ]; then
#    echo "${VERSTR}"
#    echo "${USAGE}"
#    echo
#    cat << HERE_EOF
# ifup is used to bring up a network interface.  The interface
# parameter, e.g. eth0 or eth0:2, must match the trailing part of the
# interface specifications file, e.g. /etc/sysconfig/ifconfig.eth0:2.
# 
# HERE_EOF
#    exit 0
# fi
# 
# file=/etc/sysconfig/ifconfig.${1}
# 
# # Skip backup files
# [ "${file}" = "${file%""~""}" ] || exit 0
# 
# . /lib/lsb/init-functions
# 
# if [ ! -r "${file}" ]; then
#    log_failure_msg "Unable to bring up ${1} interface! ${file} is missing or cannot be accessed."
#    exit 1
# fi
# 
# .  $file
# 
# if [ "$IFACE" = "" ]; then
#    log_failure_msg "Unable to bring up ${1} interface! ${file} does not define an interface [IFACE]."
#    exit 1
# fi
# 
# # Do not process this service if started by boot, and ONBOOT
# # is not set to yes
# if [ "${IN_BOOT}" = "1" -a "${ONBOOT}" != "yes" ]; then
#    exit 0
# fi
# 
# # Bring up the interface
# if [ "$VIRTINT" != "yes" ]; then
#    up ${IFACE}
# fi
# 
# for S in ${SERVICE}; do
#   if [ ! -x "/lib/services/${S}" ]; then
#     MSG="\nUnable to process ${file}.  Either " 
#     MSG="${MSG}the SERVICE '${S} was not present "
#     MSG="${MSG}or cannot be executed."
#     log_failure_msg "$MSG"
#     exit 1
#   fi
# done
# 
# if [ "${SERVICE}" = "wpa" ]; then log_success_msg; fi
# 
# # Create/configure the interface
# for S in ${SERVICE}; do 
#   IFCONFIG=${file} /lib/services/${S} ${IFACE} up
# done
# 
# # Set link up virtual interfaces
# if [ "${VIRTINT}" == "yes" ]; then
#    up ${IFACE}
# fi
# 
# # Bring up any additional interface components
# for I in $INTERFACE_COMPONENTS; do up $I; done
# 
# # Set MTU if requested. Check if MTU has a "good" value.
# if test -n "${MTU}"; then
#    if [[ ${MTU} =~ ^[0-9]+$ ]] && [[ $MTU -ge 68 ]] ; then
#       for I in $IFACE $INTERFACE_COMPONENTS; do 
#          ip link set dev $I mtu $MTU; 
#       done
#    else
#       log_info_msg2 "Invalid MTU $MTU"
#    fi
# fi 
# 
# # Set the route default gateway if requested
# if [ -n "${GATEWAY}" ]; then
#    if ip route | grep -q default; then
#       log_warning_msg "Gateway already setup; skipping."
#    else
#       log_info_msg "Adding default gateway ${GATEWAY} to the ${IFACE} interface..."
#       ip route add default via ${GATEWAY} dev ${IFACE}
#       evaluate_retval
#    fi
# fi
# 
# # End /sbin/ifup
# 


#        D.25. /sbin/ifdown  



# #!/bin/bash 
# ########################################################################
# # Begin /sbin/ifdown
# #
# # Description : Interface Down
# #
# # Authors     : Nathan Coulson - nathan AT linuxfromscratch D0T org
# #               Kevin P. Fleming - kpfleming@linuxfromscratch.org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# # Notes       : the IFCONFIG variable is passed to the scripts found
# #               in the /lib/services directory, to indicate what file the
# #               service should source to get interface specifications.
# #
# ########################################################################
# 
# RELEASE="7.0"
# 
# USAGE="Usage: $0 [ -hV ] [--help] [--version] interface"
# VERSTR="LFS ifdown, version ${RELEASE}"
# 
# while [ $# -gt 0 ]; do
#    case "$1" in
#       --help | -h)     help="y"; break ;;
# 
#       --version | -V)  echo "${VERSTR}"; exit 0 ;;
# 
#       -*)              echo "ifup: ${1}: invalid option" >&2
#                        echo "${USAGE}" >& 2
#                        exit 2 ;;
#                     
#       *)               break ;;
#    esac
# done
# 
# if [ -n "$help" ]; then
#    echo "${VERSTR}"
#    echo "${USAGE}"
#    echo
#    cat << HERE_EOF
# ifdown is used to bring down a network interface.  The interface
# parameter, e.g. eth0 or eth0:2, must match the trailing part of the
# interface specifications file, e.g. /etc/sysconfig/ifconfig.eth0:2.
# 
# HERE_EOF
#    exit 0
# fi
# 
# file=/etc/sysconfig/ifconfig.${1}
# 
# # Skip backup files
# [ "${file}" = "${file%""~""}" ] || exit 0
# 
# . /lib/lsb/init-functions 
# 
# if [ ! -r "${file}" ]; then
#    log_warning_msg "${file} is missing or cannot be accessed."
#    exit 1
# fi
# 
# . ${file}
# 
# if [ "$IFACE" = "" ]; then
#    log_failure_msg "${file} does not define an interface [IFACE]."
#    exit 1
# fi
# 
# # We only need to first service to bring down the interface
# S=`echo ${SERVICE} | cut -f1 -d" "`
# 
# if ip link show ${IFACE} > /dev/null 2>&1; then
#    if [ -n "${S}" -a -x "/lib/services/${S}" ]; then
#      IFCONFIG=${file} /lib/services/${S} ${IFACE} down
#    else
#      MSG="Unable to process ${file}.  Either "
#      MSG="${MSG}the SERVICE variable was not set "
#      MSG="${MSG}or the specified service cannot be executed."
#      log_failure_msg "$MSG"
#      exit 1
#   fi
# else
#    log_warning_msg "Interface ${1} doesn't exist."
# fi
# 
# # Leave the interface up if there are additional interfaces in the device
# link_status=`ip link show ${IFACE} 2>/dev/null`
# 
# if [ -n "${link_status}" ]; then
#    if [ "$(echo "${link_status}" | grep UP)" != "" ]; then
#       if [ "$(ip addr show ${IFACE} | grep 'inet ')" == ""  ]; then
#          log_info_msg "Bringing down the ${IFACE} interface..."
#          ip link set ${IFACE} down
#          evaluate_retval
#       fi
#    fi
# fi
# 
# # End /sbin/ifdown
# 


#        D.26. /lib/services/ipv4-static  



# #!/bin/sh
# ########################################################################
# # Begin /lib/services/ipv4-static
# #
# # Description : IPV4 Static Boot Script
# #
# # Authors     : Nathan Coulson - nathan AT linuxfromscratch D0T org
# #               Kevin P. Fleming - kpfleming@linuxfromscratch.org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# . /lib/lsb/init-functions
# . ${IFCONFIG}
# 
# if [ -z "${IP}" ]; then
#    log_failure_msg "\nIP variable missing from ${IFCONFIG}, cannot continue."
#    exit 1
# fi
# 
# if [ -z "${PREFIX}" -a -z "${PEER}" ]; then
#    log_warning_msg "\nPREFIX variable missing from ${IFCONFIG}, assuming 24."
#    PREFIX=24
#    args="${args} ${IP}/${PREFIX}"
# 
# elif [ -n "${PREFIX}" -a -n "${PEER}" ]; then
#    log_failure_msg "\nPREFIX and PEER both specified in ${IFCONFIG}, cannot continue."
#    exit 1
# 
# elif [ -n "${PREFIX}" ]; then
#    args="${args} ${IP}/${PREFIX}"
# 
# elif [ -n "${PEER}" ]; then
#    args="${args} ${IP} peer ${PEER}"
# fi
# 
# if [ -n "${LABEL}" ]; then
#    args="${args} label ${LABEL}"
# fi
# 
# if [ -n "${BROADCAST}" ]; then
#    args="${args} broadcast ${BROADCAST}"
# fi
# 
# case "${2}" in
#    up)
#       if [ "$(ip addr show ${1} 2>/dev/null | grep ${IP}/)" = "" ]; then
#          log_info_msg "Adding IPv4 address ${IP} to the ${1} interface..."
#          ip addr add ${args} dev ${1}
#          evaluate_retval
#       else
#          log_warning_msg "Cannot add IPv4 address ${IP} to ${1}.  Already present."
#       fi
#    ;;
# 
#    down)
#       if [ "$(ip addr show ${1} 2>/dev/null | grep ${IP}/)" != "" ]; then
#          log_info_msg "Removing IPv4 address ${IP} from the ${1} interface..."
#          ip addr del ${args} dev ${1}
#          evaluate_retval
#       fi
# 
#       if [ -n "${GATEWAY}" ]; then
#          # Only remove the gateway if there are no remaining ipv4 addresses
#          if [ "$(ip addr show ${1} 2>/dev/null | grep 'inet ')" != "" ]; then
#             log_info_msg "Removing default gateway..."
#             ip route del default
#             evaluate_retval
#          fi
#       fi
#    ;;
# 
#    *)
#       echo "Usage: ${0} [interface] {up|down}"
#       exit 1
#    ;;
# esac
# 
# # End /lib/services/ipv4-static
# 


#        D.27. /lib/services/ipv4-static-route  



# #!/bin/sh
# ########################################################################
# # Begin /lib/services/ipv4-static-route
# #
# # Description : IPV4 Static Route Script
# #
# # Authors     : Kevin P. Fleming - kpfleming@linuxfromscratch.org
# #               DJ Lucas - dj AT linuxfromscratch D0T org
# # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# #
# # Version     : LFS 7.0
# #
# ########################################################################
# 
# . /lib/lsb/init-functions
# . ${IFCONFIG}
# 
# case "${TYPE}" in
#    ("" | "network")
#       need_ip=1
#       need_gateway=1
#    ;;
# 
#    ("default")
#       need_gateway=1
#       args="${args} default"
#       desc="default"
#    ;;
# 
#    ("host")
#       need_ip=1
#    ;;
# 
#    ("unreachable")
#       need_ip=1
#       args="${args} unreachable"
#       desc="unreachable "
#    ;;
# 
#    (*)
#       log_failure_msg "Unknown route type (${TYPE}) in ${IFCONFIG}, cannot continue."
#       exit 1
#    ;;
# esac
# 
# if [ -n "${GATEWAY}" ]; then
#    MSG="The GATEWAY variable cannot be set in ${IFCONFIG} for static routes.\n"
#    log_failure_msg "$MSG Use STATIC_GATEWAY only, cannot continue"
#    exit 1
# fi
# 
# if [ -n "${need_ip}" ]; then
#    if [ -z "${IP}" ]; then
#       log_failure_msg "IP variable missing from ${IFCONFIG}, cannot continue."
#       exit 1
#    fi
# 
#    if [ -z "${PREFIX}" ]; then
#       log_failure_msg "PREFIX variable missing from ${IFCONFIG}, cannot continue." 
#       exit 1
#    fi
#    
#    args="${args} ${IP}/${PREFIX}"
#    desc="${desc}${IP}/${PREFIX}"
# fi
# 
# if [ -n "${need_gateway}" ]; then
#    if [ -z "${STATIC_GATEWAY}" ]; then
#       log_failure_msg "STATIC_GATEWAY variable missing from ${IFCONFIG}, cannot continue."
#       exit 1
#    fi
#    args="${args} via ${STATIC_GATEWAY}"
# fi
# 
# if [ -n "${SOURCE}" ]; then
#         args="${args} src ${SOURCE}"
# fi
# 
# case "${2}" in
#    up)
#       log_info_msg "Adding '${desc}' route to the ${1} interface..."
#       ip route add ${args} dev ${1}
#       evaluate_retval
#    ;;
#    
#    down)
#       log_info_msg "Removing '${desc}' route from the ${1} interface..."
#       ip route del ${args} dev ${1}
#       evaluate_retval
#    ;;
#    
#    *)
#       echo "Usage: ${0} [interface] {up|down}"
#       exit 1
#    ;;
# esac
# 
# # End /lib/services/ipv4-static-route
# 


#        Appendix E. Udev configuration rules  
# 
#                          The rules in this appendix are listed for convenience. Installation is normally
#                        done via instructions in Section 8.70, "Eudev-3.2.10".  
#        E.1. 55-lfs.rules  



# # /etc/udev/rules.d/55-lfs.rules: Rule definitions for LFS.
# 
# # Core kernel devices
# 
# # This causes the system clock to be set as soon as /dev/rtc becomes available.
# SUBSYSTEM=="rtc", ACTION=="add", MODE="0644", RUN+="/etc/rc.d/init.d/setclock start"
# KERNEL=="rtc", ACTION=="add", MODE="0644", RUN+="/etc/rc.d/init.d/setclock start"
# 
# # Comms devices
# 
# KERNEL=="ippp[0-9]*",       GROUP="dialout"
# KERNEL=="isdn[0-9]*",       GROUP="dialout"
# KERNEL=="isdnctrl[0-9]*",   GROUP="dialout"
# KERNEL=="dcbri[0-9]*",      GROUP="dialout"
# 


#        Appendix F. LFS Licenses  
# 
#                          This book is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike
#                        2.0 License. 
# 
#                          Computer instructions may be extracted from the book under the MIT License. 
#        F.1. Creative Commons License  
# 
#                          Creative Commons Legal Code 
# 
#                          Attribution-NonCommercial-ShareAlike 2.0 
#          Important 
# 
#                          CREATIVE COMMONS CORPORATION IS NOT A LAW FIRM AND DOES NOT PROVIDE LEGAL SERVICES.
#                        DISTRIBUTION OF THIS LICENSE DOES NOT CREATE AN ATTORNEY-CLIENT RELATIONSHIP. CREATIVE
#                        COMMONS PROVIDES THIS INFORMATION ON AN "AS-IS" BASIS. CREATIVE COMMONS MAKES NO
#                        WARRANTIES REGARDING THE INFORMATION PROVIDED, AND DISCLAIMS LIABILITY FOR DAMAGES
#                        RESULTING FROM ITS USE. 
# 
#                          License 
# 
#                          THE WORK (AS DEFINED BELOW) IS PROVIDED UNDER THE TERMS OF THIS CREATIVE COMMONS
#                        PUBLIC LICENSE ("CCPL" OR "LICENSE"). THE WORK IS PROTECTED BY COPYRIGHT AND/OR
#                        OTHER APPLICABLE LAW. ANY USE OF THE WORK OTHER THAN AS AUTHORIZED UNDER THIS LICENSE
#                        OR COPYRIGHT LAW IS PROHIBITED. 
# 
#                          BY EXERCISING ANY RIGHTS TO THE WORK PROVIDED HERE, YOU ACCEPT AND AGREE TO BE BOUND
#                        BY THE TERMS OF THIS LICENSE. THE LICENSOR GRANTS YOU THE RIGHTS CONTAINED HERE
#                        IN CONSIDERATION OF YOUR ACCEPTANCE OF SUCH TERMS AND CONDITIONS. 
# 
#                          Definitions 
# 
#                          "Collective Work" means a work, such as a periodical issue, anthology or encyclopedia,
#                        in which the Work in its entirety in unmodified form, along with a number of other
#                        contributions, constituting separate and independent works in themselves, are assembled
#                        into a collective whole. A work that constitutes a Collective Work will not be considered
#                        a Derivative Work (as defined below) for the purposes of this License. 
# 
#                          "Derivative Work" means a work based upon the Work or upon the Work and other pre-existing
#                        works, such as a translation, musical arrangement, dramatization, fictionalization,
#                        motion picture version, sound recording, art reproduction, abridgment, condensation,
#                        or any other form in which the Work may be recast, transformed, or adapted, except
#                        that a work that constitutes a Collective Work will not be considered a Derivative
#                        Work for the purpose of this License. For the avoidance of doubt, where the Work
#                        is a musical composition or sound recording, the synchronization of the Work in
#                        timed-relation with a moving image ("synching") will be considered a Derivative
#                        Work for the purpose of this License. 
# 
#                          "Licensor" means the individual or entity that offers the Work under the terms of
#                        this License. 
# 
#                          "Original Author" means the individual or entity who created the Work. 
# 
#                          "Work" means the copyrightable work of authorship offered under the terms of this
#                        License. 
# 
#                          "You" means an individual or entity exercising rights under this License who has
#                        not previously violated the terms of this License with respect to the Work, or who
#                        has received express permission from the Licensor to exercise rights under this
#                        License despite a previous violation. 
# 
#                          "License Elements" means the following high-level license attributes as selected
#                        by Licensor and indicated in the title of this License: Attribution, Noncommercial,
#                        ShareAlike. 
# 
#                          Fair Use Rights. Nothing in this license is intended to reduce, limit, or restrict
#                        any rights arising from fair use, first sale or other limitations on the exclusive
#                        rights of the copyright owner under copyright law or other applicable laws. 
# 
#                          License Grant. Subject to the terms and conditions of this License, Licensor hereby
#                        grants You a worldwide, royalty-free, non-exclusive, perpetual (for the duration
#                        of the applicable copyright) license to exercise the rights in the Work as stated
#                        below: 
# 
#                          to reproduce the Work, to incorporate the Work into one or more Collective Works,
#                        and to reproduce the Work as incorporated in the Collective Works; 
# 
#                          to create and reproduce Derivative Works; 
# 
#                          to distribute copies or phonorecords of, display publicly, perform publicly, and
#                        perform publicly by means of a digital audio transmission the Work including as
#                        incorporated in Collective Works; 
# 
#                          to distribute copies or phonorecords of, display publicly, perform publicly, and
#                        perform publicly by means of a digital audio transmission Derivative Works; 
# 
#                          The above rights may be exercised in all media and formats whether now known or
#                        hereafter devised. The above rights include the right to make such modifications
#                        as are technically necessary to exercise the rights in other media and formats.
#                        All rights not expressly granted by Licensor are hereby reserved, including but
#                        not limited to the rights set forth in Sections 4(e) and 4(f). 
# 
#                          Restrictions.The license granted in Section 3 above is expressly made subject to
#                        and limited by the following restrictions: 
# 
#                          You may distribute, publicly display, publicly perform, or publicly digitally perform
#                        the Work only under the terms of this License, and You must include a copy of, or
#                        the Uniform Resource Identifier for, this License with every copy or phonorecord
#                        of the Work You distribute, publicly display, publicly perform, or publicly digitally
#                        perform. You may not offer or impose any terms on the Work that alter or restrict
#                        the terms of this License or the recipients' exercise of the rights granted hereunder.
#                        You may not sublicense the Work. You must keep intact all notices that refer to
#                        this License and to the disclaimer of warranties. You may not distribute, publicly
#                        display, publicly perform, or publicly digitally perform the Work with any technological
#                        measures that control access or use of the Work in a manner inconsistent with the
#                        terms of this License Agreement. The above applies to the Work as incorporated in
#                        a Collective Work, but this does not require the Collective Work apart from the
#                        Work itself to be made subject to the terms of this License. If You create a Collective
#                        Work, upon notice from any Licensor You must, to the extent practicable, remove
#                        from the Collective Work any reference to such Licensor or the Original Author,
#                        as requested. If You create a Derivative Work, upon notice from any Licensor You
#                        must, to the extent practicable, remove from the Derivative Work any reference to
#                        such Licensor or the Original Author, as requested. 
# 
#                          You may distribute, publicly display, publicly perform, or publicly digitally perform
#                        a Derivative Work only under the terms of this License, a later version of this
#                        License with the same License Elements as this License, or a Creative Commons iCommons
#                        license that contains the same License Elements as this License (e.g. Attribution-NonCommercial-ShareAlike
#                        2.0 Japan). You must include a copy of, or the Uniform Resource Identifier for,
#                        this License or other license specified in the previous sentence with every copy
#                        or phonorecord of each Derivative Work You distribute, publicly display, publicly
#                        perform, or publicly digitally perform. You may not offer or impose any terms on
#                        the Derivative Works that alter or restrict the terms of this License or the recipients'
#                        exercise of the rights granted hereunder, and You must keep intact all notices that
#                        refer to this License and to the disclaimer of warranties. You may not distribute,
#                        publicly display, publicly perform, or publicly digitally perform the Derivative
#                        Work with any technological measures that control access or use of the Work in a
#                        manner inconsistent with the terms of this License Agreement. The above applies
#                        to the Derivative Work as incorporated in a Collective Work, but this does not require
#                        the Collective Work apart from the Derivative Work itself to be made subject to
#                        the terms of this License. 
# 
#                          You may not exercise any of the rights granted to You in Section 3 above in any
#                        manner that is primarily intended for or directed toward commercial advantage or
#                        private monetary compensation. The exchange of the Work for other copyrighted works
#                        by means of digital file-sharing or otherwise shall not be considered to be intended
#                        for or directed toward commercial advantage or private monetary compensation, provided
#                        there is no payment of any monetary compensation in connection with the exchange
#                        of copyrighted works. 
# 
#                          If you distribute, publicly display, publicly perform, or publicly digitally perform
#                        the Work or any Derivative Works or Collective Works, You must keep intact all copyright
#                        notices for the Work and give the Original Author credit reasonable to the medium
#                        or means You are utilizing by conveying the name (or pseudonym if applicable) of
#                        the Original Author if supplied; the title of the Work if supplied; to the extent
#                        reasonably practicable, the Uniform Resource Identifier, if any, that Licensor specifies
#                        to be associated with the Work, unless such URI does not refer to the copyright
#                        notice or licensing information for the Work; and in the case of a Derivative Work,
#                        a credit identifying the use of the Work in the Derivative Work (e.g., "French translation
#                        of the Work by Original Author," or "Screenplay based on original Work by Original
#                        Author"). Such credit may be implemented in any reasonable manner; provided, however,
#                        that in the case of a Derivative Work or Collective Work, at a minimum such credit
#                        will appear where any other comparable authorship credit appears and in a manner
#                        at least as prominent as such other comparable authorship credit. 
# 
#                          For the avoidance of doubt, where the Work is a musical composition: 
# 
#                          Performance Royalties Under Blanket Licenses. Licensor reserves the exclusive right
#                        to collect, whether individually or via a performance rights society (e.g. ASCAP,
#                        BMI, SESAC), royalties for the public performance or public digital performance
#                        (e.g. webcast) of the Work if that performance is primarily intended for or directed
#                        toward commercial advantage or private monetary compensation. 
# 
#                          Mechanical Rights and Statutory Royalties. Licensor reserves the exclusive right
#                        to collect, whether individually or via a music rights agency or designated agent
#                        (e.g. Harry Fox Agency), royalties for any phonorecord You create from the Work
#                        ("cover version") and distribute, subject to the compulsory license created by 17
#                        USC Section 115 of the US Copyright Act (or the equivalent in other jurisdictions),
#                        if Your distribution of such cover version is primarily intended for or directed
#                        toward commercial advantage or private monetary compensation. 6. Webcasting Rights
#                        and Statutory Royalties. For the avoidance of doubt, where the Work is a sound recording,
#                        Licensor reserves the exclusive right to collect, whether individually or via a
#                        performance-rights society (e.g. SoundExchange), royalties for the public digital
#                        performance (e.g. webcast) of the Work, subject to the compulsory license created
#                        by 17 USC Section 114 of the US Copyright Act (or the equivalent in other jurisdictions),
#                        if Your public digital performance is primarily intended for or directed toward
#                        commercial advantage or private monetary compensation. 
# 
#                          Webcasting Rights and Statutory Royalties. For the avoidance of doubt, where the
#                        Work is a sound recording, Licensor reserves the exclusive right to collect, whether
#                        individually or via a performance-rights society (e.g. SoundExchange), royalties
#                        for the public digital performance (e.g. webcast) of the Work, subject to the compulsory
#                        license created by 17 USC Section 114 of the US Copyright Act (or the equivalent
#                        in other jurisdictions), if Your public digital performance is primarily intended
#                        for or directed toward commercial advantage or private monetary compensation. 
# 
#                          Representations, Warranties and Disclaimer 
# 
#                          UNLESS OTHERWISE MUTUALLY AGREED TO BY THE PARTIES IN WRITING, LICENSOR OFFERS THE
#                        WORK AS-IS AND MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND CONCERNING THE
#                        WORK, EXPRESS, IMPLIED, STATUTORY OR OTHERWISE, INCLUDING, WITHOUT LIMITATION, WARRANTIES
#                        OF TITLE, MERCHANTIBILITY, FITNESS FOR A PARTICULAR PURPOSE, NONINFRINGEMENT, OR
#                        THE ABSENCE OF LATENT OR OTHER DEFECTS, ACCURACY, OR THE PRESENCE OF ABSENCE OF
#                        ERRORS, WHETHER OR NOT DISCOVERABLE. SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION
#                        OF IMPLIED WARRANTIES, SO SUCH EXCLUSION MAY NOT APPLY TO YOU. 
# 
#                          Limitation on Liability. EXCEPT TO THE EXTENT REQUIRED BY APPLICABLE LAW, IN NO
#                        EVENT WILL LICENSOR BE LIABLE TO YOU ON ANY LEGAL THEORY FOR ANY SPECIAL, INCIDENTAL,
#                        CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES ARISING OUT OF THIS LICENSE OR THE
#                        USE OF THE WORK, EVEN IF LICENSOR HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
#                        
# 
#                          Termination 
# 
#                          This License and the rights granted hereunder will terminate automatically upon
#                        any breach by You of the terms of this License. Individuals or entities who have
#                        received Derivative Works or Collective Works from You under this License, however,
#                        will not have their licenses terminated provided such individuals or entities remain
#                        in full compliance with those licenses. Sections 1, 2, 5, 6, 7, and 8 will survive
#                        any termination of this License. 
# 
#                          Subject to the above terms and conditions, the license granted here is perpetual
#                        (for the duration of the applicable copyright in the Work). Notwithstanding the
#                        above, Licensor reserves the right to release the Work under different license terms
#                        or to stop distributing the Work at any time; provided, however that any such election
#                        will not serve to withdraw this License (or any other license that has been, or
#                        is required to be, granted under the terms of this License), and this License will
#                        continue in full force and effect unless terminated as stated above. 
# 
#                          Miscellaneous 
# 
#                          Each time You distribute or publicly digitally perform the Work or a Collective
#                        Work, the Licensor offers to the recipient a license to the Work on the same terms
#                        and conditions as the license granted to You under this License. 
# 
#                          Each time You distribute or publicly digitally perform a Derivative Work, Licensor
#                        offers to the recipient a license to the original Work on the same terms and conditions
#                        as the license granted to You under this License. 
# 
#                          If any provision of this License is invalid or unenforceable under applicable law,
#                        it shall not affect the validity or enforceability of the remainder of the terms
#                        of this License, and without further action by the parties to this agreement, such
#                        provision shall be reformed to the minimum extent necessary to make such provision
#                        valid and enforceable. 
# 
#                          No term or provision of this License shall be deemed waived and no breach consented
#                        to unless such waiver or consent shall be in writing and signed by the party to
#                        be charged with such waiver or consent. 
# 
#                          This License constitutes the entire agreement between the parties with respect to
#                        the Work licensed here. There are no understandings, agreements or representations
#                        with respect to the Work not specified here. Licensor shall not be bound by any
#                        additional provisions that may appear in any communication from You. This License
#                        may not be modified without the mutual written agreement of the Licensor and You.
#                        
#          Important 
# 
#                          Creative Commons is not a party to this License, and makes no warranty whatsoever
#                        in connection with the Work. Creative Commons will not be liable to You or any party
#                        on any legal theory for any damages whatsoever, including without limitation any
#                        general, special, incidental or consequential damages arising in connection to this
#                        license. Notwithstanding the foregoing two (2) sentences, if Creative Commons has
#                        expressly identified itself as the Licensor hereunder, it shall have all rights
#                        and obligations of Licensor. 
# 
#                          Except for the limited purpose of indicating to the public that the Work is licensed
#                        under the CCPL, neither party will use the trademark "Creative Commons" or any related
#                        trademark or logo of Creative Commons without the prior written consent of Creative
#                        Commons. Any permitted use will be in compliance with Creative Commons' then-current
#                        trademark usage guidelines, as may be published on its website or otherwise made
#                        available upon request from time to time. 
# 
#                          Creative Commons may be contacted at http://creativecommons.org/.  
#        F.2. The MIT License  
# 
#                          Copyright C 1999-2021 Gerard Beekmans 
# 
#                          Permission is hereby granted, free of charge, to any person obtaining a copy of
#                        this software and associated documentation files (the "Software"), to deal in the
#                        Software without restriction, including without limitation the rights to use, copy,
#                        modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
#                        and to permit persons to whom the Software is furnished to do so, subject to the
#                        following conditions: 
# 
#                          The above copyright notice and this permission notice shall be included in all copies
#                        or substantial portions of the Software. 
# 
#                          THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
#                        INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
#                        PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
#                        BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
#                        TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
#                        USE OR OTHER DEALINGS IN THE SOFTWARE. 
#      Index  
#        Packages  
#           Acl: 
#                Acl-2.2.53 
#           Attr: 
#                Attr-2.4.48 
#           Autoconf: 
#                Autoconf-2.71 
#           Automake: 
#                Automake-1.16.3 
#           Bash: 
#                Bash-5.1 
#           tools: 
#                Bash-5.1 
#           Bc: 
#                Bc-3.3.0 
#           Binutils: 
#                Binutils-2.36.1 
#           tools, pass 1: 
#                Binutils-2.36.1 - Pass 1 
#           tools, pass 2: 
#                Binutils-2.36.1 - Pass 2 
#           Bison: 
#                Bison-3.7.5 
#           tools: 
#                Bison-3.7.5 
#           Bootscripts: 
#                LFS-Bootscripts-20210201 
#           usage: 
#                System V Bootscript Usage and Configuration 
#           Bzip2: 
#                Bzip2-1.0.8 
#           Check: 
#                Check-0.15.2 
#           Coreutils: 
#                Coreutils-8.32 
#           tools: 
#                Coreutils-8.32 
#           DejaGNU: 
#                DejaGNU-1.6.2 
#           Diffutils: 
#                Diffutils-3.7 
#           tools: 
#                Diffutils-3.7 
#           E2fsprogs: 
#                E2fsprogs-1.46.1 
#           Eudev: 
#                Eudev-3.2.10 
#           configuring: 
#                Configuring Eudev 
#           Expat: 
#                Expat-2.2.10 
#           Expect: 
#                Expect-5.45.4 
#           File: 
#                File-5.39 
#           tools: 
#                File-5.39 
#           Findutils: 
#                Findutils-4.8.0 
#           tools: 
#                Findutils-4.8.0 
#           Flex: 
#                Flex-2.6.4 
#           Gawk: 
#                Gawk-5.1.0 
#           tools: 
#                Gawk-5.1.0 
#           GCC: 
#                GCC-10.2.0 
#           tools, libstdc++ pass 1: 
#                Libstdc++ from GCC-10.2.0, Pass 1 
#           tools, libstdc++ pass 2: 
#                Libstdc++ from GCC-10.2.0, Pass 2 
#           tools, pass 1: 
#                GCC-10.2.0 - Pass 1 
#           tools, pass 2: 
#                GCC-10.2.0 - Pass 2 
#           GDBM: 
#                GDBM-1.19 
#           Gettext: 
#                Gettext-0.21 
#           tools: 
#                Gettext-0.21 
#           Glibc: 
#                Glibc-2.33 
#           tools: 
#                Glibc-2.33 
#           GMP: 
#                GMP-6.2.1 
#           Gperf: 
#                Gperf-3.1 
#           Grep: 
#                Grep-3.6 
#           tools: 
#                Grep-3.6 
#           Groff: 
#                Groff-1.22.4 
#           GRUB: 
#                GRUB-2.04 
#           Gzip: 
#                Gzip-1.10 
#           tools: 
#                Gzip-1.10 
#           Iana-Etc: 
#                Iana-Etc-20210202 
#           Inetutils: 
#                Inetutils-2.0 
#           Intltool: 
#                Intltool-0.51.0 
#           IPRoute2: 
#                IPRoute2-5.10.0 
#           Kbd: 
#                Kbd-2.4.0 
#           Kmod: 
#                Kmod-28 
#           Less: 
#                Less-563 
#           Libcap: 
#                Libcap-2.48 
#           Libelf: 
#                Libelf from Elfutils-0.183 
#           libffi: 
#                Libffi-3.3 
#           Libpipeline: 
#                Libpipeline-1.5.3 
#           Libtool: 
#                Libtool-2.4.6 
#           Linux: 
#                Linux-5.10.17 
#           tools, API headers: 
#                Linux-5.10.17 API Headers 
#           M4: 
#                M4-1.4.18 
#           tools: 
#                M4-1.4.18 
#           Make: 
#                Make-4.3 
#           tools: 
#                Make-4.3 
#           Man-DB: 
#                Man-DB-2.9.4 
#           Man-pages: 
#                Man-pages-5.10 
#           Meson: 
#                Meson-0.57.1 
#           MPC: 
#                MPC-1.2.1 
#           MPFR: 
#                MPFR-4.1.0 
#           Ncurses: 
#                Ncurses-6.2 
#           tools: 
#                Ncurses-6.2 
#           Ninja: 
#                Ninja-1.10.2 
#           OpenSSL: 
#                OpenSSL-1.1.1j 
#           Patch: 
#                Patch-2.7.6 
#           tools: 
#                Patch-2.7.6 
#           Perl: 
#                Perl-5.32.1 
#           tools: 
#                Perl-5.32.1 
#           Pkgconfig: 
#                Pkg-config-0.29.2 
#           Procps-ng: 
#                Procps-ng-3.3.17 
#           Psmisc: 
#                Psmisc-23.4 
#           Python: 
#                Python-3.9.2 
#           temporary: 
#                Python-3.9.2 
#           rc.site: 
#                The rc.site File 
#           Readline: 
#                Readline-8.1 
#           Sed: 
#                Sed-4.8 
#           tools: 
#                Sed-4.8 
#           Shadow: 
#                Shadow-4.8.1 
#           configuring: 
#                Configuring Shadow 
#           Sysklogd: 
#                Sysklogd-1.5.1 
#           configuring: 
#                Configuring Sysklogd 
#           Sysvinit: 
#                Sysvinit-2.98 
#           configuring: 
#                Configuring Sysvinit 
#           Tar: 
#                Tar-1.34 
#           tools: 
#                Tar-1.34 
#           Tcl: 
#                Tcl-8.6.11 
#           Texinfo: 
#                Texinfo-6.7 
#           temporary: 
#                Texinfo-6.7 
#           Udev: 
#           usage: 
#                Overview of Device and Module Handling 
#           Util-linux: 
#                Util-linux-2.36.2 
#           tools: 
#                Util-linux-2.36.2 
#           Vim: 
#                Vim-8.2.2433 
#           XML::Parser: 
#                XML::Parser-2.46 
#           Xz: 
#                Xz-5.2.5 
#           tools: 
#                Xz-5.2.5 
#           Zlib: 
#                Zlib-1.2.11 
#           zstd: 
#                Zstd-1.4.8  
#        Programs  
#           [: 
#                Coreutils-8.32-- 
#                description 
#           2to3: 
#                Python-3.9.2 
#           accessdb: 
#                Man-DB-2.9.4-- 
#                description 
#           aclocal: 
#                Automake-1.16.3-- 
#                description 
#           aclocal-1.16: 
#                Automake-1.16.3-- 
#                description 
#           addftinfo: 
#                Groff-1.22.4-- 
#                description 
#           addpart: 
#                Util-linux-2.36.2-- 
#                description 
#           addr2line: 
#                Binutils-2.36.1-- 
#                description 
#           afmtodit: 
#                Groff-1.22.4-- 
#                description 
#           agetty: 
#                Util-linux-2.36.2-- 
#                description 
#           apropos: 
#                Man-DB-2.9.4-- 
#                description 
#           ar: 
#                Binutils-2.36.1-- 
#                description 
#           as: 
#                Binutils-2.36.1-- 
#                description 
#           attr: 
#                Attr-2.4.48-- 
#                description 
#           autoconf: 
#                Autoconf-2.71-- 
#                description 
#           autoheader: 
#                Autoconf-2.71-- 
#                description 
#           autom4te: 
#                Autoconf-2.71-- 
#                description 
#           automake: 
#                Automake-1.16.3-- 
#                description 
#           automake-1.16: 
#                Automake-1.16.3-- 
#                description 
#           autopoint: 
#                Gettext-0.21-- 
#                description 
#           autoreconf: 
#                Autoconf-2.71-- 
#                description 
#           autoscan: 
#                Autoconf-2.71-- 
#                description 
#           autoupdate: 
#                Autoconf-2.71-- 
#                description 
#           awk: 
#                Gawk-5.1.0-- 
#                description 
#           b2sum: 
#                Coreutils-8.32-- 
#                description 
#           badblocks: 
#                E2fsprogs-1.46.1-- 
#                description 
#           base64: 
#                Coreutils-8.32-- 
#                description 
#           basename: 
#                Coreutils-8.32-- 
#                description 
#           basenc: 
#                Coreutils-8.32-- 
#                description 
#           bash: 
#                Bash-5.1-- 
#                description 
#           bashbug: 
#                Bash-5.1-- 
#                description 
#           bc: 
#                Bc-3.3.0-- 
#                description 
#           bison: 
#                Bison-3.7.5-- 
#                description 
#           blkdiscard: 
#                Util-linux-2.36.2-- 
#                description 
#           blkid: 
#                Util-linux-2.36.2-- 
#                description 
#           blkzone: 
#                Util-linux-2.36.2-- 
#                description 
#           blockdev: 
#                Util-linux-2.36.2-- 
#                description 
#           bootlogd: 
#                Sysvinit-2.98-- 
#                description 
#           bridge: 
#                IPRoute2-5.10.0-- 
#                description 
#           bunzip2: 
#                Bzip2-1.0.8-- 
#                description 
#           bzcat: 
#                Bzip2-1.0.8-- 
#                description 
#           bzcmp: 
#                Bzip2-1.0.8-- 
#                description 
#           bzdiff: 
#                Bzip2-1.0.8-- 
#                description 
#           bzegrep: 
#                Bzip2-1.0.8-- 
#                description 
#           bzfgrep: 
#                Bzip2-1.0.8-- 
#                description 
#           bzgrep: 
#                Bzip2-1.0.8-- 
#                description 
#           bzip2: 
#                Bzip2-1.0.8-- 
#                description 
#           bzip2recover: 
#                Bzip2-1.0.8-- 
#                description 
#           bzless: 
#                Bzip2-1.0.8-- 
#                description 
#           bzmore: 
#                Bzip2-1.0.8-- 
#                description 
#           c++: 
#                GCC-10.2.0-- 
#                description 
#           c++filt: 
#                Binutils-2.36.1-- 
#                description 
#           cal: 
#                Util-linux-2.36.2-- 
#                description 
#           capsh: 
#                Libcap-2.48-- 
#                description 
#           captoinfo: 
#                Ncurses-6.2-- 
#                description 
#           cat: 
#                Coreutils-8.32-- 
#                description 
#           catchsegv: 
#                Glibc-2.33-- 
#                description 
#           catman: 
#                Man-DB-2.9.4-- 
#                description 
#           cc: 
#                GCC-10.2.0-- 
#                description 
#           cfdisk: 
#                Util-linux-2.36.2-- 
#                description 
#           chacl: 
#                Acl-2.2.53-- 
#                description 
#           chage: 
#                Shadow-4.8.1-- 
#                description 
#           chattr: 
#                E2fsprogs-1.46.1-- 
#                description 
#           chcon: 
#                Coreutils-8.32-- 
#                description 
#           chcpu: 
#                Util-linux-2.36.2-- 
#                description 
#           checkmk: 
#                Check-0.15.2-- 
#                description 
#           chem: 
#                Groff-1.22.4-- 
#                description 
#           chfn: 
#                Shadow-4.8.1-- 
#                description 
#           chgpasswd: 
#                Shadow-4.8.1-- 
#                description 
#           chgrp: 
#                Coreutils-8.32-- 
#                description 
#           chmem: 
#                Util-linux-2.36.2-- 
#                description 
#           chmod: 
#                Coreutils-8.32-- 
#                description 
#           choom: 
#                Util-linux-2.36.2-- 
#                description 
#           chown: 
#                Coreutils-8.32-- 
#                description 
#           chpasswd: 
#                Shadow-4.8.1-- 
#                description 
#           chroot: 
#                Coreutils-8.32-- 
#                description 
#           chrt: 
#                Util-linux-2.36.2-- 
#                description 
#           chsh: 
#                Shadow-4.8.1-- 
#                description 
#           chvt: 
#                Kbd-2.4.0-- 
#                description 
#           cksum: 
#                Coreutils-8.32-- 
#                description 
#           clear: 
#                Ncurses-6.2-- 
#                description 
#           cmp: 
#                Diffutils-3.7-- 
#                description 
#           col: 
#                Util-linux-2.36.2-- 
#                description 
#           colcrt: 
#                Util-linux-2.36.2-- 
#                description 
#           colrm: 
#                Util-linux-2.36.2-- 
#                description 
#           column: 
#                Util-linux-2.36.2-- 
#                description 
#           comm: 
#                Coreutils-8.32-- 
#                description 
#           compile_et: 
#                E2fsprogs-1.46.1-- 
#                description 
#           corelist: 
#                Perl-5.32.1-- 
#                description 
#           cp: 
#                Coreutils-8.32-- 
#                description 
#           cpan: 
#                Perl-5.32.1-- 
#                description 
#           cpp: 
#                GCC-10.2.0-- 
#                description 
#           csplit: 
#                Coreutils-8.32-- 
#                description 
#           ctrlaltdel: 
#                Util-linux-2.36.2-- 
#                description 
#           ctstat: 
#                IPRoute2-5.10.0-- 
#                description 
#           cut: 
#                Coreutils-8.32-- 
#                description 
#           c_rehash: 
#                OpenSSL-1.1.1j-- 
#                description 
#           date: 
#                Coreutils-8.32-- 
#                description 
#           dc: 
#                Bc-3.3.0-- 
#                description 
#           dd: 
#                Coreutils-8.32-- 
#                description 
#           deallocvt: 
#                Kbd-2.4.0-- 
#                description 
#           debugfs: 
#                E2fsprogs-1.46.1-- 
#                description 
#           delpart: 
#                Util-linux-2.36.2-- 
#                description 
#           depmod: 
#                Kmod-28-- 
#                description 
#           df: 
#                Coreutils-8.32-- 
#                description 
#           diff: 
#                Diffutils-3.7-- 
#                description 
#           diff3: 
#                Diffutils-3.7-- 
#                description 
#           dir: 
#                Coreutils-8.32-- 
#                description 
#           dircolors: 
#                Coreutils-8.32-- 
#                description 
#           dirname: 
#                Coreutils-8.32-- 
#                description 
#           dmesg: 
#                Util-linux-2.36.2-- 
#                description 
#           dnsdomainname: 
#                Inetutils-2.0-- 
#                description 
#           du: 
#                Coreutils-8.32-- 
#                description 
#           dumpe2fs: 
#                E2fsprogs-1.46.1-- 
#                description 
#           dumpkeys: 
#                Kbd-2.4.0-- 
#                description 
#           e2freefrag: 
#                E2fsprogs-1.46.1-- 
#                description 
#           e2fsck: 
#                E2fsprogs-1.46.1-- 
#                description 
#           e2image: 
#                E2fsprogs-1.46.1-- 
#                description 
#           e2label: 
#                E2fsprogs-1.46.1-- 
#                description 
#           e2mmpstatus: 
#                E2fsprogs-1.46.1-- 
#                description 
#           e2scrub: 
#                E2fsprogs-1.46.1-- 
#                description 
#           e2scrub_all: 
#                E2fsprogs-1.46.1-- 
#                description 
#           e2undo: 
#                E2fsprogs-1.46.1-- 
#                description 
#           e4crypt: 
#                E2fsprogs-1.46.1-- 
#                description 
#           e4defrag: 
#                E2fsprogs-1.46.1-- 
#                description 
#           echo: 
#                Coreutils-8.32-- 
#                description 
#           egrep: 
#                Grep-3.6-- 
#                description 
#           eject: 
#                Util-linux-2.36.2-- 
#                description 
#           elfedit: 
#                Binutils-2.36.1-- 
#                description 
#           enc2xs: 
#                Perl-5.32.1-- 
#                description 
#           encguess: 
#                Perl-5.32.1-- 
#                description 
#           env: 
#                Coreutils-8.32-- 
#                description 
#           envsubst: 
#                Gettext-0.21-- 
#                description 
#           eqn: 
#                Groff-1.22.4-- 
#                description 
#           eqn2graph: 
#                Groff-1.22.4-- 
#                description 
#           ex: 
#                Vim-8.2.2433-- 
#                description 
#           expand: 
#                Coreutils-8.32-- 
#                description 
#           expect: 
#                Expect-5.45.4-- 
#                description 
#           expiry: 
#                Shadow-4.8.1-- 
#                description 
#           expr: 
#                Coreutils-8.32-- 
#                description 
#           factor: 
#                Coreutils-8.32-- 
#                description 
#           faillog: 
#                Shadow-4.8.1-- 
#                description 
#           fallocate: 
#                Util-linux-2.36.2-- 
#                description 
#           false: 
#                Coreutils-8.32-- 
#                description 
#           fdformat: 
#                Util-linux-2.36.2-- 
#                description 
#           fdisk: 
#                Util-linux-2.36.2-- 
#                description 
#           fgconsole: 
#                Kbd-2.4.0-- 
#                description 
#           fgrep: 
#                Grep-3.6-- 
#                description 
#           file: 
#                File-5.39-- 
#                description 
#           filefrag: 
#                E2fsprogs-1.46.1-- 
#                description 
#           fincore: 
#                Util-linux-2.36.2-- 
#                description 
#           find: 
#                Findutils-4.8.0-- 
#                description 
#           findfs: 
#                Util-linux-2.36.2-- 
#                description 
#           findmnt: 
#                Util-linux-2.36.2-- 
#                description 
#           flex: 
#                Flex-2.6.4-- 
#                description 
#           flex++: 
#                Flex-2.6.4-- 
#                description 
#           flock: 
#                Util-linux-2.36.2-- 
#                description 
#           fmt: 
#                Coreutils-8.32-- 
#                description 
#           fold: 
#                Coreutils-8.32-- 
#                description 
#           free: 
#                Procps-ng-3.3.17-- 
#                description 
#           fsck: 
#                Util-linux-2.36.2-- 
#                description 
#           fsck.cramfs: 
#                Util-linux-2.36.2-- 
#                description 
#           fsck.ext2: 
#                E2fsprogs-1.46.1-- 
#                description 
#           fsck.ext3: 
#                E2fsprogs-1.46.1-- 
#                description 
#           fsck.ext4: 
#                E2fsprogs-1.46.1-- 
#                description 
#           fsck.minix: 
#                Util-linux-2.36.2-- 
#                description 
#           fsfreeze: 
#                Util-linux-2.36.2-- 
#                description 
#           fstab-decode: 
#                Sysvinit-2.98-- 
#                description 
#           fstrim: 
#                Util-linux-2.36.2-- 
#                description 
#           ftp: 
#                Inetutils-2.0-- 
#                description 
#           fuser: 
#                Psmisc-23.4-- 
#                description 
#           g++: 
#                GCC-10.2.0-- 
#                description 
#           gawk: 
#                Gawk-5.1.0-- 
#                description 
#           gawk-5.1.0: 
#                Gawk-5.1.0-- 
#                description 
#           gcc: 
#                GCC-10.2.0-- 
#                description 
#           gc-ar: 
#                GCC-10.2.0-- 
#                description 
#           gc-nm: 
#                GCC-10.2.0-- 
#                description 
#           gc-ranlib: 
#                GCC-10.2.0-- 
#                description 
#           gcov: 
#                GCC-10.2.0-- 
#                description 
#           gcov-dump: 
#                GCC-10.2.0-- 
#                description 
#           gcov-tool: 
#                GCC-10.2.0-- 
#                description 
#           gdbmtool: 
#                GDBM-1.19-- 
#                description 
#           gdbm_dump: 
#                GDBM-1.19-- 
#                description 
#           gdbm_load: 
#                GDBM-1.19-- 
#                description 
#           gdiffmk: 
#                Groff-1.22.4-- 
#                description 
#           gencat: 
#                Glibc-2.33-- 
#                description 
#           genl: 
#                IPRoute2-5.10.0-- 
#                description 
#           getcap: 
#                Libcap-2.48-- 
#                description 
#           getconf: 
#                Glibc-2.33-- 
#                description 
#           getent: 
#                Glibc-2.33-- 
#                description 
#           getfacl: 
#                Acl-2.2.53-- 
#                description 
#           getfattr: 
#                Attr-2.4.48-- 
#                description 
#           getkeycodes: 
#                Kbd-2.4.0-- 
#                description 
#           getopt: 
#                Util-linux-2.36.2-- 
#                description 
#           getpcaps: 
#                Libcap-2.48-- 
#                description 
#           gettext: 
#                Gettext-0.21-- 
#                description 
#           gettext.sh: 
#                Gettext-0.21-- 
#                description 
#           gettextize: 
#                Gettext-0.21-- 
#                description 
#           glilypond: 
#                Groff-1.22.4-- 
#                description 
#           gpasswd: 
#                Shadow-4.8.1-- 
#                description 
#           gperf: 
#                Gperf-3.1-- 
#                description 
#           gperl: 
#                Groff-1.22.4-- 
#                description 
#           gpinyin: 
#                Groff-1.22.4-- 
#                description 
#           gprof: 
#                Binutils-2.36.1-- 
#                description 
#           grap2graph: 
#                Groff-1.22.4-- 
#                description 
#           grep: 
#                Grep-3.6-- 
#                description 
#           grn: 
#                Groff-1.22.4-- 
#                description 
#           grodvi: 
#                Groff-1.22.4-- 
#                description 
#           groff: 
#                Groff-1.22.4-- 
#                description 
#           groffer: 
#                Groff-1.22.4-- 
#                description 
#           grog: 
#                Groff-1.22.4-- 
#                description 
#           grolbp: 
#                Groff-1.22.4-- 
#                description 
#           grolj4: 
#                Groff-1.22.4-- 
#                description 
#           gropdf: 
#                Groff-1.22.4-- 
#                description 
#           grops: 
#                Groff-1.22.4-- 
#                description 
#           grotty: 
#                Groff-1.22.4-- 
#                description 
#           groupadd: 
#                Shadow-4.8.1-- 
#                description 
#           groupdel: 
#                Shadow-4.8.1-- 
#                description 
#           groupmems: 
#                Shadow-4.8.1-- 
#                description 
#           groupmod: 
#                Shadow-4.8.1-- 
#                description 
#           groups: 
#                Coreutils-8.32-- 
#                description 
#           grpck: 
#                Shadow-4.8.1-- 
#                description 
#           grpconv: 
#                Shadow-4.8.1-- 
#                description 
#           grpunconv: 
#                Shadow-4.8.1-- 
#                description 
#           grub-bios-setup: 
#                GRUB-2.04-- 
#                description 
#           grub-editenv: 
#                GRUB-2.04-- 
#                description 
#           grub-file: 
#                GRUB-2.04-- 
#                description 
#           grub-fstest: 
#                GRUB-2.04-- 
#                description 
#           grub-glue-efi: 
#                GRUB-2.04-- 
#                description 
#           grub-install: 
#                GRUB-2.04-- 
#                description 
#           grub-kbdcomp: 
#                GRUB-2.04-- 
#                description 
#           grub-macbless: 
#                GRUB-2.04-- 
#                description 
#           grub-menulst2cfg: 
#                GRUB-2.04-- 
#                description 
#           grub-mkconfig: 
#                GRUB-2.04-- 
#                description 
#           grub-mkimage: 
#                GRUB-2.04-- 
#                description 
#           grub-mklayout: 
#                GRUB-2.04-- 
#                description 
#           grub-mknetdir: 
#                GRUB-2.04-- 
#                description 
#           grub-mkpasswd-pbkdf2: 
#                GRUB-2.04-- 
#                description 
#           grub-mkrelpath: 
#                GRUB-2.04-- 
#                description 
#           grub-mkrescue: 
#                GRUB-2.04-- 
#                description 
#           grub-mkstandalone: 
#                GRUB-2.04-- 
#                description 
#           grub-ofpathname: 
#                GRUB-2.04-- 
#                description 
#           grub-probe: 
#                GRUB-2.04-- 
#                description 
#           grub-reboot: 
#                GRUB-2.04-- 
#                description 
#           grub-render-label: 
#                GRUB-2.04-- 
#                description 
#           grub-script-check: 
#                GRUB-2.04-- 
#                description 
#           grub-set-default: 
#                GRUB-2.04-- 
#                description 
#           grub-setup: 
#                GRUB-2.04-- 
#                description 
#           grub-syslinux2cfg: 
#                GRUB-2.04-- 
#                description 
#           gunzip: 
#                Gzip-1.10-- 
#                description 
#           gzexe: 
#                Gzip-1.10-- 
#                description 
#           gzip: 
#                Gzip-1.10-- 
#                description 
#           h2ph: 
#                Perl-5.32.1-- 
#                description 
#           h2xs: 
#                Perl-5.32.1-- 
#                description 
#           halt: 
#                Sysvinit-2.98-- 
#                description 
#           head: 
#                Coreutils-8.32-- 
#                description 
#           hexdump: 
#                Util-linux-2.36.2-- 
#                description 
#           hostid: 
#                Coreutils-8.32-- 
#                description 
#           hostname: 
#                Inetutils-2.0-- 
#                description 
#           hpftodit: 
#                Groff-1.22.4-- 
#                description 
#           hwclock: 
#                Util-linux-2.36.2-- 
#                description 
#           i386: 
#                Util-linux-2.36.2-- 
#                description 
#           iconv: 
#                Glibc-2.33-- 
#                description 
#           iconvconfig: 
#                Glibc-2.33-- 
#                description 
#           id: 
#                Coreutils-8.32-- 
#                description 
#           idle3: 
#                Python-3.9.2 
#           ifcfg: 
#                IPRoute2-5.10.0-- 
#                description 
#           ifconfig: 
#                Inetutils-2.0-- 
#                description 
#           ifnames: 
#                Autoconf-2.71-- 
#                description 
#           ifstat: 
#                IPRoute2-5.10.0-- 
#                description 
#           indxbib: 
#                Groff-1.22.4-- 
#                description 
#           info: 
#                Texinfo-6.7-- 
#                description 
#           infocmp: 
#                Ncurses-6.2-- 
#                description 
#           infotocap: 
#                Ncurses-6.2-- 
#                description 
#           init: 
#                Sysvinit-2.98-- 
#                description 
#           insmod: 
#                Kmod-28-- 
#                description 
#           install: 
#                Coreutils-8.32-- 
#                description 
#           install-info: 
#                Texinfo-6.7-- 
#                description 
#           instmodsh: 
#                Perl-5.32.1-- 
#                description 
#           intltool-extract: 
#                Intltool-0.51.0-- 
#                description 
#           intltool-merge: 
#                Intltool-0.51.0-- 
#                description 
#           intltool-prepare: 
#                Intltool-0.51.0-- 
#                description 
#           intltool-update: 
#                Intltool-0.51.0-- 
#                description 
#           intltoolize: 
#                Intltool-0.51.0-- 
#                description 
#           ionice: 
#                Util-linux-2.36.2-- 
#                description 
#           ip: 
#                IPRoute2-5.10.0-- 
#                description 
#           ipcmk: 
#                Util-linux-2.36.2-- 
#                description 
#           ipcrm: 
#                Util-linux-2.36.2-- 
#                description 
#           ipcs: 
#                Util-linux-2.36.2-- 
#                description 
#           isosize: 
#                Util-linux-2.36.2-- 
#                description 
#           join: 
#                Coreutils-8.32-- 
#                description 
#           json_pp: 
#                Perl-5.32.1-- 
#                description 
#           kbdinfo: 
#                Kbd-2.4.0-- 
#                description 
#           kbdrate: 
#                Kbd-2.4.0-- 
#                description 
#           kbd_mode: 
#                Kbd-2.4.0-- 
#                description 
#           kill: 
#                Util-linux-2.36.2-- 
#                description 
#           killall: 
#                Psmisc-23.4-- 
#                description 
#           killall5: 
#                Sysvinit-2.98-- 
#                description 
#           klogd: 
#                Sysklogd-1.5.1-- 
#                description 
#           kmod: 
#                Kmod-28-- 
#                description 
#           last: 
#                Util-linux-2.36.2-- 
#                description 
#           lastb: 
#                Util-linux-2.36.2-- 
#                description 
#           lastlog: 
#                Shadow-4.8.1-- 
#                description 
#           ld: 
#                Binutils-2.36.1-- 
#                description 
#           ld.bfd: 
#                Binutils-2.36.1-- 
#                description 
#           ld.gold: 
#                Binutils-2.36.1-- 
#                description 
#           ldattach: 
#                Util-linux-2.36.2-- 
#                description 
#           ldconfig: 
#                Glibc-2.33-- 
#                description 
#           ldd: 
#                Glibc-2.33-- 
#                description 
#           lddlibc4: 
#                Glibc-2.33-- 
#                description 
#           less: 
#                Less-563-- 
#                description 
#           lessecho: 
#                Less-563-- 
#                description 
#           lesskey: 
#                Less-563-- 
#                description 
#           lex: 
#                Flex-2.6.4-- 
#                description 
#           lexgrog: 
#                Man-DB-2.9.4-- 
#                description 
#           lfskernel-5.10.17: 
#                Linux-5.10.17-- 
#                description 
#           libasan: 
#                GCC-10.2.0-- 
#                description 
#           libatomic: 
#                GCC-10.2.0-- 
#                description 
#           libcc1: 
#                GCC-10.2.0-- 
#                description 
#           libnetcfg: 
#                Perl-5.32.1-- 
#                description 
#           libtool: 
#                Libtool-2.4.6-- 
#                description 
#           libtoolize: 
#                Libtool-2.4.6-- 
#                description 
#           link: 
#                Coreutils-8.32-- 
#                description 
#           linux32: 
#                Util-linux-2.36.2-- 
#                description 
#           linux64: 
#                Util-linux-2.36.2-- 
#                description 
#           lkbib: 
#                Groff-1.22.4-- 
#                description 
#           ln: 
#                Coreutils-8.32-- 
#                description 
#           lnstat: 
#                IPRoute2-5.10.0-- 
#                description 
#           loadkeys: 
#                Kbd-2.4.0-- 
#                description 
#           loadunimap: 
#                Kbd-2.4.0-- 
#                description 
#           locale: 
#                Glibc-2.33-- 
#                description 
#           localedef: 
#                Glibc-2.33-- 
#                description 
#           locate: 
#                Findutils-4.8.0-- 
#                description 
#           logger: 
#                Util-linux-2.36.2-- 
#                description 
#           login: 
#                Shadow-4.8.1-- 
#                description 
#           logname: 
#                Coreutils-8.32-- 
#                description 
#           logoutd: 
#                Shadow-4.8.1-- 
#                description 
#           logsave: 
#                E2fsprogs-1.46.1-- 
#                description 
#           look: 
#                Util-linux-2.36.2-- 
#                description 
#           lookbib: 
#                Groff-1.22.4-- 
#                description 
#           losetup: 
#                Util-linux-2.36.2-- 
#                description 
#           ls: 
#                Coreutils-8.32-- 
#                description 
#           lsattr: 
#                E2fsprogs-1.46.1-- 
#                description 
#           lsblk: 
#                Util-linux-2.36.2-- 
#                description 
#           lscpu: 
#                Util-linux-2.36.2-- 
#                description 
#           lsipc: 
#                Util-linux-2.36.2-- 
#                description 
#           lslocks: 
#                Util-linux-2.36.2-- 
#                description 
#           lslogins: 
#                Util-linux-2.36.2-- 
#                description 
#           lsmem: 
#                Util-linux-2.36.2-- 
#                description 
#           lsmod: 
#                Kmod-28-- 
#                description 
#           lsns: 
#                Util-linux-2.36.2-- 
#                description 
#           lzcat: 
#                Xz-5.2.5-- 
#                description 
#           lzcmp: 
#                Xz-5.2.5-- 
#                description 
#           lzdiff: 
#                Xz-5.2.5-- 
#                description 
#           lzegrep: 
#                Xz-5.2.5-- 
#                description 
#           lzfgrep: 
#                Xz-5.2.5-- 
#                description 
#           lzgrep: 
#                Xz-5.2.5-- 
#                description 
#           lzless: 
#                Xz-5.2.5-- 
#                description 
#           lzma: 
#                Xz-5.2.5-- 
#                description 
#           lzmadec: 
#                Xz-5.2.5-- 
#                description 
#           lzmainfo: 
#                Xz-5.2.5-- 
#                description 
#           lzmore: 
#                Xz-5.2.5-- 
#                description 
#           m4: 
#                M4-1.4.18-- 
#                description 
#           make: 
#                Make-4.3-- 
#                description 
#           makedb: 
#                Glibc-2.33-- 
#                description 
#           makeinfo: 
#                Texinfo-6.7-- 
#                description 
#           man: 
#                Man-DB-2.9.4-- 
#                description 
#           mandb: 
#                Man-DB-2.9.4-- 
#                description 
#           manpath: 
#                Man-DB-2.9.4-- 
#                description 
#           mapscrn: 
#                Kbd-2.4.0-- 
#                description 
#           mcookie: 
#                Util-linux-2.36.2-- 
#                description 
#           md5sum: 
#                Coreutils-8.32-- 
#                description 
#           mesg: 
#                Util-linux-2.36.2-- 
#                description 
#           meson: 
#                Meson-0.57.1-- 
#                description 
#           mkdir: 
#                Coreutils-8.32-- 
#                description 
#           mke2fs: 
#                E2fsprogs-1.46.1-- 
#                description 
#           mkfifo: 
#                Coreutils-8.32-- 
#                description 
#           mkfs: 
#                Util-linux-2.36.2-- 
#                description 
#           mkfs.bfs: 
#                Util-linux-2.36.2-- 
#                description 
#           mkfs.cramfs: 
#                Util-linux-2.36.2-- 
#                description 
#           mkfs.ext2: 
#                E2fsprogs-1.46.1-- 
#                description 
#           mkfs.ext3: 
#                E2fsprogs-1.46.1-- 
#                description 
#           mkfs.ext4: 
#                E2fsprogs-1.46.1-- 
#                description 
#           mkfs.minix: 
#                Util-linux-2.36.2-- 
#                description 
#           mklost+found: 
#                E2fsprogs-1.46.1-- 
#                description 
#           mknod: 
#                Coreutils-8.32-- 
#                description 
#           mkswap: 
#                Util-linux-2.36.2-- 
#                description 
#           mktemp: 
#                Coreutils-8.32-- 
#                description 
#           mk_cmds: 
#                E2fsprogs-1.46.1-- 
#                description 
#           mmroff: 
#                Groff-1.22.4-- 
#                description 
#           modinfo: 
#                Kmod-28-- 
#                description 
#           modprobe: 
#                Kmod-28-- 
#                description 
#           more: 
#                Util-linux-2.36.2-- 
#                description 
#           mount: 
#                Util-linux-2.36.2-- 
#                description 
#           mountpoint: 
#                Util-linux-2.36.2-- 
#                description 
#           msgattrib: 
#                Gettext-0.21-- 
#                description 
#           msgcat: 
#                Gettext-0.21-- 
#                description 
#           msgcmp: 
#                Gettext-0.21-- 
#                description 
#           msgcomm: 
#                Gettext-0.21-- 
#                description 
#           msgconv: 
#                Gettext-0.21-- 
#                description 
#           msgen: 
#                Gettext-0.21-- 
#                description 
#           msgexec: 
#                Gettext-0.21-- 
#                description 
#           msgfilter: 
#                Gettext-0.21-- 
#                description 
#           msgfmt: 
#                Gettext-0.21-- 
#                description 
#           msggrep: 
#                Gettext-0.21-- 
#                description 
#           msginit: 
#                Gettext-0.21-- 
#                description 
#           msgmerge: 
#                Gettext-0.21-- 
#                description 
#           msgunfmt: 
#                Gettext-0.21-- 
#                description 
#           msguniq: 
#                Gettext-0.21-- 
#                description 
#           mtrace: 
#                Glibc-2.33-- 
#                description 
#           mv: 
#                Coreutils-8.32-- 
#                description 
#           namei: 
#                Util-linux-2.36.2-- 
#                description 
#           ncursesw6-config: 
#                Ncurses-6.2-- 
#                description 
#           neqn: 
#                Groff-1.22.4-- 
#                description 
#           newgidmap: 
#                Shadow-4.8.1-- 
#                description 
#           newgrp: 
#                Shadow-4.8.1-- 
#                description 
#           newuidmap: 
#                Shadow-4.8.1-- 
#                description 
#           newusers: 
#                Shadow-4.8.1-- 
#                description 
#           ngettext: 
#                Gettext-0.21-- 
#                description 
#           nice: 
#                Coreutils-8.32-- 
#                description 
#           ninja: 
#                Ninja-1.10.2-- 
#                description 
#           nl: 
#                Coreutils-8.32-- 
#                description 
#           nm: 
#                Binutils-2.36.1-- 
#                description 
#           nohup: 
#                Coreutils-8.32-- 
#                description 
#           nologin: 
#                Shadow-4.8.1-- 
#                description 
#           nproc: 
#                Coreutils-8.32-- 
#                description 
#           nroff: 
#                Groff-1.22.4-- 
#                description 
#           nscd: 
#                Glibc-2.33-- 
#                description 
#           nsenter: 
#                Util-linux-2.36.2-- 
#                description 
#           nstat: 
#                IPRoute2-5.10.0-- 
#                description 
#           numfmt: 
#                Coreutils-8.32-- 
#                description 
#           objcopy: 
#                Binutils-2.36.1-- 
#                description 
#           objdump: 
#                Binutils-2.36.1-- 
#                description 
#           od: 
#                Coreutils-8.32-- 
#                description 
#           openssl: 
#                OpenSSL-1.1.1j-- 
#                description 
#           openvt: 
#                Kbd-2.4.0-- 
#                description 
#           partx: 
#                Util-linux-2.36.2-- 
#                description 
#           passwd: 
#                Shadow-4.8.1-- 
#                description 
#           paste: 
#                Coreutils-8.32-- 
#                description 
#           patch: 
#                Patch-2.7.6-- 
#                description 
#           pathchk: 
#                Coreutils-8.32-- 
#                description 
#           pcprofiledump: 
#                Glibc-2.33-- 
#                description 
#           pdfmom: 
#                Groff-1.22.4-- 
#                description 
#           pdfroff: 
#                Groff-1.22.4-- 
#                description 
#           pdftexi2dvi: 
#                Texinfo-6.7-- 
#                description 
#           peekfd: 
#                Psmisc-23.4-- 
#                description 
#           perl: 
#                Perl-5.32.1-- 
#                description 
#           perl5.32.1: 
#                Perl-5.32.1-- 
#                description 
#           perlbug: 
#                Perl-5.32.1-- 
#                description 
#           perldoc: 
#                Perl-5.32.1-- 
#                description 
#           perlivp: 
#                Perl-5.32.1-- 
#                description 
#           perlthanks: 
#                Perl-5.32.1-- 
#                description 
#           pfbtops: 
#                Groff-1.22.4-- 
#                description 
#           pgrep: 
#                Procps-ng-3.3.17-- 
#                description 
#           pic: 
#                Groff-1.22.4-- 
#                description 
#           pic2graph: 
#                Groff-1.22.4-- 
#                description 
#           piconv: 
#                Perl-5.32.1-- 
#                description 
#           pidof: 
#                Procps-ng-3.3.17-- 
#                description 
#           ping: 
#                Inetutils-2.0-- 
#                description 
#           ping6: 
#                Inetutils-2.0-- 
#                description 
#           pinky: 
#                Coreutils-8.32-- 
#                description 
#           pip3: 
#                Python-3.9.2 
#           pivot_root: 
#                Util-linux-2.36.2-- 
#                description 
#           pkg-config: 
#                Pkg-config-0.29.2-- 
#                description 
#           pkill: 
#                Procps-ng-3.3.17-- 
#                description 
#           pl2pm: 
#                Perl-5.32.1-- 
#                description 
#           pldd: 
#                Glibc-2.33-- 
#                description 
#           pmap: 
#                Procps-ng-3.3.17-- 
#                description 
#           pod2html: 
#                Perl-5.32.1-- 
#                description 
#           pod2man: 
#                Perl-5.32.1-- 
#                description 
#           pod2texi: 
#                Texinfo-6.7-- 
#                description 
#           pod2text: 
#                Perl-5.32.1-- 
#                description 
#           pod2usage: 
#                Perl-5.32.1-- 
#                description 
#           podchecker: 
#                Perl-5.32.1-- 
#                description 
#           podselect: 
#                Perl-5.32.1-- 
#                description 
#           post-grohtml: 
#                Groff-1.22.4-- 
#                description 
#           poweroff: 
#                Sysvinit-2.98-- 
#                description 
#           pr: 
#                Coreutils-8.32-- 
#                description 
#           pre-grohtml: 
#                Groff-1.22.4-- 
#                description 
#           preconv: 
#                Groff-1.22.4-- 
#                description 
#           printenv: 
#                Coreutils-8.32-- 
#                description 
#           printf: 
#                Coreutils-8.32-- 
#                description 
#           prlimit: 
#                Util-linux-2.36.2-- 
#                description 
#           prove: 
#                Perl-5.32.1-- 
#                description 
#           prtstat: 
#                Psmisc-23.4-- 
#                description 
#           ps: 
#                Procps-ng-3.3.17-- 
#                description 
#           psfaddtable: 
#                Kbd-2.4.0-- 
#                description 
#           psfgettable: 
#                Kbd-2.4.0-- 
#                description 
#           psfstriptable: 
#                Kbd-2.4.0-- 
#                description 
#           psfxtable: 
#                Kbd-2.4.0-- 
#                description 
#           pslog: 
#                Psmisc-23.4-- 
#                description 
#           pstree: 
#                Psmisc-23.4-- 
#                description 
#           pstree.x11: 
#                Psmisc-23.4-- 
#                description 
#           ptar: 
#                Perl-5.32.1-- 
#                description 
#           ptardiff: 
#                Perl-5.32.1-- 
#                description 
#           ptargrep: 
#                Perl-5.32.1-- 
#                description 
#           ptx: 
#                Coreutils-8.32-- 
#                description 
#           pwait: 
#                Procps-ng-3.3.17-- 
#                description 
#           pwck: 
#                Shadow-4.8.1-- 
#                description 
#           pwconv: 
#                Shadow-4.8.1-- 
#                description 
#           pwd: 
#                Coreutils-8.32-- 
#                description 
#           pwdx: 
#                Procps-ng-3.3.17-- 
#                description 
#           pwunconv: 
#                Shadow-4.8.1-- 
#                description 
#           pydoc3: 
#                Python-3.9.2 
#           python3: 
#                Python-3.9.2 
#           ranlib: 
#                Binutils-2.36.1-- 
#                description 
#           raw: 
#                Util-linux-2.36.2-- 
#                description 
#           readelf: 
#                Binutils-2.36.1-- 
#                description 
#           readlink: 
#                Coreutils-8.32-- 
#                description 
#           readprofile: 
#                Util-linux-2.36.2-- 
#                description 
#           realpath: 
#                Coreutils-8.32-- 
#                description 
#           reboot: 
#                Sysvinit-2.98-- 
#                description 
#           recode-sr-latin: 
#                Gettext-0.21-- 
#                description 
#           refer: 
#                Groff-1.22.4-- 
#                description 
#           rename: 
#                Util-linux-2.36.2-- 
#                description 
#           renice: 
#                Util-linux-2.36.2-- 
#                description 
#           reset: 
#                Ncurses-6.2-- 
#                description 
#           resize2fs: 
#                E2fsprogs-1.46.1-- 
#                description 
#           resizepart: 
#                Util-linux-2.36.2-- 
#                description 
#           rev: 
#                Util-linux-2.36.2-- 
#                description 
#           rkfill: 
#                Util-linux-2.36.2-- 
#                description 
#           rm: 
#                Coreutils-8.32-- 
#                description 
#           rmdir: 
#                Coreutils-8.32-- 
#                description 
#           rmmod: 
#                Kmod-28-- 
#                description 
#           roff2dvi: 
#                Groff-1.22.4-- 
#                description 
#           roff2html: 
#                Groff-1.22.4-- 
#                description 
#           roff2pdf: 
#                Groff-1.22.4-- 
#                description 
#           roff2ps: 
#                Groff-1.22.4-- 
#                description 
#           roff2text: 
#                Groff-1.22.4-- 
#                description 
#           roff2x: 
#                Groff-1.22.4-- 
#                description 
#           routef: 
#                IPRoute2-5.10.0-- 
#                description 
#           routel: 
#                IPRoute2-5.10.0-- 
#                description 
#           rtacct: 
#                IPRoute2-5.10.0-- 
#                description 
#           rtcwake: 
#                Util-linux-2.36.2-- 
#                description 
#           rtmon: 
#                IPRoute2-5.10.0-- 
#                description 
#           rtpr: 
#                IPRoute2-5.10.0-- 
#                description 
#           rtstat: 
#                IPRoute2-5.10.0-- 
#                description 
#           runcon: 
#                Coreutils-8.32-- 
#                description 
#           runlevel: 
#                Sysvinit-2.98-- 
#                description 
#           runtest: 
#                DejaGNU-1.6.2-- 
#                description 
#           rview: 
#                Vim-8.2.2433-- 
#                description 
#           rvim: 
#                Vim-8.2.2433-- 
#                description 
#           script: 
#                Util-linux-2.36.2-- 
#                description 
#           scriptreplay: 
#                Util-linux-2.36.2-- 
#                description 
#           sdiff: 
#                Diffutils-3.7-- 
#                description 
#           sed: 
#                Sed-4.8-- 
#                description 
#           seq: 
#                Coreutils-8.32-- 
#                description 
#           setarch: 
#                Util-linux-2.36.2-- 
#                description 
#           setcap: 
#                Libcap-2.48-- 
#                description 
#           setfacl: 
#                Acl-2.2.53-- 
#                description 
#           setfattr: 
#                Attr-2.4.48-- 
#                description 
#           setfont: 
#                Kbd-2.4.0-- 
#                description 
#           setkeycodes: 
#                Kbd-2.4.0-- 
#                description 
#           setleds: 
#                Kbd-2.4.0-- 
#                description 
#           setmetamode: 
#                Kbd-2.4.0-- 
#                description 
#           setsid: 
#                Util-linux-2.36.2-- 
#                description 
#           setterm: 
#                Util-linux-2.36.2-- 
#                description 
#           setvtrgb: 
#                Kbd-2.4.0-- 
#                description 
#           sfdisk: 
#                Util-linux-2.36.2-- 
#                description 
#           sg: 
#                Shadow-4.8.1-- 
#                description 
#           sh: 
#                Bash-5.1-- 
#                description 
#           sha1sum: 
#                Coreutils-8.32-- 
#                description 
#           sha224sum: 
#                Coreutils-8.32-- 
#                description 
#           sha256sum: 
#                Coreutils-8.32-- 
#                description 
#           sha384sum: 
#                Coreutils-8.32-- 
#                description 
#           sha512sum: 
#                Coreutils-8.32-- 
#                description 
#           shasum: 
#                Perl-5.32.1-- 
#                description 
#           showconsolefont: 
#                Kbd-2.4.0-- 
#                description 
#           showkey: 
#                Kbd-2.4.0-- 
#                description 
#           shred: 
#                Coreutils-8.32-- 
#                description 
#           shuf: 
#                Coreutils-8.32-- 
#                description 
#           shutdown: 
#                Sysvinit-2.98-- 
#                description 
#           size: 
#                Binutils-2.36.1-- 
#                description 
#           slabtop: 
#                Procps-ng-3.3.17-- 
#                description 
#           sleep: 
#                Coreutils-8.32-- 
#                description 
#           sln: 
#                Glibc-2.33-- 
#                description 
#           soelim: 
#                Groff-1.22.4-- 
#                description 
#           sort: 
#                Coreutils-8.32-- 
#                description 
#           sotruss: 
#                Glibc-2.33-- 
#                description 
#           splain: 
#                Perl-5.32.1-- 
#                description 
#           split: 
#                Coreutils-8.32-- 
#                description 
#           sprof: 
#                Glibc-2.33-- 
#                description 
#           ss: 
#                IPRoute2-5.10.0-- 
#                description 
#           stat: 
#                Coreutils-8.32-- 
#                description 
#           stdbuf: 
#                Coreutils-8.32-- 
#                description 
#           strings: 
#                Binutils-2.36.1-- 
#                description 
#           strip: 
#                Binutils-2.36.1-- 
#                description 
#           stty: 
#                Coreutils-8.32-- 
#                description 
#           su: 
#                Shadow-4.8.1-- 
#                description 
#           sulogin: 
#                Util-linux-2.36.2-- 
#                description 
#           sum: 
#                Coreutils-8.32-- 
#                description 
#           swaplabel: 
#                Util-linux-2.36.2-- 
#                description 
#           swapoff: 
#                Util-linux-2.36.2-- 
#                description 
#           swapon: 
#                Util-linux-2.36.2-- 
#                description 
#           switch_root: 
#                Util-linux-2.36.2-- 
#                description 
#           sync: 
#                Coreutils-8.32-- 
#                description 
#           sysctl: 
#                Procps-ng-3.3.17-- 
#                description 
#           syslogd: 
#                Sysklogd-1.5.1-- 
#                description 
#           tabs: 
#                Ncurses-6.2-- 
#                description 
#           tac: 
#                Coreutils-8.32-- 
#                description 
#           tail: 
#                Coreutils-8.32-- 
#                description 
#           tailf: 
#                Util-linux-2.36.2-- 
#                description 
#           talk: 
#                Inetutils-2.0-- 
#                description 
#           tar: 
#                Tar-1.34-- 
#                description 
#           taskset: 
#                Util-linux-2.36.2-- 
#                description 
#           tbl: 
#                Groff-1.22.4-- 
#                description 
#           tc: 
#                IPRoute2-5.10.0-- 
#                description 
#           tclsh: 
#                Tcl-8.6.11-- 
#                description 
#           tclsh8.6: 
#                Tcl-8.6.11-- 
#                description 
#           tee: 
#                Coreutils-8.32-- 
#                description 
#           telinit: 
#                Sysvinit-2.98-- 
#                description 
#           telnet: 
#                Inetutils-2.0-- 
#                description 
#           test: 
#                Coreutils-8.32-- 
#                description 
#           texi2dvi: 
#                Texinfo-6.7-- 
#                description 
#           texi2pdf: 
#                Texinfo-6.7-- 
#                description 
#           texi2any: 
#                Texinfo-6.7-- 
#                description 
#           texindex: 
#                Texinfo-6.7-- 
#                description 
#           tfmtodit: 
#                Groff-1.22.4-- 
#                description 
#           tftp: 
#                Inetutils-2.0-- 
#                description 
#           tic: 
#                Ncurses-6.2-- 
#                description 
#           timeout: 
#                Coreutils-8.32-- 
#                description 
#           tload: 
#                Procps-ng-3.3.17-- 
#                description 
#           toe: 
#                Ncurses-6.2-- 
#                description 
#           top: 
#                Procps-ng-3.3.17-- 
#                description 
#           touch: 
#                Coreutils-8.32-- 
#                description 
#           tput: 
#                Ncurses-6.2-- 
#                description 
#           tr: 
#                Coreutils-8.32-- 
#                description 
#           traceroute: 
#                Inetutils-2.0-- 
#                description 
#           troff: 
#                Groff-1.22.4-- 
#                description 
#           true: 
#                Coreutils-8.32-- 
#                description 
#           truncate: 
#                Coreutils-8.32-- 
#                description 
#           tset: 
#                Ncurses-6.2-- 
#                description 
#           tsort: 
#                Coreutils-8.32-- 
#                description 
#           tty: 
#                Coreutils-8.32-- 
#                description 
#           tune2fs: 
#                E2fsprogs-1.46.1-- 
#                description 
#           tzselect: 
#                Glibc-2.33-- 
#                description 
#           udevadm: 
#                Eudev-3.2.10-- 
#                description 
#           udevd: 
#                Eudev-3.2.10-- 
#                description 
#           ul: 
#                Util-linux-2.36.2-- 
#                description 
#           umount: 
#                Util-linux-2.36.2-- 
#                description 
#           uname: 
#                Coreutils-8.32-- 
#                description 
#           uname26: 
#                Util-linux-2.36.2-- 
#                description 
#           uncompress: 
#                Gzip-1.10-- 
#                description 
#           unexpand: 
#                Coreutils-8.32-- 
#                description 
#           unicode_start: 
#                Kbd-2.4.0-- 
#                description 
#           unicode_stop: 
#                Kbd-2.4.0-- 
#                description 
#           uniq: 
#                Coreutils-8.32-- 
#                description 
#           unlink: 
#                Coreutils-8.32-- 
#                description 
#           unlzma: 
#                Xz-5.2.5-- 
#                description 
#           unshare: 
#                Util-linux-2.36.2-- 
#                description 
#           unxz: 
#                Xz-5.2.5-- 
#                description 
#           updatedb: 
#                Findutils-4.8.0-- 
#                description 
#           uptime: 
#                Procps-ng-3.3.17-- 
#                description 
#           useradd: 
#                Shadow-4.8.1-- 
#                description 
#           userdel: 
#                Shadow-4.8.1-- 
#                description 
#           usermod: 
#                Shadow-4.8.1-- 
#                description 
#           users: 
#                Coreutils-8.32-- 
#                description 
#           utmpdump: 
#                Util-linux-2.36.2-- 
#                description 
#           uuidd: 
#                Util-linux-2.36.2-- 
#                description 
#           uuidgen: 
#                Util-linux-2.36.2-- 
#                description 
#           uuidparse: 
#                Util-linux-2.36.2-- 
#                description 
#           vdir: 
#                Coreutils-8.32-- 
#                description 
#           vi: 
#                Vim-8.2.2433-- 
#                description 
#           view: 
#                Vim-8.2.2433-- 
#                description 
#           vigr: 
#                Shadow-4.8.1-- 
#                description 
#           vim: 
#                Vim-8.2.2433-- 
#                description 
#           vimdiff: 
#                Vim-8.2.2433-- 
#                description 
#           vimtutor: 
#                Vim-8.2.2433-- 
#                description 
#           vipw: 
#                Shadow-4.8.1-- 
#                description 
#           vmstat: 
#                Procps-ng-3.3.17-- 
#                description 
#           w: 
#                Procps-ng-3.3.17-- 
#                description 
#           wall: 
#                Util-linux-2.36.2-- 
#                description 
#           watch: 
#                Procps-ng-3.3.17-- 
#                description 
#           wc: 
#                Coreutils-8.32-- 
#                description 
#           wdctl: 
#                Util-linux-2.36.2-- 
#                description 
#           whatis: 
#                Man-DB-2.9.4-- 
#                description 
#           whereis: 
#                Util-linux-2.36.2-- 
#                description 
#           who: 
#                Coreutils-8.32-- 
#                description 
#           whoami: 
#                Coreutils-8.32-- 
#                description 
#           wipefs: 
#                Util-linux-2.36.2-- 
#                description 
#           x86_64: 
#                Util-linux-2.36.2-- 
#                description 
#           xargs: 
#                Findutils-4.8.0-- 
#                description 
#           xgettext: 
#                Gettext-0.21-- 
#                description 
#           xmlwf: 
#                Expat-2.2.10-- 
#                description 
#           xsubpp: 
#                Perl-5.32.1-- 
#                description 
#           xtrace: 
#                Glibc-2.33-- 
#                description 
#           xxd: 
#                Vim-8.2.2433-- 
#                description 
#           xz: 
#                Xz-5.2.5-- 
#                description 
#           xzcat: 
#                Xz-5.2.5-- 
#                description 
#           xzcmp: 
#                Xz-5.2.5-- 
#                description 
#           xzdec: 
#                Xz-5.2.5-- 
#                description 
#           xzdiff: 
#                Xz-5.2.5-- 
#                description 
#           xzegrep: 
#                Xz-5.2.5-- 
#                description 
#           xzfgrep: 
#                Xz-5.2.5-- 
#                description 
#           xzgrep: 
#                Xz-5.2.5-- 
#                description 
#           xzless: 
#                Xz-5.2.5-- 
#                description 
#           xzmore: 
#                Xz-5.2.5-- 
#                description 
#           yacc: 
#                Bison-3.7.5-- 
#                description 
#           yes: 
#                Coreutils-8.32-- 
#                description 
#           zcat: 
#                Gzip-1.10-- 
#                description 
#           zcmp: 
#                Gzip-1.10-- 
#                description 
#           zdiff: 
#                Gzip-1.10-- 
#                description 
#           zdump: 
#                Glibc-2.33-- 
#                description 
#           zegrep: 
#                Gzip-1.10-- 
#                description 
#           zfgrep: 
#                Gzip-1.10-- 
#                description 
#           zforce: 
#                Gzip-1.10-- 
#                description 
#           zgrep: 
#                Gzip-1.10-- 
#                description 
#           zic: 
#                Glibc-2.33-- 
#                description 
#           zipdetails: 
#                Perl-5.32.1-- 
#                description 
#           zless: 
#                Gzip-1.10-- 
#                description 
#           zmore: 
#                Gzip-1.10-- 
#                description 
#           znew: 
#                Gzip-1.10-- 
#                description 
#           zramctl: 
#                Util-linux-2.36.2-- 
#                description 
#           zstd: 
#                Zstd-1.4.8-- 
#                description 
#           zstdgrep: 
#                Zstd-1.4.8-- 
#                description 
#           zstdless: 
#                Zstd-1.4.8-- 
#                description  
#        Libraries  
#           Expat: 
#                XML::Parser-2.46-- 
#                description 
#           ld-2.33.so: 
#                Glibc-2.33-- 
#                description 
#           libacl: 
#                Acl-2.2.53-- 
#                description 
#           libanl: 
#                Glibc-2.33-- 
#                description 
#           libasprintf: 
#                Gettext-0.21-- 
#                description 
#           libattr: 
#                Attr-2.4.48-- 
#                description 
#           libbfd: 
#                Binutils-2.36.1-- 
#                description 
#           libblkid: 
#                Util-linux-2.36.2-- 
#                description 
#           libBrokenLocale: 
#                Glibc-2.33-- 
#                description 
#           libbz2: 
#                Bzip2-1.0.8-- 
#                description 
#           libc: 
#                Glibc-2.33-- 
#                description 
#           libcap: 
#                Libcap-2.48-- 
#                description 
#           libcheck: 
#                Check-0.15.2-- 
#                description 
#           libcom_err: 
#                E2fsprogs-1.46.1-- 
#                description 
#           libcrypt: 
#                Glibc-2.33-- 
#                description 
#           libcrypto.so: 
#                OpenSSL-1.1.1j-- 
#                description 
#           libctf: 
#                Binutils-2.36.1-- 
#                description 
#           libctf-nobfd: 
#                Binutils-2.36.1-- 
#                description 
#           libcursesw: 
#                Ncurses-6.2-- 
#                description 
#           libdl: 
#                Glibc-2.33-- 
#                description 
#           libe2p: 
#                E2fsprogs-1.46.1-- 
#                description 
#           libelf: 
#                Libelf from Elfutils-0.183-- 
#                description 
#           libexpat: 
#                Expat-2.2.10-- 
#                description 
#           libexpect-5.45: 
#                Expect-5.45.4-- 
#                description 
#           libext2fs: 
#                E2fsprogs-1.46.1-- 
#                description 
#           libfdisk: 
#                Util-linux-2.36.2-- 
#                description 
#           libffi: 
#                Libffi-3.3 
#           libfl: 
#                Flex-2.6.4-- 
#                description 
#           libformw: 
#                Ncurses-6.2-- 
#                description 
#           libg: 
#                Glibc-2.33-- 
#                description 
#           libgcc: 
#                GCC-10.2.0-- 
#                description 
#           libgcov: 
#                GCC-10.2.0-- 
#                description 
#           libgdbm: 
#                GDBM-1.19-- 
#                description 
#           libgdbm_compat: 
#                GDBM-1.19-- 
#                description 
#           libgettextlib: 
#                Gettext-0.21-- 
#                description 
#           libgettextpo: 
#                Gettext-0.21-- 
#                description 
#           libgettextsrc: 
#                Gettext-0.21-- 
#                description 
#           libgmp: 
#                GMP-6.2.1-- 
#                description 
#           libgmpxx: 
#                GMP-6.2.1-- 
#                description 
#           libgomp: 
#                GCC-10.2.0-- 
#                description 
#           libhistory: 
#                Readline-8.1-- 
#                description 
#           libkmod: 
#                Kmod-28 
#           liblsan: 
#                GCC-10.2.0-- 
#                description 
#           libltdl: 
#                Libtool-2.4.6-- 
#                description 
#           liblto_plugin: 
#                GCC-10.2.0-- 
#                description 
#           liblzma: 
#                Xz-5.2.5-- 
#                description 
#           libm: 
#                Glibc-2.33-- 
#                description 
#           libmagic: 
#                File-5.39-- 
#                description 
#           libman: 
#                Man-DB-2.9.4-- 
#                description 
#           libmandb: 
#                Man-DB-2.9.4-- 
#                description 
#           libmcheck: 
#                Glibc-2.33-- 
#                description 
#           libmemusage: 
#                Glibc-2.33-- 
#                description 
#           libmenuw: 
#                Ncurses-6.2-- 
#                description 
#           libmount: 
#                Util-linux-2.36.2-- 
#                description 
#           libmpc: 
#                MPC-1.2.1-- 
#                description 
#           libmpfr: 
#                MPFR-4.1.0-- 
#                description 
#           libncursesw: 
#                Ncurses-6.2-- 
#                description 
#           libnsl: 
#                Glibc-2.33-- 
#                description 
#           libnss: 
#                Glibc-2.33-- 
#                description 
#           libopcodes: 
#                Binutils-2.36.1-- 
#                description 
#           libpanelw: 
#                Ncurses-6.2-- 
#                description 
#           libpcprofile: 
#                Glibc-2.33-- 
#                description 
#           libpipeline: 
#                Libpipeline-1.5.3 
#           libprocps: 
#                Procps-ng-3.3.17-- 
#                description 
#           libpsx: 
#                Libcap-2.48-- 
#                description 
#           libpthread: 
#                Glibc-2.33-- 
#                description 
#           libquadmath: 
#                GCC-10.2.0-- 
#                description 
#           libreadline: 
#                Readline-8.1-- 
#                description 
#           libresolv: 
#                Glibc-2.33-- 
#                description 
#           librt: 
#                Glibc-2.33-- 
#                description 
#           libSegFault: 
#                Glibc-2.33-- 
#                description 
#           libsmartcols: 
#                Util-linux-2.36.2-- 
#                description 
#           libss: 
#                E2fsprogs-1.46.1-- 
#                description 
#           libssl.so: 
#                OpenSSL-1.1.1j-- 
#                description 
#           libssp: 
#                GCC-10.2.0-- 
#                description 
#           libstdbuf: 
#                Coreutils-8.32-- 
#                description 
#           libstdc++: 
#                GCC-10.2.0-- 
#                description 
#           libstdc++fs: 
#                GCC-10.2.0-- 
#                description 
#           libsupc++: 
#                GCC-10.2.0-- 
#                description 
#           libtcl8.6.so: 
#                Tcl-8.6.11-- 
#                description 
#           libtclstub8.6.a: 
#                Tcl-8.6.11-- 
#                description 
#           libtextstyle: 
#                Gettext-0.21-- 
#                description 
#           libthread_db: 
#                Glibc-2.33-- 
#                description 
#           libtsan: 
#                GCC-10.2.0-- 
#                description 
#           libubsan: 
#                GCC-10.2.0-- 
#                description 
#           libudev: 
#                Eudev-3.2.10-- 
#                description 
#           libutil: 
#                Glibc-2.33-- 
#                description 
#           libuuid: 
#                Util-linux-2.36.2-- 
#                description 
#           liby: 
#                Bison-3.7.5-- 
#                description 
#           libz: 
#                Zlib-1.2.11-- 
#                description 
#           libzstd: 
#                Zstd-1.4.8-- 
#                description 
#           preloadable_libintl: 
#                Gettext-0.21-- 
#                description  
#        Scripts  
#           checkfs: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           cleanfs: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           console: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           configuring: 
#                Configuring the Linux Console 
#           File creation at boot: 
#           configuring: 
#                Creating Files at Boot 
#           functions: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           halt: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           hostname: 
#           configuring: 
#                Configuring the system hostname 
#           ifdown: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           ifup: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           ipv4-static: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           localnet: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           /etc/hosts: 
#                Customizing the /etc/hosts File 
#           modules: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           mountfs: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           mountvirtfs: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           network: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           /etc/hosts: 
#                Customizing the /etc/hosts File 
#           configuring: 
#                General Network Configuration 
#           rc: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           reboot: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           sendsignals: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           setclock: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           configuring: 
#                Configuring the System Clock 
#           swap: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           sysctl: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           sysklogd: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           configuring: 
#                Configuring the sysklogd Script 
#           template: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           udev: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           udev_retry: 
#                LFS-Bootscripts-20210201-- 
#                description 
#           dwp: 
#                Binutils-2.36.1-- 
#                description  
#        Others  
#           /boot/config-5.10.17: 
#                Linux-5.10.17-- 
#                description 
#           /boot/System.map-5.10.17: 
#                Linux-5.10.17-- 
#                description 
#           /dev/*: 
#                Preparing Virtual Kernel File Systems 
#           /etc/fstab: 
#                Creating the /etc/fstab File 
#           /etc/group: 
#                Creating Essential Files and Symlinks 
#           /etc/hosts: 
#                Customizing the /etc/hosts File 
#           /etc/inittab: 
#                Configuring Sysvinit 
#           /etc/inputrc: 
#                Creating the /etc/inputrc File 
#           /etc/ld.so.conf: 
#                Configuring the Dynamic Loader 
#           /etc/lfs-release: 
#                The End 
#           /etc/localtime: 
#                Configuring Glibc 
#           /etc/lsb-release: 
#                The End 
#           /etc/modprobe.d/usb.conf: 
#                Configuring Linux Module Load Order 
#           /etc/nsswitch.conf: 
#                Configuring Glibc 
#           /etc/os-release: 
#                The End 
#           /etc/passwd: 
#                Creating Essential Files and Symlinks 
#           /etc/profile: 
#                The Bash Shell Startup Files 
#           /etc/protocols: 
#                Iana-Etc-20210202 
#           /etc/resolv.conf: 
#                Creating the /etc/resolv.conf File 
#           /etc/services: 
#                Iana-Etc-20210202 
#           /etc/syslog.conf: 
#                Configuring Sysklogd 
#           /etc/udev: 
#                Eudev-3.2.10-- 
#                description 
#           /etc/udev/hwdb.bin: 
#                Configuring Eudev 
#           /etc/vimrc: 
#                Configuring Vim 
#           /run/utmp: 
#                Creating Essential Files and Symlinks 
#           /usr/include/asm-generic/*.h: 
#                Linux-5.10.17 API Headers-- 
#                description 
#           /usr/include/asm/*.h: 
#                Linux-5.10.17 API Headers-- 
#                description 
#           /usr/include/drm/*.h: 
#                Linux-5.10.17 API Headers-- 
#                description 
#           /usr/include/linux/*.h: 
#                Linux-5.10.17 API Headers-- 
#                description 
#           /usr/include/misc/*.h: 
#                Linux-5.10.17 API Headers-- 
#                description 
#           /usr/include/mtd/*.h: 
#                Linux-5.10.17 API Headers-- 
#                description 
#           /usr/include/rdma/*.h: 
#                Linux-5.10.17 API Headers-- 
#                description 
#           /usr/include/scsi/*.h: 
#                Linux-5.10.17 API Headers-- 
#                description 
#           /usr/include/sound/*.h: 
#                Linux-5.10.17 API Headers-- 
#                description 
#           /usr/include/video/*.h: 
#                Linux-5.10.17 API Headers-- 
#                description 
#           /usr/include/xen/*.h: 
#                Linux-5.10.17 API Headers-- 
#                description 
#           /var/log/btmp: 
#                Creating Essential Files and Symlinks 
#           /var/log/lastlog: 
#                Creating Essential Files and Symlinks 
#           /var/log/wtmp: 
#                Creating Essential Files and Symlinks 
#           /etc/shells: 
#                Creating the /etc/shells File 
#           man pages: 
#                Man-pages-5.10-- 
#                description 