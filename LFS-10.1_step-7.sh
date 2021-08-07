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



cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'libtool-*')
tar xf $(find -maxdepth 1 -type f -name 'libtool-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'libtool-*')
read -p "Chapter 8.35"
 
# 010392        8.35. Libtool-2.4.6 
# 010393 
# 010394                          The Libtool package contains the GNU generic library support script. It wraps the
# 010395                        complexity of using shared libraries in a consistent, portable interface. 
# 010396           Approximate build time: 1.6 SBU
# 010397           Required disk space: 43 MB 
# 010398          8.35.1. Installation of Libtool 
# 010399 
# 010400                          Prepare Libtool for compilation: 



./configure --prefix=/usr



# 010408 
# 010409                          Compile the package: 



make



# 010417 
# 010418                          To test the results, issue: 



make check



# 010426          Note 
# 010427 
# 010428                          The test time for libtool can be reduced significantly on a system with multiple
# 010429                        cores. To do this, append TESTSUITEFLAGS=-j<N>  to the line above. For instance, using
# 010430                        -j4 can reduce the test time by over 60 percent. 
# 010431 
# 010432                          Five tests are known to fail in the LFS build environment due to a circular dependency,
# 010433                        but all tests pass if rechecked after automake is installed. 
# 010434 
# 010435                          Install the package: 



make install



# 010443 
# 010444                          Remove an useless static library: 



rm -fv /usr/lib/libltdl.a


 
# 010452          8.35.2. Contents of Libtool 
# 010453           Installed programs: libtool and libtoolize
# 010454           Installed libraries: libltdl.so
# 010455           Installed directories: /usr/include/libltdl and /usr/share/libtool  
# 010456            Short Descriptions  
# 010457 
# 010458                          
# 010459 
# 010460                libtool   
# 010461 
# 010462                          Provides generalized library-building support services  
# 010463 
# 010464                          libtoolize   
# 010465 
# 010466                          Provides a standard way to add libtool  support to a package  
# 010467 
# 010468                          libltdl 
# 010469 
# 010470                          Hides the various difficulties of dlopening libraries 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'gdbm-*')
tar xf $(find -maxdepth 1 -type f -name 'gdbm-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'gdbm-*')
read -p "Chapter 8.36"
 
# 010471        8.36. GDBM-1.19 
# 010472 
# 010473                          The GDBM package contains the GNU Database Manager. It is a library of database
# 010474                        functions that use extensible hashing and works similar to the standard UNIX dbm.
# 010475                        The library provides primitives for storing key/data pairs, searching and retrieving
# 010476                        the data by its key and deleting a key along with its data. 
# 010477           Approximate build time: 0.2 SBU
# 010478           Required disk space: 11 MB 
# 010479          8.36.1. Installation of GDBM 
# 010480 
# 010481                          Prepare GDBM for compilation: 



./configure --prefix=/usr    \
            --disable-static \
            --enable-libgdbm-compat



# 010491 
# 010492                          The meaning of the configure option: 
# 010493 
# 010494                --enable-libgdbm-compat 
# 010495 
# 010496                          This switch enables building the libgdbm compatibility library. Some packages outside
# 010497                        of LFS may require the older DBM routines it provides. 
# 010498 
# 010499                          Compile the package: 



make



# 010507 
# 010508                          To test the results, issue: 



make check



# 010516 
# 010517                          One test, VERSION, is known to fail. 
# 010518 
# 010519                          Install the package: 



make install


 
# 010527          8.36.2. Contents of GDBM 
# 010528           Installed programs: gdbm_dump, gdbm_load, and gdbmtool
# 010529           Installed libraries: libgdbm.so and libgdbm_compat.so  
# 010530            Short Descriptions  
# 010531 
# 010532                          
# 010533 
# 010534                gdbm_dump   
# 010535 
# 010536                          Dumps a GDBM database to a file  
# 010537 
# 010538                          gdbm_load   
# 010539 
# 010540                          Recreates a GDBM database from a dump file  
# 010541 
# 010542                          gdbmtool   
# 010543 
# 010544                          Tests and modifies a GDBM database  
# 010545 
# 010546                          libgdbm 
# 010547 
# 010548                          Contains functions to manipulate a hashed database  
# 010549 
# 010550                          libgdbm_compat 
# 010551 
# 010552                          Compatibility library containing older DBM functions 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'gperf-*')
tar xf $(find -maxdepth 1 -type f -name 'gperf-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'gperf-*')
read -p "Chapter 8.37"
 
# 010553        8.37. Gperf-3.1 
# 010554 
# 010555                          Gperf generates a perfect hash function from a key set. 
# 010556           Approximate build time: less than 0.1 SBU
# 010557           Required disk space: 6.4 MB 
# 010558          8.37.1. Installation of Gperf 
# 010559 
# 010560                          Prepare Gperf for compilation: 



./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.1



# 010568 
# 010569                          Compile the package: 



make



# 010577 
# 010578                          The tests are known to fail if running multiple simultaneous tests (-j option greater
# 010579                        than 1). To test the results, issue: 



make -j1 check



# 010587 
# 010588                          Install the package: 



make install


 
# 010596          8.37.2. Contents of Gperf 
# 010597           Installed program: gperf
# 010598           Installed directory: /usr/share/doc/gperf-3.1  
# 010599            Short Descriptions  
# 010600 
# 010601                          
# 010602 
# 010603                gperf   
# 010604 
# 010605                          Generates a perfect hash from a key set 


cd /sources
wget https://sourceforge.net/projects/expat/files/expat/2.4.1/expat-2.4.1.tar.xz --continue --directory-prefix=$LFS/sources



cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'expat-*')
tar xf $(find -maxdepth 1 -type f -name 'expat-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'expat-*')
read -p "Chapter 8.38"
 
# 010606        8.38. Expat-2.2.10 
# 010607 
# 010608                          The Expat package contains a stream oriented C library for parsing XML. 
# 010609           Approximate build time: 0.1 SBU
# 010610           Required disk space: 14 MB 
# 010611          8.38.1. Installation of Expat 
# 010612 
# 010613                          Prepare Expat for compilation: 



./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.2.10



# 010623 
# 010624                          Compile the package: 



make



# 010632 
# 010633                          To test the results, issue: 



make check



# 010641 
# 010642                          Install the package: 



make install



# 010650 
# 010651                          If desired, install the documentation: 



install -v -m644 doc/*.{html,png,css} /usr/share/doc/expat-2.2.10


 
# 010659          8.38.2. Contents of Expat 
# 010660           Installed program: xmlwf
# 010661           Installed libraries: libexpat.so
# 010662           Installed directory: /usr/share/doc/expat-2.2.10  
# 010663            Short Descriptions  
# 010664 
# 010665                          
# 010666 
# 010667                xmlwf   
# 010668 
# 010669                          Is a non-validating utility to check whether or not XML documents are well formed
# 010670                         
# 010671 
# 010672                          libexpat 
# 010673 
# 010674                          Contains API functions for parsing XML 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'inetutils-*')
tar xf $(find -maxdepth 1 -type f -name 'inetutils-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'inetutils-*')
read -p "Chapter 8.39"
 
# 010675        8.39. Inetutils-2.0 
# 010676 
# 010677                          The Inetutils package contains programs for basic networking. 
# 010678           Approximate build time: 0.3 SBU
# 010679           Required disk space: 31 MB 
# 010680          8.39.1. Installation of Inetutils 
# 010681 
# 010682                          Prepare Inetutils for compilation: 



./configure --prefix=/usr        \
            --localstatedir=/var \
            --disable-logger     \
            --disable-whois      \
            --disable-rcp        \
            --disable-rexec      \
            --disable-rlogin     \
            --disable-rsh        \
            --disable-servers



# 010698 
# 010699                          The meaning of the configure options: 
# 010700 
# 010701                --disable-logger  
# 010702 
# 010703                          This option prevents Inetutils from installing the logger  program, which is used
# 010704                        by scripts to pass messages to the System Log Daemon. Do not install it because
# 010705                        Util-linux installs a more recent version. 
# 010706 
# 010707                --disable-whois  
# 010708 
# 010709                          This option disables the building of the Inetutils whois  client, which is out of
# 010710                        date. Instructions for a better whois  client are in the BLFS book. 
# 010711 
# 010712                --disable-r*  
# 010713 
# 010714                          These parameters disable building obsolete programs that should not be used due
# 010715                        to security issues. The functions provided by these programs can be provided by
# 010716                        the openssh package in the BLFS book. 
# 010717 
# 010718                --disable-servers  
# 010719 
# 010720                          This disables the installation of the various network servers included as part of
# 010721                        the Inetutils package. These servers are deemed not appropriate in a basic LFS system.
# 010722                        Some are insecure by nature and are only considered safe on trusted networks. Note
# 010723                        that better replacements are available for many of these servers. 
# 010724 
# 010725                          Compile the package: 



make



# 010733 
# 010734                          To test the results, issue: 



make check



# 010742          Note 
# 010743 
# 010744                          One test, libls.sh, may fail in the initial chroot environment but will pass if
# 010745                        the test is rerun after the LFS system is complete. One test, ping-localhost.sh,
# 010746                        will fail if the host system does not have ipv6 capability. 
# 010747 
# 010748                          Install the package: 



make install



# 010756 
# 010757                          Move some programs so they are available if /usris not accessible: 



mv -v /usr/bin/{hostname,ping,ping6,traceroute} /bin
mv -v /usr/bin/ifconfig /sbin


 
# 010766          8.39.2. Contents of Inetutils 
# 010767           Installed programs: dnsdomainname, ftp, ifconfig, hostname, ping, ping6, talk, telnet, tftp, and traceroute  
# 010768            Short Descriptions  
# 010769 
# 010770                          
# 010771 
# 010772                dnsdomainname   
# 010773 
# 010774                          Show the system's DNS domain name  
# 010775 
# 010776                          ftp   
# 010777 
# 010778                          Is the file transfer protocol program  
# 010779 
# 010780                          hostname   
# 010781 
# 010782                          Reports or sets the name of the host  
# 010783 
# 010784                          ifconfig   
# 010785 
# 010786                          Manages network interfaces  
# 010787 
# 010788                          ping   
# 010789 
# 010790                          Sends echo-request packets and reports how long the replies take  
# 010791 
# 010792                          ping6   
# 010793 
# 010794                          A version of ping  for IPv6 networks  
# 010795 
# 010796                          talk   
# 010797 
# 010798                          Is used to chat with another user  
# 010799 
# 010800                          telnet   
# 010801 
# 010802                          An interface to the TELNET protocol  
# 010803 
# 010804                          tftp   
# 010805 
# 010806                          A trivial file transfer program  
# 010807 
# 010808                          traceroute   
# 010809 
# 010810                          Traces the route your packets take from the host you are working on to another host
# 010811                        on a network, showing all the intermediate hops (gateways) along the way 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'perl-*')
tar xf $(find -maxdepth 1 -type f -name 'perl-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'perl-*')
read -p "Chapter 8.40"
 
# 010812        8.40. Perl-5.32.1 
# 010813 
# 010814                          The Perl package contains the Practical Extraction and Report Language. 
# 010815           Approximate build time: 10 SBU
# 010816           Required disk space: 222 MB 
# 010817          8.40.1. Installation of Perl 
# 010818 
# 010819                          This version of Perl now builds the Compress::Raw::Zlib and Compress::Raw::BZip2
# 010820                        modules. By default Perl will use an internal copy of the sources for the build.
# 010821                        Issue the following command so that Perl will use the libraries installed on the
# 010822                        system: 



export BUILD_ZLIB=False
export BUILD_BZIP2=0



# 010831 
# 010832                          To have full control over the way Perl is set up, you can remove the "-des " options
# 010833                        from the following command and hand-pick the way this package is built. Alternatively,
# 010834                        use the command exactly as below to use the defaults that Perl auto-detects: 



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



# 010855 
# 010856                          The meaning of the configure options: 
# 010857 
# 010858                -Dvendorprefix=/usr  
# 010859 
# 010860                          This ensures perl  knows how to tell packages where they should install their perl
# 010861                        modules. 
# 010862 
# 010863                -Dpager="/usr/bin/less -isR"  
# 010864 
# 010865                          This ensures that less is used instead of more . 
# 010866 
# 010867                -Dman1dir=/usr/share/man/man1 -Dman3dir=/usr/share/man/man3  
# 010868 
# 010869                          Since Groff is not installed yet, Configure  thinks that we do not want man pages
# 010870                        for Perl. Issuing these parameters overrides this decision. 
# 010871 
# 010872                -Duseshrplib  
# 010873 
# 010874                          Build a shared libperl needed by some perl modules. 
# 010875 
# 010876                -Dusethreads  
# 010877 
# 010878                          Build perl with support for threads. 
# 010879 
# 010880                -Dprivlib,-Darchlib,-Dsitelib,...  
# 010881 
# 010882                          These settings define where Perl is looking for installed modules. The LFS editors
# 010883                        chose to put them in a directory structure based on the Major.Minor version of Perl
# 010884                        (5.32) which allows upgrading Perl to newer Patch levels (5.32.1) without the need
# 010885                        to reinstall all of the modules again. 
# 010886 
# 010887                          Compile the package: 



make



# 010895 
# 010896                          To test the results (approximately 11 SBU), issue: 



make test



# 010904 
# 010905                          Install the package and clean up: 



make install
unset BUILD_ZLIB BUILD_BZIP2


 
# 010914          8.40.2. Contents of Perl 
# 010915           Installed programs: corelist, cpan, enc2xs, encguess, h2ph, h2xs, instmodsh, json_pp, libnetcfg, perl, perl5.32.1 (hard link to perl), perlbug, perldoc, perlivp, perlthanks (hard link to perlbug), piconv, pl2pm, pod2html, pod2man, pod2text, pod2usage, podchecker, podselect, prove, ptar, ptardiff, ptargrep, shasum, splain, xsubpp, and zipdetails
# 010916           Installed libraries: Many which cannot all be listed here
# 010917           Installed directory: /usr/lib/perl5  
# 010918            Short Descriptions  
# 010919 
# 010920                          
# 010921 
# 010922                corelist   
# 010923 
# 010924                          A commandline frontend to Module::CoreList  
# 010925 
# 010926                          cpan   
# 010927 
# 010928                          Interact with the Comprehensive Perl Archive Network (CPAN) from the command line
# 010929                         
# 010930 
# 010931                          enc2xs   
# 010932 
# 010933                          Builds a Perl extension for the Encode module from either Unicode Character Mappings
# 010934                        or Tcl Encoding Files  
# 010935 
# 010936                          encguess   
# 010937 
# 010938                          Guess the encoding type of one or several files  
# 010939 
# 010940                          h2ph   
# 010941 
# 010942                          Converts .hC header files to .phPerl header files  
# 010943 
# 010944                          h2xs   
# 010945 
# 010946                          Converts .hC header files to Perl extensions  
# 010947 
# 010948                          instmodsh   
# 010949 
# 010950                          Shell script for examining installed Perl modules, and can create a tarball from
# 010951                        an installed module  
# 010952 
# 010953                          json_pp   
# 010954 
# 010955                          Converts data between certain input and output formats  
# 010956 
# 010957                          libnetcfg   
# 010958 
# 010959                          Can be used to configure the libnetPerl module  
# 010960 
# 010961                          perl   
# 010962 
# 010963                          Combines some of the best features of C, sed  , awk  and sh  into a single swiss-army
# 010964                        language  
# 010965 
# 010966                          perl5.32.1   
# 010967 
# 010968                          A hard link to perl   
# 010969 
# 010970                          perlbug   
# 010971 
# 010972                          Used to generate bug reports about Perl, or the modules that come with it, and mail
# 010973                        them  
# 010974 
# 010975                          perldoc   
# 010976 
# 010977                          Displays a piece of documentation in pod format that is embedded in the Perl installation
# 010978                        tree or in a Perl script  
# 010979 
# 010980                          perlivp   
# 010981 
# 010982                          The Perl Installation Verification Procedure; it can be used to verify that Perl
# 010983                        and its libraries have been installed correctly  
# 010984 
# 010985                          perlthanks   
# 010986 
# 010987                          Used to generate thank you messages to mail to the Perl developers  
# 010988 
# 010989                          piconv   
# 010990 
# 010991                          A Perl version of the character encoding converter iconv   
# 010992 
# 010993                          pl2pm   
# 010994 
# 010995                          A rough tool for converting Perl4 .plfiles to Perl5 .pmmodules  
# 010996 
# 010997                          pod2html   
# 010998 
# 010999                          Converts files from pod format to HTML format  
# 011000 
# 011001                          pod2man   
# 011002 
# 011003                          Converts pod data to formatted *roff input  
# 011004 
# 011005                          pod2text   
# 011006 
# 011007                          Converts pod data to formatted ASCII text  
# 011008 
# 011009                          pod2usage   
# 011010 
# 011011                          Prints usage messages from embedded pod docs in files  
# 011012 
# 011013                          podchecker   
# 011014 
# 011015                          Checks the syntax of pod format documentation files  
# 011016 
# 011017                          podselect   
# 011018 
# 011019                          Displays selected sections of pod documentation  
# 011020 
# 011021                          prove   
# 011022 
# 011023                          Command line tool for running tests against the Test::Harness module  
# 011024 
# 011025                          ptar   
# 011026 
# 011027                          A tar  -like program written in Perl  
# 011028 
# 011029                          ptardiff   
# 011030 
# 011031                          A Perl program that compares an extracted archive with an unextracted one  
# 011032 
# 011033                          ptargrep   
# 011034 
# 011035                          A Perl program that applies pattern matching to the contents of files in a tar archive
# 011036                         
# 011037 
# 011038                          shasum   
# 011039 
# 011040                          Prints or checks SHA checksums  
# 011041 
# 011042                          splain   
# 011043 
# 011044                          Is used to force verbose warning diagnostics in Perl  
# 011045 
# 011046                          xsubpp   
# 011047 
# 011048                          Converts Perl XS code into C code  
# 011049 
# 011050                          zipdetails   
# 011051 
# 011052                          Displays details about the internal structure of a Zip file 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'XML-P*')
tar xf $(find -maxdepth 1 -type f -name 'XML-P*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'XML-P*')
read -p "Chapter 8.41"
 
# 011053        8.41. XML::Parser-2.46 
# 011054 
# 011055                          The XML::Parser module is a Perl interface to James Clark's XML parser, Expat. 
# 011056           Approximate build time: less than 0.1 SBU
# 011057           Required disk space: 2.4 MB 
# 011058          8.41.1. Installation of XML::Parser 
# 011059 
# 011060                          Prepare XML::Parser for compilation: 



perl Makefile.PL



# 011068 
# 011069                          Compile the package: 



make



# 011077 
# 011078                          To test the results, issue: 



make test



# 011086 
# 011087                          Install the package: 



make install


 
# 011095          8.41.2. Contents of XML::Parser 
# 011096           Installed module: Expat.so  
# 011097            Short Descriptions  
# 011098 
# 011099                          
# 011100 
# 011101                Expat 
# 011102 
# 011103                          provides the Perl Expat interface 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'intltool-*')
tar xf $(find -maxdepth 1 -type f -name 'intltool-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'intltool-*')
read -p "Chapter 8.42"
 
# 011104        8.42. Intltool-0.51.0 
# 011105 
# 011106                          The Intltool is an internationalization tool used for extracting translatable strings
# 011107                        from source files. 
# 011108           Approximate build time: less than 0.1 SBU
# 011109           Required disk space: 1.5 MB 
# 011110          8.42.1. Installation of Intltool 
# 011111 
# 011112                          First fix a warning that is caused by perl-5.22 and later: 



sed -i 's:\\\${:\\\$\\{:' intltool-update.in



# 011120          Note 
# 011121 
# 011122                          The above regular expression looks unusual because of all the backslashes. What
# 011123                        it does is add a backslash before the right brace character in the sequence '\${'
# 011124                        resulting in '\$\{'. 
# 011125 
# 011126                          Prepare Intltool for compilation: 



./configure --prefix=/usr



# 011134 
# 011135                          Compile the package: 



make



# 011143 
# 011144                          To test the results, issue: 



make check



# 011152 
# 011153                          Install the package: 



make install
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO


 
# 011162          8.42.2. Contents of Intltool 
# 011163           Installed programs: intltool-extract, intltool-merge, intltool-prepare, intltool-update, and intltoolize
# 011164           Installed directories: /usr/share/doc/intltool-0.51.0 and /usr/share/intltool  
# 011165            Short Descriptions  
# 011166 
# 011167                          
# 011168 
# 011169                intltoolize   
# 011170 
# 011171                          Prepares a package to use intltool  
# 011172 
# 011173                          intltool-extract   
# 011174 
# 011175                          Generates header files that can be read by gettext   
# 011176 
# 011177                          intltool-merge   
# 011178 
# 011179                          Merges translated strings into various file types  
# 011180 
# 011181                          intltool-prepare   
# 011182 
# 011183                          Updates pot files and merges them with translation files  
# 011184 
# 011185                          intltool-update   
# 011186 
# 011187                          Updates the po template files and merges them with the translations 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'autoconf-*')
tar xf $(find -maxdepth 1 -type f -name 'autoconf-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'autoconf-*')
read -p "Chapter 8.43"
 
# 011188        8.43. Autoconf-2.71 
# 011189 
# 011190                          The Autoconf package contains programs for producing shell scripts that can automatically
# 011191                        configure source code. 
# 011192           Approximate build time: less than 0.1 SBU (about 7.2 SBU with tests)
# 011193           Required disk space: 24 MB 
# 011194          8.43.1. Installation of Autoconf 
# 011195 
# 011196                          Prepare Autoconf for compilation: 



./configure --prefix=/usr



# 011204 
# 011205                          Compile the package: 



make



# 011213 
# 011214                          To test the results, issue: 



make check



# 011222 
# 011223                          Install the package: 



make install


 
# 011231          8.43.2. Contents of Autoconf 
# 011232           Installed programs: autoconf, autoheader, autom4te, autoreconf, autoscan, autoupdate, and ifnames
# 011233           Installed directory: /usr/share/autoconf  
# 011234            Short Descriptions  
# 011235 
# 011236                          
# 011237 
# 011238                autoconf   
# 011239 
# 011240                          Produces shell scripts that automatically configure software source code packages
# 011241                        to adapt to many kinds of Unix-like systems; the configuration scripts it produces
# 011242                        are independent;running them does not require the autoconf  program  
# 011243 
# 011244                          autoheader   
# 011245 
# 011246                          A tool for creating template files of C #define  statements for configure to use  
# 011247 
# 011248                          autom4te   
# 011249 
# 011250                          A wrapper for the M4 macro processor  
# 011251 
# 011252                          autoreconf   
# 011253 
# 011254                          Automatically runs autoconf  , autoheader  , aclocal  , automake  , gettextize  , and libtoolize  in
# 011255                        the correct order to save time when changes are made to autoconf  and automake  template
# 011256                        files  
# 011257 
# 011258                          autoscan   
# 011259 
# 011260                          Helps to create a configure.infile for a software package; it examines the source
# 011261                        files in a directory tree, searching them for common portability issues, and creates
# 011262                        a configure.scanfile that serves as as a preliminary configure.infile for the package
# 011263                         
# 011264 
# 011265                          autoupdate   
# 011266 
# 011267                          Modifies a configure.infile that still calls autoconf  macros by their old names to
# 011268                        use the current macro names  
# 011269 
# 011270                          ifnames   
# 011271 
# 011272                          Helps when writing configure.infiles for a software package; it prints the identifiers
# 011273                        that the package uses in C preprocessor conditionals [If a package has already been
# 011274                        set up to have some portability, this program can help determine what configure  needs
# 011275                        to check for. It can also fill in gaps in a configure.infile generated by autoscan  .]
# 011276                        


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'automake-*')
tar xf $(find -maxdepth 1 -type f -name 'automake-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'automake-*')
read -p "Chapter 8.44"
 
# 011277        8.44. Automake-1.16.3 
# 011278 
# 011279                          The Automake package contains programs for generating Makefiles for use with Autoconf.
# 011280                        
# 011281           Approximate build time: less than 0.1 SBU (about 9.1 SBU with tests)
# 011282           Required disk space: 115 MB 
# 011283          8.44.1. Installation of Automake 
# 011284 
# 011285                          Fix a failing test: 



sed -i "s/''/etags/" t/tags-lisp-space.sh



# 011293 
# 011294                          Prepare Automake for compilation: 



./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.16.3



# 011302 
# 011303                          Compile the package: 



make



# 011311 
# 011312                          Using the -j4 make option speeds up the tests, even on systems with only one processor,
# 011313                        due to internal delays in individual tests. To test the results, issue: 



make -j4 check



# 011321 
# 011322                          The tests t/subobj.sh, t/deprecated-acinit.sh, and t/init.sh are known to fail in
# 011323                        the LFS environment. 
# 011324 
# 011325                          Install the package: 



make install


 
# 011333          8.44.2. Contents of Automake 
# 011334           Installed programs: aclocal, aclocal-1.16 (hard linked with aclocal), automake, and automake-1.16 (hard linked with automake)
# 011335           Installed directories: /usr/share/aclocal-1.16, /usr/share/automake-1.16, and /usr/share/doc/automake-1.16.3  
# 011336            Short Descriptions  
# 011337 
# 011338                          
# 011339 
# 011340                aclocal   
# 011341 
# 011342                          Generates aclocal.m4files based on the contents of configure.infiles  
# 011343 
# 011344                          aclocal-1.16   
# 011345 
# 011346                          A hard link to aclocal   
# 011347 
# 011348                          automake   
# 011349 
# 011350                          A tool for automatically generating Makefile.infiles from Makefile.amfiles [To create
# 011351                        all the Makefile.infiles for a package, run this program in the top-level directory.
# 011352                        By scanning the configure.infile, it automatically finds each appropriate Makefile.amfile
# 011353                        and generates the corresponding Makefile.infile.]  
# 011354 
# 011355                          automake-1.16   
# 011356 
# 011357                          A hard link to automake  


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'kmod-*')
tar xf $(find -maxdepth 1 -type f -name 'kmod-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'kmod-*')
read -p "Chapter 8.45"
 
# 011358        8.45. Kmod-28 
# 011359 
# 011360                          The Kmod package contains libraries and utilities for loading kernel modules 
# 011361           Approximate build time: 0.1 SBU
# 011362           Required disk space: 13 MB 
# 011363          8.45.1. Installation of Kmod 
# 011364 
# 011365                          Prepare Kmod for compilation: 



./configure --prefix=/usr          \
            --bindir=/bin          \
            --sysconfdir=/etc      \
            --with-rootlibdir=/lib \
            --with-xz              \
            --with-zstd            \
            --with-zlib



# 011379 
# 011380                          The meaning of the configure options: 
# 011381 
# 011382                --with-xz, --with-zlib, --with-zstd  
# 011383 
# 011384                          These options enable Kmod to handle compressed kernel modules. 
# 011385 
# 011386                --with-rootlibdir=/lib  
# 011387 
# 011388                          This option ensures different library related files are placed in the correct directories.
# 011389                        
# 011390 
# 011391                          Compile the package: 



make



# 011399 
# 011400                          This package does not come with a test suite that can be run in the LFS chroot environment.
# 011401                        At a minimum the git program is required and several tests will not run outside
# 011402                        of a git repository. 
# 011403 
# 011404                          Install the package and create symlinks for compatibility with Module-Init-Tools
# 011405                        (the package that previously handled Linux kernel modules): 



make install

for target in depmod insmod lsmod modinfo modprobe rmmod; do
  ln -sfv ../bin/kmod /sbin/$target
done

ln -sfv kmod /bin/lsmod


 
# 011419          8.45.2. Contents of Kmod 
# 011420           Installed programs: depmod (link to kmod), insmod (link to kmod), kmod, lsmod (link to kmod), modinfo (link to kmod), modprobe (link to kmod), and rmmod (link to kmod)
# 011421           Installed library: libkmod.so  
# 011422            Short Descriptions  
# 011423 
# 011424                          
# 011425 
# 011426                depmod   
# 011427 
# 011428                          Creates a dependency file based on the symbols it finds in the existing set of modules;
# 011429                        this dependency file is used by modprobe  to automatically load the required modules
# 011430                         
# 011431 
# 011432                          insmod   
# 011433 
# 011434                          Installs a loadable module in the running kernel  
# 011435 
# 011436                          kmod   
# 011437 
# 011438                          Loads and unloads kernel modules  
# 011439 
# 011440                          lsmod   
# 011441 
# 011442                          Lists currently loaded modules  
# 011443 
# 011444                          modinfo   
# 011445 
# 011446                          Examines an object file associated with a kernel module and displays any information
# 011447                        that it can glean  
# 011448 
# 011449                          modprobe   
# 011450 
# 011451                          Uses a dependency file, created by depmod  , to automatically load relevant modules
# 011452                         
# 011453 
# 011454                          rmmod   
# 011455 
# 011456                          Unloads modules from the running kernel  
# 011457 
# 011458                          libkmod 
# 011459 
# 011460                          This library is used by other programs to load and unload kernel modules 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'elfutils-*')
tar xf $(find -maxdepth 1 -type f -name 'elfutils-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'elfutils-*')
read -p "Chapter 8.46"
 
# 011461        8.46. Libelf from Elfutils-0.183 
# 011462 
# 011463                          Libelf is a library for handling ELF (Executable and Linkable Format) files. 
# 011464           Approximate build time: 0.9 SBU
# 011465           Required disk space: 121 MB 
# 011466          8.46.1. Installation of Libelf 
# 011467 
# 011468                          Libelf is part of elfutils-0.183 package. Use the elfutils-0.183.tar.bz2 as the
# 011469                        source tarball. 
# 011470 
# 011471                          Prepare Libelf for compilation: 



./configure --prefix=/usr                \
            --disable-debuginfod         \
            --enable-libdebuginfod=dummy \
            --libdir=/lib



# 011482 
# 011483                          Compile the package: 



make



# 011491 
# 011492                          To test the results, issue: 



make check



# 011500 
# 011501                          Install only Libelf: 



make -C libelf install
install -vm644 config/libelf.pc /usr/lib/pkgconfig
rm /lib/libelf.a


 
# 011511          8.46.2. Contents of Libelf 
# 011512           Installed Library: libelf.so (symlink) and libelf-0.183.so
# 011513           Installed Directory: /usr/include/elfutils  
# 011514            Short Descriptions  
# 011515 
# 011516                          
# 011517 
# 011518                libelf 
# 011519 
# 011520                          Contains API functions to handle ELF object files 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'libffi-*')
tar xf $(find -maxdepth 1 -type f -name 'libffi-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'libffi-*')
read -p "Chapter 8.47"
 
# 011521        8.47. Libffi-3.3 
# 011522 
# 011523                          The Libffi library provides a portable, high level programming interface to various
# 011524                        calling conventions. This allows a programmer to call any function specified by
# 011525                        a call interface description at run time. 
# 011526           Approximate build time: 1.9 SBU
# 011527           Required disk space: 10 MB 
# 011528          8.47.1. Installation of Libffi 
# 011529          Note 
# 011530 
# 011531                          Similar to GMP, libffi builds with optimizations specific to the proccesor in use.
# 011532                        If building for another system, export CFLAGS and CXXFLAGS to specify a generic
# 011533                        build for your architecture. If this is not done, all applications that link to
# 011534                        libffi will trigger Illegal Operation Errors. 
# 011535 
# 011536                          Prepare libffi for compilation: 



./configure --prefix=/usr --disable-static --with-gcc-arch=native



# 011544 
# 011545                          The meaning of the configure option: 
# 011546 
# 011547                --with-gcc-arch=native  
# 011548 
# 011549                          Ensure GCC optimizes for the current system. If this is not specified, the system
# 011550                        is guessed and the code generated may not be correct for some systems. If the generated
# 011551                        code will be copied from the native system to a less capable system, use the less
# 011552                        capable system as a parameter. For details about alternative system types, see the
# 011553                        x86 options in the GCC manual . 
# 011554 
# 011555                          Compile the package: 



make



# 011563 
# 011564                          To test the results, issue: 



make check



# 011572 
# 011573                          Install the package: 



make install


 
# 011581          8.47.2. Contents of Libffi 
# 011582           Installed library: libffi.so  
# 011583            Short Descriptions  
# 011584 
# 011585                          
# 011586 
# 011587                libffi 
# 011588 
# 011589                          contains the foreign function interface API functions 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'openssl-*')
tar xf $(find -maxdepth 1 -type f -name 'openssl-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'openssl-*')
read -p "Chapter 8.48"
 
# 011590        8.48. OpenSSL-1.1.1j 
# 011591 
# 011592                          The OpenSSL package contains management tools and libraries relating to cryptography.
# 011593                        These are useful for providing cryptographic functions to other packages, such as
# 011594                        OpenSSH, email applications, and web browsers (for accessing HTTPS sites). 
# 011595           Approximate build time: 2.2 SBU
# 011596           Required disk space: 154 MB 
# 011597          8.48.1. Installation of OpenSSL 
# 011598 
# 011599                          Prepare OpenSSL for compilation: 



./config --prefix=/usr         \
         --openssldir=/etc/ssl \
         --libdir=lib          \
         shared                \
         zlib-dynamic



# 011611 
# 011612                          Compile the package: 



make



# 011620 
# 011621                          To test the results, issue: 



make test



# 011629 
# 011630                          One test 30-test_afalg.t is known to fail on some kernel configurations (it apparently
# 011631                        assumes certain unspecified crypto options have been selected). 
# 011632 
# 011633                          Install the package: 



sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install



# 011642 
# 011643                          Add the version to the documentation directory name, to be consistent with other
# 011644                        packages: 



mv -v /usr/share/doc/openssl /usr/share/doc/openssl-1.1.1j



# 011652 
# 011653                          If desired, install some additional documentation: 



cp -vfr doc/* /usr/share/doc/openssl-1.1.1j


 
# 011661          8.48.2. Contents of OpenSSL 
# 011662           Installed programs: c_rehash and openssl
# 011663           Installed libraries: libcrypto.so and libssl.so
# 011664           Installed directories: /etc/ssl, /usr/include/openssl, /usr/lib/engines and /usr/share/doc/openssl-1.1.1j  
# 011665            Short Descriptions  
# 011666 
# 011667                          
# 011668 
# 011669                c_rehash   
# 011670 
# 011671                          is a Perl script that scans all files in a directory and adds symbolic links to their
# 011672                        hash values  
# 011673 
# 011674                          openssl   
# 011675 
# 011676                          is a command-line tool for using the various cryptography functions of OpenSSL 's
# 011677                        crypto library from the shell. It can be used for various functions which are documented
# 011678                        in man 1 openssl   
# 011679 
# 011680                          libcrypto.so 
# 011681 
# 011682                          implements a wide range of cryptographic algorithms used in various Internet standards.
# 011683                        The services provided by this library are used by the OpenSSL implementations of
# 011684                        SSL, TLS and S/MIME, and they have also been used to implement OpenSSH , OpenPGP ,
# 011685                        and other cryptographic standards  
# 011686 
# 011687                          libssl.so 
# 011688 
# 011689                          implements the Transport Layer Security (TLS v1) protocol. It provides a rich API,
# 011690                        documentation on which can be found by running man 3 ssl  


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'Python-*')
tar xf $(find -maxdepth 1 -type f -name 'Python-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'Python-*')
read -p "Chapter 8.49"
 
# 011691        8.49. Python-3.9.2 
# 011692 
# 011693                          The Python 3 package contains the Python development environment. It is useful for
# 011694                        object-oriented programming, writing scripts, prototyping large programs, or developing
# 011695                        entire applications. 
# 011696           Approximate build time: 2.8 SBU
# 011697           Required disk space: 294 MB 
# 011698          8.49.1. Installation of Python 3 
# 011699 
# 011700                          Prepare Python for compilation: 



./configure --prefix=/usr       \
            --enable-shared     \
            --with-system-expat \
            --with-system-ffi   \
            --with-ensurepip=yes



# 011712 
# 011713                          The meaning of the configure options: 
# 011714 
# 011715                --with-system-expat  
# 011716 
# 011717                          This switch enables linking against system version of Expat . 
# 011718 
# 011719                --with-system-ffi  
# 011720 
# 011721                          This switch enables linking against system version of libffi . 
# 011722 
# 011723                --with-ensurepip=yes  
# 011724 
# 011725                          This switch enables building pip  and setuptools  packaging programs. 
# 011726 
# 011727                          Compile the package: 



make



# 011735 
# 011736                          To test the results, issue: 



make test



# 011744 
# 011745                          Some tests requiring a network connection or additional packages are skipped. The
# 011746                        test named test_normalization is known to fail. For more comprehensive results,
# 011747                        the tests can be rerun when Python 3 is reinstalled in BLFS. 
# 011748 
# 011749                          Install the package: 



make install



# 011757 
# 011758                          If desired, install the preformatted documentation: 



install -v -dm755 /usr/share/doc/python-3.9.2/html 

tar --strip-components=1  \
    --no-same-owner       \
    --no-same-permissions \
    -C /usr/share/doc/python-3.9.2/html \
    -xvf ../python-3.9.2-docs-html.tar.bz2



# 011772 
# 011773                          The meaning of the documentation install commands: 
# 011774 
# 011775                --no-same-ownerand --no-same-permissions 
# 011776 
# 011777                          Ensure the installed files have the correct ownership and permissions. Without these
# 011778                        options, using tar will install the package files with the upstream creator's values.
# 011779                         
# 011780          8.49.2. Contents of Python 3 
# 011781           Installed Programs: 2to3, idle3, pip3, pydoc3, python3, and python3-config
# 011782           Installed Library: libpython3.9.so and libpython3.so
# 011783           Installed Directories: /usr/include/python3.9, /usr/lib/python3, and /usr/share/doc/python-3.9.2  
# 011784            Short Descriptions  
# 011785 
# 011786                          
# 011787 
# 011788                2to3   
# 011789 
# 011790                          is a Python program that reads Python 2.x source code and applies a series of fixes
# 011791                        to transform it into valid Python 3.x code  
# 011792 
# 011793                          idle3   
# 011794 
# 011795                          is a wrapper script that opens a Python aware GUI editor. For this script to run,
# 011796                        you must have installed Tk before Python so that the Tkinter Python module is built
# 011797                         
# 011798 
# 011799                          pip3   
# 011800 
# 011801                          The package installer for Python. You can use pip to install packages from Python
# 011802                        Package Index and other indexes  
# 011803 
# 011804                          pydoc3   
# 011805 
# 011806                          is the Python documentation tool  
# 011807 
# 011808                          python3   
# 011809 
# 011810                          is an interpreted, interactive, object-oriented programming language 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'ninja-*')
tar xf $(find -maxdepth 1 -type f -name 'ninja-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'ninja-*')
read -p "Chapter 8.50"
 
# 011811        8.50. Ninja-1.10.2 
# 011812 
# 011813                          Ninja is a small build system with a focus on speed. 
# 011814           Approximate build time: 0.2 SBU
# 011815           Required disk space: 79 MB 
# 011816          Tip 
# 011817 
# 011818                          This section is not strictly required for LFS if not using systemd. On the other
# 011819                        hand, ninja associated to meson makes a powerful build system combination, which
# 011820                        is expected to be used more and more often. It is required for several packages
# 011821                        in the BLFS book . 
# 011822          8.50.1. Installation of Ninja 
# 011823 
# 011824                          When run, ninja normally runs a maximum number of processes in parallel. By default
# 011825                        this is the number of cores on the system plus two. In some cases this can overheat
# 011826                        a CPU or run a system out of memory. If run from the command line, passing a -jN
# 011827                        parameter will limit the number of parallel processes, but some packages embed the
# 011828                        execution of ninja and do not pass a -j parameter. 
# 011829 
# 011830                          Using the optional  procedure below allows a user to limit the number of parallel
# 011831                        processes via an environment variable, NINJAJOBS. For example  , setting: 



export NINJAJOBS=4



# 011839 
# 011840                          will limit ninja to four parallel processes. 
# 011841 
# 011842                          If desired, add the capability to use the environment variable NINJAJOBS by running:
# 011843                        



sed -i '/int Guess/a \
  int   j = 0;\
  char* jobs = getenv( "NINJAJOBS" );\
  if ( jobs != NULL ) j = atoi( jobs );\
  if ( j > 0 ) return j;\
' src/ninja.cc



# 011856 
# 011857                          Build Ninja with: 



python3 configure.py --bootstrap



# 011865 
# 011866                          The meaning of the build option: 
# 011867 
# 011868                --bootstrap  
# 011869 
# 011870                          This parameter forces ninja to rebuild itself for the current system. 
# 011871 
# 011872                          To test the results, issue: 



./ninja ninja_test
./ninja_test --gtest_filter=-SubprocessTest.SetWithLots



# 011881 
# 011882                          Install the package: 



install -vm755 ninja /usr/bin/
install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
install -vDm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja


 
# 011892          8.50.2. Contents of Ninja 
# 011893           Installed programs: ninja  
# 011894            Short Descriptions  
# 011895 
# 011896                          
# 011897 
# 011898                ninja   
# 011899 
# 011900                          is the Ninja build system 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'meson-*')
tar xf $(find -maxdepth 1 -type f -name 'meson-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'meson-*')
read -p "Chapter 8.51"
 
# 011901        8.51. Meson-0.57.1 
# 011902 
# 011903                          Meson is an open source build system meant to be both extremely fast and as user
# 011904                        friendly as possible. 
# 011905           Approximate build time: less than 0.1 SBU
# 011906           Required disk space: 37 MB 
# 011907          Tip 
# 011908 
# 011909                          This section is not strictly required for LFS if not using systemd. On the other
# 011910                        hand, meson/ninja is a powerful build system, which is expected to be used more
# 011911                        and more often. It is required for several packages in the BLFS book . 
# 011912          8.51.1. Installation of Meson 
# 011913 
# 011914                          Compile Meson with the following command: 



python3 setup.py build



# 011922 
# 011923                          This package does not come with a test suite. 
# 011924 
# 011925                          Install the package: 



python3 setup.py install --root=dest
cp -rv dest/* /



# 011934 
# 011935                          The meaning of the install parameters: 
# 011936 
# 011937                --root=dest  
# 011938 
# 011939                          By default python3 setup.py install  installs various files (such as man pages) into
# 011940                        Python Eggs. With a specified root location, setup.py  installs these files into a
# 011941                        standard hierarchy. Then the hierarchy can just be copied to the standard location.
# 011942                         
# 011943          8.51.2. Contents of Meson 
# 011944           Installed programs: meson
# 011945           Installed directory: /usr/lib/python3.9/site-packages/meson-0.57.1-py3.9.egg-info and /usr/lib/python3.9/site-packages/mesonbuild  
# 011946            Short Descriptions  
# 011947 
# 011948                          
# 011949 
# 011950                meson   
# 011951 
# 011952                          A high productivity build system 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'coreutils-*')
tar xf $(find -maxdepth 1 -type f -name 'coreutils-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'coreutils-*')
read -p "Chapter 8.52"
 
# 011953        8.52. Coreutils-8.32 
# 011954 
# 011955                          The Coreutils package contains utilities for showing and setting the basic system
# 011956                        characteristics. 
# 011957           Approximate build time: 2.5 SBU
# 011958           Required disk space: 164 MB 
# 011959          8.52.1. Installation of Coreutils 
# 011960 
# 011961                          POSIX requires that programs from Coreutils recognize character boundaries correctly
# 011962                        even in multibyte locales. The following patch fixes this non-compliance and other
# 011963                        internationalization-related bugs. 



patch -Np1 -i ../coreutils-8.32-i18n-1.patch



# 011971          Note 
# 011972 
# 011973                          In the past, many bugs were found in this patch. When reporting new bugs to Coreutils
# 011974                        maintainers, please check first if they are reproducible without this patch. 
# 011975 
# 011976                          Suppress a test which on some machines can loop forever: 



sed -i '/test.lock/s/^/#/' gnulib-tests/gnulib.mk



# 011984 
# 011985                          Now prepare Coreutils for compilation: 



autoreconf -fiv
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr            \
            --enable-no-install-program=kill,uptime



# 011996 
# 011997                          The meaning of the configure options: 
# 011998 
# 011999                
# 012000           autoreconf  
# 012001 
# 012002                          The patch for internationalization has modified the building system of the package,
# 012003                        so the configuration files have to be regenerated. 
# 012004 
# 012005                FORCE_UNSAFE_CONFIGURE=1 
# 012006 
# 012007                          This environment variable allows the package to be built as the rootuser. 
# 012008 
# 012009                --enable-no-install-program=kill,uptime  
# 012010 
# 012011                          The purpose of this switch is to prevent Coreutils from installing binaries that
# 012012                        will be installed by other packages later. 
# 012013 
# 012014                          Compile the package: 



make



# 012022 
# 012023                          Skip down to "Install the package " if not running the test suite. 
# 012024 
# 012025                          Now the test suite is ready to be run. First, run the tests that are meant to be
# 012026                        run as user root: 



make NON_ROOT_USERNAME=tester check-root



# 012034 
# 012035                          We're going to run the remainder of the tests as the testeruser. Certain tests require
# 012036                        that the user be a member of more than one group. So that these tests are not skipped,
# 012037                        add a temporary group and make the user testera part of it: 



echo "dummy:x:102:tester" >> /etc/group



# 012045 
# 012046                          Fix some of the permissions so that the non-root user can compile and run the tests:
# 012047                        



chown -Rv tester . 



# 012055 
# 012056                          Now run the tests: 



su tester -c "PATH=$PATH make RUN_EXPENSIVE_TESTS=yes check"



# 012064 
# 012065                          The test-getlogin test is known to fail in the LFS chroot environment. 
# 012066 
# 012067                          Remove the temporary group: 



sed -i '/dummy/d' /etc/group



# 012075 
# 012076                          Install the package: 



make install



# 012084 
# 012085                          Move programs to the locations specified by the FHS: 



mv -v /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin
mv -v /usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm} /bin
mv -v /usr/bin/{rmdir,stty,sync,true,uname} /bin
mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8



# 012098 
# 012099                          Some of the scripts in the LFS-Bootscripts package depend on head  , nice  , sleep  ,
# 012100                        and touch  . As /usrmay not be available during the early and late stages of booting,
# 012101                        those binaries need to be on the root partition to maintain FHS compliance: 



mv -v /usr/bin/{head,nice,sleep,touch} /bin


 
# 012109          8.52.2. Contents of Coreutils 
# 012110           Installed programs: [, b2sum, base32, base64, basename, basenc, cat, chcon, chgrp, chmod, chown, chroot, cksum, comm, cp, csplit, cut, date, dd, df, dir, dircolors, dirname, du, echo, env, expand, expr, factor, false, fmt, fold, groups, head, hostid, id, install, join, link, ln, logname, ls, md5sum, mkdir, mkfifo, mknod, mktemp, mv, nice, nl, nohup, nproc, numfmt, od, paste, pathchk, pinky, pr, printenv, printf, ptx, pwd, readlink, realpath, rm, rmdir, runcon, seq, sha1sum, sha224sum, sha256sum, sha384sum, sha512sum, shred, shuf, sleep, sort, split, stat, stdbuf, stty, sum, sync, tac, tail, tee, test, timeout, touch, tr, true, truncate, tsort, tty, uname, unexpand, uniq, unlink, users, vdir, wc, who, whoami, and yes
# 012111           Installed library: libstdbuf.so (in /usr/libexec/coreutils)
# 012112           Installed directory: /usr/libexec/coreutils  
# 012113            Short Descriptions  
# 012114 
# 012115                          
# 012116 
# 012117                [   
# 012118 
# 012119                          Is an actual command, /usr/bin/[, that is a synonym for the test  command.  
# 012120 
# 012121                          base32   
# 012122 
# 012123                          Encodes and decodes data according to the base32 specification (RFC 4648)  
# 012124 
# 012125                          base64   
# 012126 
# 012127                          Encodes and decodes data according to the base64 specification (RFC 4648)  
# 012128 
# 012129                          b2sum   
# 012130 
# 012131                          Prints or checks BLAKE2 (512-bit) checksums  
# 012132 
# 012133                          basename   
# 012134 
# 012135                          Strips any path and a given suffix from a file name  
# 012136 
# 012137                          basenc   
# 012138 
# 012139                          Encodes or decodes data using various algorithms  
# 012140 
# 012141                          cat   
# 012142 
# 012143                          Concatenates files to standard output  
# 012144 
# 012145                          chcon   
# 012146 
# 012147                          Changes security context for files and directories  
# 012148 
# 012149                          chgrp   
# 012150 
# 012151                          Changes the group ownership of files and directories  
# 012152 
# 012153                          chmod   
# 012154 
# 012155                          Changes the permissions of each file to the given mode; the mode can be either a
# 012156                        symbolic representation of the changes to make or an octal number representing the
# 012157                        new permissions  
# 012158 
# 012159                          chown   
# 012160 
# 012161                          Changes the user and/or group ownership of files and directories  
# 012162 
# 012163                          chroot   
# 012164 
# 012165                          Runs a command with the specified directory as the /directory  
# 012166 
# 012167                          cksum   
# 012168 
# 012169                          Prints the Cyclic Redundancy Check (CRC) checksum and the byte counts of each specified
# 012170                        file  
# 012171 
# 012172                          comm   
# 012173 
# 012174                          Compares two sorted files, outputting in three columns the lines that are unique
# 012175                        and the lines that are common  
# 012176 
# 012177                          cp   
# 012178 
# 012179                          Copies files  
# 012180 
# 012181                          csplit   
# 012182 
# 012183                          Splits a given file into several new files, separating them according to given patterns
# 012184                        or line numbers and outputting the byte count of each new file  
# 012185 
# 012186                          cut   
# 012187 
# 012188                          Prints sections of lines, selecting the parts according to given fields or positions
# 012189                         
# 012190 
# 012191                          date   
# 012192 
# 012193                          Displays the current time in the given format, or sets the system date  
# 012194 
# 012195                          dd   
# 012196 
# 012197                          Copies a file using the given block size and count, while optionally performing
# 012198                        conversions on it  
# 012199 
# 012200                          df   
# 012201 
# 012202                          Reports the amount of disk space available (and used) on all mounted file systems,
# 012203                        or only on the file systems holding the selected files  
# 012204 
# 012205                          dir   
# 012206 
# 012207                          Lists the contents of each given directory (the same as the ls  command)  
# 012208 
# 012209                          dircolors   
# 012210 
# 012211                          Outputs commands to set the LS_COLORenvironment variable to change the color scheme
# 012212                        used by ls   
# 012213 
# 012214                          dirname   
# 012215 
# 012216                          Strips the non-directory suffix from a file name  
# 012217 
# 012218                          du   
# 012219 
# 012220                          Reports the amount of disk space used by the current directory, by each of the given
# 012221                        directories (including all subdirectories) or by each of the given files  
# 012222 
# 012223                          echo   
# 012224 
# 012225                          Displays the given strings  
# 012226 
# 012227                          env   
# 012228 
# 012229                          Runs a command in a modified environment  
# 012230 
# 012231                          expand   
# 012232 
# 012233                          Converts tabs to spaces  
# 012234 
# 012235                          expr   
# 012236 
# 012237                          Evaluates expressions  
# 012238 
# 012239                          factor   
# 012240 
# 012241                          Prints the prime factors of all specified integer numbers  
# 012242 
# 012243                          false   
# 012244 
# 012245                          Does nothing, unsuccessfully; it always exits with a status code indicating failure
# 012246                         
# 012247 
# 012248                          fmt   
# 012249 
# 012250                          Reformats the paragraphs in the given files  
# 012251 
# 012252                          fold   
# 012253 
# 012254                          Wraps the lines in the given files  
# 012255 
# 012256                          groups   
# 012257 
# 012258                          Reports a user's group memberships  
# 012259 
# 012260                          head   
# 012261 
# 012262                          Prints the first ten lines (or the given number of lines) of each given file  
# 012263 
# 012264                          hostid   
# 012265 
# 012266                          Reports the numeric identifier (in hexadecimal) of the host  
# 012267 
# 012268                          id   
# 012269 
# 012270                          Reports the effective user ID, group ID, and group memberships of the current user
# 012271                        or specified user  
# 012272 
# 012273                          install   
# 012274 
# 012275                          Copies files while setting their permission modes and, if possible, their owner
# 012276                        and group  
# 012277 
# 012278                          join   
# 012279 
# 012280                          Joins the lines that have identical join fields from two separate files  
# 012281 
# 012282                          link   
# 012283 
# 012284                          Creates a hard link with the given name to a file  
# 012285 
# 012286                          ln   
# 012287 
# 012288                          Makes hard links or soft (symbolic) links between files  
# 012289 
# 012290                          logname   
# 012291 
# 012292                          Reports the current user's login name  
# 012293 
# 012294                          ls   
# 012295 
# 012296                          Lists the contents of each given directory  
# 012297 
# 012298                          md5sum   
# 012299 
# 012300                          Reports or checks Message Digest 5 (MD5) checksums  
# 012301 
# 012302                          mkdir   
# 012303 
# 012304                          Creates directories with the given names  
# 012305 
# 012306                          mkfifo   
# 012307 
# 012308                          Creates First-In, First-Outs (FIFOs), a "named pipe" in UNIX parlance, with the
# 012309                        given names  
# 012310 
# 012311                          mknod   
# 012312 
# 012313                          Creates device nodes with the given names; a device node is a character special
# 012314                        file, a block special file, or a FIFO  
# 012315 
# 012316                          mktemp   
# 012317 
# 012318                          Creates temporary files in a secure manner; it is used in scripts  
# 012319 
# 012320                          mv   
# 012321 
# 012322                          Moves or renames files or directories  
# 012323 
# 012324                          nice   
# 012325 
# 012326                          Runs a program with modified scheduling priority  
# 012327 
# 012328                          nl   
# 012329 
# 012330                          Numbers the lines from the given files  
# 012331 
# 012332                          nohup   
# 012333 
# 012334                          Runs a command immune to hangups, with its output redirected to a log file  
# 012335 
# 012336                          nproc   
# 012337 
# 012338                          Prints the number of processing units available to a process  
# 012339 
# 012340                          numfmt   
# 012341 
# 012342                          Converts numbers to or from human-readable strings  
# 012343 
# 012344                          od   
# 012345 
# 012346                          Dumps files in octal and other formats  
# 012347 
# 012348                          paste   
# 012349 
# 012350                          Merges the given files, joining sequentially corresponding lines side by side, separated
# 012351                        by tab characters  
# 012352 
# 012353                          pathchk   
# 012354 
# 012355                          Checks if file names are valid or portable  
# 012356 
# 012357                          pinky   
# 012358 
# 012359                          Is a lightweight finger client; it reports some information about the given users
# 012360                         
# 012361 
# 012362                          pr   
# 012363 
# 012364                          Paginates and columnates files for printing  
# 012365 
# 012366                          printenv   
# 012367 
# 012368                          Prints the environment  
# 012369 
# 012370                          printf   
# 012371 
# 012372                          Prints the given arguments according to the given format, much like the C printf
# 012373                        function  
# 012374 
# 012375                          ptx   
# 012376 
# 012377                          Produces a permuted index from the contents of the given files, with each keyword
# 012378                        in its context  
# 012379 
# 012380                          pwd   
# 012381 
# 012382                          Reports the name of the current working directory  
# 012383 
# 012384                          readlink   
# 012385 
# 012386                          Reports the value of the given symbolic link  
# 012387 
# 012388                          realpath   
# 012389 
# 012390                          Prints the resolved path  
# 012391 
# 012392                          rm   
# 012393 
# 012394                          Removes files or directories  
# 012395 
# 012396                          rmdir   
# 012397 
# 012398                          Removes directories if they are empty  
# 012399 
# 012400                          runcon   
# 012401 
# 012402                          Runs a command with specified security context  
# 012403 
# 012404                          seq   
# 012405 
# 012406                          Prints a sequence of numbers within a given range and with a given increment  
# 012407 
# 012408                          sha1sum   
# 012409 
# 012410                          Prints or checks 160-bit Secure Hash Algorithm 1 (SHA1) checksums  
# 012411 
# 012412                          sha224sum   
# 012413 
# 012414                          Prints or checks 224-bit Secure Hash Algorithm checksums  
# 012415 
# 012416                          sha256sum   
# 012417 
# 012418                          Prints or checks 256-bit Secure Hash Algorithm checksums  
# 012419 
# 012420                          sha384sum   
# 012421 
# 012422                          Prints or checks 384-bit Secure Hash Algorithm checksums  
# 012423 
# 012424                          sha512sum   
# 012425 
# 012426                          Prints or checks 512-bit Secure Hash Algorithm checksums  
# 012427 
# 012428                          shred   
# 012429 
# 012430                          Overwrites the given files repeatedly with complex patterns, making it difficult
# 012431                        to recover the data  
# 012432 
# 012433                          shuf   
# 012434 
# 012435                          Shuffles lines of text  
# 012436 
# 012437                          sleep   
# 012438 
# 012439                          Pauses for the given amount of time  
# 012440 
# 012441                          sort   
# 012442 
# 012443                          Sorts the lines from the given files  
# 012444 
# 012445                          split   
# 012446 
# 012447                          Splits the given file into pieces, by size or by number of lines  
# 012448 
# 012449                          stat   
# 012450 
# 012451                          Displays file or filesystem status  
# 012452 
# 012453                          stdbuf   
# 012454 
# 012455                          Runs commands with altered buffering operations for its standard streams  
# 012456 
# 012457                          stty   
# 012458 
# 012459                          Sets or reports terminal line settings  
# 012460 
# 012461                          sum   
# 012462 
# 012463                          Prints checksum and block counts for each given file  
# 012464 
# 012465                          sync   
# 012466 
# 012467                          Flushes file system buffers; it forces changed blocks to disk and updates the super
# 012468                        block  
# 012469 
# 012470                          tac   
# 012471 
# 012472                          Concatenates the given files in reverse  
# 012473 
# 012474                          tail   
# 012475 
# 012476                          Prints the last ten lines (or the given number of lines) of each given file  
# 012477 
# 012478                          tee   
# 012479 
# 012480                          Reads from standard input while writing both to standard output and to the given
# 012481                        files  
# 012482 
# 012483                          test   
# 012484 
# 012485                          Compares values and checks file types  
# 012486 
# 012487                          timeout   
# 012488 
# 012489                          Runs a command with a time limit  
# 012490 
# 012491                          touch   
# 012492 
# 012493                          Changes file timestamps, setting the access and modification times of the given
# 012494                        files to the current time; files that do not exist are created with zero length
# 012495                         
# 012496 
# 012497                          tr   
# 012498 
# 012499                          Translates, squeezes, and deletes the given characters from standard input  
# 012500 
# 012501                          true   
# 012502 
# 012503                          Does nothing, successfully; it always exits with a status code indicating success
# 012504                         
# 012505 
# 012506                          truncate   
# 012507 
# 012508                          Shrinks or expands a file to the specified size  
# 012509 
# 012510                          tsort   
# 012511 
# 012512                          Performs a topological sort; it writes a completely ordered list according to the
# 012513                        partial ordering in a given file  
# 012514 
# 012515                          tty   
# 012516 
# 012517                          Reports the file name of the terminal connected to standard input  
# 012518 
# 012519                          uname   
# 012520 
# 012521                          Reports system information  
# 012522 
# 012523                          unexpand   
# 012524 
# 012525                          Converts spaces to tabs  
# 012526 
# 012527                          uniq   
# 012528 
# 012529                          Discards all but one of successive identical lines  
# 012530 
# 012531                          unlink   
# 012532 
# 012533                          Removes the given file  
# 012534 
# 012535                          users   
# 012536 
# 012537                          Reports the names of the users currently logged on  
# 012538 
# 012539                          vdir   
# 012540 
# 012541                          Is the same as ls -l   
# 012542 
# 012543                          wc   
# 012544 
# 012545                          Reports the number of lines, words, and bytes for each given file, as well as a
# 012546                        total line when more than one file is given  
# 012547 
# 012548                          who   
# 012549 
# 012550                          Reports who is logged on  
# 012551 
# 012552                          whoami   
# 012553 
# 012554                          Reports the user name associated with the current effective user ID  
# 012555 
# 012556                          yes   
# 012557 
# 012558                          Repeatedly outputs "y " or a given string until killed  
# 012559 
# 012560                          libstdbuf 
# 012561 
# 012562                          Library used by stdbuf  


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'check-*')
tar xf $(find -maxdepth 1 -type f -name 'check-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'check-*')
read -p "Chapter 8.53"
 
# 012563        8.53. Check-0.15.2 
# 012564 
# 012565                          Check is a unit testing framework for C. 
# 012566           Approximate build time: 0.1 SBU (about 4.2 SBU with tests)
# 012567           Required disk space: 12 MB 
# 012568          8.53.1. Installation of Check 
# 012569 
# 012570                          Prepare Check for compilation: 



./configure --prefix=/usr --disable-static



# 012578 
# 012579                          Build the package: 



make



# 012587 
# 012588                          Compilation is now complete. To run the Check test suite, issue the following command:
# 012589                        



make check



# 012597 
# 012598                          Note that the Check test suite may take a relatively long (up to 4 SBU) time. 
# 012599 
# 012600                          Install the package: 



make docdir=/usr/share/doc/check-0.15.2 install


 
# 012608          8.53.2. Contents of Check 
# 012609           Installed program: checkmk
# 012610           Installed library: libcheck.so  
# 012611            Short Descriptions  
# 012612 
# 012613                          
# 012614 
# 012615                checkmk   
# 012616 
# 012617                          Awk script for generating C unit tests for use with the Check unit testing framework
# 012618                         
# 012619 
# 012620                          libcheck.{a,so} 
# 012621 
# 012622                          Contains functions that allow Check to be called from a test program 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'diffutils-*')
tar xf $(find -maxdepth 1 -type f -name 'diffutils-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'diffutils-*')
read -p "Chapter 8.54"
 
# 012623        8.54. Diffutils-3.7 
# 012624 
# 012625                          The Diffutils package contains programs that show the differences between files
# 012626                        or directories. 
# 012627           Approximate build time: 0.4 SBU
# 012628           Required disk space: 33 MB 
# 012629          8.54.1. Installation of Diffutils 
# 012630 
# 012631                          Prepare Diffutils for compilation: 



./configure --prefix=/usr



# 012639 
# 012640                          Compile the package: 



make



# 012648 
# 012649                          To test the results, issue: 



make check



# 012657 
# 012658                          Install the package: 



make install


 
# 012666          8.54.2. Contents of Diffutils 
# 012667           Installed programs: cmp, diff, diff3, and sdiff  
# 012668            Short Descriptions  
# 012669 
# 012670                          
# 012671 
# 012672                cmp   
# 012673 
# 012674                          Compares two files and reports whether or in which bytes they differ  
# 012675 
# 012676                          diff   
# 012677 
# 012678                          Compares two files or directories and reports which lines in the files differ  
# 012679 
# 012680                          diff3   
# 012681 
# 012682                          Compares three files line by line  
# 012683 
# 012684                          sdiff   
# 012685 
# 012686                          Merges two files and interactively outputs the results 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'gawk-*')
tar xf $(find -maxdepth 1 -type f -name 'gawk-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'gawk-*')
read -p "Chapter 8.55"
 
# 012687        8.55. Gawk-5.1.0 
# 012688 
# 012689                          The Gawk package contains programs for manipulating text files. 
# 012690           Approximate build time: 0.4 SBU
# 012691           Required disk space: 45 MB 
# 012692          8.55.1. Installation of Gawk 
# 012693 
# 012694                          First, ensure some unneeded files are not installed: 



sed -i 's/extras//' Makefile.in



# 012702 
# 012703                          Prepare Gawk for compilation: 



./configure --prefix=/usr



# 012711 
# 012712                          Compile the package: 



make



# 012720 
# 012721                          To test the results, issue: 



make check



# 012729 
# 012730                          Install the package: 



make install



# 012738 
# 012739                          If desired, install the documentation: 



mkdir -v /usr/share/doc/gawk-5.1.0
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.1.0


 
# 012748          8.55.2. Contents of Gawk 
# 012749           Installed programs: awk (link to gawk), gawk, and awk-5.1.0
# 012750           Installed libraries: filefuncs.so, fnmatch.so, fork.so, inplace.so, intdiv.so, ordchr.so, readdir.so, readfile.so, revoutput.so, revtwoway.so, rwarray.so, and time.so (all in /usr/lib/gawk)
# 012751           Installed directories: /usr/lib/gawk, /usr/libexec/awk, /usr/share/awk, and /usr/share/doc/gawk-5.1.0  
# 012752            Short Descriptions  
# 012753 
# 012754                          
# 012755 
# 012756                awk   
# 012757 
# 012758                          A link to gawk   
# 012759 
# 012760                          gawk   
# 012761 
# 012762                          A program for manipulating text files; it is the GNU implementation of awk   
# 012763 
# 012764                          gawk-5.1.0   
# 012765 
# 012766                          A hard link to gawk  


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'findutils-*')
tar xf $(find -maxdepth 1 -type f -name 'findutils-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'findutils-*')
read -p "Chapter 8.56"
 
# 012767        8.56. Findutils-4.8.0 
# 012768 
# 012769                          The Findutils package contains programs to find files. These programs are provided
# 012770                        to recursively search through a directory tree and to create, maintain, and search
# 012771                        a database (often faster than the recursive find, but is unreliable if the database
# 012772                        has not been recently updated). 
# 012773           Approximate build time: 0.9 SBU
# 012774           Required disk space: 55 MB 
# 012775          8.56.1. Installation of Findutils 
# 012776 
# 012777                          Prepare Findutils for compilation: 



./configure --prefix=/usr --localstatedir=/var/lib/locate



# 012785 
# 012786                          The meaning of the configure options: 
# 012787 
# 012788                --localstatedir  
# 012789 
# 012790                          This option changes the location of the locate  database to be in /var/lib/locate,
# 012791                        which is FHS-compliant. 
# 012792 
# 012793                          Compile the package: 



make



# 012801 
# 012802                          To test the results, issue: 



chown -Rv tester .
su tester -c "PATH=$PATH make check"



# 012811 
# 012812                          Install the package: 



make install



# 012820 
# 012821                          Some of the scripts in the LFS-Bootscripts package depend on find  . As /usrmay not
# 012822                        be available during the early stages of booting, this program needs to be on the
# 012823                        root partition. The updatedb  script also needs to be modified to correct an explicit
# 012824                        path: 



mv -v /usr/bin/find /bin
sed -i 's|find:=${BINDIR}|find:=/bin|' /usr/bin/updatedb


 
# 012833          8.56.2. Contents of Findutils 
# 012834           Installed programs: find, locate, updatedb, and xargs
# 012835           Installed directory: /var/lib/locate  
# 012836            Short Descriptions  
# 012837 
# 012838                          
# 012839 
# 012840                find   
# 012841 
# 012842                          Searches given directory trees for files matching the specified criteria  
# 012843 
# 012844                          locate   
# 012845 
# 012846                          Searches through a database of file names and reports the names that contain a given
# 012847                        string or match a given pattern  
# 012848 
# 012849                          updatedb   
# 012850 
# 012851                          Updates the locate  database; it scans the entire file system (including other file
# 012852                        systems that are currently mounted, unless told not to) and puts every file name
# 012853                        it finds into the database  
# 012854 
# 012855                          xargs   
# 012856 
# 012857                          Can be used to apply a given command to a list of files 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'groff-*')
tar xf $(find -maxdepth 1 -type f -name 'groff-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'groff-*')
read -p "Chapter 8.57"
 
# 012858        8.57. Groff-1.22.4 
# 012859 
# 012860                          The Groff package contains programs for processing and formatting text. 
# 012861           Approximate build time: 0.5 SBU
# 012862           Required disk space: 96 MB 
# 012863          8.57.1. Installation of Groff 
# 012864 
# 012865                          Groff expects the environment variable PAGEto contain the default paper size. For
# 012866                        users in the United States, PAGE=letter is appropriate. Elsewhere, PAGE=A4 may be
# 012867                        more suitable. While the default paper size is configured during compilation, it
# 012868                        can be overridden later by echoing either "A4 " or "letter " to the /etc/papersizefile.
# 012869                        
# 012870 
# 012871                          Prepare Groff for compilation: 



PAGE=<paper_size> ./configure --prefix=/usr


 
# 012879 
# 012880                          This package does not support parallel build. Compile the package: 



make -j1



# 012888 
# 012889                          This package does not come with a test suite. 
# 012890 
# 012891                          Install the package: 



make install


 
# 012899          8.57.2. Contents of Groff 
# 012900           Installed programs: addftinfo, afmtodit, chem, eqn, eqn2graph, gdiffmk, glilypond, gperl, gpinyin, grap2graph, grn, grodvi, groff, groffer, grog, grolbp, grolj4, gropdf, grops, grotty, hpftodit, indxbib, lkbib, lookbib, mmroff, neqn, nroff, pdfmom, pdfroff, pfbtops, pic, pic2graph, post-grohtml, preconv, pre-grohtml, refer, roff2dvi, roff2html, roff2pdf, roff2ps, roff2text, roff2x, soelim, tbl, tfmtodit, and troff
# 012901           Installed directories: /usr/lib/groff and /usr/share/doc/groff-1.22.4, /usr/share/groff  
# 012902            Short Descriptions  
# 012903 
# 012904                          
# 012905 
# 012906                addftinfo   
# 012907 
# 012908                          Reads a troff font file and adds some additional font-metric information that is
# 012909                        used by the groff  system  
# 012910 
# 012911                          afmtodit   
# 012912 
# 012913                          Creates a font file for use with groff  and grops   
# 012914 
# 012915                          chem   
# 012916 
# 012917                          Groff preprocessor for producing chemical structure diagrams  
# 012918 
# 012919                          eqn   
# 012920 
# 012921                          Compiles descriptions of equations embedded within troff input files into commands
# 012922                        that are understood by troff   
# 012923 
# 012924                          eqn2graph   
# 012925 
# 012926                          Converts a troff EQN (equation) into a cropped image  
# 012927 
# 012928                          gdiffmk   
# 012929 
# 012930                          Marks differences between groff/nroff/troff files  
# 012931 
# 012932                          glilypond   
# 012933 
# 012934                          Transforms sheet music written in the lilypond language into the groff language
# 012935                         
# 012936 
# 012937                          gperl   
# 012938 
# 012939                          Preprocesor for groff, allowing addition of perl code into groff files  
# 012940 
# 012941                          gpinyin   
# 012942 
# 012943                          Preprocesor for groff, allowing addition of Chinese European-like language Pinyin
# 012944                        into groff files.  
# 012945 
# 012946                          grap2graph   
# 012947 
# 012948                          Converts a grap diagram into a cropped bitmap image  
# 012949 
# 012950                          grn   
# 012951 
# 012952                          A groff  preprocessor for gremlin files  
# 012953 
# 012954                          grodvi   
# 012955 
# 012956                          A driver for groff  that produces TeX dvi format  
# 012957 
# 012958                          groff   
# 012959 
# 012960                          A front-end to the groff document formatting system; normally, it runs the troff  program
# 012961                        and a post-processor appropriate for the selected device  
# 012962 
# 012963                          groffer   
# 012964 
# 012965                          Displays groff files and man pages on X and tty terminals  
# 012966 
# 012967                          grog   
# 012968 
# 012969                          Reads files and guesses which of the groff  options -e, -man, -me, -mm, -ms, -p, -s,
# 012970                        and -tare required for printing files, and reports the groff  command including those
# 012971                        options  
# 012972 
# 012973                          grolbp   
# 012974 
# 012975                          Is a groff  driver for Canon CAPSL printers (LBP-4 and LBP-8 series laser printers)
# 012976                         
# 012977 
# 012978                          grolj4   
# 012979 
# 012980                          Is a driver for groff  that produces output in PCL5 format suitable for an HP LaserJet
# 012981                        4 printer  
# 012982 
# 012983                          gropdf   
# 012984 
# 012985                          Translates the output of GNU troff  to PDF  
# 012986 
# 012987                          grops   
# 012988 
# 012989                          Translates the output of GNU troff  to PostScript  
# 012990 
# 012991                          grotty   
# 012992 
# 012993                          Translates the output of GNU troff  into a form suitable for typewriter-like devices
# 012994                         
# 012995 
# 012996                          hpftodit   
# 012997 
# 012998                          Creates a font file for use with groff -Tlj4  from an HP-tagged font metric file  
# 012999 
# 013000                          indxbib   
# 013001 
# 013002                          Creates an inverted index for the bibliographic databases with a specified file
# 013003                        for use with refer  , lookbib  , and lkbib   
# 013004 
# 013005                          lkbib   
# 013006 
# 013007                          Searches bibliographic databases for references that contain specified keys and
# 013008                        reports any references found  
# 013009 
# 013010                          lookbib   
# 013011 
# 013012                          Prints a prompt on the standard error (unless the standard input is not a terminal),
# 013013                        reads a line containing a set of keywords from the standard input, searches the
# 013014                        bibliographic databases in a specified file for references containing those keywords,
# 013015                        prints any references found on the standard output, and repeats this process until
# 013016                        the end of input  
# 013017 
# 013018                          mmroff   
# 013019 
# 013020                          A simple preprocessor for groff   
# 013021 
# 013022                          neqn   
# 013023 
# 013024                          Formats equations for American Standard Code for Information Interchange (ASCII)
# 013025                        output  
# 013026 
# 013027                          nroff   
# 013028 
# 013029                          A script that emulates the nroff  command using groff   
# 013030 
# 013031                          pdfmom   
# 013032 
# 013033                          Is a wrapper around groff that facilitates the production of PDF documents from
# 013034                        files formatted with the mom macros.  
# 013035 
# 013036                          pdfroff   
# 013037 
# 013038                          Creates pdf documents using groff  
# 013039 
# 013040                          pfbtops   
# 013041 
# 013042                          Translates a PostScript font in .pfbformat to ASCII  
# 013043 
# 013044                          pic   
# 013045 
# 013046                          Compiles descriptions of pictures embedded within troff or TeX input files into
# 013047                        commands understood by TeX or troff   
# 013048 
# 013049                          pic2graph   
# 013050 
# 013051                          Converts a PIC diagram into a cropped image  
# 013052 
# 013053                          post-grohtml   
# 013054 
# 013055                          Translates the output of GNU troff  to HTML  
# 013056 
# 013057                          preconv   
# 013058 
# 013059                          Converts encoding of input files to something GNU troff  understands  
# 013060 
# 013061                          pre-grohtml   
# 013062 
# 013063                          Translates the output of GNU troff  to HTML  
# 013064 
# 013065                          refer   
# 013066 
# 013067                          Copies the contents of a file to the standard output, except that lines between
# 013068                        .[  and .]  are interpreted as citations, and lines between .R1  and .R2  are interpreted
# 013069                        as commands for how citations are to be processed  
# 013070 
# 013071                          roff2dvi   
# 013072 
# 013073                          Transforms roff files into DVI format  
# 013074 
# 013075                          roff2html   
# 013076 
# 013077                          Transforms roff files into HTML format  
# 013078 
# 013079                          roff2pdf   
# 013080 
# 013081                          Transforms roff files into PDFs  
# 013082 
# 013083                          roff2ps   
# 013084 
# 013085                          Transforms roff files into ps files  
# 013086 
# 013087                          roff2text   
# 013088 
# 013089                          Transforms roff files into text files  
# 013090 
# 013091                          roff2x   
# 013092 
# 013093                          Transforms roff files into other formats  
# 013094 
# 013095                          soelim   
# 013096 
# 013097                          Reads files and replaces lines of the form .so file  by the contents of the mentioned
# 013098                        file   
# 013099 
# 013100                          tbl   
# 013101 
# 013102                          Compiles descriptions of tables embedded within troff input files into commands
# 013103                        that are understood by troff   
# 013104 
# 013105                          tfmtodit   
# 013106 
# 013107                          Creates a font file for use with groff -Tdvi   
# 013108 
# 013109                          troff   
# 013110 
# 013111                          Is highly compatible with Unix troff  ; it should usually be invoked using the groff  command,
# 013112                        which will also run preprocessors and post-processors in the appropriate order and
# 013113                        with the appropriate options 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'grub-*')
tar xf $(find -maxdepth 1 -type f -name 'grub-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'grub-*')
read -p "Chapter 8.58"
 
# 013114        8.58. GRUB-2.04 
# 013115 
# 013116                          The GRUB package contains the GRand Unified Bootloader. 
# 013117           Approximate build time: 0.7 SBU
# 013118           Required disk space: 154 MB 
# 013119          8.58.1. Installation of GRUB 
# 013120 
# 013121                          First, fix an issue introduced by binutils-2.36: 



sed "s/gold-version/& -R .note.gnu.property/" \
    -i Makefile.in grub-core/Makefile.in



# 013130 
# 013131                          Prepare GRUB for compilation: 



./configure --prefix=/usr          \
            --sbindir=/sbin        \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror



# 013143 
# 013144                          The meaning of the new configure options: 
# 013145 
# 013146                --disable-werror  
# 013147 
# 013148                          This allows the build to complete with warnings introduced by more recent Flex versions.
# 013149                        
# 013150 
# 013151                --disable-efiemu  
# 013152 
# 013153                          This option minimizes what is built by disabling a feature and testing programs
# 013154                        not needed for LFS. 
# 013155 
# 013156                          Compile the package: 



make



# 013164 
# 013165                          This package does not come with a test suite. 
# 013166 
# 013167                          Install the package: 



make install
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions



# 013176 
# 013177                          Using GRUB to make your LFS system bootable will be discussed in Section 10.4, "Using
# 013178                        GRUB to Set Up the Boot Process" .  
# 013179          8.58.2. Contents of GRUB 
# 013180           Installed programs: grub-bios-setup, grub-editenv, grub-file, grub-fstest, grub-glue-efi, grub-install, grub-kbdcomp, grub-macbless, grub-menulst2cfg, grub-mkconfig, grub-mkimage, grub-mklayout, grub-mknetdir, grub-mkpasswd-pbkdf2, grub-mkrelpath, grub-mkrescue, grub-mkstandalone, grub-ofpathname, grub-probe, grub-reboot, grub-render-label, grub-script-check, grub-set-default, grub-sparc64-setup, and grub-syslinux2cfg
# 013181           Installed directories: /usr/lib/grub, /etc/grub.d, /usr/share/grub, and /boot/grub (when grub-install is first run)  
# 013182            Short Descriptions  
# 013183 
# 013184                          
# 013185 
# 013186                grub-bios-setup   
# 013187 
# 013188                          Is a helper program for grub-install  
# 013189 
# 013190                          grub-editenv   
# 013191 
# 013192                          A tool to edit the environment block  
# 013193 
# 013194                          grub-file   
# 013195 
# 013196                          Checks if FILE is of the specified type.  
# 013197 
# 013198                          grub-fstest   
# 013199 
# 013200                          Tool to debug the filesystem driver  
# 013201 
# 013202                          grub-glue-efi   
# 013203 
# 013204                          Processes ia32 and amd64 EFI images and glues them according to Apple format.  
# 013205 
# 013206                          grub-install   
# 013207 
# 013208                          Install GRUB on your drive  
# 013209 
# 013210                          grub-kbdcomp   
# 013211 
# 013212                          Script that converts an xkb layout into one recognized by GRUB  
# 013213 
# 013214                          grub-macbless   
# 013215 
# 013216                          Mac-style bless on HFS or HFS+ files  
# 013217 
# 013218                          grub-menulst2cfg   
# 013219 
# 013220                          Converts a GRUB Legacy menu.lstinto a grub.cfgfor use with GRUB 2  
# 013221 
# 013222                          grub-mkconfig   
# 013223 
# 013224                          Generate a grub config file  
# 013225 
# 013226                          grub-mkimage   
# 013227 
# 013228                          Make a bootable image of GRUB  
# 013229 
# 013230                          grub-mklayout   
# 013231 
# 013232                          Generates a GRUB keyboard layout file  
# 013233 
# 013234                          grub-mknetdir   
# 013235 
# 013236                          Prepares a GRUB netboot directory  
# 013237 
# 013238                          grub-mkpasswd-pbkdf2   
# 013239 
# 013240                          Generates an encrypted PBKDF2 password for use in the boot menu  
# 013241 
# 013242                          grub-mkrelpath   
# 013243 
# 013244                          Makes a system pathname relative to its root  
# 013245 
# 013246                          grub-mkrescue   
# 013247 
# 013248                          Make a bootable image of GRUB suitable for a floppy disk or CDROM/DVD  
# 013249 
# 013250                          grub-mkstandalone   
# 013251 
# 013252                          Generates a standalone image  
# 013253 
# 013254                          grub-ofpathname   
# 013255 
# 013256                          Is a helper program that prints the path of a GRUB device  
# 013257 
# 013258                          grub-probe   
# 013259 
# 013260                          Probe device information for a given path or device  
# 013261 
# 013262                          grub-reboot   
# 013263 
# 013264                          Sets the default boot entry for GRUB for the next boot only  
# 013265 
# 013266                          grub-render-label   
# 013267 
# 013268                          Render Apple .disk_label for Apple Macs  
# 013269 
# 013270                          grub-script-check   
# 013271 
# 013272                          Checks GRUB configuration script for syntax errors  
# 013273 
# 013274                          grub-set-default   
# 013275 
# 013276                          Sets the default boot entry for GRUB  
# 013277 
# 013278                          grub-sparc64-setup   
# 013279 
# 013280                          Is a helper program for grub-setup  
# 013281 
# 013282                          grub-syslinux2cfg   
# 013283 
# 013284                          Transform a syslinux config file into grub.cfg format 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'less-*')
tar xf $(find -maxdepth 1 -type f -name 'less-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'less-*')
read -p "Chapter 8.59"
 
# 013285        8.59. Less-563 
# 013286 
# 013287                          The Less package contains a text file viewer. 
# 013288           Approximate build time: less than 0.1 SBU
# 013289           Required disk space: 4.1 MB 
# 013290          8.59.1. Installation of Less 
# 013291 
# 013292                          Prepare Less for compilation: 



./configure --prefix=/usr --sysconfdir=/etc



# 013300 
# 013301                          The meaning of the configure options: 
# 013302 
# 013303                --sysconfdir=/etc  
# 013304 
# 013305                          This option tells the programs created by the package to look in /etcfor the configuration
# 013306                        files. 
# 013307 
# 013308                          Compile the package: 



make



# 013316 
# 013317                          This package does not come with a test suite. 
# 013318 
# 013319                          Install the package: 



make install


 
# 013327          8.59.2. Contents of Less 
# 013328           Installed programs: less, lessecho, and lesskey  
# 013329            Short Descriptions  
# 013330 
# 013331                          
# 013332 
# 013333                less   
# 013334 
# 013335                          A file viewer or pager; it displays the contents of the given file, letting the
# 013336                        user scroll, find strings, and jump to marks  
# 013337 
# 013338                          lessecho   
# 013339 
# 013340                          Needed to expand meta-characters, such as *  and ?  , in filenames on Unix systems  
# 013341 
# 013342                          lesskey   
# 013343 
# 013344                          Used to specify the key bindings for less  


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'gzip-*')
tar xf $(find -maxdepth 1 -type f -name 'gzip-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'gzip-*')
read -p "Chapter 8.60"
 
# 013345        8.60. Gzip-1.10 
# 013346 
# 013347                          The Gzip package contains programs for compressing and decompressing files. 
# 013348           Approximate build time: 0.1 SBU
# 013349           Required disk space: 19 MB 
# 013350          8.60.1. Installation of Gzip 
# 013351 
# 013352                          Prepare Gzip for compilation: 



./configure --prefix=/usr



# 013360 
# 013361                          Compile the package: 



make



# 013369 
# 013370                          To test the results, issue: 



make check



# 013378 
# 013379                          Install the package: 



make install



# 013387 
# 013388                          Move a program that needs to be on the root filesystem: 



mv -v /usr/bin/gzip /bin


 
# 013396          8.60.2. Contents of Gzip 
# 013397           Installed programs: gunzip, gzexe, gzip, uncompress (hard link with gunzip), zcat, zcmp, zdiff, zegrep, zfgrep, zforce, zgrep, zless, zmore, and znew  
# 013398            Short Descriptions  
# 013399 
# 013400                          
# 013401 
# 013402                gunzip   
# 013403 
# 013404                          Decompresses gzipped files  
# 013405 
# 013406                          gzexe   
# 013407 
# 013408                          Creates self-decompressing executable files  
# 013409 
# 013410                          gzip   
# 013411 
# 013412                          Compresses the given files using Lempel-Ziv (LZ77) coding  
# 013413 
# 013414                          uncompress   
# 013415 
# 013416                          Decompresses compressed files  
# 013417 
# 013418                          zcat   
# 013419 
# 013420                          Decompresses the given gzipped files to standard output  
# 013421 
# 013422                          zcmp   
# 013423 
# 013424                          Runs cmp  on gzipped files  
# 013425 
# 013426                          zdiff   
# 013427 
# 013428                          Runs diff  on gzipped files  
# 013429 
# 013430                          zegrep   
# 013431 
# 013432                          Runs egrep  on gzipped files  
# 013433 
# 013434                          zfgrep   
# 013435 
# 013436                          Runs fgrep  on gzipped files  
# 013437 
# 013438                          zforce   
# 013439 
# 013440                          Forces a .gzextension on all given files that are gzipped files, so that gzip  will
# 013441                        not compress them again; this can be useful when file names were truncated during
# 013442                        a file transfer  
# 013443 
# 013444                          zgrep   
# 013445 
# 013446                          Runs grep  on gzipped files  
# 013447 
# 013448                          zless   
# 013449 
# 013450                          Runs less  on gzipped files  
# 013451 
# 013452                          zmore   
# 013453 
# 013454                          Runs more  on gzipped files  
# 013455 
# 013456                          znew   
# 013457 
# 013458                          Re-compresses files from compress  format to gzip  format;.Zto .gz


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'iproute2-*')
tar xf $(find -maxdepth 1 -type f -name 'iproute2-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'iproute2-*')
read -p "Chapter 8.61"
 
# 013459        8.61. IPRoute2-5.10.0 
# 013460 
# 013461                          The IPRoute2 package contains programs for basic and advanced IPV4-based networking.
# 013462                        
# 013463           Approximate build time: 0.2 SBU
# 013464           Required disk space: 15 MB 
# 013465          8.61.1. Installation of IPRoute2 
# 013466 
# 013467                          The arpd  program included in this package will not be built since it is dependent
# 013468                        on Berkeley DB, which is not installed in LFS. However, a directory for arpd  and
# 013469                        a man page will still be installed. Prevent this by running the commands below.
# 013470                        If the arpd  binary is needed, instructions for compiling Berkeley DB can be found
# 013471                        in the BLFS Book at http://www.linuxfromscratch.org/blfs/view/10.1/server/db.html .
# 013472                        



sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8



# 013481 
# 013482                          It is also necessary to disable building two modules that require http://www.linuxfromscratch.org/blfs/view/10.1/postlfs/iptables.html .
# 013483                        



sed -i 's/.m_ipt.o//' tc/Makefile



# 013491 
# 013492                          Compile the package: 



make



# 013500 
# 013501                          This package does not have a working test suite. 
# 013502 
# 013503                          Install the package: 



make DOCDIR=/usr/share/doc/iproute2-5.10.0 install


 
# 013511          8.61.2. Contents of IPRoute2 
# 013512           Installed programs: bridge, ctstat (link to lnstat), genl, ifcfg, ifstat, ip, lnstat, nstat, routef, routel, rtacct, rtmon, rtpr, rtstat (link to lnstat), ss, and tc
# 013513           Installed directories: /etc/iproute2, /usr/lib/tc, and /usr/share/doc/iproute2-5.10.0  
# 013514            Short Descriptions  
# 013515 
# 013516                          
# 013517 
# 013518                bridge   
# 013519 
# 013520                          Configures network bridges  
# 013521 
# 013522                          ctstat   
# 013523 
# 013524                          Connection status utility  
# 013525 
# 013526                          genl   
# 013527 
# 013528                          Generic netlink utility frontend  
# 013529 
# 013530                          ifcfg   
# 013531 
# 013532                          A shell script wrapper for the ip  command [Note that it requires the arping  and rdisk  programs
# 013533                        from the iputils package found at http://www.skbuff.net/iputils/ .]  
# 013534 
# 013535                          ifstat   
# 013536 
# 013537                          Shows the interface statistics, including the amount of transmitted and received
# 013538                        packets by interface  
# 013539 
# 013540                          ip   
# 013541 
# 013542                          The main executable. It has several different functions: 
# 013543 
# 013544                          ip link <device>   allows users to look at the state of devices and to make changes
# 013545                        
# 013546 
# 013547                          ip addr  allows users to look at addresses and their properties, add new addresses,
# 013548                        and delete old ones 
# 013549 
# 013550                          ip neighbor  allows users to look at neighbor bindings and their properties, add new
# 013551                        neighbor entries, and delete old ones 
# 013552 
# 013553                          ip rule  allows users to look at the routing policies and change them 
# 013554 
# 013555                          ip route  allows users to look at the routing table and change routing table rules
# 013556                        
# 013557 
# 013558                          ip tunnel  allows users to look at the IP tunnels and their properties, and change
# 013559                        them 
# 013560 
# 013561                          ip maddr  allows users to look at the multicast addresses and their properties, and
# 013562                        change them 
# 013563 
# 013564                          ip mroute  allows users to set, change, or delete the multicast routing 
# 013565 
# 013566                          ip monitor  allows users to continuously monitor the state of devices, addresses and
# 013567                        routes  
# 013568 
# 013569                          lnstat   
# 013570 
# 013571                          Provides Linux network statistics; it is a generalized and more feature-complete
# 013572                        replacement for the old rtstat  program  
# 013573 
# 013574                          nstat   
# 013575 
# 013576                          Shows network statistics  
# 013577 
# 013578                          routef   
# 013579 
# 013580                          A component of ip route  . This is for flushing the routing tables  
# 013581 
# 013582                          routel   
# 013583 
# 013584                          A component of ip route  . This is for listing the routing tables  
# 013585 
# 013586                          rtacct   
# 013587 
# 013588                          Displays the contents of /proc/net/rt_acct 
# 013589 
# 013590                          rtmon   
# 013591 
# 013592                          Route monitoring utility  
# 013593 
# 013594                          rtpr   
# 013595 
# 013596                          Converts the output of ip -o  back into a readable form  
# 013597 
# 013598                          rtstat   
# 013599 
# 013600                          Route status utility  
# 013601 
# 013602                          ss   
# 013603 
# 013604                          Similar to the netstat  command; shows active connections  
# 013605 
# 013606                          tc   
# 013607 
# 013608                          Traffic Controlling Executable; this is for Quality Of Service (QOS) and Class Of
# 013609                        Service (COS) implementations 
# 013610 
# 013611                          tc qdisc  allows users to setup the queueing discipline 
# 013612 
# 013613                          tc class  allows users to setup classes based on the queuing discipline scheduling
# 013614                        
# 013615 
# 013616                          tc estimator  allows users to estimate the network flow into a network 
# 013617 
# 013618                          tc filter  allows users to setup the QOS/COS packet filtering 
# 013619 
# 013620                          tc policy  allows users to setup the QOS/COS policies 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'kbd-*')
tar xf $(find -maxdepth 1 -type f -name 'kbd-*.xz' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'kbd-*')
read -p "Chapter 8.62"
 
# 013621        8.62. Kbd-2.4.0 
# 013622 
# 013623                          The Kbd package contains key-table files, console fonts, and keyboard utilities.
# 013624                        
# 013625           Approximate build time: 0.1 SBU
# 013626           Required disk space: 33 MB 
# 013627          8.62.1. Installation of Kbd 
# 013628 
# 013629                          The behaviour of the backspace and delete keys is not consistent across the keymaps
# 013630                        in the Kbd package. The following patch fixes this issue for i386 keymaps: 



patch -Np1 -i ../kbd-2.4.0-backspace-1.patch



# 013638 
# 013639                          After patching, the backspace key generates the character with code 127, and the
# 013640                        delete key generates a well-known escape sequence. 
# 013641 
# 013642                          Remove the redundant resizecons  program (it requires the defunct svgalib to provide
# 013643                        the video mode files - for normal use setfont  sizes the console appropriately) together
# 013644                        with its manpage. 



sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in



# 013653 
# 013654                          Prepare Kbd for compilation: 



./configure --prefix=/usr --disable-vlock



# 013662 
# 013663                          The meaning of the configure option: 
# 013664 
# 013665                --disable-vlock  
# 013666 
# 013667                          This option prevents the vlock utility from being built because it requires the
# 013668                        PAM library, which isn't available in the chroot environment. 
# 013669 
# 013670                          Compile the package: 



make



# 013678 
# 013679                          To test the results, issue: 



make check



# 013687 
# 013688                          Install the package: 



make install



# 013696          Note 
# 013697 
# 013698                          For some languages (e.g., Belarusian) the Kbd package doesn't provide a useful keymap
# 013699                        where the stock "by " keymap assumes the ISO-8859-5 encoding, and the CP1251 keymap
# 013700                        is normally used. Users of such languages have to download working keymaps separately.
# 013701                        
# 013702 
# 013703                          If desired, install the documentation: 



mkdir -v            /usr/share/doc/kbd-2.4.0
cp -R -v docs/doc/* /usr/share/doc/kbd-2.4.0


 
# 013712          8.62.2. Contents of Kbd 
# 013713           Installed programs: chvt, deallocvt, dumpkeys, fgconsole, getkeycodes, kbdinfo, kbd_mode, kbdrate, loadkeys, loadunimap, mapscrn, openvt, psfaddtable (link to psfxtable), psfgettable (link to psfxtable), psfstriptable (link to psfxtable), psfxtable, setfont, setkeycodes, setleds, setmetamode, setvtrgb, showconsolefont, showkey, unicode_start, and unicode_stop
# 013714           Installed directories: /usr/share/consolefonts, /usr/share/consoletrans, /usr/share/keymaps, /usr/share/doc/kbd-2.4.0, and /usr/share/unimaps  
# 013715            Short Descriptions  
# 013716 
# 013717                          
# 013718 
# 013719                chvt   
# 013720 
# 013721                          Changes the foreground virtual terminal  
# 013722 
# 013723                          deallocvt   
# 013724 
# 013725                          Deallocates unused virtual terminals  
# 013726 
# 013727                          dumpkeys   
# 013728 
# 013729                          Dumps the keyboard translation tables  
# 013730 
# 013731                          fgconsole   
# 013732 
# 013733                          Prints the number of the active virtual terminal  
# 013734 
# 013735                          getkeycodes   
# 013736 
# 013737                          Prints the kernel scancode-to-keycode mapping table  
# 013738 
# 013739                          kbdinfo   
# 013740 
# 013741                          Obtains information about the status of a console  
# 013742 
# 013743                          kbd_mode   
# 013744 
# 013745                          Reports or sets the keyboard mode  
# 013746 
# 013747                          kbdrate   
# 013748 
# 013749                          Sets the keyboard repeat and delay rates  
# 013750 
# 013751                          loadkeys   
# 013752 
# 013753                          Loads the keyboard translation tables  
# 013754 
# 013755                          loadunimap   
# 013756 
# 013757                          Loads the kernel unicode-to-font mapping table  
# 013758 
# 013759                          mapscrn   
# 013760 
# 013761                          An obsolete program that used to load a user-defined output character mapping table
# 013762                        into the console driver; this is now done by setfont   
# 013763 
# 013764                          openvt   
# 013765 
# 013766                          Starts a program on a new virtual terminal (VT)  
# 013767 
# 013768                          psfaddtable   
# 013769 
# 013770                          Adds a Unicode character table to a console font  
# 013771 
# 013772                          psfgettable   
# 013773 
# 013774                          Extracts the embedded Unicode character table from a console font  
# 013775 
# 013776                          psfstriptable   
# 013777 
# 013778                          Removes the embedded Unicode character table from a console font  
# 013779 
# 013780                          psfxtable   
# 013781 
# 013782                          Handles Unicode character tables for console fonts  
# 013783 
# 013784                          setfont   
# 013785 
# 013786                          Changes the Enhanced Graphic Adapter (EGA) and Video Graphics Array (VGA) fonts
# 013787                        on the console  
# 013788 
# 013789                          setkeycodes   
# 013790 
# 013791                          Loads kernel scancode-to-keycode mapping table entries; this is useful if there
# 013792                        are unusual keys on the keyboard  
# 013793 
# 013794                          setleds   
# 013795 
# 013796                          Sets the keyboard flags and Light Emitting Diodes (LEDs)  
# 013797 
# 013798                          setmetamode   
# 013799 
# 013800                          Defines the keyboard meta-key handling  
# 013801 
# 013802                          setvtrgb   
# 013803 
# 013804                          Sets the console color map in all virtual terminals  
# 013805 
# 013806                          showconsolefont   
# 013807 
# 013808                          Shows the current EGA/VGA console screen font  
# 013809 
# 013810                          showkey   
# 013811 
# 013812                          Reports the scancodes, keycodes, and ASCII codes of the keys pressed on the keyboard
# 013813                         
# 013814 
# 013815                          unicode_start   
# 013816 
# 013817                          Puts the keyboard and console in UNICODE mode [Don't use this program unless your
# 013818                        keymap file is in the ISO-8859-1 encoding. For other encodings, this utility produces
# 013819                        incorrect results.]  
# 013820 
# 013821                          unicode_stop   
# 013822 
# 013823                          Reverts keyboard and console from UNICODE mode 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'libpipeline-*')
tar xf $(find -maxdepth 1 -type f -name 'libpipeline-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'libpipeline-*')
read -p "Chapter 8.63"
 
# 013824        8.63. Libpipeline-1.5.3 
# 013825 
# 013826                          The Libpipeline package contains a library for manipulating pipelines of subprocesses
# 013827                        in a flexible and convenient way. 
# 013828           Approximate build time: 0.1 SBU
# 013829           Required disk space: 9.3 MB 
# 013830          8.63.1. Installation of Libpipeline 
# 013831 
# 013832                          Prepare Libpipeline for compilation: 



./configure --prefix=/usr



# 013840 
# 013841                          Compile the package: 



make



# 013849 
# 013850                          To test the results, issue: 



make check



# 013858 
# 013859                          Install the package: 



make install


 
# 013867          8.63.2. Contents of Libpipeline 
# 013868           Installed library: libpipeline.so  
# 013869            Short Descriptions  
# 013870 
# 013871                          
# 013872 
# 013873                libpipeline 
# 013874 
# 013875                          This library is used to safely construct pipelines between subprocesses 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'make-*')
tar xf $(find -maxdepth 1 -type f -name 'make-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'make-*')
read -p "Chapter 8.64"
 
# 013876        8.64. Make-4.3 
# 013877 
# 013878                          The Make package contains a program for controlling the generation of executables
# 013879                        and other non-source files of a package from source files. 
# 013880           Approximate build time: 0.6 SBU
# 013881           Required disk space: 14 MB 
# 013882          8.64.1. Installation of Make 
# 013883 
# 013884                          Prepare Make for compilation: 



./configure --prefix=/usr



# 013892 
# 013893                          Compile the package: 



make



# 013901 
# 013902                          To test the results, issue: 



make check



# 013910 
# 013911                          Install the package: 



make install


 
# 013919          8.64.2. Contents of Make 
# 013920           Installed program: make  
# 013921            Short Descriptions  
# 013922 
# 013923                          
# 013924 
# 013925                make   
# 013926 
# 013927                          Automatically determines which pieces of a package need to be (re)compiled and then
# 013928                        issues the relevant commands 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'patch-*')
tar xf $(find -maxdepth 1 -type f -name 'patch-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'patch-*')
read -p "Chapter 8.65"
 
# 013929        8.65. Patch-2.7.6 
# 013930 
# 013931                          The Patch package contains a program for modifying or creating files by applying
# 013932                        a "patch " file typically created by the diff  program. 
# 013933           Approximate build time: 0.2 SBU
# 013934           Required disk space: 12 MB 
# 013935          8.65.1. Installation of Patch 
# 013936 
# 013937                          Prepare Patch for compilation: 



./configure --prefix=/usr



# 013945 
# 013946                          Compile the package: 



make



# 013954 
# 013955                          To test the results, issue: 



make check



# 013963 
# 013964                          Install the package: 



make install


 
# 013972          8.65.2. Contents of Patch 
# 013973           Installed program: patch  
# 013974            Short Descriptions  
# 013975 
# 013976                          
# 013977 
# 013978                patch   
# 013979 
# 013980                          Modifies files according to a patch file (A patch file is normally a difference
# 013981                        listing created with the diff  program. By applying these differences to the original
# 013982                        files, patch  creates the patched versions.) 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'man-db-*')
tar xf $(find -maxdepth 1 -type f -name 'man-db-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'man-db-*')
read -p "Chapter 8.66"
 
# 013983        8.66. Man-DB-2.9.4 
# 013984 
# 013985                          The Man-DB package contains programs for finding and viewing man pages. 
# 013986           Approximate build time: 0.4 SBU
# 013987           Required disk space: 40 MB 
# 013988          8.66.1. Installation of Man-DB 
# 013989 
# 013990                          Prepare Man-DB for compilation: 



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



# 014007 
# 014008                          The meaning of the configure options: 
# 014009 
# 014010                --disable-setuid  
# 014011 
# 014012                          This disables making the man  program setuid to user man. 
# 014013 
# 014014                --enable-cache-owner=bin  
# 014015 
# 014016                          This makes the system-wide cache files be owned by user bin. 
# 014017 
# 014018                --with-...  
# 014019 
# 014020                          These three parameters are used to set some default programs. lynx  is a text-based
# 014021                        web browser (see BLFS for installation instructions), vgrind  converts program sources
# 014022                        to Groff input, and grap  is useful for typesetting graphs in Groff documents. The
# 014023                        vgrind  and grap  programs are not normally needed for viewing manual pages. They are
# 014024                        not part of LFS or BLFS, but you should be able to install them yourself after finishing
# 014025                        LFS if you wish to do so. 
# 014026 
# 014027                --with-systemd...  
# 014028 
# 014029                          These parameters prevent installing unneeded systemd directories and files. 
# 014030 
# 014031                          Compile the package: 



make



# 014039 
# 014040                          To test the results, issue: 



make check



# 014048 
# 014049                          Install the package: 



make install



# 014057          8.66.2. Non-English Manual Pages in LFS 
# 014058 
# 014059                          The following table shows the character set that Man-DB assumes manual pages installed
# 014060                        under /usr/share/man/<ll>will be encoded with. In addition to this, Man-DB correctly
# 014061                        determines if manual pages installed in that directory are UTF-8 encoded.  
# 014062 
# 014063                          Table 8.1. Expected character encoding of legacy 8-bit manual pages 
# 014064 
# 014065                Language (code) Encoding Language (code) Encoding Danish (da) ISO-8859-1 Croatian (hr) ISO-8859-2 German (de) ISO-8859-1 Hungarian (hu) ISO-8859-2 English (en) ISO-8859-1 Japanese (ja) EUC-JP Spanish (es) ISO-8859-1 Korean (ko) EUC-KR Estonian (et) ISO-8859-1 Lithuanian (lt) ISO-8859-13 Finnish (fi) ISO-8859-1 Latvian (lv) ISO-8859-13 French (fr) ISO-8859-1 Macedonian (mk) ISO-8859-5 Irish (ga) ISO-8859-1 Polish (pl) ISO-8859-2 Galician (gl) ISO-8859-1 Romanian (ro) ISO-8859-2 Indonesian (id) ISO-8859-1 Russian (ru) KOI8-R Icelandic (is) ISO-8859-1 Slovak (sk) ISO-8859-2 Italian (it) ISO-8859-1 Slovenian (sl) ISO-8859-2 Norwegian Bokmal (nb) ISO-8859-1 Serbian Latin (sr@latin) ISO-8859-2 Dutch (nl) ISO-8859-1 Serbian (sr) ISO-8859-5 Norwegian Nynorsk (nn) ISO-8859-1 Turkish (tr) ISO-8859-9 Norwegian (no) ISO-8859-1 Ukrainian (uk) KOI8-U Portuguese (pt) ISO-8859-1 Vietnamese (vi) TCVN5712-1 Swedish (sv) ISO-8859-1 Simplified Chinese (zh_CN) GBK Belarusian (be) CP1251 Simplified Chinese, Singapore (zh_SG) GBK Bulgarian (bg) CP1251 Traditional Chinese, Hong Kong (zh_HK) BIG5HKSCS Czech (cs) ISO-8859-2 Traditional Chinese (zh_TW) BIG5 Greek (el) ISO-8859-7 
# 014066          Note 
# 014067 
# 014068                          Manual pages in languages not in the list are not supported.  
# 014069          8.66.3. Contents of Man-DB 
# 014070           Installed programs: accessdb, apropos (link to whatis), catman, lexgrog, man, mandb, manpath, and whatis
# 014071           Installed libraries: libman.so and libmandb.so (both in /usr/lib/man-db)
# 014072           Installed directories: /usr/lib/man-db, /usr/libexec/man-db, and /usr/share/doc/man-db-2.9.4  
# 014073            Short Descriptions  
# 014074 
# 014075                          
# 014076 
# 014077                accessdb   
# 014078 
# 014079                          Dumps the whatis  database contents in human-readable form  
# 014080 
# 014081                          apropos   
# 014082 
# 014083                          Searches the whatis  database and displays the short descriptions of system commands
# 014084                        that contain a given string  
# 014085 
# 014086                          catman   
# 014087 
# 014088                          Creates or updates the pre-formatted manual pages  
# 014089 
# 014090                          lexgrog   
# 014091 
# 014092                          Displays one-line summary information about a given manual page  
# 014093 
# 014094                          man   
# 014095 
# 014096                          Formats and displays the requested manual page  
# 014097 
# 014098                          mandb   
# 014099 
# 014100                          Creates or updates the whatis  database  
# 014101 
# 014102                          manpath   
# 014103 
# 014104                          Displays the contents of $MANPATH or (if $MANPATH is not set) a suitable search
# 014105                        path based on the settings in man.conf and the user's environment  
# 014106 
# 014107                          whatis   
# 014108 
# 014109                          Searches the whatis  database and displays the short descriptions of system commands
# 014110                        that contain the given keyword as a separate word  
# 014111 
# 014112                          libman 
# 014113 
# 014114                          Contains run-time support for man   
# 014115 
# 014116                          libmandb 
# 014117 
# 014118                          Contains run-time support for man  


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'tar-*')
tar xf $(find -maxdepth 1 -type f -name 'tar-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'tar-*')
read -p "Chapter 8.67"
 
# 014119        8.67. Tar-1.34 
# 014120 
# 014121                          The Tar package provides the ability to create tar archives as well as perform various
# 014122                        other kinds of archive manipulation. Tar can be used on previously created archives
# 014123                        to extract files, to store additional files, or to update or list files which were
# 014124                        already stored. 
# 014125           Approximate build time: 2.0 SBU
# 014126           Required disk space: 41 MB 
# 014127          8.67.1. Installation of Tar 
# 014128 
# 014129                          Prepare Tar for compilation: 



FORCE_UNSAFE_CONFIGURE=1  \
./configure --prefix=/usr \
            --bindir=/bin



# 014139 
# 014140                          The meaning of the configure option: 
# 014141 
# 014142                FORCE_UNSAFE_CONFIGURE=1 
# 014143 
# 014144                          This forces the test for mknodto be run as root. It is generally considered dangerous
# 014145                        to run this test as the rootuser, but as it is being run on a system that has only
# 014146                        been partially built, overriding it is OK. 
# 014147 
# 014148                          Compile the package: 



make



# 014156 
# 014157                          To test the results (about 3 SBU), issue: 



make check



# 014165 
# 014166                          One test, capabilities: binary store/restore, is known to fail. 
# 014167 
# 014168                          Install the package: 



make install
make -C doc install-html docdir=/usr/share/doc/tar-1.34


 
# 014177          8.67.2. Contents of Tar 
# 014178           Installed programs: tar
# 014179           Installed directory: /usr/share/doc/tar-1.34  
# 014180            Short Descriptions  
# 014181 
# 014182                          
# 014183 
# 014184                tar   
# 014185 
# 014186                          Creates, extracts files from, and lists the contents of archives, also known as
# 014187                        tarballs 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'texinfo-*')
tar xf $(find -maxdepth 1 -type f -name 'texinfo-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'texinfo-*')
read -p "Chapter 8.68"
 
# 014188        8.68. Texinfo-6.7 
# 014189 
# 014190                          The Texinfo package contains programs for reading, writing, and converting info
# 014191                        pages. 
# 014192           Approximate build time: 0.7 SBU
# 014193           Required disk space: 105 MB 
# 014194          8.68.1. Installation of Texinfo 
# 014195 
# 014196                          Prepare Texinfo for compilation: 



./configure --prefix=/usr



# 014204 
# 014205                          Compile the package: 



make



# 014213 
# 014214                          To test the results, issue: 



make check



# 014222 
# 014223                          Install the package: 



make install



# 014231 
# 014232                          Optionally, install the components belonging in a TeX installation: 



make TEXMF=/usr/share/texmf install-tex



# 014240 
# 014241                          The meaning of the make parameter: 
# 014242 
# 014243                TEXMF=/usr/share/texmf  
# 014244 
# 014245                          The TEXMFmakefile variable holds the location of the root of the TeX tree if, for
# 014246                        example, a TeX package will be installed later. 
# 014247 
# 014248                          The Info documentation system uses a plain text file to hold its list of menu entries.
# 014249                        The file is located at /usr/share/info/dir. Unfortunately, due to occasional problems
# 014250                        in the Makefiles of various packages, it can sometimes get out of sync with the
# 014251                        info pages installed on the system. If the /usr/share/info/dirfile ever needs to
# 014252                        be recreated, the following optional commands will accomplish the task: 



pushd /usr/share/info
  rm -v dir
  for f in *
    do install-info $f dir 2>/dev/null
  done
popd


 
# 014265          8.68.2. Contents of Texinfo 
# 014266           Installed programs: info, install-info, makeinfo (link to texi2any), pdftexi2dvi, pod2texi, texi2any, texi2dvi, texi2pdf, and texindex
# 014267           Installed library: MiscXS.so, Parsetexi.so, and XSParagraph.so (all in /usr/lib/texinfo)
# 014268           Installed directories: /usr/share/texinfo and /usr/lib/texinfo  
# 014269            Short Descriptions  
# 014270 
# 014271                          
# 014272 
# 014273                info   
# 014274 
# 014275                          Used to read info pages which are similar to man pages, but often go much deeper
# 014276                        than just explaining all the available command line options [For example, compare
# 014277                        man bison  and info bison  .]  
# 014278 
# 014279                          install-info   
# 014280 
# 014281                          Used to install info pages; it updates entries in the info  index file  
# 014282 
# 014283                          makeinfo   
# 014284 
# 014285                          Translates the given Texinfo source documents into info pages, plain text, or HTML
# 014286                         
# 014287 
# 014288                          pdftexi2dvi   
# 014289 
# 014290                          Used to format the given Texinfo document into a Portable Document Format (PDF)
# 014291                        file  
# 014292 
# 014293                          pod2texi   
# 014294 
# 014295                          Converts Pod to Texinfo format  
# 014296 
# 014297                          texi2any   
# 014298 
# 014299                          Translate Texinfo source documentation to various other formats  
# 014300 
# 014301                          texi2dvi   
# 014302 
# 014303                          Used to format the given Texinfo document into a device-independent file that can
# 014304                        be printed  
# 014305 
# 014306                          texi2pdf   
# 014307 
# 014308                          Used to format the given Texinfo document into a Portable Document Format (PDF)
# 014309                        file  
# 014310 
# 014311                          texindex   
# 014312 
# 014313                          Used to sort Texinfo index files 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'vim-*')
tar xf $(find -maxdepth 1 -type f -name 'vim-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'vim-*')
read -p "Chapter 8.69"
 
# 014314        8.69. Vim-8.2.2433 
# 014315 
# 014316                          The Vim package contains a powerful text editor. 
# 014317           Approximate build time: 2.0 SBU
# 014318           Required disk space: 208 MB 
# 014319          Alternatives to Vim 
# 014320 
# 014321                          If you prefer another editor;such as Emacs, Joe, or Nano;please refer to http://www.linuxfromscratch.org/blfs/view/10.1/postlfs/editors.html for
# 014322                        suggested installation instructions. 
# 014323          8.69.1. Installation of Vim 
# 014324 
# 014325                          First, change the default location of the vimrcconfiguration file to /etc: 



echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h



# 014333 
# 014334                          Prepare vim for compilation: 



./configure --prefix=/usr



# 014342 
# 014343                          Compile the package: 



make



# 014351 
# 014352                          To prepare the tests, ensure that user testercan write to the source tree: 



chown -Rv tester .



# 014360 
# 014361                          Now run the tests as user tester: 



su tester -c "LANG=en_US.UTF-8 make -j1 test" &> vim-test.log



# 014369 
# 014370                          The test suite outputs a lot of binary data to the screen. This can cause issues
# 014371                        with the settings of the current terminal. The problem can be avoided by redirecting
# 014372                        the output to a log file as shown above. A successful test will result in the words
# 014373                        "ALL DONE" in the log file at completion. 
# 014374 
# 014375                          Install the package: 



make install



# 014383 
# 014384                          Many users are used to using vi  instead of vim  . To allow execution of vim  when users
# 014385                        habitually enter vi  , create a symlink for both the binary and the man page in the
# 014386                        provided languages: 



ln -sv vim /usr/bin/vi
for L in  /usr/share/man/{,*/}man1/vim.1; do
    ln -sv vim.1 $(dirname $L)/vi.1
done



# 014397 
# 014398                          By default, vim's documentation is installed in /usr/share/vim. The following symlink
# 014399                        allows the documentation to be accessed via /usr/share/doc/vim-8.2.2433, making
# 014400                        it consistent with the location of documentation for other packages: 



ln -sv ../vim/vim82/doc /usr/share/doc/vim-8.2.2433



# 014408 
# 014409                          If an X Window System is going to be installed on the LFS system, it may be necessary
# 014410                        to recompile vim after installing X. Vim comes with a GUI version of the editor
# 014411                        that requires X and some additional libraries to be installed. For more information
# 014412                        on this process, refer to the vim documentation and the vim installation page in
# 014413                        the BLFS book at http://www.linuxfromscratch.org/blfs/view/10.1/postlfs/vim.html .
# 014414                         
# 014415          8.69.2. Configuring Vim 
# 014416 
# 014417                          By default, vim  runs in vi-incompatible mode. This may be new to users who have used
# 014418                        other editors in the past. The "nocompatible " setting is included below to highlight
# 014419                        the fact that a new behavior is being used. It also reminds those who would change
# 014420                        to "compatible " mode that it should be the first setting in the configuration file.
# 014421                        This is necessary because it changes other settings, and overrides must come after
# 014422                        this setting. Create a default vim  configuration file by running the following: 



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



# 014446 
# 014447                          The set nocompatible setting makes vim  behave in a more useful way (the default) than
# 014448                        the vi-compatible manner. Remove the "no " to keep the old vi  behavior. The set backspace=2 setting
# 014449                        allows backspacing over line breaks, autoindents, and the start of an insert. The
# 014450                        syntax on parameter enables vim's syntax highlighting. The set mouse= setting enables
# 014451                        proper pasting of text with the mouse when working in chroot or over a remote connection.
# 014452                        Finally, the if  statement with the set background=dark setting corrects vim  's guess
# 014453                        about the background color of some terminal emulators. This gives the highlighting
# 014454                        a better color scheme for use on the black background of these programs. 
# 014455 
# 014456                          Documentation for other available options can be obtained by running the following
# 014457                        command: 



vim -c ':options'



# 014465          Note 
# 014466 
# 014467                          By default, vim only installs spell files for the English language. To install spell
# 014468                        files for your preferred language, download the *.spland optionally, the *.sugfiles
# 014469                        for your language and character encoding from ftp://ftp.vim.org/pub/vim/runtime/spell/ and
# 014470                        save them to /usr/share/vim/vim82/spell/. 
# 014471 
# 014472                          To use these spell files, some configuration in /etc/vimrcis needed, e.g.: 



set spelllang=en,ru
set spell



# 014481 
# 014482                          For more information, see the appropriate README file located at the URL above.
# 014483                         
# 014484          8.69.3. Contents of Vim 
# 014485           Installed programs: ex (link to vim), rview (link to vim), rvim (link to vim), vi (link to vim), view (link to vim), vim, vimdiff (link to vim), vimtutor, and xxd
# 014486           Installed directory: /usr/share/vim  
# 014487            Short Descriptions  
# 014488 
# 014489                          
# 014490 
# 014491                ex   
# 014492 
# 014493                          Starts vim  in ex mode  
# 014494 
# 014495                          rview   
# 014496 
# 014497                          Is a restricted version of view  ; no shell commands can be started and view  cannot
# 014498                        be suspended  
# 014499 
# 014500                          rvim   
# 014501 
# 014502                          Is a restricted version of vim  ; no shell commands can be started and vim  cannot be
# 014503                        suspended  
# 014504 
# 014505                          vi   
# 014506 
# 014507                          Link to vim   
# 014508 
# 014509                          view   
# 014510 
# 014511                          Starts vim  in read-only mode  
# 014512 
# 014513                          vim   
# 014514 
# 014515                          Is the editor  
# 014516 
# 014517                          vimdiff   
# 014518 
# 014519                          Edits two or three versions of a file with vim  and shows differences  
# 014520 
# 014521                          vimtutor   
# 014522 
# 014523                          Teaches the basic keys and commands of vim   
# 014524 
# 014525                          xxd   
# 014526 
# 014527                          Creates a hex dump of the given file; it can also do the reverse, so it can be used
# 014528                        for binary patching 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'eudev-*')
tar xf $(find -maxdepth 1 -type f -name 'eudev-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'eudev-*')
read -p "Chapter 8.70"
 
# 014529        8.70. Eudev-3.2.10 
# 014530 
# 014531                          The Eudev package contains programs for dynamic creation of device nodes. 
# 014532           Approximate build time: 0.2 SBU
# 014533           Required disk space: 82 MB 
# 014534          8.70.1. Installation of Eudev 
# 014535 
# 014536                          Prepare Eudev for compilation: 



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



# 014553 
# 014554                          Compile the package: 



make



# 014562 
# 014563                          Create some directories now that are needed for tests, but will also be used as
# 014564                        a part of installation: 



mkdir -pv /lib/udev/rules.d
mkdir -pv /etc/udev/rules.d



# 014573 
# 014574                          To test the results, issue: 



make check



# 014582 
# 014583                          Install the package: 



make install



# 014591 
# 014592                          Install some custom rules and support files useful in an LFS environment: 



tar -xvf ../udev-lfs-20171102.tar.xz
make -f udev-lfs-20171102/Makefile.lfs install


 
# 014601          8.70.2. Configuring Eudev 
# 014602 
# 014603                          Information about hardware devices is maintained in the /etc/udev/hwdb.dand /lib/udev/hwdb.ddirectories.
# 014604                        Eudev needs that information to be compiled into a binary database /etc/udev/hwdb.bin.
# 014605                        Create the initial database: 



udevadm hwdb --update



# 014613 
# 014614                          This command needs to be run each time the hardware information is updated.  
# 014615          8.70.3. Contents of Eudev 
# 014616           Installed programs: udevadm and udevd
# 014617           Installed libraries: libudev.so
# 014618           Installed directories: /etc/udev, /lib/udev, and /usr/share/doc/udev-udev-lfs-20171102  
# 014619            Short Descriptions  
# 014620 
# 014621                          
# 014622 
# 014623                udevadm   
# 014624 
# 014625                          Generic udev administration tool: controls the udevd daemon, provides info from
# 014626                        the Udev database, monitors uevents, waits for uevents to finish, tests Udev configuration,
# 014627                        and triggers uevents for a given device  
# 014628 
# 014629                          udevd   
# 014630 
# 014631                          A daemon that listens for uevents on the netlink socket, creates devices and runs
# 014632                        the configured external programs in response to these uevents  
# 014633 
# 014634                          libudev 
# 014635 
# 014636                          A library interface to udev device information  
# 014637 
# 014638                          /etc/udev 
# 014639 
# 014640                          Contains Udev configuration files, device permissions, and rules for device naming
# 014641                        


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'procps-*')
tar xf $(find -maxdepth 1 -type f -name 'procps-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'procps-*')
read -p "Chapter 8.71"
 
# 014642        8.71. Procps-ng-3.3.17 
# 014643 
# 014644                          The Procps-ng package contains programs for monitoring processes. 
# 014645          Note 
# 014646 
# 014647                          This package extracts to the directory procps-3.3.17, not the expected procps-ng-3.3.17.
# 014648                        
# 014649           Approximate build time: 0.5 SBU
# 014650           Required disk space: 20 MB 
# 014651          8.71.1. Installation of Procps-ng 
# 014652 
# 014653                          Prepare procps-ng for compilation: 



./configure --prefix=/usr                            \
            --exec-prefix=                           \
            --libdir=/usr/lib                        \
            --docdir=/usr/share/doc/procps-ng-3.3.17 \
            --disable-static                         \
            --disable-kill



# 014666 
# 014667                          The meaning of the configure option: 
# 014668 
# 014669                --disable-kill  
# 014670 
# 014671                          This switch disables building the kill  command that will be installed by the Util-linux
# 014672                        package. 
# 014673 
# 014674                          Compile the package: 



make



# 014682 
# 014683                          To run the test suite, run: 



make check



# 014691 
# 014692                          Five tests related to pkill are known to fail due to a problem with tests that were
# 014693                        not updated. 
# 014694 
# 014695                          Install the package: 



make install



# 014703 
# 014704                          Finally, move essential libraries to a location that can be found if /usris not
# 014705                        mounted. 



mv -v /usr/lib/libprocps.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libprocps.so) /usr/lib/libprocps.so


 
# 014714          8.71.2. Contents of Procps-ng 
# 014715           Installed programs: free, pgrep, pidof, pkill, pmap, ps, pwdx, slabtop, sysctl, tload, top, uptime, vmstat, w, and watch
# 014716           Installed library: libprocps.so
# 014717           Installed directories: /usr/include/proc and /usr/share/doc/procps-ng-3.3.17  
# 014718            Short Descriptions  
# 014719 
# 014720                          
# 014721 
# 014722                free   
# 014723 
# 014724                          Reports the amount of free and used memory (both physical and swap memory) in the
# 014725                        system  
# 014726 
# 014727                          pgrep   
# 014728 
# 014729                          Looks up processes based on their name and other attributes  
# 014730 
# 014731                          pidof   
# 014732 
# 014733                          Reports the PIDs of the given programs  
# 014734 
# 014735                          pkill   
# 014736 
# 014737                          Signals processes based on their name and other attributes  
# 014738 
# 014739                          pmap   
# 014740 
# 014741                          Reports the memory map of the given process  
# 014742 
# 014743                          ps   
# 014744 
# 014745                          Lists the current running processes  
# 014746 
# 014747                          pwait   
# 014748 
# 014749                          Waits for a process to finish before executing.  
# 014750 
# 014751                          pwdx   
# 014752 
# 014753                          Reports the current working directory of a process  
# 014754 
# 014755                          slabtop   
# 014756 
# 014757                          Displays detailed kernel slab cache information in real time  
# 014758 
# 014759                          sysctl   
# 014760 
# 014761                          Modifies kernel parameters at run time  
# 014762 
# 014763                          tload   
# 014764 
# 014765                          Prints a graph of the current system load average  
# 014766 
# 014767                          top   
# 014768 
# 014769                          Displays a list of the most CPU intensive processes; it provides an ongoing look
# 014770                        at processor activity in real time  
# 014771 
# 014772                          uptime   
# 014773 
# 014774                          Reports how long the system has been running, how many users are logged on, and
# 014775                        the system load averages  
# 014776 
# 014777                          vmstat   
# 014778 
# 014779                          Reports virtual memory statistics, giving information about processes, memory, paging,
# 014780                        block Input/Output (IO), traps, and CPU activity  
# 014781 
# 014782                          w   
# 014783 
# 014784                          Shows which users are currently logged on, where, and since when  
# 014785 
# 014786                          watch   
# 014787 
# 014788                          Runs a given command repeatedly, displaying the first screen-full of its output;
# 014789                        this allows a user to watch the output change over time  
# 014790 
# 014791                          libprocps 
# 014792 
# 014793                          Contains the functions used by most programs in this package 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'util-linux-*')
tar xf $(find -maxdepth 1 -type f -name 'util-linux-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'util-linux-*')
read -p "Chapter 8.72"
 
# 014794        8.72. Util-linux-2.36.2 
# 014795 
# 014796                          The Util-linux package contains miscellaneous utility programs. Among them are utilities
# 014797                        for handling file systems, consoles, partitions, and messages. 
# 014798           Approximate build time: 1.1 SBU
# 014799           Required disk space: 262 MB 
# 014800          8.72.1. Installation of Util-linux 
# 014801 
# 014802                          Prepare Util-linux for compilation: 



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



# 014823 
# 014824                          The --disable and --without options prevent warnings about building components that
# 014825                        require packages not in LFS or are inconsistent with programs installed by other
# 014826                        packages. 
# 014827 
# 014828                          Compile the package: 



make



# 014836 
# 014837                          If desired, run the test suite as a non-root user: 
# 014838          Warning 
# 014839 
# 014840                          Running the test suite as the rootuser can be harmful to your system. To run it,
# 014841                        the CONFIG_SCSI_DEBUG option for the kernel must be available in the currently running
# 014842                        system and must be built as a module. Building it into the kernel will prevent booting.
# 014843                        For complete coverage, other BLFS packages must be installed. If desired, this test
# 014844                        can be run after rebooting into the completed LFS system and running: 



bash tests/run.sh --srcdir=$PWD --builddir=$PWD






chown -Rv tester .
su tester -c "make -k check"



# 014860 
# 014861                          Install the package: 



make install


 
# 014869          8.72.2. Contents of Util-linux 
# 014870           Installed programs: addpart, agetty, blkdiscard, blkid, blkzone, blockdev, cal, cfdisk, chcpu, chmem, choom, chrt, col, colcrt, colrm, column, ctrlaltdel, delpart, dmesg, eject, fallocate, fdformat, fdisk, fincore, findfs, findmnt, flock, fsck, fsck.cramfs, fsck.minix, fsfreeze, fstrim, getopt, hexdump, hwclock, i386, ionice, ipcmk, ipcrm, ipcs, isosize, kill, last, lastb (link to last), ldattach, linux32, linux64, logger, look, losetup, lsblk, lscpu, lsipc, lslocks, lslogins, lsmem, lsns, mcookie, mesg, mkfs, mkfs.bfs, mkfs.cramfs, mkfs.minix, mkswap, more, mount, mountpoint, namei, nsenter, partx, pivot_root, prlimit, raw, readprofile, rename, renice, resizepart, rev, rfkill, rtcwake, script, scriptreplay, setarch, setsid, setterm, sfdisk, sulogin, swaplabel, swapoff (link to swapon), swapon, switch_root, taskset, ul, umount, uname26, unshare, utmpdump, uuidd, uuidgen, uuidparse, wall, wdctl, whereis, wipefs, x86_64, and zramctl
# 014871           Installed libraries: libblkid.so, libfdisk.so, libmount.so, libsmartcols.so, and libuuid.so
# 014872           Installed directories: /usr/include/blkid, /usr/include/libfdisk, /usr/include/libmount, /usr/include/libsmartcols, /usr/include/uuid, /usr/share/doc/util-linux-2.36.2, and /var/lib/hwclock  
# 014873            Short Descriptions  
# 014874 
# 014875                          
# 014876 
# 014877                addpart   
# 014878 
# 014879                          Informs the Linux kernel of new partitions  
# 014880 
# 014881                          agetty   
# 014882 
# 014883                          Opens a tty port, prompts for a login name, and then invokes the login  program  
# 014884 
# 014885                          blkdiscard   
# 014886 
# 014887                          Discards sectors on a device  
# 014888 
# 014889                          blkid   
# 014890 
# 014891                          A command line utility to locate and print block device attributes  
# 014892 
# 014893                          blkzone   
# 014894 
# 014895                          Runs zone command on the given block device  
# 014896 
# 014897                          blockdev   
# 014898 
# 014899                          Allows users to call block device ioctls from the command line  
# 014900 
# 014901                          cal   
# 014902 
# 014903                          Displays a simple calendar  
# 014904 
# 014905                          cfdisk   
# 014906 
# 014907                          Manipulates the partition table of the given device  
# 014908 
# 014909                          chcpu   
# 014910 
# 014911                          Modifies the state of CPUs  
# 014912 
# 014913                          chmem   
# 014914 
# 014915                          Configures memory  
# 014916 
# 014917                          choom   
# 014918 
# 014919                          Displays and adjusts OOM-killer score  
# 014920 
# 014921                          chrt   
# 014922 
# 014923                          Manipulates real-time attributes of a process  
# 014924 
# 014925                          col   
# 014926 
# 014927                          Filters out reverse line feeds  
# 014928 
# 014929                          colcrt   
# 014930 
# 014931                          Filters nroff  output for terminals that lack some capabilities, such as overstriking
# 014932                        and half-lines  
# 014933 
# 014934                          colrm   
# 014935 
# 014936                          Filters out the given columns  
# 014937 
# 014938                          column   
# 014939 
# 014940                          Formats a given file into multiple columns  
# 014941 
# 014942                          ctrlaltdel   
# 014943 
# 014944                          Sets the function of the Ctrl+Alt+Del key combination to a hard or a soft reset
# 014945                         
# 014946 
# 014947                          delpart   
# 014948 
# 014949                          Asks the Linux kernel to remove a partition  
# 014950 
# 014951                          dmesg   
# 014952 
# 014953                          Dumps the kernel boot messages  
# 014954 
# 014955                          eject   
# 014956 
# 014957                          Ejects removable media  
# 014958 
# 014959                          fallocate   
# 014960 
# 014961                          Preallocates space to a file  
# 014962 
# 014963                          fdformat   
# 014964 
# 014965                          Low-level formats a floppy disk  
# 014966 
# 014967                          fdisk   
# 014968 
# 014969                          Manipulates the partition table of the given device  
# 014970 
# 014971                          fincore   
# 014972 
# 014973                          Counts pages of file contents in core  
# 014974 
# 014975                          findfs   
# 014976 
# 014977                          Finds a file system by label or Universally Unique Identifier (UUID)  
# 014978 
# 014979                          findmnt   
# 014980 
# 014981                          Is a command line interface to the libmount library for work with mountinfo, fstab
# 014982                        and mtab files  
# 014983 
# 014984                          flock   
# 014985 
# 014986                          Acquires a file lock and then executes a command with the lock held  
# 014987 
# 014988                          fsck   
# 014989 
# 014990                          Is used to check, and optionally repair, file systems  
# 014991 
# 014992                          fsck.cramfs   
# 014993 
# 014994                          Performs a consistency check on the Cramfs file system on the given device  
# 014995 
# 014996                          fsck.minix   
# 014997 
# 014998                          Performs a consistency check on the Minix file system on the given device  
# 014999 
# 015000                          fsfreeze   
# 015001 
# 015002                          Is a very simple wrapper around FIFREEZE/FITHAW ioctl kernel driver operations  
# 015003 
# 015004                          fstrim   
# 015005 
# 015006                          Discards unused blocks on a mounted filesystem  
# 015007 
# 015008                          getopt   
# 015009 
# 015010                          Parses options in the given command line  
# 015011 
# 015012                          hexdump   
# 015013 
# 015014                          Dumps the given file in hexadecimal or in another given format  
# 015015 
# 015016                          hwclock   
# 015017 
# 015018                          Reads or sets the system's hardware clock, also called the Real-Time Clock (RTC)
# 015019                        or Basic Input-Output System (BIOS) clock  
# 015020 
# 015021                          i386   
# 015022 
# 015023                          A symbolic link to setarch  
# 015024 
# 015025                          ionice   
# 015026 
# 015027                          Gets or sets the io scheduling class and priority for a program  
# 015028 
# 015029                          ipcmk   
# 015030 
# 015031                          Creates various IPC resources  
# 015032 
# 015033                          ipcrm   
# 015034 
# 015035                          Removes the given Inter-Process Communication (IPC) resource  
# 015036 
# 015037                          ipcs   
# 015038 
# 015039                          Provides IPC status information  
# 015040 
# 015041                          isosize   
# 015042 
# 015043                          Reports the size of an iso9660 file system  
# 015044 
# 015045                          kill   
# 015046 
# 015047                          Sends signals to processes  
# 015048 
# 015049                          last   
# 015050 
# 015051                          Shows which users last logged in (and out), searching back through the /var/log/wtmpfile;
# 015052                        it also shows system boots, shutdowns, and run-level changes  
# 015053 
# 015054                          lastb   
# 015055 
# 015056                          Shows the failed login attempts, as logged in /var/log/btmp 
# 015057 
# 015058                          ldattach   
# 015059 
# 015060                          Attaches a line discipline to a serial line  
# 015061 
# 015062                          linux32   
# 015063 
# 015064                          A symbolic link to setarch  
# 015065 
# 015066                          linux64   
# 015067 
# 015068                          A symbolic link to setarch  
# 015069 
# 015070                          logger   
# 015071 
# 015072                          Enters the given message into the system log  
# 015073 
# 015074                          look   
# 015075 
# 015076                          Displays lines that begin with the given string  
# 015077 
# 015078                          losetup   
# 015079 
# 015080                          Sets up and controls loop devices  
# 015081 
# 015082                          lsblk   
# 015083 
# 015084                          Lists information about all or selected block devices in a tree-like format  
# 015085 
# 015086                          lscpu   
# 015087 
# 015088                          Prints CPU architecture information  
# 015089 
# 015090                          lsipc   
# 015091 
# 015092                          Prints information on IPC facilities currently employed in the system  
# 015093 
# 015094                          lslocks   
# 015095 
# 015096                          Lists local system locks  
# 015097 
# 015098                          lslogins   
# 015099 
# 015100                          Lists information about users, groups and system accounts  
# 015101 
# 015102                          lsmem   
# 015103 
# 015104                          Lists the ranges of available memory with their online status  
# 015105 
# 015106                          lsns   
# 015107 
# 015108                          Lists namespaces  
# 015109 
# 015110                          mcookie   
# 015111 
# 015112                          Generates magic cookies (128-bit random hexadecimal numbers) for xauth   
# 015113 
# 015114                          mesg   
# 015115 
# 015116                          Controls whether other users can send messages to the current user's terminal  
# 015117 
# 015118                          mkfs   
# 015119 
# 015120                          Builds a file system on a device (usually a hard disk partition)  
# 015121 
# 015122                          mkfs.bfs   
# 015123 
# 015124                          Creates a Santa Cruz Operations (SCO) bfs file system  
# 015125 
# 015126                          mkfs.cramfs   
# 015127 
# 015128                          Creates a cramfs file system  
# 015129 
# 015130                          mkfs.minix   
# 015131 
# 015132                          Creates a Minix file system  
# 015133 
# 015134                          mkswap   
# 015135 
# 015136                          Initializes the given device or file to be used as a swap area  
# 015137 
# 015138                          more   
# 015139 
# 015140                          A filter for paging through text one screen at a time  
# 015141 
# 015142                          mount   
# 015143 
# 015144                          Attaches the file system on the given device to a specified directory in the file-system
# 015145                        tree  
# 015146 
# 015147                          mountpoint   
# 015148 
# 015149                          Checks if the directory is a mountpoint  
# 015150 
# 015151                          namei   
# 015152 
# 015153                          Shows the symbolic links in the given pathnames  
# 015154 
# 015155                          nsenter   
# 015156 
# 015157                          Runs a program with namespaces of other processes  
# 015158 
# 015159                          partx   
# 015160 
# 015161                          Tells the kernel about the presence and numbering of on-disk partitions  
# 015162 
# 015163                          pivot_root   
# 015164 
# 015165                          Makes the given file system the new root file system of the current process  
# 015166 
# 015167                          prlimit   
# 015168 
# 015169                          Get and set a process' resource limits  
# 015170 
# 015171                          raw   
# 015172 
# 015173                          Bind a Linux raw character device to a block device  
# 015174 
# 015175                          readprofile   
# 015176 
# 015177                          Reads kernel profiling information  
# 015178 
# 015179                          rename   
# 015180 
# 015181                          Renames the given files, replacing a given string with another  
# 015182 
# 015183                          renice   
# 015184 
# 015185                          Alters the priority of running processes  
# 015186 
# 015187                          resizepart   
# 015188 
# 015189                          Asks the Linux kernel to resize a partition  
# 015190 
# 015191                          rev   
# 015192 
# 015193                          Reverses the lines of a given file  
# 015194 
# 015195                          rkfill   
# 015196 
# 015197                          Tool for enabling and disabling wireless devices  
# 015198 
# 015199                          rtcwake   
# 015200 
# 015201                          Used to enter a system sleep state until specified wakeup time  
# 015202 
# 015203                          script   
# 015204 
# 015205                          Makes a typescript of a terminal session  
# 015206 
# 015207                          scriptreplay   
# 015208 
# 015209                          Plays back typescripts using timing information  
# 015210 
# 015211                          setarch   
# 015212 
# 015213                          Changes reported architecture in a new program environment and sets personality
# 015214                        flags  
# 015215 
# 015216                          setsid   
# 015217 
# 015218                          Runs the given program in a new session  
# 015219 
# 015220                          setterm   
# 015221 
# 015222                          Sets terminal attributes  
# 015223 
# 015224                          sfdisk   
# 015225 
# 015226                          A disk partition table manipulator  
# 015227 
# 015228                          sulogin   
# 015229 
# 015230                          Allows rootto log in; it is normally invoked by init  when the system goes into single
# 015231                        user mode  
# 015232 
# 015233                          swaplabel   
# 015234 
# 015235                          Allows to change swaparea UUID and label  
# 015236 
# 015237                          swapoff   
# 015238 
# 015239                          Disables devices and files for paging and swapping  
# 015240 
# 015241                          swapon   
# 015242 
# 015243                          Enables devices and files for paging and swapping and lists the devices and files
# 015244                        currently in use  
# 015245 
# 015246                          switch_root   
# 015247 
# 015248                          Switches to another filesystem as the root of the mount tree  
# 015249 
# 015250                          tailf   
# 015251 
# 015252                          Tracks the growth of a log file; displays the last 10 lines of a log file, then
# 015253                        continues displaying any new entries in the log file as they are created  
# 015254 
# 015255                          taskset   
# 015256 
# 015257                          Retrieves or sets a process' CPU affinity  
# 015258 
# 015259                          ul   
# 015260 
# 015261                          A filter for translating underscores into escape sequences indicating underlining
# 015262                        for the terminal in use  
# 015263 
# 015264                          umount   
# 015265 
# 015266                          Disconnects a file system from the system's file tree  
# 015267 
# 015268                          uname26   
# 015269 
# 015270                          A symbolic link to setarch  
# 015271 
# 015272                          unshare   
# 015273 
# 015274                          Runs a program with some namespaces unshared from parent  
# 015275 
# 015276                          utmpdump   
# 015277 
# 015278                          Displays the content of the given login file in a more user-friendly format  
# 015279 
# 015280                          uuidd   
# 015281 
# 015282                          A daemon used by the UUID library to generate time-based UUIDs in a secure and guaranteed-unique
# 015283                        fashion  
# 015284 
# 015285                          uuidgen   
# 015286 
# 015287                          Creates new UUIDs. Each new UUID can reasonably be considered unique among all UUIDs
# 015288                        created, on the local system and on other systems, in the past and in the future
# 015289                         
# 015290 
# 015291                          uuidparse   
# 015292 
# 015293                          An utility to parse unique identifiers  
# 015294 
# 015295                          wall   
# 015296 
# 015297                          Displays the contents of a file or, by default, its standard input, on the terminals
# 015298                        of all currently logged in users  
# 015299 
# 015300                          wdctl   
# 015301 
# 015302                          Shows hardware watchdog status  
# 015303 
# 015304                          whereis   
# 015305 
# 015306                          Reports the location of the binary, source, and man page for the given command  
# 015307 
# 015308                          wipefs   
# 015309 
# 015310                          Wipes a filesystem signature from a device  
# 015311 
# 015312                          x86_64   
# 015313 
# 015314                          A symbolic link to setarch  
# 015315 
# 015316                          zramctl   
# 015317 
# 015318                          A program to set up and control zram (compressed ram disk) devices  
# 015319 
# 015320                          libblkid 
# 015321 
# 015322                          Contains routines for device identification and token extraction  
# 015323 
# 015324                          libfdisk 
# 015325 
# 015326                          Contains routines for manipulating partition tables  
# 015327 
# 015328                          libmount 
# 015329 
# 015330                          Contains routines for block device mounting and unmounting  
# 015331 
# 015332                          libsmartcols 
# 015333 
# 015334                          Contains routines for aiding screen output in tabular form  
# 015335 
# 015336                          libuuid 
# 015337 
# 015338                          Contains routines for generating unique identifiers for objects that may be accessible
# 015339                        beyond the local system 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'e2fsprogs-*')
tar xf $(find -maxdepth 1 -type f -name 'e2fsprogs-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'e2fsprogs-*')
read -p "Chapter 8.73"
 
# 015340        8.73. E2fsprogs-1.46.1 
# 015341 
# 015342                          The e2fsprogs package contains the utilities for handling the ext2file system. It
# 015343                        also supports the ext3and ext4journaling file systems. 
# 015344           Approximate build time: 4.4 SBU on a spinning disk, 1.5 SBU on an SSD
# 015345           Required disk space: 102 MB 
# 015346          8.73.1. Installation of E2fsprogs 
# 015347 
# 015348                          The e2fsprogs documentation recommends that the package be built in a subdirectory
# 015349                        of the source tree: 



mkdir -v build
cd       build



# 015358 
# 015359                          Prepare e2fsprogs for compilation: 



../configure --prefix=/usr           \
             --bindir=/bin           \
             --with-root-prefix=""   \
             --enable-elf-shlibs     \
             --disable-libblkid      \
             --disable-libuuid       \
             --disable-uuidd         \
             --disable-fsck



# 015374 
# 015375                          The meaning of the configure options: 
# 015376 
# 015377                --with-root-prefix="" and --bindir=/bin  
# 015378 
# 015379                          Certain programs (such as the e2fsck  program) are considered essential programs.
# 015380                        When, for example, /usris not mounted, these programs still need to be available.
# 015381                        They belong in directories like /liband /sbin. If this option is not passed to configure,
# 015382                        the programs are installed into the /usrdirectory. 
# 015383 
# 015384                --enable-elf-shlibs  
# 015385 
# 015386                          This creates the shared libraries which some programs in this package use. 
# 015387 
# 015388                --disable-*  
# 015389 
# 015390                          This prevents e2fsprogs from building and installing the libuuidand libblkidlibraries,
# 015391                        the uuidddaemon, and the fsck  wrapper, as util-linux installs more recent versions.
# 015392                        
# 015393 
# 015394                          Compile the package: 



make



# 015402 
# 015403                          To run the tests, issue: 



make check



# 015411 
# 015412                          One test, m_rootdir_acl, is known to fail. 
# 015413 
# 015414                          On a spinning disk, the tests take a little more than 4 SBUs. They can be much shorter
# 015415                        on an SSD (down to about 1.5 SBUs). 
# 015416 
# 015417                          Install the package: 



make install



# 015425 
# 015426                          Remove useless static libraries: 



rm -fv /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a



# 015434 
# 015435                          This package installs a gzipped .infofile but doesn't update the system-wide dirfile.
# 015436                        Unzip this file and then update the system dirfile using the following commands:
# 015437                        



gunzip -v /usr/share/info/libext2fs.info.gz
install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info



# 015446 
# 015447                          If desired, create and install some additional documentation by issuing the following
# 015448                        commands: 



makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo
install -v -m644 doc/com_err.info /usr/share/info
install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info


 
# 015458          8.73.2. Contents of E2fsprogs 
# 015459           Installed programs: badblocks, chattr, compile_et, debugfs, dumpe2fs, e2freefrag, e2fsck, e2image, e2label, e2mmpstatus, e2scrub, e2scrub_all, e2undo, e4crypt, e4defrag, filefrag, fsck.ext2, fsck.ext3, fsck.ext4, logsave, lsattr, mk_cmds, mke2fs, mkfs.ext2, mkfs.ext3, mkfs.ext4, mklost+found, resize2fs, and tune2fs
# 015460           Installed libraries: libcom_err.so, libe2p.so, libext2fs.so, and libss.so
# 015461           Installed directories: /usr/include/e2p, /usr/include/et, /usr/include/ext2fs, /usr/include/ss, /usr/lib/e2fsprogs, /usr/share/et, and /usr/share/ss  
# 015462            Short Descriptions  
# 015463 
# 015464                          
# 015465 
# 015466                badblocks   
# 015467 
# 015468                          Searches a device (usually a disk partition) for bad blocks  
# 015469 
# 015470                          chattr   
# 015471 
# 015472                          Changes the attributes of files on an ext2file system; it also changes ext3file
# 015473                        systems, the journaling version of ext2file systems  
# 015474 
# 015475                          compile_et   
# 015476 
# 015477                          An error table compiler; it converts a table of error-code names and messages into
# 015478                        a C source file suitable for use with the com_errlibrary  
# 015479 
# 015480                          debugfs   
# 015481 
# 015482                          A file system debugger; it can be used to examine and change the state of an ext2file
# 015483                        system  
# 015484 
# 015485                          dumpe2fs   
# 015486 
# 015487                          Prints the super block and blocks group information for the file system present
# 015488                        on a given device  
# 015489 
# 015490                          e2freefrag   
# 015491 
# 015492                          Reports free space fragmentation information  
# 015493 
# 015494                          e2fsck   
# 015495 
# 015496                          Is used to check, and optionally repair ext2file systems and ext3file systems  
# 015497 
# 015498                          e2image   
# 015499 
# 015500                          Is used to save critical ext2file system data to a file  
# 015501 
# 015502                          e2label   
# 015503 
# 015504                          Displays or changes the file system label on the ext2file system present on a given
# 015505                        device  
# 015506 
# 015507                          e2mmpstatus   
# 015508 
# 015509                          Checks MMP status of an ext4 filesystem  
# 015510 
# 015511                          e2scrub   
# 015512 
# 015513                          Checks the contents of a mounted ext[234] filesystem  
# 015514 
# 015515                          e2scrub_all   
# 015516 
# 015517                          Checks all mounted ext[234] filesystems for errors  
# 015518 
# 015519                          e2undo   
# 015520 
# 015521                          Replays the undo log undo_log for an ext2/ext3/ext4 filesystem found on a device
# 015522                        [This can be used to undo a failed operation by an e2fsprogs program.]  
# 015523 
# 015524                          e4crypt   
# 015525 
# 015526                          Ext4 filesystem encryption utility  
# 015527 
# 015528                          e4defrag   
# 015529 
# 015530                          Online defragmenter for ext4 filesystems  
# 015531 
# 015532                          filefrag   
# 015533 
# 015534                          Reports on how badly fragmented a particular file might be  
# 015535 
# 015536                          fsck.ext2   
# 015537 
# 015538                          By default checks ext2file systems and is a hard link to e2fsck   
# 015539 
# 015540                          fsck.ext3   
# 015541 
# 015542                          By default checks ext3file systems and is a hard link to e2fsck   
# 015543 
# 015544                          fsck.ext4   
# 015545 
# 015546                          By default checks ext4file systems and is a hard link to e2fsck   
# 015547 
# 015548                          logsave   
# 015549 
# 015550                          Saves the output of a command in a log file  
# 015551 
# 015552                          lsattr   
# 015553 
# 015554                          Lists the attributes of files on a second extended file system  
# 015555 
# 015556                          mk_cmds   
# 015557 
# 015558                          Converts a table of command names and help messages into a C source file suitable
# 015559                        for use with the libsssubsystem library  
# 015560 
# 015561                          mke2fs   
# 015562 
# 015563                          Creates an ext2or ext3file system on the given device  
# 015564 
# 015565                          mkfs.ext2   
# 015566 
# 015567                          By default creates ext2file systems and is a hard link to mke2fs   
# 015568 
# 015569                          mkfs.ext3   
# 015570 
# 015571                          By default creates ext3file systems and is a hard link to mke2fs   
# 015572 
# 015573                          mkfs.ext4   
# 015574 
# 015575                          By default creates ext4file systems and is a hard link to mke2fs   
# 015576 
# 015577                          mklost+found   
# 015578 
# 015579                          Used to create a lost+founddirectory on an ext2file system; it pre-allocates disk
# 015580                        blocks to this directory to lighten the task of e2fsck   
# 015581 
# 015582                          resize2fs   
# 015583 
# 015584                          Can be used to enlarge or shrink an ext2file system  
# 015585 
# 015586                          tune2fs   
# 015587 
# 015588                          Adjusts tunable file system parameters on an ext2file system  
# 015589 
# 015590                          libcom_err 
# 015591 
# 015592                          The common error display routine  
# 015593 
# 015594                          libe2p 
# 015595 
# 015596                          Used by dumpe2fs  , chattr  , and lsattr   
# 015597 
# 015598                          libext2fs 
# 015599 
# 015600                          Contains routines to enable user-level programs to manipulate an ext2file system
# 015601                         
# 015602 
# 015603                          libss 
# 015604 
# 015605                          Used by debugfs  


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'sysklogd-*')
tar xf $(find -maxdepth 1 -type f -name 'sysklogd-*' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'sysklogd-*')
read -p "Chapter 8.74"
 
# 015606        8.74. Sysklogd-1.5.1 
# 015607 
# 015608                          The sysklogd package contains programs for logging system messages, such as those
# 015609                        given by the kernel when unusual things happen. 
# 015610           Approximate build time: less than 0.1 SBU
# 015611           Required disk space: 0.6 MB 
# 015612          8.74.1. Installation of Sysklogd 
# 015613 
# 015614                          First, fix problems that causes a segmentation fault under some conditions in klogd
# 015615                        and fix an obsolete program construct: 



sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c
sed -i 's/union wait/int/' syslogd.c



# 015624 
# 015625                          Compile the package: 



make



# 015633 
# 015634                          This package does not come with a test suite. 
# 015635 
# 015636                          Install the package: 



make BINDIR=/sbin install


 
# 015644          8.74.2. Configuring Sysklogd 
# 015645 
# 015646                          Create a new /etc/syslog.conffile by running the following: 



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


 
# 015666          8.74.3. Contents of Sysklogd 
# 015667           Installed programs: klogd and syslogd  
# 015668            Short Descriptions  
# 015669 
# 015670                          
# 015671 
# 015672                klogd   
# 015673 
# 015674                          A system daemon for intercepting and logging kernel messages  
# 015675 
# 015676                          syslogd   
# 015677 
# 015678                          Logs the messages that system programs offer for logging [Every logged message contains
# 015679                        at least a date stamp and a hostname, and normally the program's name too, but that
# 015680                        depends on how trusting the logging daemon is told to be.] 


cd /sources
rm -rf $(find -maxdepth 1 -type d -name 'sysvinit-*')
tar xf $(find -maxdepth 1 -type f -name 'sysvinit-*.xz' | cut -c 3-)
cd $(find -maxdepth 1 -type d -name 'sysvinit-*')
read -p "Chapter 8.75"
 
# 015681        8.75. Sysvinit-2.98 
# 015682 
# 015683                          The Sysvinit package contains programs for controlling the startup, running, and
# 015684                        shutdown of the system. 
# 015685           Approximate build time: less than 0.1 SBU
# 015686           Required disk space: 1.4 MB 
# 015687          8.75.1. Installation of Sysvinit 
# 015688 
# 015689                          First, apply a patch that removes several programs installed by other packages,
# 015690                        clarifies a message, and fixes a compiler warning: 



patch -Np1 -i ../sysvinit-2.98-consolidated-1.patch



# 015698 
# 015699                          Compile the package: 



make



# 015707 
# 015708                          This package does not come with a test suite. 
# 015709 
# 015710                          Install the package: 



make install


 
# 015718          8.75.2. Contents of Sysvinit 
# 015719           Installed programs: bootlogd, fstab-decode, halt, init, killall5, poweroff (link to halt), reboot (link to halt), runlevel, shutdown, and telinit (link to init)  
# 015720            Short Descriptions  
# 015721 
# 015722                          
# 015723 
# 015724                bootlogd   
# 015725 
# 015726                          Logs boot messages to a log file  
# 015727 
# 015728                          fstab-decode   
# 015729 
# 015730                          Run a command with fstab-encoded arguments  
# 015731 
# 015732                          halt   
# 015733 
# 015734                          Normally invokes shutdown  with the -h option, except when already in run-level 0,
# 015735                        then it tells the kernel to halt the system; it notes in the file /var/log/wtmpthat
# 015736                        the system is being brought down  
# 015737 
# 015738                          init   
# 015739 
# 015740                          The first process to be started when the kernel has initialized the hardware which
# 015741                        takes over the boot process and starts all the proceses specified in its configuration
# 015742                        file  
# 015743 
# 015744                          killall5   
# 015745 
# 015746                          Sends a signal to all processes, except the processes in its own session so it will
# 015747                        not kill its parent shell  
# 015748 
# 015749                          poweroff   
# 015750 
# 015751                          Tells the kernel to halt the system and switch off the computer (see halt  )  
# 015752 
# 015753                          reboot   
# 015754 
# 015755                          Tells the kernel to reboot the system (see halt  )  
# 015756 
# 015757                          runlevel   
# 015758 
# 015759                          Reports the previous and the current run-level, as noted in the last run-level record
# 015760                        in /run/utmp 
# 015761 
# 015762                          shutdown   
# 015763 
# 015764                          Brings the system down in a secure way, signaling all processes and notifying all
# 015765                        logged-in users  
# 015766 
# 015767                          telinit   
# 015768 
# 015769                          Tells init  which run-level to change to  
# 015770        8.76. About Debugging Symbols 
# 015771 
# 015772                          Most programs and libraries are, by default, compiled with debugging symbols included
# 015773                        (with gcc  's -g option). This means that when debugging a program or library that
# 015774                        was compiled with debugging information, the debugger can provide not only memory
# 015775                        addresses, but also the names of the routines and variables. 
# 015776 
# 015777                          However, the inclusion of these debugging symbols enlarges a program or library
# 015778                        significantly. The following is an example of the amount of space these symbols
# 015779                        occupy: 
# 015780 
# 015781                          A bash  binary with debugging symbols: 1200 KB 
# 015782 
# 015783                          A bash  binary without debugging symbols: 480 KB 
# 015784 
# 015785                          Glibc and GCC files (/liband /usr/lib) with debugging symbols: 87 MB 
# 015786 
# 015787                          Glibc and GCC files without debugging symbols: 16 MB 
# 015788 
# 015789                          Sizes may vary depending on which compiler and C library were used, but when comparing
# 015790                        programs with and without debugging symbols, the difference will usually be a factor
# 015791                        between two and five. 
# 015792 
# 015793                          Because most users will never use a debugger on their system software, a lot of
# 015794                        disk space can be regained by removing these symbols. The next section shows how
# 015795                        to strip all debugging symbols from the programs and libraries.  
# 015796        8.77. Stripping Again 
# 015797 
# 015798                          This section is optional. If the intended user is not a programmer and does not
# 015799                        plan to do any debugging on the system software, the system size can be decreased
# 015800                        by about 2 GB by removing the debugging symbols from binaries and libraries. This
# 015801                        causes no inconvenience other than not being able to debug the software fully anymore.
# 015802                        
# 015803 
# 015804                          Most people who use the commands mentioned below do not experience any difficulties.
# 015805                        However, it is easy to make a typo and render the new system unusable, so before
# 015806                        running the strip  commands, it is a good idea to make a backup of the LFS system
# 015807                        in its current state. 
# 015808 
# 015809                          First place the debugging symbols for selected libraries in separate files. This
# 015810                        debugging information is needed if running regression tests that use valgrind or
# 015811                        gdb later in BLFS. 



# 015815 save_lib="ld-2.33.so libc-2.33.so libpthread-2.33.so libthread_db-1.0.so"
# 015816 
# 015817 cd /lib
# 015818 
# 015819 for LIB in $save_lib; do
# 015820     objcopy --only-keep-debug $LIB $LIB.dbg 
# 015821     strip --strip-unneeded $LIB
# 015822     objcopy --add-gnu-debuglink=$LIB.dbg $LIB 
# 015823 done    
# 015824 
# 015825 save_usrlib="libquadmath.so.0.0.0 libstdc++.so.6.0.28
# 015826              libitm.so.1.0.0 libatomic.so.1.2.0" 
# 015827 
# 015828 cd /usr/lib
# 015829 
# 015830 for LIB in $save_usrlib; do
# 015831     objcopy --only-keep-debug $LIB $LIB.dbg
# 015832     strip --strip-unneeded $LIB
# 015833     objcopy --add-gnu-debuglink=$LIB.dbg $LIB
# 015834 done
# 015835 
# 015836 unset LIB save_lib save_usrlib
# 015837 


# 015840 
# 015841                          Now the binaries and libraries can be stripped: 



# 015845 find /usr/lib -type f -name \*.a \
# 015846    -exec strip --strip-debug {} ';'
# 015847 
# 015848 find /lib /usr/lib -type f -name \*.so* ! -name \*dbg \
# 015849    -exec strip --strip-unneeded {} ';'
# 015850 
# 015851 find /{bin,sbin} /usr/{bin,sbin,libexec} -type f \
# 015852     -exec strip --strip-all {} ';'
# 015853 


# 015856 
# 015857                          A large number of files will be reported as having their file format not recognized.
# 015858                        These warnings can be safely ignored. These warnings indicate that those files are
# 015859                        scripts instead of binaries.  
# 015860        8.78. Cleaning Up 
# 015861 
# 015862                          Finally, clean up some extra files left around from running tests: 



rm -rf /tmp/*



# 015870 
# 015871                          Now log out and reenter the chroot environment with an updated chroot command. From
# 015872                        now on, use this updated chroot command any time you need to reenter the chroot
# 015873                        environment after exiting: 



logout

chroot "$LFS" /usr/bin/env -i          \
    HOME=/root TERM="$TERM"            \
    PS1='(lfs chroot) \u:\w\$ '        \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin \
    /bin/bash --login



# 015887 
# 015888                          Here the +h option is not used anymore, since all the previous programs have been
# 015889                        replaced: hashing is therefore possible. 
# 015890 
# 015891                          If the virtual kernel file systems have been unmounted, either manually or through
# 015892                        a reboot, ensure that the virtual kernel file systems are mounted when reentering
# 015893                        the chroot. This process was explained in Section 7.3.2, "Mounting and Populating
# 015894                        /dev" and Section 7.3.3, "Mounting Virtual Kernel File Systems" . 
# 015895 
# 015896                          There are also several files installed in the /usr/lib and /usr/libexec directories
# 015897                        with a file name extension of .la. These are "libtool archive" files. As already
# 015898                        said, they are only useful when linking with static libraries. They are unneeded,
# 015899                        and potentially harmful, when using dynamic shared libraries, specially when using
# 015900                        also non-autotools build systems. To remove them, run: 



find /usr/lib /usr/libexec -name \*.la -delete



# 015908 
# 015909                          For more information about libtool archive files, see the BLFS section "About Libtool
# 015910                        Archive (.la) files" . 
# 015911 
# 015912                          The compiler built in Chapter 6 and Chapter 7 is still partially installed and not
# 015913                        needed anymore. Remove it with: 



find /usr -depth -name $(uname -m)-lfs-linux-gnu\* | xargs rm -rf



# 015921 
# 015922                          The /toolsdirectory can also be removed to further gain some space: 



rm -rf /tools



# 015930 
# 015931                          Finally, remove the temporary 'tester' user account created at the beginning of
# 015932                        the previous chapter. 



userdel -r tester


 
# 015940        Chapter 9. System Configuration  
# 015941        9.1. Introduction 
# 015942 
# 015943                          Booting a Linux system involves several tasks. The process must mount both virtual
# 015944                        and real file systems, initialize devices, activate swap, check file systems for
# 015945                        integrity, mount any swap partitions or files, set the system clock, bring up networking,
# 015946                        start any daemons required by the system, and accomplish any other custom tasks
# 015947                        needed by the user. This process must be organized to ensure the tasks are performed
# 015948                        in the correct order but, at the same time, be executed as fast as possible.  
# 015949          9.1.1. System V 
# 015950 
# 015951                          System V is the classic boot process that has been used in Unix and Unix-like systems
# 015952                        such as Linux since about 1983. It consists of a small program, init  , that sets
# 015953                        up basic programs such as login  (via getty) and runs a script. This script, usually
# 015954                        named rc  , controls the execution of a set of additional scripts that perform the
# 015955                        tasks required to initialize the system. 
# 015956 
# 015957                          The init  program is controlled by the /etc/inittabfile and is organized into run
# 015958                        levels that can be run by the user: 
# 015959 
# 015960                          0 ; halt1 ; Single user mode2 ; Multiuser, without networking3 ; Full multiuser
# 015961                        mode4 ; User definable5 ; Full multiuser mode with display manager6 ; reboot 
# 015962 
# 015963                          The usual default run level is 3 or 5.  
# 015964            Advantages 
# 015965 
# 015966                          Established, well understood system. 
# 015967 
# 015968                          Easy to customize.  
# 015969            Disadvantages 
# 015970 
# 015971                          May be slower to boot. A medium speed base LFS system takes 8-12 seconds where the
# 015972                        boot time is measured from the first kernel message to the login prompt. Network
# 015973                        connectivity is typically established about 2 seconds after the login prompt. 
# 015974 
# 015975                          Serial processing of boot tasks. This is related to the previous point. A delay
# 015976                        in any process such as a file system check, will delay the entire boot process.
# 015977                        
# 015978 
# 015979                          Does not directly support advanced features like control groups (cgroups), and per-user
# 015980                        fair share scheduling. 
# 015981 
# 015982                          Adding scripts requires manual, static sequencing decisions.  
# 015983        9.2. LFS-Bootscripts-20210201 
# 015984 
# 015985                          The LFS-Bootscripts package contains a set of scripts to start/stop the LFS system
# 015986                        at bootup/shutdown. The configuration files and procedures needed to customize the
# 015987                        boot process are described in the following sections. 
# 015988           Approximate build time: less than 0.1 SBU
# 015989           Required disk space: 244 KB 
# 015990          9.2.1. Installation of LFS-Bootscripts 
# 015991 
# 015992                          Install the package: 



# 015996 make install
# 015997 

 
# 016000          9.2.2. Contents of LFS-Bootscripts 
# 016001           Installed scripts: checkfs, cleanfs, console, functions, halt, ifdown, ifup, localnet, modules, mountfs, mountvirtfs, network, rc, reboot, sendsignals, setclock, ipv4-static, swap, sysctl, sysklogd, template, udev, and udev_retry
# 016002           Installed directories: /etc/rc.d, /etc/init.d (symbolic link), /etc/sysconfig, /lib/services, /lib/lsb (symbolic link)  
# 016003            Short Descriptions  
# 016004 
# 016005                          
# 016006 
# 016007                checkfs   
# 016008 
# 016009                          Checks the integrity of the file systems before they are mounted (with the exception
# 016010                        of journal and network based file systems)  
# 016011 
# 016012                          cleanfs   
# 016013 
# 016014                          Removes files that should not be preserved between reboots, such as those in /run/and
# 016015                        /var/lock/; it re-creates /run/utmpand removes the possibly present /etc/nologin,
# 016016                        /fastboot, and /forcefsckfiles  
# 016017 
# 016018                          console   
# 016019 
# 016020                          Loads the correct keymap table for the desired keyboard layout; it also sets the
# 016021                        screen font  
# 016022 
# 016023                          functions   
# 016024 
# 016025                          Contains common functions, such as error and status checking, that are used by several
# 016026                        bootscripts  
# 016027 
# 016028                          halt   
# 016029 
# 016030                          Halts the system  
# 016031 
# 016032                          ifdown   
# 016033 
# 016034                          Stops a network device  
# 016035 
# 016036                          ifup   
# 016037 
# 016038                          Initializes a network device  
# 016039 
# 016040                          localnet   
# 016041 
# 016042                          Sets up the system's hostname and local loopback device  
# 016043 
# 016044                          modules   
# 016045 
# 016046                          Loads kernel modules listed in /etc/sysconfig/modules, using arguments that are
# 016047                        also given there  
# 016048 
# 016049                          mountfs   
# 016050 
# 016051                          Mounts all file systems, except ones that are marked noauto  or are network based
# 016052                         
# 016053 
# 016054                          mountvirtfs   
# 016055 
# 016056                          Mounts virtual kernel file systems, such as proc 
# 016057 
# 016058                          network   
# 016059 
# 016060                          Sets up network interfaces, such as network cards, and sets up the default gateway
# 016061                        (where applicable)  
# 016062 
# 016063                          rc   
# 016064 
# 016065                          The master run-level control script; it is responsible for running all the other
# 016066                        bootscripts one-by-one, in a sequence determined by the name of the symbolic links
# 016067                        being processed  
# 016068 
# 016069                          reboot   
# 016070 
# 016071                          Reboots the system  
# 016072 
# 016073                          sendsignals   
# 016074 
# 016075                          Makes sure every process is terminated before the system reboots or halts  
# 016076 
# 016077                          setclock   
# 016078 
# 016079                          Resets the kernel clock to local time in case the hardware clock is not set to UTC
# 016080                        time  
# 016081 
# 016082                          ipv4-static   
# 016083 
# 016084                          Provides the functionality needed to assign a static Internet Protocol (IP) address
# 016085                        to a network interface  
# 016086 
# 016087                          swap   
# 016088 
# 016089                          Enables and disables swap files and partitions  
# 016090 
# 016091                          sysctl   
# 016092 
# 016093                          Loads system configuration values from /etc/sysctl.conf, if that file exists, into
# 016094                        the running kernel  
# 016095 
# 016096                          sysklogd   
# 016097 
# 016098                          Starts and stops the system and kernel log daemons  
# 016099 
# 016100                          template   
# 016101 
# 016102                          A template to create custom bootscripts for other daemons  
# 016103 
# 016104                          udev   
# 016105 
# 016106                          Prepares the /devdirectory and starts Udev  
# 016107 
# 016108                          udev_retry   
# 016109 
# 016110                          Retries failed udev uevents, and copies generated rules files from /run/udevto /etc/udev/rules.dif
# 016111                        required  
# 016112        9.3. Overview of Device and Module Handling 
# 016113 
# 016114                          In Chapter 8 , we installed the udev package when eudev was built. Before we go into
# 016115                        the details regarding how this works, a brief history of previous methods of handling
# 016116                        devices is in order. 
# 016117 
# 016118                          Linux systems in general traditionally used a static device creation method, whereby
# 016119                        a great many device nodes were created under /dev(sometimes literally thousands
# 016120                        of nodes), regardless of whether the corresponding hardware devices actually existed.
# 016121                        This was typically done via a MAKEDEV  script, which contains a number of calls to
# 016122                        the mknod  program with the relevant major and minor device numbers for every possible
# 016123                        device that might exist in the world. 
# 016124 
# 016125                          Using the udev method, only those devices which are detected by the kernel get device
# 016126                        nodes created for them. Because these device nodes will be created each time the
# 016127                        system boots, they will be stored on a devtmpfsfile system (a virtual file system
# 016128                        that resides entirely in system memory). Device nodes do not require much space,
# 016129                        so the memory that is used is negligible. 
# 016130          9.3.1. History 
# 016131 
# 016132                          In February 2000, a new filesystem called devfswas merged into the 2.3.46 kernel
# 016133                        and was made available during the 2.4 series of stable kernels. Although it was
# 016134                        present in the kernel source itself, this method of creating devices dynamically
# 016135                        never received overwhelming support from the core kernel developers. 
# 016136 
# 016137                          The main problem with the approach adopted by devfswas the way it handled device
# 016138                        detection, creation, and naming. The latter issue, that of device node naming, was
# 016139                        perhaps the most critical. It is generally accepted that if device names are allowed
# 016140                        to be configurable, then the device naming policy should be up to a system administrator,
# 016141                        not imposed on them by any particular developer(s). The devfsfile system also suffered
# 016142                        from race conditions that were inherent in its design and could not be fixed without
# 016143                        a substantial revision to the kernel. It was marked as deprecated for a long period
# 016144                        - due to a lack of maintenance - and was finally removed from the kernel in June,
# 016145                        2006. 
# 016146 
# 016147                          With the development of the unstable 2.5 kernel tree, later released as the 2.6
# 016148                        series of stable kernels, a new virtual filesystem called sysfscame to be. The job
# 016149                        of sysfsis to export a view of the system's hardware configuration to userspace
# 016150                        processes. With this userspace-visible representation, the possibility of developing
# 016151                        a userspace replacement for devfsbecame much more realistic. 
# 016152          9.3.2. Udev Implementation  
# 016153            9.3.2.1. Sysfs 
# 016154 
# 016155                          The sysfsfilesystem was mentioned briefly above. One may wonder how sysfsknows about
# 016156                        the devices present on a system and what device numbers should be used for them.
# 016157                        Drivers that have been compiled into the kernel directly register their objects
# 016158                        with a sysfs(devtmpfs internally) as they are detected by the kernel. For drivers
# 016159                        compiled as modules, this registration will happen when the module is loaded. Once
# 016160                        the sysfsfilesystem is mounted (on /sys), data which the drivers register with sysfsare
# 016161                        available to userspace processes and to udevd for processing (including modifications
# 016162                        to device nodes).  
# 016163            9.3.2.2. Device Node Creation 
# 016164 
# 016165                          Device files are created by the kernel by the devtmpfsfilesystem. Any driver that
# 016166                        wishes to register a device node will go through the devtmpfs(via the driver core)
# 016167                        to do it. When a devtmpfsinstance is mounted on /dev, the device node will initially
# 016168                        be created with a fixed name, permissions, and owner. 
# 016169 
# 016170                          A short time later, the kernel will send a uevent to udevd  . Based on the rules specified
# 016171                        in the files within the /etc/udev/rules.d, /lib/udev/rules.d, and /run/udev/rules.ddirectories,
# 016172                        udevd  will create additional symlinks to the device node, or change its permissions,
# 016173                        owner, or group, or modify the internal udevd  database entry (name) for that object.
# 016174                        
# 016175 
# 016176                          The rules in these three directories are numbered and all three directories are
# 016177                        merged together. If udevd  can't find a rule for the device it is creating, it will
# 016178                        leave the permissions and ownership at whatever devtmpfsused initially.  
# 016179            9.3.2.3. Module Loading 
# 016180 
# 016181                          Device drivers compiled as modules may have aliases built into them. Aliases are
# 016182                        visible in the output of the modinfo  program and are usually related to the bus-specific
# 016183                        identifiers of devices supported by a module. For example, the snd-fm801  driver supports
# 016184                        PCI devices with vendor ID 0x1319 and device ID 0x0801, and has an alias of "pci:v00001319d00000801sv*sd*bc04sc01i* " .
# 016185                        For most devices, the bus driver exports the alias of the driver that would handle
# 016186                        the device via sysfs. E.g., the /sys/bus/pci/devices/0000:00:0d.0/modaliasfile might
# 016187                        contain the string "pci:v00001319d00000801sv00001319sd00001319bc04sc01i00 " . The
# 016188                        default rules provided with udev will cause udevd  to call out to /sbin/modprobe  with
# 016189                        the contents of the MODALIASuevent environment variable (which should be the same
# 016190                        as the contents of the modaliasfile in sysfs), thus loading all modules whose aliases
# 016191                        match this string after wildcard expansion. 
# 016192 
# 016193                          In this example, this means that, in addition to snd-fm801  , the obsolete (and unwanted)
# 016194                        forte  driver will be loaded if it is available. See below for ways in which the loading
# 016195                        of unwanted drivers can be prevented. 
# 016196 
# 016197                          The kernel itself is also able to load modules for network protocols, filesystems,
# 016198                        and NLS support on demand.  
# 016199            9.3.2.4. Handling Hotpluggable/Dynamic Devices 
# 016200 
# 016201                          When you plug in a device, such as a Universal Serial Bus (USB) MP3 player, the
# 016202                        kernel recognizes that the device is now connected and generates a uevent. This
# 016203                        uevent is then handled by udevd  as described above. 
# 016204          9.3.3. Problems with Loading Modules and Creating Devices 
# 016205 
# 016206                          There are a few possible problems when it comes to automatically creating device
# 016207                        nodes.  
# 016208            9.3.3.1. A kernel module is not loaded automatically 
# 016209 
# 016210                          Udev will only load a module if it has a bus-specific alias and the bus driver properly
# 016211                        exports the necessary aliases to sysfs. In other cases, one should arrange module
# 016212                        loading by other means. With Linux-5.10.17, udev is known to load properly-written
# 016213                        drivers for INPUT, IDE, PCI, USB, SCSI, SERIO, and FireWire devices. 
# 016214 
# 016215                          To determine if the device driver you require has the necessary support for udev,
# 016216                        run modinfo  with the module name as the argument. Now try locating the device directory
# 016217                        under /sys/busand check whether there is a modaliasfile there. 
# 016218 
# 016219                          If the modaliasfile exists in sysfs, the driver supports the device and can talk
# 016220                        to it directly, but doesn't have the alias, it is a bug in the driver. Load the
# 016221                        driver without the help from udev and expect the issue to be fixed later. 
# 016222 
# 016223                          If there is no modaliasfile in the relevant directory under /sys/bus, this means
# 016224                        that the kernel developers have not yet added modalias support to this bus type.
# 016225                        With Linux-5.10.17, this is the case with ISA busses. Expect this issue to be fixed
# 016226                        in later kernel versions. 
# 016227 
# 016228                          Udev is not intended to load "wrapper " drivers such as snd-pcm-oss  and non-hardware
# 016229                        drivers such as loop  at all.  
# 016230            9.3.3.2. A kernel module is not loaded automatically, and udev is not intended to load it 
# 016231 
# 016232                          If the "wrapper " module only enhances the functionality provided by some other module
# 016233                        (e.g., snd-pcm-oss  enhances the functionality of snd-pcm  by making the sound cards
# 016234                        available to OSS applications), configure modprobe  to load the wrapper after udev
# 016235                        loads the wrapped module. To do this, add a "softdep " line to the corresponding /etc/modprobe.d/<filename> .conffile.
# 016236                        For example: 



# 016240 softdep snd-pcm post: snd-pcm-oss
# 016241 


# 016244 
# 016245                          Note that the "softdep " command also allows pre:dependencies, or a mixture of both
# 016246                        pre:and post:dependencies. See the modprobe.d(5)manual page for more information
# 016247                        on "softdep " syntax and capabilities. 
# 016248 
# 016249                          If the module in question is not a wrapper and is useful by itself, configure the
# 016250                        modules  bootscript to load this module on system boot. To do this, add the module
# 016251                        name to the /etc/sysconfig/modulesfile on a separate line. This works for wrapper
# 016252                        modules too, but is suboptimal in that case.  
# 016253            9.3.3.3. Udev loads some unwanted module 
# 016254 
# 016255                          Either don't build the module, or blacklist it in a /etc/modprobe.d/blacklist.conffile
# 016256                        as done with the forte  module in the example below: 



# 016260 blacklist forte
# 016261 


# 016264 
# 016265                          Blacklisted modules can still be loaded manually with the explicit modprobe  command.
# 016266                         
# 016267            9.3.3.4. Udev creates a device incorrectly, or makes a wrong symlink 
# 016268 
# 016269                          This usually happens if a rule unexpectedly matches a device. For example, a poorly-written
# 016270                        rule can match both a SCSI disk (as desired) and the corresponding SCSI generic
# 016271                        device (incorrectly) by vendor. Find the offending rule and make it more specific,
# 016272                        with the help of the udevadm info  command.  
# 016273            9.3.3.5. Udev rule works unreliably 
# 016274 
# 016275                          This may be another manifestation of the previous problem. If not, and your rule
# 016276                        uses sysfsattributes, it may be a kernel timing issue, to be fixed in later kernels.
# 016277                        For now, you can work around it by creating a rule that waits for the used sysfsattribute
# 016278                        and appending it to the /etc/udev/rules.d/10-wait_for_sysfs.rulesfile (create this
# 016279                        file if it does not exist). Please notify the LFS Development list if you do so
# 016280                        and it helps.  
# 016281            9.3.3.6. Udev does not create a device 
# 016282 
# 016283                          Further text assumes that the driver is built statically into the kernel or already
# 016284                        loaded as a module, and that you have already checked that udev doesn't create a
# 016285                        misnamed device. 
# 016286 
# 016287                          Udev has no information needed to create a device node if a kernel driver does not
# 016288                        export its data to sysfs. This is most common with third party drivers from outside
# 016289                        the kernel tree. Create a static device node in /lib/udev/deviceswith the appropriate
# 016290                        major/minor numbers (see the file devices.txtinside the kernel documentation or
# 016291                        the documentation provided by the third party driver vendor). The static device
# 016292                        node will be copied to /devby udev  .  
# 016293            9.3.3.7. Device naming order changes randomly after rebooting 
# 016294 
# 016295                          This is due to the fact that udev, by design, handles uevents and loads modules
# 016296                        in parallel, and thus in an unpredictable order. This will never be "fixed " . You
# 016297                        should not rely upon the kernel device names being stable. Instead, create your
# 016298                        own rules that make symlinks with stable names based on some stable attributes of
# 016299                        the device, such as a serial number or the output of various *_id utilities installed
# 016300                        by udev. See Section 9.4, "Managing Devices" and Section 9.5, "General Network Configuration" for
# 016301                        examples. 
# 016302          9.3.4. Useful Reading 
# 016303 
# 016304                          Additional helpful documentation is available at the following sites: 
# 016305 
# 016306                          A Userspace Implementation of devfshttp://www.kroah.com/linux/talks/ols_2003_udev_paper/Reprint-Kroah-Hartman-OLS2003.pdf 
# 016307 
# 016308                          The sysfsFilesystem http://www.kernel.org/pub/linux/kernel/people/mochel/doc/papers/ols-2005/mochel.pdf  
# 016309        9.4. Managing Devices 
# 016310          9.4.1. Network Devices 
# 016311 
# 016312                          Udev, by default, names network devices according to Firmware/BIOS data or physical
# 016313                        characteristics like the bus, slot, or MAC address. The purpose of this naming convention
# 016314                        is to ensure that network devices are named consistently and not based on the time
# 016315                        the network card was discovered. For example, on a computer having two network cards
# 016316                        made by Intel and Realtek, the network card manufactured by Intel may become eth0
# 016317                        and the Realtek card becomes eth1. In some cases, after a reboot the cards could
# 016318                        get renumbered the other way around. 
# 016319 
# 016320                          In the new naming scheme, typical network device names would then be something like
# 016321                        enp5s0 or wlp3s0. If this naming convention is not desired, the traditional naming
# 016322                        scheme or a custom scheme can be implemented.  
# 016323            9.4.1.1. Disabling Persistent Naming on the Kernel Command Line 
# 016324 
# 016325                          The traditional naming scheme using eth0, eth1, etc can be restored by adding net.ifnames=0 on
# 016326                        the kernel command line. This is most appropriate for those systems that have only
# 016327                        one ethernet device of the same type. Laptops often have multiple ethernet connections
# 016328                        that are named eth0 and wlan0 and are also candidates for this method. The command
# 016329                        line is passed in the GRUB configuration file. See Section 10.4.4, "Creating the
# 016330                        GRUB Configuration File" .  
# 016331            9.4.1.2. Creating Custom Udev Rules 
# 016332 
# 016333                          The naming scheme can be customized by creating custom udev rules. A script has
# 016334                        been included that generates the initial rules. Generate these rules by running:
# 016335                        



# 016339 bash /lib/udev/init-net-rules.sh
# 016340 


# 016343 
# 016344                          Now, inspect the /etc/udev/rules.d/70-persistent-net.rulesfile, to find out which
# 016345                        name was assigned to which network device: 



# 016349 cat /etc/udev/rules.d/70-persistent-net.rules
# 016350 


# 016353          Note 
# 016354 
# 016355                          In some cases such as when MAC addresses have been assigned to a network card manually
# 016356                        or in a virtual environment such as Qemu or Xen, the network rules file may not
# 016357                        have been generated because addresses are not consistently assigned. In these cases,
# 016358                        this method cannot be used. 
# 016359 
# 016360                          The file begins with a comment block followed by two lines for each NIC. The first
# 016361                        line for each NIC is a commented description showing its hardware IDs (e.g. its
# 016362                        PCI vendor and device IDs, if it's a PCI card), along with its driver in parentheses,
# 016363                        if the driver can be found. Neither the hardware ID nor the driver is used to determine
# 016364                        which name to give an interface; this information is only for reference. The second
# 016365                        line is the udev rule that matches this NIC and actually assigns it a name. 
# 016366 
# 016367                          All udev rules are made up of several keys, separated by commas and optional whitespace.
# 016368                        This rule's keys and an explanation of each of them are as follows: 
# 016369 
# 016370                          SUBSYSTEM=="net"- This tells udev to ignore devices that are not network cards.
# 016371                        
# 016372 
# 016373                          ACTION=="add"- This tells udev to ignore this rule for a uevent that isn't an add
# 016374                        ("remove" and "change" uevents also happen, but don't need to rename network interfaces).
# 016375                        
# 016376 
# 016377                          DRIVERS=="?*"- This exists so that udev will ignore VLAN or bridge sub-interfaces
# 016378                        (because these sub-interfaces do not have drivers). These sub-interfaces are skipped
# 016379                        because the name that would be assigned would collide with their parent devices.
# 016380                        
# 016381 
# 016382                          ATTR{address}- The value of this key is the NIC's MAC address. 
# 016383 
# 016384                          ATTR{type}=="1"- This ensures the rule only matches the primary interface in the
# 016385                        case of certain wireless drivers which create multiple virtual interfaces. The secondary
# 016386                        interfaces are skipped for the same reason that VLAN and bridge sub-interfaces are
# 016387                        skipped: there would be a name collision otherwise. 
# 016388 
# 016389                          NAME- The value of this key is the name that udev will assign to this interface.
# 016390                        
# 016391 
# 016392                          The value of NAMEis the important part. Make sure you know which name has been assigned
# 016393                        to each of your network cards before proceeding, and be sure to use that NAMEvalue
# 016394                        when creating your configuration files below. 
# 016395          9.4.2. CD-ROM symlinks 
# 016396 
# 016397                          Some software that you may want to install later (e.g., various media players) expect
# 016398                        the /dev/cdromand /dev/dvdsymlinks to exist, and to point to a CD-ROM or DVD-ROM
# 016399                        device. Also, it may be convenient to put references to those symlinks into /etc/fstab.
# 016400                        Udev comes with a script that will generate rules files to create these symlinks
# 016401                        for you, depending on the capabilities of each device, but you need to decide which
# 016402                        of two modes of operation you wish to have the script use. 
# 016403 
# 016404                          First, the script can operate in "by-path " mode (used by default for USB and FireWire
# 016405                        devices), where the rules it creates depend on the physical path to the CD or DVD
# 016406                        device. Second, it can operate in "by-id " mode (default for IDE and SCSI devices),
# 016407                        where the rules it creates depend on identification strings stored on the CD or
# 016408                        DVD device itself. The path is determined by udev's path_id  script, and the identification
# 016409                        strings are read from the hardware by its ata_id  or scsi_id  programs, depending on
# 016410                        which type of device you have. 
# 016411 
# 016412                          There are advantages to each approach; the correct approach to use will depend on
# 016413                        what kinds of device changes may happen. If you expect the physical path to the
# 016414                        device (that is, the ports and/or slots that it plugs into) to change, for example
# 016415                        because you plan on moving the drive to a different IDE port or a different USB
# 016416                        connector, then you should use the "by-id " mode. On the other hand, if you expect
# 016417                        the device's identification to change, for example because it may die, and you would
# 016418                        replace it with a different device with the same capabilities and which is plugged
# 016419                        into the same connectors, then you should use the "by-path " mode. 
# 016420 
# 016421                          If either type of change is possible with your drive, then choose a mode based on
# 016422                        the type of change you expect to happen more often. 
# 016423          Important 
# 016424 
# 016425                          External devices (for example, a USB-connected CD drive) should not use by-path
# 016426                        persistence, because each time the device is plugged into a new external port, its
# 016427                        physical path will change. All externally-connected devices will have this problem
# 016428                        if you write udev rules to recognize them by their physical path; the problem is
# 016429                        not limited to CD and DVD drives. 
# 016430 
# 016431                          If you wish to see the values that the udev scripts will use, then for the appropriate
# 016432                        CD-ROM device, find the corresponding directory under /sys(e.g., this can be /sys/block/hdd)
# 016433                        and run a command similar to the following: 



# 016437 udevadm test /sys/block/hdd
# 016438 


# 016441 
# 016442                          Look at the lines containing the output of various *_id programs. The "by-id " mode
# 016443                        will use the ID_SERIAL value if it exists and is not empty, otherwise it will use
# 016444                        a combination of ID_MODEL and ID_REVISION. The "by-path " mode will use the ID_PATH
# 016445                        value. 
# 016446 
# 016447                          If the default mode is not suitable for your situation, then the following modification
# 016448                        can be made to the /etc/udev/rules.d/83-cdrom-symlinks.rulesfile, as follows (where
# 016449                        mode is one of "by-id " or "by-path " ): 



# 016453 sed -e 's/"write_cd_rules"/"write_cd_rules mode"/' \
# 016454     -i /etc/udev/rules.d/83-cdrom-symlinks.rules
# 016455 

 
# 016458 
# 016459                          Note that it is not necessary to create the rules files or symlinks at this time
# 016460                        because you have bind-mounted the host's /devdirectory into the LFS system and we
# 016461                        assume the symlinks exist on the host. The rules and symlinks will be created the
# 016462                        first time you boot your LFS system. 
# 016463 
# 016464                          However, if you have multiple CD-ROM devices, then the symlinks generated at that
# 016465                        time may point to different devices than they point to on your host because devices
# 016466                        are not discovered in a predictable order. The assignments created when you first
# 016467                        boot the LFS system will be stable, so this is only an issue if you need the symlinks
# 016468                        on both systems to point to the same device. If you need that, then inspect (and
# 016469                        possibly edit) the generated /etc/udev/rules.d/70-persistent-cd.rulesfile after
# 016470                        booting, to make sure the assigned symlinks match what you need. 
# 016471          9.4.3. Dealing with duplicate devices 
# 016472 
# 016473                          As explained in Section 9.3, "Overview of Device and Module Handling" , the order
# 016474                        in which devices with the same function appear in /devis essentially random. E.g.,
# 016475                        if you have a USB web camera and a TV tuner, sometimes /dev/video0refers to the
# 016476                        camera and /dev/video1refers to the tuner, and sometimes after a reboot the order
# 016477                        changes. For all classes of hardware except sound cards and network cards, this
# 016478                        is fixable by creating udev rules for custom persistent symlinks. The case of network
# 016479                        cards is covered separately in Section 9.5, "General Network Configuration" , and
# 016480                        sound card configuration can be found in BLFS . 
# 016481 
# 016482                          For each of your devices that is likely to have this problem (even if the problem
# 016483                        doesn't exist in your current Linux distribution), find the corresponding directory
# 016484                        under /sys/classor /sys/block. For video devices, this may be /sys/class/video4linux/videoX .
# 016485                        Figure out the attributes that identify the device uniquely (usually, vendor and
# 016486                        product IDs and/or serial numbers work): 



# 016490 udevadm info -a -p /sys/class/video4linux/video0
# 016491 


# 016494 
# 016495                          Then write rules that create the symlinks, e.g.: 



# 016499 cat > /etc/udev/rules.d/83-duplicate_devs.rules << "EOF"
# 016500 
# 016501 # Persistent symlinks for webcam and tuner
# 016502 KERNEL=="video*", ATTRS{idProduct}=="1910", ATTRS{idVendor}=="0d81", SYMLINK+="webcam"
# 016503 KERNEL=="video*", ATTRS{device}=="0x036f",  ATTRS{vendor}=="0x109e", SYMLINK+="tvtuner"
# 016504 
# 016505 EOF
# 016506 


# 016509 
# 016510                          The result is that /dev/video0and /dev/video1devices still refer randomly to the
# 016511                        tuner and the web camera (and thus should never be used directly), but there are
# 016512                        symlinks /dev/tvtunerand /dev/webcamthat always point to the correct device.  
# 016513        9.5. General Network Configuration 
# 016514          9.5.1. Creating Network Interface Configuration Files 
# 016515 
# 016516                          Which interfaces are brought up and down by the network script usually depends on
# 016517                        the files in /etc/sysconfig/. This directory should contain a file for each interface
# 016518                        to be configured, such as ifconfig.xyz, where "xyz " should describe the network card.
# 016519                        The interface name (e.g. eth0) is usually appropriate. Inside this file are attributes
# 016520                        to this interface, such as its IP address(es), subnet masks, and so forth. It is
# 016521                        necessary that the stem of the filename be ifconfig  . 
# 016522          Note 
# 016523 
# 016524                          If the procedure in the previous section was not used, udev will assign network
# 016525                        card interface names based on system physical characteristics such as enp2s1. If
# 016526                        you are not sure what your interface name is, you can always run ip link  or ls /sys/class/net  after
# 016527                        you have booted your system. 
# 016528 
# 016529                          The following command creates a sample file for the eth0  device with a static IP
# 016530                        address: 



# 016534 cd /etc/sysconfig/
# 016535 cat > ifconfig.eth0 << "EOF"
# 016536 ONBOOT=yes
# 016537 IFACE=eth0
# 016538 SERVICE=ipv4-static
# 016539 IP=192.168.1.2
# 016540 GATEWAY=192.168.1.1
# 016541 PREFIX=24
# 016542 BROADCAST=192.168.1.255
# 016543 EOF
# 016544 

 
# 016547 
# 016548                          The values in italics must be changed in every file to match the proper setup. 
# 016549 
# 016550                          If the ONBOOTvariable is set to "yes " the System V network script will bring up the
# 016551                        Network Interface Card (NIC) during the system boot process. If set to anything
# 016552                        but "yes " the NIC will be ignored by the network script and not be automatically
# 016553                        brought up. The interface can be manually started or stopped with the ifup  and ifdown  commands.
# 016554                        
# 016555 
# 016556                          The IFACEvariable defines the interface name, for example, eth0. It is required
# 016557                        for all network device configuration files. The filename extension must match this
# 016558                        value. 
# 016559 
# 016560                          The SERVICEvariable defines the method used for obtaining the IP address. The LFS-Bootscripts
# 016561                        package has a modular IP assignment format, and creating additional files in the
# 016562                        /lib/services/directory allows other IP assignment methods. This is commonly used
# 016563                        for Dynamic Host Configuration Protocol (DHCP), which is addressed in the BLFS book.
# 016564                        
# 016565 
# 016566                          The GATEWAYvariable should contain the default gateway IP address, if one is present.
# 016567                        If not, then comment out the variable entirely. 
# 016568 
# 016569                          The PREFIXvariable contains the number of bits used in the subnet. Each octet in
# 016570                        an IP address is 8 bits. If the subnet's netmask is 255.255.255.0, then it is using
# 016571                        the first three octets (24 bits) to specify the network number. If the netmask is
# 016572                        255.255.255.240, it would be using the first 28 bits. Prefixes longer than 24 bits
# 016573                        are commonly used by DSL and cable-based Internet Service Providers (ISPs). In this
# 016574                        example (PREFIX=24), the netmask is 255.255.255.0. Adjust the PREFIXvariable according
# 016575                        to your specific subnet. If omitted, the PREFIX defaults to 24. 
# 016576 
# 016577                          For more information see the ifup  man page.  
# 016578          9.5.2. Creating the /etc/resolv.conf File 
# 016579 
# 016580                          The system will need some means of obtaining Domain Name Service (DNS) name resolution
# 016581                        to resolve Internet domain names to IP addresses, and vice versa. This is best achieved
# 016582                        by placing the IP address of the DNS server, available from the ISP or network administrator,
# 016583                        into /etc/resolv.conf. Create the file by running the following: 



# 016587 cat > /etc/resolv.conf << "EOF"
# 016588 # Begin /etc/resolv.conf
# 016589 
# 016590 domain <Your Domain Name>
# 016591 nameserver <IP address of your primary nameserver>
# 016592 nameserver <IP address of your secondary nameserver>
# 016593 
# 016594 # End /etc/resolv.conf
# 016595 EOF
# 016596 

 
# 016599 
# 016600                          The domainstatement can be omitted or replaced with a searchstatement. See the man
# 016601                        page for resolv.conf for more details. 
# 016602 
# 016603                          Replace <IP address of the nameserver> with the IP address of the DNS most appropriate
# 016604                        for the setup. There will often be more than one entry (requirements demand secondary
# 016605                        servers for fallback capability). If you only need or want one DNS server, remove
# 016606                        the second nameserver  line from the file. The IP address may also be a router on
# 016607                        the local network. 
# 016608          Note 
# 016609 
# 016610                          The Google Public IPv4 DNS addresses are 8.8.8.8 and 8.8.4.4.  
# 016611          9.5.3. Configuring the system hostname 
# 016612 
# 016613                          During the boot process, the file /etc/hostnameis used for establishing the system's
# 016614                        hostname. 
# 016615 
# 016616                          Create the /etc/hostnamefile and enter a hostname by running: 



# 016620 echo "<lfs>" > /etc/hostname
# 016621 

 
# 016624 
# 016625                          <lfs> needs to be replaced with the name given to the computer. Do not enter the
# 016626                        Fully Qualified Domain Name (FQDN) here. That information is put in the /etc/hostsfile.
# 016627                         
# 016628          9.5.4. Customizing the /etc/hosts File 
# 016629 
# 016630                          Decide on the IP address, fully-qualified domain name (FQDN), and possible aliases
# 016631                        for use in the /etc/hostsfile. The syntax is: 



# 016635 IP_address myhost.example.org aliases
# 016636 


# 016639 
# 016640                          Unless the computer is to be visible to the Internet (i.e., there is a registered
# 016641                        domain and a valid block of assigned IP addresses;most users do not have this),
# 016642                        make sure that the IP address is in the private network IP address range. Valid
# 016643                        ranges are: 



# 016647 Private Network Address Range      Normal Prefix
# 016648 10.0.0.1 - 10.255.255.254           8
# 016649 172.x.0.1 - 172.x.255.254           16
# 016650 192.168.y.1 - 192.168.y.254         24
# 016651 


# 016654 
# 016655                          x can be any number in the range 16-31. y can be any number in the range 0-255.
# 016656                        
# 016657 
# 016658                          A valid private IP address could be 192.168.1.1. A valid FQDN for this IP could
# 016659                        be lfs.example.org. 
# 016660 
# 016661                          Even if not using a network card, a valid FQDN is still required. This is necessary
# 016662                        for certain programs to operate correctly. 
# 016663 
# 016664                          Create the /etc/hostsfile by running: 



# 016668 cat > /etc/hosts << "EOF"
# 016669 # Begin /etc/hosts
# 016670 
# 016671 127.0.0.1 localhost.localdomain localhost
# 016672 127.0.1.1 <FQDN> <HOSTNAME>
# 016673 <192.168.1.1> <FQDN> <HOSTNAME> [alias1] [alias2 ...]
# 016674 ::1       localhost ip6-localhost ip6-loopback
# 016675 ff02::1   ip6-allnodes
# 016676 ff02::2   ip6-allrouters
# 016677 
# 016678 # End /etc/hosts
# 016679 EOF
# 016680 

 
# 016683 
# 016684                          The <192.168.1.1> , <FQDN> , and <HOSTNAME> values need to be changed for specific
# 016685                        uses or requirements (if assigned an IP address by a network/system administrator
# 016686                        and the machine will be connected to an existing network). The optional alias name(s)
# 016687                        can be omitted.  
# 016688        9.6. System V Bootscript Usage and Configuration 
# 016689          9.6.1. How Do the System V Bootscripts Work? 
# 016690 
# 016691                          Linux uses a special booting facility named SysVinit that is based on a concept
# 016692                        of run-levels  . It can be quite different from one system to another, so it cannot
# 016693                        be assumed that because things worked in one particular Linux distribution, they
# 016694                        should work the same in LFS too. LFS has its own way of doing things, but it respects
# 016695                        generally accepted standards. 
# 016696 
# 016697                          SysVinit (which will be referred to as "init " from now on) works using a run-levels
# 016698                        scheme. There are seven (numbered 0 to 6) run-levels (actually, there are more run-levels,
# 016699                        but they are for special cases and are generally not used. See init(8)for more details),
# 016700                        and each one of those corresponds to the actions the computer is supposed to perform
# 016701                        when it starts up. The default run-level is 3. Here are the descriptions of the
# 016702                        different run-levels as they are implemented: 
# 016703 
# 016704                          0: halt the computer1: single-user mode2: multi-user mode without networking3: multi-user
# 016705                        mode with networking4: reserved for customization, otherwise does the same as 35:
# 016706                        same as 4, it is usually used for GUI login (like X's xdm   or KDE's kdm  )6: reboot
# 016707                        the computer  
# 016708          9.6.2. Configuring Sysvinit 
# 016709 
# 016710                          During the kernel initialization, the first program that is run is either specified
# 016711                        on the command line or, by default init  . This program reads the initialization file
# 016712                        /etc/inittab. Create this file with: 



# 016716 cat > /etc/inittab << "EOF"
# 016717 # Begin /etc/inittab
# 016718 
# 016719 id:3:initdefault:
# 016720 
# 016721 si::sysinit:/etc/rc.d/init.d/rc S
# 016722 
# 016723 l0:0:wait:/etc/rc.d/init.d/rc 0
# 016724 l1:S1:wait:/etc/rc.d/init.d/rc 1
# 016725 l2:2:wait:/etc/rc.d/init.d/rc 2
# 016726 l3:3:wait:/etc/rc.d/init.d/rc 3
# 016727 l4:4:wait:/etc/rc.d/init.d/rc 4
# 016728 l5:5:wait:/etc/rc.d/init.d/rc 5
# 016729 l6:6:wait:/etc/rc.d/init.d/rc 6
# 016730 
# 016731 ca:12345:ctrlaltdel:/sbin/shutdown -t1 -a -r now
# 016732 
# 016733 su:S016:once:/sbin/sulogin
# 016734 
# 016735 1:2345:respawn:/sbin/agetty --noclear tty1 9600
# 016736 2:2345:respawn:/sbin/agetty tty2 9600
# 016737 3:2345:respawn:/sbin/agetty tty3 9600
# 016738 4:2345:respawn:/sbin/agetty tty4 9600
# 016739 5:2345:respawn:/sbin/agetty tty5 9600
# 016740 6:2345:respawn:/sbin/agetty tty6 9600
# 016741 
# 016742 # End /etc/inittab
# 016743 EOF
# 016744 


# 016747 
# 016748                          An explanation of this initialization file is in the man page for inittab  . For LFS,
# 016749                        the key command that is run is rc  . The initialization file above will instruct rc  to
# 016750                        run all the scripts starting with an S in the /etc/rc.d/rcS.ddirectory followed
# 016751                        by all the scripts starting with an S in the /etc/rc.d/rc?.ddirectory where the
# 016752                        question mark is specified by the initdefault value. 
# 016753 
# 016754                          As a convenience, the rc  script reads a library of functions in /lib/lsb/init-functions.
# 016755                        This library also reads an optional configuration file, /etc/sysconfig/rc.site.
# 016756                        Any of the system configuration file parameters described in subsequent sections
# 016757                        can be alternatively placed in this file allowing consolidation of all system parameters
# 016758                        in this one file. 
# 016759 
# 016760                          As a debugging convenience, the functions script also logs all output to /run/var/bootlog.
# 016761                        Since the /rundirectory is a tmpfs, this file is not persistent across boots, however
# 016762                        it is appended to the more permanent file /var/log/boot.logat the end of the boot
# 016763                        process.  
# 016764            9.6.2.1. Changing Run Levels 
# 016765 
# 016766                          Changing run-levels is done with init <runlevel>   , where <runlevel> is the target
# 016767                        run-level. For example, to reboot the computer, a user could issue the init 6  command,
# 016768                        which is an alias for the reboot  command. Likewise, init 0  is an alias for the halt  command.
# 016769                        
# 016770 
# 016771                          There are a number of directories under /etc/rc.dthat look like rc?.d(where ? is
# 016772                        the number of the run-level) and rcsysinit.d, all containing a number of symbolic
# 016773                        links. Some begin with a K  , the others begin with an S  , and all of them have two
# 016774                        numbers following the initial letter. The K means to stop (kill) a service and the
# 016775                        S means to start a service. The numbers determine the order in which the scripts
# 016776                        are run, from 00 to 99;the lower the number the earlier it gets executed. When init  switches
# 016777                        to another run-level, the appropriate services are either started or stopped, depending
# 016778                        on the runlevel chosen. 
# 016779 
# 016780                          The real scripts are in /etc/rc.d/init.d. They do the actual work, and the symlinks
# 016781                        all point to them. K links and S links point to the same script in /etc/rc.d/init.d.
# 016782                        This is because the scripts can be called with different parameters like start ,
# 016783                        stop , restart , reload , and status . When a K link is encountered, the appropriate
# 016784                        script is run with the stop argument. When an S link is encountered, the appropriate
# 016785                        script is run with the start argument. 
# 016786 
# 016787                          There is one exception to this explanation. Links that start with an S  in the rc0.dand
# 016788                        rc6.ddirectories will not cause anything to be started. They will be called with
# 016789                        the parameter stop to stop something. The logic behind this is that when a user is
# 016790                        going to reboot or halt the system, nothing needs to be started. The system only
# 016791                        needs to be stopped. 
# 016792 
# 016793                          These are descriptions of what the arguments make the scripts do: 
# 016794 
# 016795                start  
# 016796 
# 016797                          The service is started. 
# 016798 
# 016799                stop  
# 016800 
# 016801                          The service is stopped. 
# 016802 
# 016803                restart  
# 016804 
# 016805                          The service is stopped and then started again. 
# 016806 
# 016807                reload  
# 016808 
# 016809                          The configuration of the service is updated. This is used after the configuration
# 016810                        file of a service was modified, when the service does not need to be restarted.
# 016811                        
# 016812 
# 016813                status  
# 016814 
# 016815                          Tells if the service is running and with which PIDs. 
# 016816 
# 016817                          Feel free to modify the way the boot process works (after all, it is your own LFS
# 016818                        system). The files given here are an example of how it can be done. 
# 016819          9.6.3. Udev Bootscripts 
# 016820 
# 016821                          The /etc/rc.d/init.d/udevinitscript starts udevd  , triggers any "coldplug" devices
# 016822                        that have already been created by the kernel and waits for any rules to complete.
# 016823                        The script also unsets the uevent handler from the default of /sbin/hotplug. This
# 016824                        is done because the kernel no longer needs to call out to an external binary. Instead
# 016825                        udevd  will listen on a netlink socket for uevents that the kernel raises. 
# 016826 
# 016827                          The /etc/rc.d/init.d/udev_retry  initscript takes care of re-triggering events for
# 016828                        subsystems whose rules may rely on filesystems that are not mounted until the mountfs  script
# 016829                        is run (in particular, /usrand /varmay cause this). This script runs after the mountfs  script,
# 016830                        so those rules (if re-triggered) should succeed the second time around. It is configured
# 016831                        from the /etc/sysconfig/udev_retryfile; any words in this file other than comments
# 016832                        are considered subsystem names to trigger at retry time. To find the subsystem of
# 016833                        a device, use udevadm info --attribute-walk <device>  where <device> is an absolute
# 016834                        path in /dev or /sys such as /dev/sr0 or /sys/class/rtc. 
# 016835 
# 016836                          For information on kernel module loading and udev, see Section 9.3.2.3, "Module
# 016837                        Loading" .  
# 016838          9.6.4. Configuring the System Clock 
# 016839 
# 016840                          The setclock  script reads the time from the hardware clock, also known as the BIOS
# 016841                        or the Complementary Metal Oxide Semiconductor (CMOS) clock. If the hardware clock
# 016842                        is set to UTC, this script will convert the hardware clock's time to the local time
# 016843                        using the /etc/localtimefile (which tells the hwclock  program which timezone to use).
# 016844                        There is no way to detect whether or not the hardware clock is set to UTC, so this
# 016845                        needs to be configured manually. 
# 016846 
# 016847                          The setclock  program is run via udev when the kernel detects the hardware capability
# 016848                        upon boot. It can also be run manually with the stop parameter to store the system
# 016849                        time to the CMOS clock. 
# 016850 
# 016851                          If you cannot remember whether or not the hardware clock is set to UTC, find out
# 016852                        by running the hwclock --localtime --show command. This will display what the current
# 016853                        time is according to the hardware clock. If this time matches whatever your watch
# 016854                        says, then the hardware clock is set to local time. If the output from hwclock  is
# 016855                        not local time, chances are it is set to UTC time. Verify this by adding or subtracting
# 016856                        the proper amount of hours for the timezone to the time shown by hwclock  . For example,
# 016857                        if you are currently in the MST timezone, which is also known as GMT -0700, add
# 016858                        seven hours to the local time. 
# 016859 
# 016860                          Change the value of the UTCvariable below to a value of 0 (zero) if the hardware
# 016861                        clock is NOT  set to UTC time. 
# 016862 
# 016863                          Create a new file /etc/sysconfig/clockby running the following: 



# 016867 cat > /etc/sysconfig/clock << "EOF"
# 016868 # Begin /etc/sysconfig/clock
# 016869 
# 016870 UTC=1
# 016871 
# 016872 # Set this to any options you might need to give to hwclock,
# 016873 # such as machine hardware clock type for Alphas.
# 016874 CLOCKPARAMS=
# 016875 
# 016876 # End /etc/sysconfig/clock
# 016877 EOF
# 016878 


# 016881 
# 016882                          A good hint explaining how to deal with time on LFS is available at http://www.linuxfromscratch.org/hints/downloads/files/time.txt .
# 016883                        It explains issues such as time zones, UTC, and the TZenvironment variable. 
# 016884          Note 
# 016885 
# 016886                          The CLOCKPARAMS and UTC paramaters may also be set in the /etc/sysconfig/rc.sitefile.
# 016887                         
# 016888          9.6.5. Configuring the Linux Console 
# 016889 
# 016890                          This section discusses how to configure the console  bootscript that sets up the keyboard
# 016891                        map, console font, and console kernel log level. If non-ASCII characters (e.g.,
# 016892                        the copyright sign, the British pound sign and Euro symbol) will not be used and
# 016893                        the keyboard is a U.S. one, much of this section can be skipped. Without the configuration
# 016894                        file, (or equivalent settings in rc.site), the console  bootscript will do nothing.
# 016895                        
# 016896 
# 016897                          The console  script reads the /etc/sysconfig/consolefile for configuration information.
# 016898                        Decide which keymap and screen font will be used. Various language-specific HOWTOs
# 016899                        can also help with this, see http://www.tldp.org/HOWTO/HOWTO-INDEX/other-lang.html .
# 016900                        If still in doubt, look in the /usr/share/keymapsand /usr/share/consolefontsdirectories
# 016901                        for valid keymaps and screen fonts. Read loadkeys(1)and setfont(8)manual pages to
# 016902                        determine the correct arguments for these programs. 
# 016903 
# 016904                          The /etc/sysconfig/consolefile should contain lines of the form: VARIABLE="value".
# 016905                        The following variables are recognized: 
# 016906 
# 016907                LOGLEVEL 
# 016908 
# 016909                          This variable specifies the log level for kernel messages sent to the console as
# 016910                        set by dmesg -n  . Valid levels are from "1" (no messages) to "8". The default level
# 016911                        is "7". 
# 016912 
# 016913                KEYMAP 
# 016914 
# 016915                          This variable specifies the arguments for the loadkeys  program, typically, the name
# 016916                        of keymap to load, e.g., "it " . If this variable is not set, the bootscript will
# 016917                        not run the loadkeys  program, and the default kernel keymap will be used. Note that
# 016918                        a few keymaps have multiple versions with the same name (cz and its variants in
# 016919                        qwerty/ and qwertz/, es in olpc/ and qwerty/, and trf in fgGIod/ and qwerty/). In
# 016920                        these cases the parent directory should also be specified (e.g. qwerty/es) to ensure
# 016921                        the proper keymap is loaded. 
# 016922 
# 016923                KEYMAP_CORRECTIONS 
# 016924 
# 016925                          This (rarely used) variable specifies the arguments for the second call to the loadkeys  program.
# 016926                        This is useful if the stock keymap is not completely satisfactory and a small adjustment
# 016927                        has to be made. E.g., to include the Euro sign into a keymap that normally doesn't
# 016928                        have it, set this variable to "euro2 " . 
# 016929 
# 016930                FONT 
# 016931 
# 016932                          This variable specifies the arguments for the setfont  program. Typically, this includes
# 016933                        the font name, "-m " , and the name of the application character map to load. E.g.,
# 016934                        in order to load the "lat1-16 " font together with the "8859-1 " application character
# 016935                        map (as it is appropriate in the USA), set this variable to "lat1-16 -m 8859-1 " .
# 016936                        In UTF-8 mode, the kernel uses the application character map for conversion of composed
# 016937                        8-bit key codes in the keymap to UTF-8, and thus the argument of the "-m" parameter
# 016938                        should be set to the encoding of the composed key codes in the keymap. 
# 016939 
# 016940                UNICODE 
# 016941 
# 016942                          Set this variable to "1 " , "yes " or "true " in order to put the console into UTF-8 mode.
# 016943                        This is useful in UTF-8 based locales and harmful otherwise. 
# 016944 
# 016945                LEGACY_CHARSET 
# 016946 
# 016947                          For many keyboard layouts, there is no stock Unicode keymap in the Kbd package.
# 016948                        The console  bootscript will convert an available keymap to UTF-8 on the fly if this
# 016949                        variable is set to the encoding of the available non-UTF-8 keymap. 
# 016950 
# 016951                          Some examples: 
# 016952 
# 016953                          For a non-Unicode setup, only the KEYMAP and FONT variables are generally needed.
# 016954                        E.g., for a Polish setup, one would use: 



# 016958 cat > /etc/sysconfig/console << "EOF"
# 016959 # Begin /etc/sysconfig/console
# 016960 
# 016961 KEYMAP="pl2"
# 016962 FONT="lat2a-16 -m 8859-2"
# 016963 
# 016964 # End /etc/sysconfig/console
# 016965 EOF
# 016966 


# 016969 
# 016970                          As mentioned above, it is sometimes necessary to adjust a stock keymap slightly.
# 016971                        The following example adds the Euro symbol to the German keymap: 



# 016975 cat > /etc/sysconfig/console << "EOF"
# 016976 # Begin /etc/sysconfig/console
# 016977 
# 016978 KEYMAP="de-latin1"
# 016979 KEYMAP_CORRECTIONS="euro2"
# 016980 FONT="lat0-16 -m 8859-15"
# 016981 UNICODE="1"
# 016982 
# 016983 # End /etc/sysconfig/console
# 016984 EOF
# 016985 


# 016988 
# 016989                          The following is a Unicode-enabled example for Bulgarian, where a stock UTF-8 keymap
# 016990                        exists: 



# 016994 cat > /etc/sysconfig/console << "EOF"
# 016995 # Begin /etc/sysconfig/console
# 016996 
# 016997 UNICODE="1"
# 016998 KEYMAP="bg_bds-utf8"
# 016999 FONT="LatArCyrHeb-16"
# 017000 
# 017001 # End /etc/sysconfig/console
# 017002 EOF
# 017003 


# 017006 
# 017007                          Due to the use of a 512-glyph LatArCyrHeb-16 font in the previous example, bright
# 017008                        colors are no longer available on the Linux console unless a framebuffer is used.
# 017009                        If one wants to have bright colors without a framebuffer and can live without characters
# 017010                        not belonging to his language, it is still possible to use a language-specific 256-glyph
# 017011                        font, as illustrated below: 



# 017015 cat > /etc/sysconfig/console << "EOF"
# 017016 # Begin /etc/sysconfig/console
# 017017 
# 017018 UNICODE="1"
# 017019 KEYMAP="bg_bds-utf8"
# 017020 FONT="cyr-sun16"
# 017021 
# 017022 # End /etc/sysconfig/console
# 017023 EOF
# 017024 


# 017027 
# 017028                          The following example illustrates keymap autoconversion from ISO-8859-15 to UTF-8
# 017029                        and enabling dead keys in Unicode mode: 



# 017033 cat > /etc/sysconfig/console << "EOF"
# 017034 # Begin /etc/sysconfig/console
# 017035 
# 017036 UNICODE="1"
# 017037 KEYMAP="de-latin1"
# 017038 KEYMAP_CORRECTIONS="euro2"
# 017039 LEGACY_CHARSET="iso-8859-15"
# 017040 FONT="LatArCyrHeb-16 -m 8859-15"
# 017041 
# 017042 # End /etc/sysconfig/console
# 017043 EOF
# 017044 


# 017047 
# 017048                          Some keymaps have dead keys (i.e., keys that don't produce a character by themselves,
# 017049                        but put an accent on the character produced by the next key) or define composition
# 017050                        rules (such as: "press Ctrl+. A E to get Æ " in the default keymap). Linux-5.10.17
# 017051                        interprets dead keys and composition rules in the keymap correctly only when the
# 017052                        source characters to be composed together are not multibyte. This deficiency doesn't
# 017053                        affect keymaps for European languages, because there accents are added to unaccented
# 017054                        ASCII characters, or two ASCII characters are composed together. However, in UTF-8
# 017055                        mode it is a problem; e.g., for the Greek language, where one sometimes needs to
# 017056                        put an accent on the letter "alpha " . The solution is either to avoid the use of
# 017057                        UTF-8, or to install the X window system that doesn't have this limitation in its
# 017058                        input handling. 
# 017059 
# 017060                          For Chinese, Japanese, Korean, and some other languages, the Linux console cannot
# 017061                        be configured to display the needed characters. Users who need such languages should
# 017062                        install the X Window System, fonts that cover the necessary character ranges, and
# 017063                        the proper input method (e.g., SCIM, supports a wide variety of languages). 
# 017064          Note 
# 017065 
# 017066                          The /etc/sysconfig/consolefile only controls the Linux text console localization.
# 017067                        It has nothing to do with setting the proper keyboard layout and terminal fonts
# 017068                        in the X Window System, with ssh sessions, or with a serial console. In such situations,
# 017069                        limitations mentioned in the last two list items above do not apply.  
# 017070          9.6.6. Creating Files at Boot 
# 017071 
# 017072                          At times, it is desirable to create files at boot time. For instance, the /tmp/.ICE-unixdirectory
# 017073                        is often needed. This can be done by creating an entry in the /etc/sysconfig/createfilesconfiguration
# 017074                        script. The format of this file is embedded in the comments of the default configuration
# 017075                        file.  
# 017076          9.6.7. Configuring the sysklogd Script 
# 017077 
# 017078                          The sysklogdscript invokes the syslogd  program as a part of System V initialization.
# 017079                        The -m 0 option turns off the periodic timestamp mark that syslogd  writes to the log
# 017080                        files every 20 minutes by default. If you want to turn on this periodic timestamp
# 017081                        mark, edit /etc/sysconfig/rc.siteand define the variable SYSKLOGD_PARMS to the desired
# 017082                        value. For instance, to remove all parameters, set the variable to a null value:
# 017083                        



# 017087 SYSKLOGD_PARMS=
# 017088 


# 017091 
# 017092                          See man syslogd for more options.  
# 017093          9.6.8. The rc.site File 
# 017094 
# 017095                          The optional /etc/sysconfig/rc.sitefile contains settings that are automatically
# 017096                        set for each SystemV boot script. It can alternatively set the values specified
# 017097                        in the hostname, console, and clockfiles in the /etc/sysconfig/directory. If the
# 017098                        associated variables are present in both these separate files and rc.site, the values
# 017099                        in the script specific files have precedence. 
# 017100 
# 017101                          rc.sitealso contains parameters that can customize other aspects of the boot process.
# 017102                        Setting the IPROMPT variable will enable selective running of bootscripts. Other
# 017103                        options are described in the file comments. The default version of the file is as
# 017104                        follows: 



# 017108 # rc.site
# 017109 # Optional parameters for boot scripts.
# 017110 
# 017111 # Distro Information
# 017112 # These values, if specified here, override the defaults
# 017113 #DISTRO="Linux From Scratch" # The distro name
# 017114 #DISTRO_CONTACT="lfs-dev@linuxfromscratch.org" # Bug report address
# 017115 #DISTRO_MINI="LFS" # Short name used in filenames for distro config
# 017116 
# 017117 # Define custom colors used in messages printed to the screen
# 017118 
# 017119 # Please consult `man console_codes` for more information
# 017120 # under the "ECMA-48 Set Graphics Rendition" section
# 017121 #
# 017122 # Warning: when switching from a 8bit to a 9bit font,
# 017123 # the linux console will reinterpret the bold (1;) to
# 017124 # the top 256 glyphs of the 9bit font.  This does
# 017125 # not affect framebuffer consoles
# 017126 
# 017127 # These values, if specified here, override the defaults
# 017128 #BRACKET="\\033[1;34m" # Blue
# 017129 #FAILURE="\\033[1;31m" # Red
# 017130 #INFO="\\033[1;36m"    # Cyan
# 017131 #NORMAL="\\033[0;39m"  # Grey
# 017132 #SUCCESS="\\033[1;32m" # Green
# 017133 #WARNING="\\033[1;33m" # Yellow
# 017134 
# 017135 # Use a colored prefix
# 017136 # These values, if specified here, override the defaults
# 017137 #BMPREFIX="      "
# 017138 #SUCCESS_PREFIX="${SUCCESS}  *  ${NORMAL} "
# 017139 #FAILURE_PREFIX="${FAILURE}*****${NORMAL} "
# 017140 #WARNING_PREFIX="${WARNING} *** ${NORMAL} "
# 017141 
# 017142 # Manually seet the right edge of message output (characters)
# 017143 # Useful when resetting console font during boot to override
# 017144 # automatic screen width detection
# 017145 #COLUMNS=120
# 017146 
# 017147 # Interactive startup
# 017148 #IPROMPT="yes" # Whether to display the interactive boot prompt
# 017149 #itime="3"    # The amount of time (in seconds) to display the prompt
# 017150 
# 017151 # The total length of the distro welcome string, without escape codes
# 017152 #wlen=$(echo "Welcome to ${DISTRO}" | wc -c )
# 017153 #welcome_message="Welcome to ${INFO}${DISTRO}${NORMAL}"
# 017154 
# 017155 # The total length of the interactive string, without escape codes
# 017156 #ilen=$(echo "Press 'I' to enter interactive startup" | wc -c )
# 017157 #i_message="Press '${FAILURE}I${NORMAL}' to enter interactive startup"
# 017158 
# 017159 # Set scripts to skip the file system check on reboot
# 017160 #FASTBOOT=yes
# 017161 
# 017162 # Skip reading from the console
# 017163 #HEADLESS=yes
# 017164 
# 017165 # Write out fsck progress if yes
# 017166 #VERBOSE_FSCK=no
# 017167 
# 017168 # Speed up boot without waiting for settle in udev
# 017169 #OMIT_UDEV_SETTLE=y
# 017170 
# 017171 # Speed up boot without waiting for settle in udev_retry
# 017172 #OMIT_UDEV_RETRY_SETTLE=yes
# 017173 
# 017174 # Skip cleaning /tmp if yes
# 017175 #SKIPTMPCLEAN=no
# 017176 
# 017177 # For setclock
# 017178 #UTC=1
# 017179 #CLOCKPARAMS=
# 017180 
# 017181 # For consolelog (Note that the default, 7=debug, is noisy)
# 017182 #LOGLEVEL=7
# 017183 
# 017184 # For network
# 017185 #HOSTNAME=mylfs
# 017186 
# 017187 # Delay between TERM and KILL signals at shutdown
# 017188 #KILLDELAY=3
# 017189 
# 017190 # Optional sysklogd parameters
# 017191 #SYSKLOGD_PARMS="-m 0"
# 017192 
# 017193 # Console parameters
# 017194 #UNICODE=1
# 017195 #KEYMAP="de-latin1"
# 017196 #KEYMAP_CORRECTIONS="euro2"
# 017197 #FONT="lat0-16 -m 8859-15"
# 017198 #LEGACY_CHARSET=
# 017199 
# 017200 

 
# 017203            9.6.8.1. Customizing the Boot and Shutdown Scripts 
# 017204 
# 017205                          The LFS boot scripts boot and shut down a system in a fairly efficient manner, but
# 017206                        there are a few tweaks that you can make in the rc.site file to improve speed even
# 017207                        more and to adjust messages according to your preferences. To do this, adjust the
# 017208                        settings in the /etc/sysconfig/rc.sitefile above. 
# 017209 
# 017210                          During the boot script udev, there is a call to udev settle  that requires some time
# 017211                        to complete. This time may or may not be required depending on devices present in
# 017212                        the system. If you only have simple partitions and a single ethernet card, the boot
# 017213                        process will probably not need to wait for this command. To skip it, set the variable
# 017214                        OMIT_UDEV_SETTLE=y. 
# 017215 
# 017216                          The boot script udev_retryalso runs udev settle  by default. This command is only
# 017217                        needed by default if the /vardirectory is separately mounted. This is because the
# 017218                        clock needs the file /var/lib/hwclock/adjtime. Other customizations may also need
# 017219                        to wait for udev to complete, but in many installations it is not needed. Skip the
# 017220                        command by setting the variable OMIT_UDEV_RETRY_SETTLE=y. 
# 017221 
# 017222                          By default, the file system checks are silent. This can appear to be a delay during
# 017223                        the bootup process. To turn on the fsck  output, set the variable VERBOSE_FSCK=y.
# 017224                        
# 017225 
# 017226                          When rebooting, you may want to skip the filesystem check, fsck  , completely. To
# 017227                        do this, either create the file /fastbootor reboot the system with the command /sbin/shutdown
# 017228                        -f -r now  . On the other hand, you can force all file systems to be checked by creating
# 017229                        /forcefsckor running shutdown  with the -F parameter instead of -f . 
# 017230 
# 017231                          Setting the variable FASTBOOT=y will disable fsck  during the boot process until it
# 017232                        is removed. This is not recommended on a permanent basis. 
# 017233 
# 017234                          Normally, all files in the /tmpdirectory are deleted at boot time. Depending on
# 017235                        the number of files or directories present, this can cause a noticeable delay in
# 017236                        the boot process. To skip removing these files set the variable SKIPTMPCLEAN=y.
# 017237                        
# 017238 
# 017239                          During shutdown, the init  program sends a TERM signal to each program it has started
# 017240                        (e.g. agetty), waits for a set time (default 3 seconds), and sends each process
# 017241                        a KILL signal and waits again. This process is repeated in the sendsignals  script
# 017242                        for any processes that are not shut down by their own scripts. The delay for init  can
# 017243                        be set by passing a parameter. For example to remove the delay in init  , pass the
# 017244                        -t0 parameter when shutting down or rebooting (e.g. /sbin/shutdown -t0 -r now  ).
# 017245                        The delay for the sendsignals  script can be skipped by setting the parameter KILLDELAY=0.
# 017246                         
# 017247        9.7. The Bash Shell Startup Files 
# 017248 
# 017249                          The shell program /bin/bash  (hereafter referred to as "the shell " ) uses a collection
# 017250                        of startup files to help create an environment to run in. Each file has a specific
# 017251                        use and may affect login and interactive environments differently. The files in
# 017252                        the /etcdirectory provide global settings. If an equivalent file exists in the home
# 017253                        directory, it may override the global settings. 
# 017254 
# 017255                          An interactive login shell is started after a successful login, using /bin/login  ,
# 017256                        by reading the /etc/passwdfile. An interactive non-login shell is started at the
# 017257                        command-line (e.g., [prompt]$/bin/bash  ). A non-interactive shell is usually present
# 017258                        when a shell script is running. It is non-interactive because it is processing a
# 017259                        script and not waiting for user input between commands. 
# 017260 
# 017261                          For more information, see info bash  under the Bash Startup Files and Interactive
# 017262                        Shells  section. 
# 017263 
# 017264                          The files /etc/profileand ~/.bash_profileare read when the shell is invoked as an
# 017265                        interactive login shell. 
# 017266 
# 017267                          The base /etc/profilebelow sets some environment variables necessary for native
# 017268                        language support. Setting them properly results in: 
# 017269 
# 017270                          The output of programs translated into the native language 
# 017271 
# 017272                          Correct classification of characters into letters, digits and other classes. This
# 017273                        is necessary for bash  to properly accept non-ASCII characters in command lines in
# 017274                        non-English locales 
# 017275 
# 017276                          The correct alphabetical sorting order for the country 
# 017277 
# 017278                          Appropriate default paper size 
# 017279 
# 017280                          Correct formatting of monetary, time, and date values 
# 017281 
# 017282                          Replace <ll> below with the two-letter code for the desired language (e.g., "en " )
# 017283                        and <CC> with the two-letter code for the appropriate country (e.g., "GB " ). <charmap> should
# 017284                        be replaced with the canonical charmap for your chosen locale. Optional modifiers
# 017285                        such as "@euro " may also be present. 
# 017286 
# 017287                          The list of all locales supported by Glibc can be obtained by running the following
# 017288                        command: 



# 017292 locale -a
# 017293 


# 017296 
# 017297                          Charmaps can have a number of aliases, e.g., "ISO-8859-1 " is also referred to as
# 017298                        "iso8859-1 " and "iso88591 " . Some applications cannot handle the various synonyms
# 017299                        correctly (e.g., require that "UTF-8 " is written as "UTF-8 " , not "utf8 " ), so it is
# 017300                        safest in most cases to choose the canonical name for a particular locale. To determine
# 017301                        the canonical name, run the following command, where <locale name> is the output
# 017302                        given by locale -a  for your preferred locale ("en_GB.iso88591 " in our example). 



# 017306 LC_ALL=<locale name> locale charmap
# 017307 

 
# 017310 
# 017311                          For the "en_GB.iso88591 " locale, the above command will print: 



# 017315 
# 017316 ISO-8859-1
# 017317 


# 017320 
# 017321                          This results in a final locale setting of "en_GB.ISO-8859-1 " . It is important that
# 017322                        the locale found using the heuristic above is tested prior to it being added to
# 017323                        the Bash startup files: 



# 017327 LC_ALL=<locale name> locale language
# 017328 LC_ALL=<locale name> locale charmap
# 017329 LC_ALL=<locale name> locale int_curr_symbol
# 017330 LC_ALL=<locale name> locale int_prefix
# 017331 


# 017334 
# 017335                          The above commands should print the language name, the character encoding used by
# 017336                        the locale, the local currency, and the prefix to dial before the telephone number
# 017337                        in order to get into the country. If any of the commands above fail with a message
# 017338                        similar to the one shown below, this means that your locale was either not installed
# 017339                        in Section 8.5, "Glibc-2.33" or is not supported by the default installation of Glibc.
# 017340                        



# 017344 
# 017345 locale: Cannot set LC_* to default locale: No such file or directory
# 017346 


# 017349 
# 017350                          If this happens, you should either install the desired locale using the localedef  command,
# 017351                        or consider choosing a different locale. Further instructions assume that there
# 017352                        are no such error messages from Glibc. 
# 017353 
# 017354                          Other packages can also function incorrectly (but may not necessarily display any
# 017355                        error messages) if the locale name does not meet their expectations. In those cases,
# 017356                        investigating how other Linux distributions support your locale might provide some
# 017357                        useful information. 
# 017358 
# 017359                          Once the proper locale settings have been determined, create the /etc/profilefile:
# 017360                        



# 017364 cat > /etc/profile << "EOF"
# 017365 # Begin /etc/profile
# 017366 
# 017367 export LANG=<ll>_<CC>.<charmap><@modifiers>
# 017368 
# 017369 # End /etc/profile
# 017370 EOF
# 017371 

 
# 017374 
# 017375                          The "C " (default) and "en_US.utf8 " (the recommended one for United States English
# 017376                        users) locales are different. "C " uses the US-ASCII 7-bit character set, and treats
# 017377                        bytes with the high bit set as invalid characters. That's why, e.g., the ls  command
# 017378                        substitutes them with question marks in that locale. Also, an attempt to send mail
# 017379                        with such characters from Mutt or Pine results in non-RFC-conforming messages being
# 017380                        sent (the charset in the outgoing mail is indicated as "unknown 8-bit " ). So you
# 017381                        can use the "C " locale only if you are sure that you will never need 8-bit characters.
# 017382                        
# 017383 
# 017384                          UTF-8 based locales are not supported well by some programs. Work is in progress
# 017385                        to document and, if possible, fix such problems, see http://www.linuxfromscratch.org/blfs/view/10.1/introduction/locale-issues.html .
# 017386                         
# 017387        9.8. Creating the /etc/inputrc File 
# 017388 
# 017389                          The inputrcfile is the configuration file for the readline library, which provides
# 017390                        editing capabilities while the user is entering a line from the terminal. It works
# 017391                        by translating keyboard inputs into specific actions. Readline is used by bash and
# 017392                        most other shells as well as many other applications. 
# 017393 
# 017394                          Most people do not need user-specific functionality so the command below creates
# 017395                        a global /etc/inputrcused by everyone who logs in. If you later decide you need
# 017396                        to override the defaults on a per user basis, you can create a .inputrcfile in the
# 017397                        user's home directory with the modified mappings. 
# 017398 
# 017399                          For more information on how to edit the inputrcfile, see info bash  under the Readline
# 017400                        Init File  section. info readline  is also a good source of information. 
# 017401 
# 017402                          Below is a generic global inputrcalong with comments to explain what the various
# 017403                        options do. Note that comments cannot be on the same line as commands. Create the
# 017404                        file using the following command: 



# 017408 cat > /etc/inputrc << "EOF"
# 017409 # Begin /etc/inputrc
# 017410 # Modified by Chris Lynn <roryo@roryo.dynup.net>
# 017411 
# 017412 # Allow the command prompt to wrap to the next line
# 017413 set horizontal-scroll-mode Off
# 017414 
# 017415 # Enable 8bit input
# 017416 set meta-flag On
# 017417 set input-meta On
# 017418 
# 017419 # Turns off 8th bit stripping
# 017420 set convert-meta Off
# 017421 
# 017422 # Keep the 8th bit for display
# 017423 set output-meta On
# 017424 
# 017425 # none, visible or audible
# 017426 set bell-style none
# 017427 
# 017428 # All of the following map the escape sequence of the value
# 017429 # contained in the 1st argument to the readline specific functions
# 017430 "\eOd": backward-word
# 017431 "\eOc": forward-word
# 017432 
# 017433 # for linux console
# 017434 "\e[1~": beginning-of-line
# 017435 "\e[4~": end-of-line
# 017436 "\e[5~": beginning-of-history
# 017437 "\e[6~": end-of-history
# 017438 "\e[3~": delete-char
# 017439 "\e[2~": quoted-insert
# 017440 
# 017441 # for xterm
# 017442 "\eOH": beginning-of-line
# 017443 "\eOF": end-of-line
# 017444 
# 017445 # for Konsole
# 017446 "\e[H": beginning-of-line
# 017447 "\e[F": end-of-line
# 017448 
# 017449 # End /etc/inputrc
# 017450 EOF
# 017451 

 
# 017454        9.9. Creating the /etc/shells File 
# 017455 
# 017456                          The shellsfile contains a list of login shells on the system. Applications use this
# 017457                        file to determine whether a shell is valid. For each shell a single line should
# 017458                        be present, consisting of the shell's path relative to the root of the directory
# 017459                        structure (/). 
# 017460 
# 017461                          For example, this file is consulted by chsh  to determine whether an unprivileged
# 017462                        user may change the login shell for her own account. If the command name is not
# 017463                        listed, the user will be denied the ability to change shells. 
# 017464 
# 017465                          It is a requirement for applications such as GDM which does not populate the face
# 017466                        browser if it can't find /etc/shells, or FTP daemons which traditionally disallow
# 017467                        access to users with shells not included in this file. 



# 017471 cat > /etc/shells << "EOF"
# 017472 # Begin /etc/shells
# 017473 
# 017474 /bin/sh
# 017475 /bin/bash
# 017476 
# 017477 # End /etc/shells
# 017478 EOF
# 017479 

 
# 017482        Chapter 10. Making the LFS System Bootable  
# 017483        10.1. Introduction 
# 017484 
# 017485                          It is time to make the LFS system bootable. This chapter discusses creating the
# 017486                        /etc/fstabfile, building a kernel for the new LFS system, and installing the GRUB
# 017487                        boot loader so that the LFS system can be selected for booting at startup.  
# 017488        10.2. Creating the /etc/fstab File 
# 017489 
# 017490                          The /etc/fstabfile is used by some programs to determine where file systems are
# 017491                        to be mounted by default, in which order, and which must be checked (for integrity
# 017492                        errors) prior to mounting. Create a new file systems table like this: 



# 017496 cat > /etc/fstab << "EOF"
# 017497 # Begin /etc/fstab
# 017498 
# 017499 # file system  mount-point  type     options             dump  fsck
# 017500 #                                                              order
# 017501 
# 017502 /dev/<xxx>     /            <fff>    defaults            1     1
# 017503 /dev/<yyy>     swap         swap     pri=1               0     0
# 017504 proc           /proc        proc     nosuid,noexec,nodev 0     0
# 017505 sysfs          /sys         sysfs    nosuid,noexec,nodev 0     0
# 017506 devpts         /dev/pts     devpts   gid=5,mode=620      0     0
# 017507 tmpfs          /run         tmpfs    defaults            0     0
# 017508 devtmpfs       /dev         devtmpfs mode=0755,nosuid    0     0
# 017509 
# 017510 # End /etc/fstab
# 017511 EOF
# 017512 

 
# 017515 
# 017516                          Replace <xxx> , <yyy> , and <fff> with the values appropriate for the system, for example,
# 017517                        sda2, sda5, and ext4. For details on the six fields in this file, see man 5 fstab  .
# 017518                        
# 017519 
# 017520                          Filesystems with MS-DOS or Windows origin (i.e. vfat, ntfs, smbfs, cifs, iso9660,
# 017521                        udf) need a special option, utf8, in order for non-ASCII characters in file names
# 017522                        to be interpreted properly. For non-UTF-8 locales, the value of iocharsetshould
# 017523                        be set to be the same as the character set of the locale, adjusted in such a way
# 017524                        that the kernel understands it. This works if the relevant character set definition
# 017525                        (found under File systems -> Native Language Support when configuring the kernel)
# 017526                        has been compiled into the kernel or built as a module. However, if the character
# 017527                        set of the locale is UTF-8, the corresponding option iocharset=utf8would make the
# 017528                        file system case sensitive. To fix this, use the special option utf8instead of iocharset=utf8,
# 017529                        for UTF-8 locales. The "codepage " option is also needed for vfat and smbfs filesystems.
# 017530                        It should be set to the codepage number used under MS-DOS in your country. For example,
# 017531                        in order to mount USB flash drives, a ru_RU.KOI8-R user would need the following
# 017532                        in the options portion of its mount line in /etc/fstab: 



# 017536 noauto,user,quiet,showexec,codepage=866,iocharset=koi8r
# 017537 


# 017540 
# 017541                          The corresponding options fragment for ru_RU.UTF-8 users is: 



# 017545 noauto,user,quiet,showexec,codepage=866,utf8
# 017546 


# 017549 
# 017550                          Note that using iocharsetis the default for iso8859-1(which keeps the file system
# 017551                        case insensitive), and the utf8option tells the kernel to convert the file names
# 017552                        using UTF-8 so they can be interpreted in the UTF-8 locale. 
# 017553 
# 017554                          It is also possible to specify default codepage and iocharset values for some filesystems
# 017555                        during kernel configuration. The relevant parameters are named "Default NLS Option " (CONFIG_NLS_DEFAULT),
# 017556                        "Default Remote NLS Option " (CONFIG_SMB_NLS_DEFAULT), "Default codepage for FAT " (CONFIG_FAT_DEFAULT_CODEPAGE),
# 017557                        and "Default iocharset for FAT " (CONFIG_FAT_DEFAULT_IOCHARSET). There is no way to
# 017558                        specify these settings for the ntfs filesystem at kernel compilation time. 
# 017559 
# 017560                          It is possible to make the ext3 filesystem reliable across power failures for some
# 017561                        hard disk types. To do this, add the barrier=1mount option to the appropriate entry
# 017562                        in /etc/fstab. To check if the disk drive supports this option, run hdparm on the
# 017563                        applicable disk drive. For example, if: 



# 017567 hdparm -I /dev/sda | grep NCQ
# 017568 


# 017571 
# 017572                          returns non-empty output, the option is supported. 
# 017573 
# 017574                          Note: Logical Volume Management (LVM) based partitions cannot use the barrieroption.
# 017575                         
# 017576        10.3. Linux-5.10.17 
# 017577 
# 017578                          The Linux package contains the Linux kernel. 
# 017579           Approximate build time: 5.0 - 125.0 SBU (typically about 9 SBU)
# 017580           Required disk space: 1200 - 6750 MB (typically about 1500 MB) 
# 017581          10.3.1. Installation of the kernel 
# 017582 
# 017583                          Building the kernel involves a few steps;configuration, compilation, and installation.
# 017584                        Read the READMEfile in the kernel source tree for alternative methods to the way
# 017585                        this book configures the kernel. 
# 017586 
# 017587                          Prepare for compilation by running the following command: 



# 017591 make mrproper
# 017592 


# 017595 
# 017596                          This ensures that the kernel tree is absolutely clean. The kernel team recommends
# 017597                        that this command be issued prior to each kernel compilation. Do not rely on the
# 017598                        source tree being clean after un-tarring. 
# 017599 
# 017600                          There are several ways to configure the kernel options. Usually, This is done through
# 017601                        a menu-driven interface, for example: 



# 017605 make menuconfig
# 017606 


# 017609 
# 017610                          The meaning of optional make environment variables: 
# 017611 
# 017612                LANG=<host_LANG_value> LC_ALL=  
# 017613 
# 017614                          This establishes the locale setting to the one used on the host. This may be needed
# 017615                        for a proper menuconfig ncurses interface line drawing on a UTF-8 linux text console.
# 017616                        
# 017617 
# 017618                          If used, be sure to replace <host_LANG_value> by the value of the $LANGvariable from
# 017619                        your host. You can alternatively use instead the host's value of $LC_ALLor $LC_CTYPE.
# 017620                        
# 017621 
# 017622                
# 017623           make menuconfig  
# 017624 
# 017625                          This launches an ncurses menu-driven interface. For other (graphical) interfaces,
# 017626                        type make help  . 
# 017627 
# 017628                          For general information on kernel configuration see http://www.linuxfromscratch.org/hints/downloads/files/kernel-configuration.txt .
# 017629                        BLFS has some information regarding particular kernel configuration requirements
# 017630                        of packages outside of LFS at http://www.linuxfromscratch.org/blfs/view/10.1/longindex.html#kernel-config-index .
# 017631                        Additional information about configuring and building the kernel can be found at
# 017632                        http://www.kroah.com/lkn/ 
# 017633          Note 
# 017634 
# 017635                          A good starting place for setting up the kernel configuration is to run make defconfig  .
# 017636                        This will set the base configuration to a good state that takes your current system
# 017637                        architecture into account. 
# 017638 
# 017639                          Be sure to enable/disable/set the following features or the system might not work
# 017640                        correctly or boot at all: 



# 017644 Device Drivers  --->
# 017645   Generic Driver Options  --->
# 017646    [ ] Support for uevent helper [CONFIG_UEVENT_HELPER]
# 017647    [*] Maintain a devtmpfs filesystem to mount at /dev [CONFIG_DEVTMPFS]
# 017648 


# 017651 
# 017652                          There are several other options that may be desired depending on the requirements
# 017653                        for the system. For a list of options needed for BLFS packages, see the BLFS Index
# 017654                        of Kernel Settings (http://www.linuxfromscratch.org/blfs/view/10.1/longindex.html#kernel-config-index).
# 017655                        
# 017656          Note 
# 017657 
# 017658                          If your host hardware is using UEFI, then the 'make defconfig' above should automatically
# 017659                        add in some EFI-related kernel options. 
# 017660 
# 017661                          In order to allow your LFS kernel to be booted from within your host's UEFI boot
# 017662                        environment, your kernel must have this option selected: 



# 017666 Processor type and features  --->
# 017667    [*]   EFI stub support  [CONFIG_EFI_STUB]
# 017668 


# 017671 
# 017672                          A fuller description of managing UEFI environments from within LFS is covered by
# 017673                        the lfs-uefi.txt hint at http://www.linuxfromscratch.org/hints/downloads/files/lfs-uefi.txt .
# 017674                        
# 017675 
# 017676                          The rationale for the above configuration items: 
# 017677 
# 017678                Support for uevent helper  
# 017679 
# 017680                          Having this option set may interfere with device management when using Udev/Eudev.
# 017681                        
# 017682 
# 017683                Maintain a devtmpfs  
# 017684 
# 017685                          This will create automated device nodes which are populated by the kernel, even
# 017686                        without Udev running. Udev then runs on top of this, managing permissions and adding
# 017687                        symlinks. This configuration item is required for all users of Udev/Eudev. 
# 017688 
# 017689                          Alternatively, make oldconfig  may be more appropriate in some situations. See the
# 017690                        READMEfile for more information. 
# 017691 
# 017692                          If desired, skip kernel configuration by copying the kernel config file, .config,
# 017693                        from the host system (assuming it is available) to the unpacked linux-5.10.17directory.
# 017694                        However, we do not recommend this option. It is often better to explore all the
# 017695                        configuration menus and create the kernel configuration from scratch. 
# 017696 
# 017697                          Compile the kernel image and modules: 



# 017701 make
# 017702 


# 017705 
# 017706                          If using kernel modules, module configuration in /etc/modprobe.dmay be required.
# 017707                        Information pertaining to modules and kernel configuration is located in Section
# 017708                        9.3, "Overview of Device and Module Handling" and in the kernel documentation in
# 017709                        the linux-5.10.17/Documentationdirectory. Also, modprobe.d(5)may be of interest.
# 017710                        
# 017711 
# 017712                          Unless module support has been disabled in the kernel configuration, install the
# 017713                        modules with: 



# 017717 make modules_install
# 017718 


# 017721 
# 017722                          After kernel compilation is complete, additional steps are required to complete
# 017723                        the installation. Some files need to be copied to the /bootdirectory. 
# 017724          Caution 
# 017725 
# 017726                          If the host system has a separate /boot partition, the files copied below should
# 017727                        go there. The easiest way to do that is to bind /boot on the host (outside chroot)
# 017728                        to /mnt/lfs/boot before proceeding. As the root user in the host system  : 



# 017732 mount --bind /boot /mnt/lfs/boot
# 017733 


# 017736 
# 017737                          The path to the kernel image may vary depending on the platform being used. The
# 017738                        filename below can be changed to suit your taste, but the stem of the filename should
# 017739                        be vmlinuz  to be compatible with the automatic setup of the boot process described
# 017740                        in the next section. The following command assumes an x86 architecture: 



# 017744 cp -iv arch/x86/boot/bzImage /boot/vmlinuz-5.10.17-lfs-10.1
# 017745 


# 017748 
# 017749                          System.mapis a symbol file for the kernel. It maps the function entry points of
# 017750                        every function in the kernel API, as well as the addresses of the kernel data structures
# 017751                        for the running kernel. It is used as a resource when investigating kernel problems.
# 017752                        Issue the following command to install the map file: 



# 017756 cp -iv System.map /boot/System.map-5.10.17
# 017757 


# 017760 
# 017761                          The kernel configuration file .configproduced by the make menuconfig  step above contains
# 017762                        all the configuration selections for the kernel that was just compiled. It is a
# 017763                        good idea to keep this file for future reference: 



# 017767 cp -iv .config /boot/config-5.10.17
# 017768 


# 017771 
# 017772                          Install the documentation for the Linux kernel: 



# 017776 install -d /usr/share/doc/linux-5.10.17
# 017777 cp -r Documentation/* /usr/share/doc/linux-5.10.17
# 017778 


# 017781 
# 017782                          It is important to note that the files in the kernel source directory are not owned
# 017783                        by root  . Whenever a package is unpacked as user root  (like we did inside chroot),
# 017784                        the files have the user and group IDs of whatever they were on the packager's computer.
# 017785                        This is usually not a problem for any other package to be installed because the
# 017786                        source tree is removed after the installation. However, the Linux source tree is
# 017787                        often retained for a long time. Because of this, there is a chance that whatever
# 017788                        user ID the packager used will be assigned to somebody on the machine. That person
# 017789                        would then have write access to the kernel source. 
# 017790          Note 
# 017791 
# 017792                          In many cases, the configuration of the kernel will need to be updated for packages
# 017793                        that will be installed later in BLFS. Unlike other packages, it is not necessary
# 017794                        to remove the kernel source tree after the newly built kernel is installed. 
# 017795 
# 017796                          If the kernel source tree is going to be retained, run chown -R 0:0  on the linux-5.10.17directory
# 017797                        to ensure all files are owned by user root  . 
# 017798          Warning 
# 017799 
# 017800                          Some kernel documentation recommends creating a symlink from /usr/src/linuxpointing
# 017801                        to the kernel source directory. This is specific to kernels prior to the 2.6 series
# 017802                        and must not  be created on an LFS system as it can cause problems for packages you
# 017803                        may wish to build once your base LFS system is complete. 
# 017804          Warning 
# 017805 
# 017806                          The headers in the system's includedirectory (/usr/include) should always  be the
# 017807                        ones against which Glibc was compiled, that is, the sanitised headers installed
# 017808                        in Section 5.4, "Linux-5.10.17 API Headers" . Therefore, they should never  be replaced
# 017809                        by either the raw kernel headers or any other kernel sanitized headers.  
# 017810          10.3.2. Configuring Linux Module Load Order 
# 017811 
# 017812                          Most of the time Linux modules are loaded automatically, but sometimes it needs
# 017813                        some specific direction. The program that loads modules, modprobe  or insmod  , uses
# 017814                        /etc/modprobe.d/usb.conffor this purpose. This file needs to be created so that
# 017815                        if the USB drivers (ehci_hcd, ohci_hcd and uhci_hcd) have been built as modules,
# 017816                        they will be loaded in the correct order; ehci_hcd needs to be loaded prior to ohci_hcd
# 017817                        and uhci_hcd in order to avoid a warning being output at boot time. 
# 017818 
# 017819                          Create a new file /etc/modprobe.d/usb.confby running the following: 



# 017823 install -v -m755 -d /etc/modprobe.d
# 017824 cat > /etc/modprobe.d/usb.conf << "EOF"
# 017825 # Begin /etc/modprobe.d/usb.conf
# 017826 
# 017827 install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
# 017828 install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true
# 017829 
# 017830 # End /etc/modprobe.d/usb.conf
# 017831 EOF
# 017832 

 
# 017835          10.3.3. Contents of Linux 
# 017836           Installed files: config-5.10.17, vmlinuz-5.10.17-lfs-10.1,and System.map-5.10.17
# 017837           Installed directories: /lib/modules, /usr/share/doc/linux-5.10.17  
# 017838            Short Descriptions  
# 017839 
# 017840                          
# 017841 
# 017842                config-5.10.17 
# 017843 
# 017844                          Contains all the configuration selections for the kernel  
# 017845 
# 017846                          vmlinuz-5.10.17-lfs-10.1 
# 017847 
# 017848                          The engine of the Linux system. When turning on the computer, the kernel is the
# 017849                        first part of the operating system that gets loaded. It detects and initializes
# 017850                        all components of the computer's hardware, then makes these components available
# 017851                        as a tree of files to the software and turns a single CPU into a multitasking machine
# 017852                        capable of running scores of programs seemingly at the same time  
# 017853 
# 017854                          System.map-5.10.17 
# 017855 
# 017856                          A list of addresses and symbols; it maps the entry points and addresses of all the
# 017857                        functions and data structures in the kernel  
# 017858        10.4. Using GRUB to Set Up the Boot Process 
# 017859          10.4.1. Introduction 
# 017860          Warning 
# 017861 
# 017862                          Configuring GRUB incorrectly can render your system inoperable without an alternate
# 017863                        boot device such as a CD-ROM or bootable USB drive. This section is not required
# 017864                        to boot your LFS system. You may just want to modify your current boot loader, e.g.
# 017865                        Grub-Legacy, GRUB2, or LILO. 
# 017866 
# 017867                          Ensure that an emergency boot disk is ready to "rescue " the computer if the computer
# 017868                        becomes unusable (un-bootable). If you do not already have a boot device, you can
# 017869                        create one. In order for the procedure below to work, you need to jump ahead to
# 017870                        BLFS and install xorriso from the libisoburn package. 



# 017874 cd /tmp 
# 017875 grub-mkrescue --output=grub-img.iso 
# 017876 xorriso -as cdrecord -v dev=/dev/cdrw blank=as_needed grub-img.iso
# 017877 


# 017880          Note 
# 017881 
# 017882                          To boot LFS on host systems that have UEFI enabled, the kernel needs to have been
# 017883                        built with the CONFIG_EFI_STUB capability described in the previous section. However,
# 017884                        LFS can be booted using GRUB2 without such an addition. To do this, the UEFI Mode
# 017885                        and Secure Boot capabilities in the host system's BIOS need to be turned off. For
# 017886                        details, see the lfs-uefi.txt hint at http://www.linuxfromscratch.org/hints/downloads/files/lfs-uefi.txt.
# 017887                        
# 017888          10.4.2. GRUB Naming Conventions 
# 017889 
# 017890                          GRUB uses its own naming structure for drives and partitions in the form of (hdn,m)  ,
# 017891                        where n  is the hard drive number and m  is the partition number. The hard drive number
# 017892                        starts from zero, but the partition number starts from one for normal partitions
# 017893                        and five for extended partitions. Note that this is different from earlier versions
# 017894                        where both numbers started from zero. For example, partition sda1is (hd0,1)  to GRUB
# 017895                        and sdb3is (hd1,3)  . In contrast to Linux, GRUB does not consider CD-ROM drives to
# 017896                        be hard drives. For example, if using a CD on hdband a second hard drive on hdc,
# 017897                        that second hard drive would still be (hd1)  . 
# 017898          10.4.3. Setting Up the Configuration 
# 017899 
# 017900                          GRUB works by writing data to the first physical track of the hard disk. This area
# 017901                        is not part of any file system. The programs there access GRUB modules in the boot
# 017902                        partition. The default location is /boot/grub/. 
# 017903 
# 017904                          The location of the boot partition is a choice of the user that affects the configuration.
# 017905                        One recommendation is to have a separate small (suggested size is 200 MB) partition
# 017906                        just for boot information. That way each build, whether LFS or some commercial distro,
# 017907                        can access the same boot files and access can be made from any booted system. If
# 017908                        you choose to do this, you will need to mount the separate partition, move all files
# 017909                        in the current /bootdirectory (e.g. the linux kernel you just built in the previous
# 017910                        section) to the new partition. You will then need to unmount the partition and remount
# 017911                        it as /boot. If you do this, be sure to update /etc/fstab. 
# 017912 
# 017913                          Using the current lfs partition will also work, but configuration for multiple systems
# 017914                        is more difficult. 
# 017915 
# 017916                          Using the above information, determine the appropriate designator for the root partition
# 017917                        (or boot partition, if a separate one is used). For the following example, it is
# 017918                        assumed that the root (or separate boot) partition is sda2. 
# 017919 
# 017920                          Install the GRUB files into /boot/gruband set up the boot track: 
# 017921          Warning 
# 017922 
# 017923                          The following command will overwrite the current boot loader. Do not run the command
# 017924                        if this is not desired, for example, if using a third party boot manager to manage
# 017925                        the Master Boot Record (MBR). 



# 017929 grub-install /dev/sda
# 017930 


# 017933          Note 
# 017934 
# 017935                          If the system has been booted using UEFI, grub-install  will try to install files
# 017936                        for the x86_64-efi  target, but those files have not been installed in chapter 6.
# 017937                        If this is the case, add --target i386-pcto the command above.  
# 017938          10.4.4. Creating the GRUB Configuration File 
# 017939 
# 017940                          Generate /boot/grub/grub.cfg: 



# 017944 cat > /boot/grub/grub.cfg << "EOF"
# 017945 # Begin /boot/grub/grub.cfg
# 017946 set default=0
# 017947 set timeout=5
# 017948 
# 017949 insmod ext2
# 017950 set root=(hd0,2)
# 017951 
# 017952 menuentry "GNU/Linux, Linux 5.10.17-lfs-10.1" {
# 017953         linux   /boot/vmlinuz-5.10.17-lfs-10.1 root=/dev/sda2 ro
# 017954 }
# 017955 EOF
# 017956 


# 017959          Note 
# 017960 
# 017961                          From GRUB 's perspective, the kernel files are relative to the partition used. If
# 017962                        you used a separate /boot partition, remove /boot from the above linux  line. You
# 017963                        will also need to change the set root  line to point to the boot partition. 
# 017964 
# 017965                          GRUB is an extremely powerful program and it provides a tremendous number of options
# 017966                        for booting from a wide variety of devices, operating systems, and partition types.
# 017967                        There are also many options for customization such as graphical splash screens,
# 017968                        playing sounds, mouse input, etc. The details of these options are beyond the scope
# 017969                        of this introduction. 
# 017970          Caution 
# 017971 
# 017972                          There is a command, grub-mkconfig , that can write a configuration file automatically.
# 017973                        It uses a set of scripts in /etc/grub.d/ and will destroy any customizations that
# 017974                        you make. These scripts are designed primarily for non-source distributions and
# 017975                        are not recommended for LFS. If you install a commercial Linux distribution, there
# 017976                        is a good chance that this program will be run. Be sure to back up your grub.cfg
# 017977                        file.  
# 017978        Chapter 11. The End  
# 017979        11.1. The End 
# 017980 
# 017981                          Well done! The new LFS system is installed! We wish you much success with your shiny
# 017982                        new custom-built Linux system. 
# 017983 
# 017984                          It may be a good idea to create an /etc/lfs-releasefile. By having this file, it
# 017985                        is very easy for you (and for us if you need to ask for help at some point) to find
# 017986                        out which LFS version is installed on the system. Create this file by running: 



# 017990 echo 10.1 > /etc/lfs-release
# 017991 


# 017994 
# 017995                          Two files describing the installed system may be used by packages that can be installed
# 017996                        on the system later, either in binary form or by building them. 
# 017997 
# 017998                          The first one shows the status of your new system with respect to the Linux Standards
# 017999                        Base (LSB). To create this file, run: 



# 018003 cat > /etc/lsb-release << "EOF"
# 018004 DISTRIB_ID="Linux From Scratch"
# 018005 DISTRIB_RELEASE="10.1"
# 018006 DISTRIB_CODENAME="<your name here>"
# 018007 DISTRIB_DESCRIPTION="Linux From Scratch"
# 018008 EOF
# 018009 


# 018012 
# 018013                          The second one contains roughly the same information, and is used by systemd and
# 018014                        some graphical desktop environments. To create this file, run: 



# 018018 cat > /etc/os-release << "EOF"
# 018019 NAME="Linux From Scratch"
# 018020 VERSION="10.1"
# 018021 ID=lfs
# 018022 PRETTY_NAME="Linux From Scratch 10.1"
# 018023 VERSION_CODENAME="<your name here>"
# 018024 EOF
# 018025 


# 018028 
# 018029                          Be sure to put some sort of customization for the fields 'DISTRIB_CODENAME' and
# 018030                        'VERSION_CODENAME' to make the system uniquely yours.  
# 018031        11.2. Get Counted 
# 018032 
# 018033                          Now that you have finished the book, do you want to be counted as an LFS user? Head
# 018034                        over to http://www.linuxfromscratch.org/cgi-bin/lfscounter.php and register as an
# 018035                        LFS user by entering your name and the first LFS version you have used. 
# 018036 
# 018037                          Let's reboot into LFS now.  
# 018038        11.3. Rebooting the System 
# 018039 
# 018040                          Now that all of the software has been installed, it is time to reboot your computer.
# 018041                        However, you should be aware of a few things. The system you have created in this
# 018042                        book is quite minimal, and most likely will not have the functionality you would
# 018043                        need to be able to continue forward. By installing a few extra packages from the
# 018044                        BLFS book while still in our current chroot environment, you can leave yourself
# 018045                        in a much better position to continue on once you reboot into your new LFS installation.
# 018046                        Here are some suggestions: 
# 018047 
# 018048                          A text mode browser such as Lynx will allow you to easily view the BLFS book in one
# 018049                        virtual terminal, while building packages in another. 
# 018050 
# 018051                          The GPM package will allow you to perform copy/paste actions in your virtual terminals.
# 018052                        
# 018053 
# 018054                          If you are in a situation where static IP configuration does not meet your networking
# 018055                        requirements, installing a package such as dhcpcd or the client portion of dhcp may
# 018056                        be useful. 
# 018057 
# 018058                          Installing sudo may be useful for building packages as a non-root user and easily
# 018059                        installing the resulting packages in your new system. 
# 018060 
# 018061                          If you want to access your new system from a remote system within a comfortable
# 018062                        GUI environment, install openssh . 
# 018063 
# 018064                          To make fetching files over the internet easier, install wget . 
# 018065 
# 018066                          Finally, a review of the following configuration files is also appropriate at this
# 018067                        point. 
# 018068 
# 018069                          /etc/bashrc 
# 018070 
# 018071                          /etc/dircolors 
# 018072 
# 018073                          /etc/fstab 
# 018074 
# 018075                          /etc/hosts 
# 018076 
# 018077                          /etc/inputrc 
# 018078 
# 018079                          /etc/profile 
# 018080 
# 018081                          /etc/resolv.conf 
# 018082 
# 018083                          /etc/vimrc 
# 018084 
# 018085                          /root/.bash_profile 
# 018086 
# 018087                          /root/.bashrc 
# 018088 
# 018089                          /etc/sysconfig/ifconfig.eth0 
# 018090 
# 018091                          Now that we have said that, let's move on to booting our shiny new LFS installation
# 018092                        for the first time! First exit from the chroot environment: 



# 018096 logout
# 018097 


# 018100 
# 018101                          Unmount the LFS file system hierarchy: 



# 018105 umount -Rv $LFS
# 018106 


# 018109 
# 018110                          Now, reboot the system with: 



# 018114 shutdown -r now
# 018115 


# 018118 
# 018119                          Assuming the GRUB boot loader was set up as outlined earlier, the menu is set to
# 018120                        boot LFS 10.1  automatically. 
# 018121 
# 018122                          When the reboot is complete, the LFS system is ready for use and more software may
# 018123                        be added to suit your needs.  
# 018124        11.4. What Now? 
# 018125 
# 018126                          Thank you for reading this LFS book. We hope that you have found this book helpful
# 018127                        and have learned more about the system creation process. 
# 018128 
# 018129                          Now that the LFS system is installed, you may be wondering "What next? " To answer
# 018130                        that question, we have compiled a list of resources for you. 
# 018131 
# 018132                          Maintenance 
# 018133 
# 018134                          Bugs and security notices are reported regularly for all software. Since an LFS
# 018135                        system is compiled from source, it is up to you to keep abreast of such reports.
# 018136                        There are several online resources that track such reports, some of which are shown
# 018137                        below: 
# 018138 
# 018139                          CERT (Computer Emergency Response Team) 
# 018140 
# 018141                          CERT has a mailing list that publishes security alerts concerning various operating
# 018142                        systems and applications. Subscription information is available at http://www.us-cert.gov/cas/signup.html .
# 018143                        
# 018144 
# 018145                          Bugtraq 
# 018146 
# 018147                          Bugtraq is a full-disclosure computer security mailing list. It publishes newly
# 018148                        discovered security issues, and occasionally potential fixes for them. Subscription
# 018149                        information is available at http://www.securityfocus.com/archive . 
# 018150 
# 018151                          Beyond Linux From Scratch 
# 018152 
# 018153                          The Beyond Linux From Scratch book covers installation procedures for a wide range
# 018154                        of software beyond the scope of the LFS Book. The BLFS project is located at http://www.linuxfromscratch.org/blfs/view/10.1/ .
# 018155                        
# 018156 
# 018157                          LFS Hints 
# 018158 
# 018159                          The LFS Hints are a collection of educational documents submitted by volunteers
# 018160                        in the LFS community. The hints are available at http://www.linuxfromscratch.org/hints/downloads/files/ .
# 018161                        
# 018162 
# 018163                          Mailing lists 
# 018164 
# 018165                          There are several LFS mailing lists you may subscribe to if you are in need of help,
# 018166                        want to stay current with the latest developments, want to contribute to the project,
# 018167                        and more. See Chapter 1 - Mailing Lists for more information. 
# 018168 
# 018169                          The Linux Documentation Project 
# 018170 
# 018171                          The goal of The Linux Documentation Project (TLDP) is to collaborate on all of the
# 018172                        issues of Linux documentation. The TLDP features a large collection of HOWTOs, guides,
# 018173                        and man pages. It is located at http://www.tldp.org/ .  
# 018174      Part V. Appendices  
# 018175        Appendix A. Acronyms and Terms 
# 018176 
# 018177                          
# 018178 
# 018179                ABI   
# 018180 
# 018181                          Application Binary Interface 
# 018182 
# 018183                          ALFS   
# 018184 
# 018185                          Automated Linux From Scratch 
# 018186 
# 018187                          API   
# 018188 
# 018189                          Application Programming Interface 
# 018190 
# 018191                          ASCII   
# 018192 
# 018193                          American Standard Code for Information Interchange 
# 018194 
# 018195                          BIOS   
# 018196 
# 018197                          Basic Input/Output System 
# 018198 
# 018199                          BLFS   
# 018200 
# 018201                          Beyond Linux From Scratch 
# 018202 
# 018203                          BSD   
# 018204 
# 018205                          Berkeley Software Distribution 
# 018206 
# 018207                          chroot   
# 018208 
# 018209                          change root 
# 018210 
# 018211                          CMOS   
# 018212 
# 018213                          Complementary Metal Oxide Semiconductor 
# 018214 
# 018215                          COS   
# 018216 
# 018217                          Class Of Service 
# 018218 
# 018219                          CPU   
# 018220 
# 018221                          Central Processing Unit 
# 018222 
# 018223                          CRC   
# 018224 
# 018225                          Cyclic Redundancy Check 
# 018226 
# 018227                          CVS   
# 018228 
# 018229                          Concurrent Versions System 
# 018230 
# 018231                          DHCP   
# 018232 
# 018233                          Dynamic Host Configuration Protocol 
# 018234 
# 018235                          DNS   
# 018236 
# 018237                          Domain Name Service 
# 018238 
# 018239                          EGA   
# 018240 
# 018241                          Enhanced Graphics Adapter 
# 018242 
# 018243                          ELF   
# 018244 
# 018245                          Executable and Linkable Format 
# 018246 
# 018247                          EOF   
# 018248 
# 018249                          End of File 
# 018250 
# 018251                          EQN   
# 018252 
# 018253                          equation 
# 018254 
# 018255                          ext2   
# 018256 
# 018257                          second extended file system 
# 018258 
# 018259                          ext3   
# 018260 
# 018261                          third extended file system 
# 018262 
# 018263                          ext4   
# 018264 
# 018265                          fourth extended file system 
# 018266 
# 018267                          FAQ   
# 018268 
# 018269                          Frequently Asked Questions 
# 018270 
# 018271                          FHS   
# 018272 
# 018273                          Filesystem Hierarchy Standard 
# 018274 
# 018275                          FIFO   
# 018276 
# 018277                          First-In, First Out 
# 018278 
# 018279                          FQDN   
# 018280 
# 018281                          Fully Qualified Domain Name 
# 018282 
# 018283                          FTP   
# 018284 
# 018285                          File Transfer Protocol 
# 018286 
# 018287                          GB   
# 018288 
# 018289                          Gigabytes 
# 018290 
# 018291                          GCC   
# 018292 
# 018293                          GNU Compiler Collection 
# 018294 
# 018295                          GID   
# 018296 
# 018297                          Group Identifier 
# 018298 
# 018299                          GMT   
# 018300 
# 018301                          Greenwich Mean Time 
# 018302 
# 018303                          HTML   
# 018304 
# 018305                          Hypertext Markup Language 
# 018306 
# 018307                          IDE   
# 018308 
# 018309                          Integrated Drive Electronics 
# 018310 
# 018311                          IEEE   
# 018312 
# 018313                          Institute of Electrical and Electronic Engineers 
# 018314 
# 018315                          IO   
# 018316 
# 018317                          Input/Output 
# 018318 
# 018319                          IP   
# 018320 
# 018321                          Internet Protocol 
# 018322 
# 018323                          IPC   
# 018324 
# 018325                          Inter-Process Communication 
# 018326 
# 018327                          IRC   
# 018328 
# 018329                          Internet Relay Chat 
# 018330 
# 018331                          ISO   
# 018332 
# 018333                          International Organization for Standardization 
# 018334 
# 018335                          ISP   
# 018336 
# 018337                          Internet Service Provider 
# 018338 
# 018339                          KB   
# 018340 
# 018341                          Kilobytes 
# 018342 
# 018343                          LED   
# 018344 
# 018345                          Light Emitting Diode 
# 018346 
# 018347                          LFS   
# 018348 
# 018349                          Linux From Scratch 
# 018350 
# 018351                          LSB   
# 018352 
# 018353                          Linux Standard Base 
# 018354 
# 018355                          MB   
# 018356 
# 018357                          Megabytes 
# 018358 
# 018359                          MBR   
# 018360 
# 018361                          Master Boot Record 
# 018362 
# 018363                          MD5   
# 018364 
# 018365                          Message Digest 5 
# 018366 
# 018367                          NIC   
# 018368 
# 018369                          Network Interface Card 
# 018370 
# 018371                          NLS   
# 018372 
# 018373                          Native Language Support 
# 018374 
# 018375                          NNTP   
# 018376 
# 018377                          Network News Transport Protocol 
# 018378 
# 018379                          NPTL   
# 018380 
# 018381                          Native POSIX Threading Library 
# 018382 
# 018383                          OSS   
# 018384 
# 018385                          Open Sound System 
# 018386 
# 018387                          PCH   
# 018388 
# 018389                          Pre-Compiled Headers 
# 018390 
# 018391                          PCRE   
# 018392 
# 018393                          Perl Compatible Regular Expression 
# 018394 
# 018395                          PID   
# 018396 
# 018397                          Process Identifier 
# 018398 
# 018399                          PTY   
# 018400 
# 018401                          pseudo terminal 
# 018402 
# 018403                          QOS   
# 018404 
# 018405                          Quality Of Service 
# 018406 
# 018407                          RAM   
# 018408 
# 018409                          Random Access Memory 
# 018410 
# 018411                          RPC   
# 018412 
# 018413                          Remote Procedure Call 
# 018414 
# 018415                          RTC   
# 018416 
# 018417                          Real Time Clock 
# 018418 
# 018419                          SBU   
# 018420 
# 018421                          Standard Build Unit 
# 018422 
# 018423                          SCO   
# 018424 
# 018425                          The Santa Cruz Operation 
# 018426 
# 018427                          SHA1   
# 018428 
# 018429                          Secure-Hash Algorithm 1 
# 018430 
# 018431                          TLDP   
# 018432 
# 018433                          The Linux Documentation Project 
# 018434 
# 018435                          TFTP   
# 018436 
# 018437                          Trivial File Transfer Protocol 
# 018438 
# 018439                          TLS   
# 018440 
# 018441                          Thread-Local Storage 
# 018442 
# 018443                          UID   
# 018444 
# 018445                          User Identifier 
# 018446 
# 018447                          umask   
# 018448 
# 018449                          user file-creation mask 
# 018450 
# 018451                          USB   
# 018452 
# 018453                          Universal Serial Bus 
# 018454 
# 018455                          UTC   
# 018456 
# 018457                          Coordinated Universal Time 
# 018458 
# 018459                          UUID   
# 018460 
# 018461                          Universally Unique Identifier 
# 018462 
# 018463                          VC   
# 018464 
# 018465                          Virtual Console 
# 018466 
# 018467                          VGA   
# 018468 
# 018469                          Video Graphics Array 
# 018470 
# 018471                          VT   
# 018472 
# 018473                          Virtual Terminal  
# 018474        Appendix B. Acknowledgments 
# 018475 
# 018476                          We would like to thank the following people and organizations for their contributions
# 018477                        to the Linux From Scratch Project. 
# 018478 
# 018479                          Gerard Beekmans <gerard AT linuxfromscratch D0T org> - LFS Creator 
# 018480 
# 018481                          Bruce Dubbs <bdubbs AT linuxfromscratch D0T org> - LFS Managing Editor 
# 018482 
# 018483                          Jim Gifford <jim AT linuxfromscratch D0T org> - CLFS Project Co-Leader 
# 018484 
# 018485                          Pierre Labastie <pierre AT linuxfromscratch D0T org> - BLFS Editor and ALFS Lead
# 018486                        
# 018487 
# 018488                          DJ Lucas <dj AT linuxfromscratch D0T org> - LFS and BLFS Editor 
# 018489 
# 018490                          Ken Moffat <ken AT linuxfromscratch D0T org> - BLFS Editor 
# 018491 
# 018492                          Countless other people on the various LFS and BLFS mailing lists who helped make
# 018493                        this book possible by giving their suggestions, testing the book, and submitting
# 018494                        bug reports, instructions, and their experiences with installing various packages.
# 018495                         
# 018496          Translators 
# 018497 
# 018498                          Manuel Canales Esparcia <macana AT macana-es D0T com> - Spanish LFS translation project
# 018499                        
# 018500 
# 018501                          Johan Lenglet <johan AT linuxfromscratch D0T org> - French LFS translation project
# 018502                        until 2008 
# 018503 
# 018504                          Jean-Philippe Mengual <jmengual AT linuxfromscratch D0T org> - French LFS translation
# 018505                        project 2008-2016 
# 018506 
# 018507                          Julien Lepiller <jlepiller AT linuxfromscratch D0T org> - French LFS translation
# 018508                        project 2017-present 
# 018509 
# 018510                          Anderson Lizardo <lizardo AT linuxfromscratch D0T org> - Portuguese LFS translation
# 018511                        project 
# 018512 
# 018513                          Thomas Reitelbach <tr AT erdfunkstelle D0T de> - German LFS translation project 
# 018514 
# 018515                          Anton Maisak <info AT linuxfromscratch D0T org D0T ru> - Russian LFS translation
# 018516                        project 
# 018517 
# 018518                          Elena Shevcova <helen AT linuxfromscratch D0T org D0T ru> - Russian LFS translation
# 018519                        project  
# 018520          Mirror Maintainers  
# 018521            North American Mirrors 
# 018522 
# 018523                          Scott Kveton <scott AT osuosl D0T org> - lfs.oregonstate.edu mirror 
# 018524 
# 018525                          William Astle <lost AT l-w D0T net> - ca.linuxfromscratch.org mirror 
# 018526 
# 018527                          Eujon Sellers <jpolen@rackspace.com> - lfs.introspeed.com mirror 
# 018528 
# 018529                          Justin Knierim <tim@idge.net> - lfs-matrix.net mirror  
# 018530            South American Mirrors 
# 018531 
# 018532                          Manuel Canales Esparcia <manuel AT linuxfromscratch D0T org> - lfsmirror.lfs-es.info
# 018533                        mirror 
# 018534 
# 018535                          Luis Falcon <Luis Falcon> - torredehanoi.org mirror  
# 018536            European Mirrors 
# 018537 
# 018538                          Guido Passet <guido AT primerelay D0T net> - nl.linuxfromscratch.org mirror 
# 018539 
# 018540                          Bastiaan Jacques <baafie AT planet D0T nl> - lfs.pagefault.net mirror 
# 018541 
# 018542                          Sven Cranshoff <sven D0T cranshoff AT lineo D0T be> - lfs.lineo.be mirror 
# 018543 
# 018544                          Scarlet Belgium - lfs.scarlet.be mirror 
# 018545 
# 018546                          Sebastian Faulborn <info AT aliensoft D0T org> - lfs.aliensoft.org mirror 
# 018547 
# 018548                          Stuart Fox <stuart AT dontuse D0T ms> - lfs.dontuse.ms mirror 
# 018549 
# 018550                          Ralf Uhlemann <admin AT realhost D0T de> - lfs.oss-mirror.org mirror 
# 018551 
# 018552                          Antonin Sprinzl <Antonin D0T Sprinzl AT tuwien D0T ac D0T at> - at.linuxfromscratch.org
# 018553                        mirror 
# 018554 
# 018555                          Fredrik Danerklint <fredan-lfs AT fredan D0T org> - se.linuxfromscratch.org mirror
# 018556                        
# 018557 
# 018558                          Franck <franck AT linuxpourtous D0T com> - lfs.linuxpourtous.com mirror 
# 018559 
# 018560                          Philippe Baque <baque AT cict D0T fr> - lfs.cict.fr mirror 
# 018561 
# 018562                          Vitaly Chekasin <gyouja AT pilgrims D0T ru> - lfs.pilgrims.ru mirror 
# 018563 
# 018564                          Benjamin Heil <kontakt AT wankoo D0T org> - lfs.wankoo.org mirror 
# 018565 
# 018566                          Anton Maisak <info AT linuxfromscratch D0T org D0T ru> - linuxfromscratch.org.ru
# 018567                        mirror  
# 018568            Asian Mirrors 
# 018569 
# 018570                          Satit Phermsawang <satit AT wbac D0T ac D0T th> - lfs.phayoune.org mirror 
# 018571 
# 018572                          Shizunet Co.,Ltd. <info AT shizu-net D0T jp> - lfs.mirror.shizu-net.jp mirror 
# 018573 
# 018574                          Init World <http://www.initworld.com/> - lfs.initworld.com mirror  
# 018575            Australian Mirrors 
# 018576 
# 018577                          Jason Andrade <jason AT dstc D0T edu D0T au> - au.linuxfromscratch.org mirror  
# 018578          Former Project Team Members 
# 018579 
# 018580                          Christine Barczak <theladyskye AT linuxfromscratch D0T org> - LFS Book Editor 
# 018581 
# 018582                          Archaic <archaic@linuxfromscratch.org> - LFS Technical Writer/Editor, HLFS Project
# 018583                        Leader, BLFS Editor, Hints and Patches Project Maintainer 
# 018584 
# 018585                          Matthew Burgess <matthew AT linuxfromscratch D0T org> - LFS Project Leader, LFS Technical
# 018586                        Writer/Editor 
# 018587 
# 018588                          Nathan Coulson <nathan AT linuxfromscratch D0T org> - LFS-Bootscripts Maintainer
# 018589                        
# 018590 
# 018591                          Timothy Bauscher 
# 018592 
# 018593                          Robert Briggs 
# 018594 
# 018595                          Ian Chilton 
# 018596 
# 018597                          Jeroen Coumans <jeroen AT linuxfromscratch D0T org> - Website Developer, FAQ Maintainer
# 018598                        
# 018599 
# 018600                          Manuel Canales Esparcia <manuel AT linuxfromscratch D0T org> - LFS/BLFS/HLFS XML
# 018601                        and XSL Maintainer 
# 018602 
# 018603                          Alex Groenewoud - LFS Technical Writer 
# 018604 
# 018605                          Marc Heerdink 
# 018606 
# 018607                          Jeremy Huntwork <jhuntwork AT linuxfromscratch D0T org> - LFS Technical Writer, LFS
# 018608                        LiveCD Maintainer 
# 018609 
# 018610                          Bryan Kadzban <bryan AT linuxfromscratch D0T org> - LFS Technical Writer 
# 018611 
# 018612                          Mark Hymers 
# 018613 
# 018614                          Seth W. Klein - FAQ maintainer 
# 018615 
# 018616                          Nicholas Leippe <nicholas AT linuxfromscratch D0T org> - Wiki Maintainer 
# 018617 
# 018618                          Anderson Lizardo <lizardo AT linuxfromscratch D0T org> - Website Backend-Scripts
# 018619                        Maintainer 
# 018620 
# 018621                          Randy McMurchy <randy AT linuxfromscratch D0T org> - BLFS Project Leader, LFS Editor
# 018622                        
# 018623 
# 018624                          Dan Nicholson <dnicholson AT linuxfromscratch D0T org> - LFS and BLFS Editor 
# 018625 
# 018626                          Alexander E. Patrakov <alexander AT linuxfromscratch D0T org> - LFS Technical Writer,
# 018627                        LFS Internationalization Editor, LFS Live CD Maintainer 
# 018628 
# 018629                          Simon Perreault 
# 018630 
# 018631                          Scot Mc Pherson <scot AT linuxfromscratch D0T org> - LFS NNTP Gateway Maintainer
# 018632                        
# 018633 
# 018634                          Douglas R. Reno <renodr AT linuxfromscratch D0T org> - Systemd Editor 
# 018635 
# 018636                          Ryan Oliver <ryan AT linuxfromscratch D0T org> - CLFS Project Co-Leader 
# 018637 
# 018638                          Greg Schafer <gschafer AT zip D0T com D0T au> - LFS Technical Writer and Architect
# 018639                        of the Next Generation 64-bit-enabling Build Method 
# 018640 
# 018641                          Jesse Tie-Ten-Quee - LFS Technical Writer 
# 018642 
# 018643                          James Robertson <jwrober AT linuxfromscratch D0T org> - Bugzilla Maintainer 
# 018644 
# 018645                          Tushar Teredesai <tushar AT linuxfromscratch D0T org> - BLFS Book Editor, Hints and
# 018646                        Patches Project Leader 
# 018647 
# 018648                          Jeremy Utley <jeremy AT linuxfromscratch D0T org> - LFS Technical Writer, Bugzilla
# 018649                        Maintainer, LFS-Bootscripts Maintainer 
# 018650 
# 018651                          Zack Winkles <zwinkles AT gmail D0T com> - LFS Technical Writer  
# 018652        Appendix C. Dependencies 
# 018653 
# 018654                          Every package built in LFS relies on one or more other packages in order to build
# 018655                        and install properly. Some packages even participate in circular dependencies, that
# 018656                        is, the first package depends on the second which in turn depends on the first.
# 018657                        Because of these dependencies, the order in which packages are built in LFS is very
# 018658                        important. The purpose of this page is to document the dependencies of each package
# 018659                        built in LFS. 
# 018660 
# 018661                          For each package we build, we have listed three, and sometimes four, types of dependencies.
# 018662                        The first lists what other packages need to be available in order to compile and
# 018663                        install the package in question. The second lists what packages, in addition to
# 018664                        those on the first list, need to be available in order to run the test suites. The
# 018665                        third list of dependencies are packages that require this package to be built and
# 018666                        installed in its final location before they are built and installed. In most cases,
# 018667                        this is because these packages will hard code paths to binaries within their scripts.
# 018668                        If not built in a certain order, this could result in paths of /tools/bin/[binary]
# 018669                        being placed inside scripts installed to the final system. This is obviously not
# 018670                        desirable. 
# 018671 
# 018672                          The last list of dependencies are optional packages that are not addressed in LFS,
# 018673                        but could be useful to the user. These packages may have additional mandatory or
# 018674                        optional dependencies of their own. For these dependencies, the recommended practice
# 018675                        is to install them after completion of the LFS book and then go back and rebuild
# 018676                        the LFS package. In several cases, re-installation is addressed in BLFS.  
# 018677          Acl 
# 018678           Installation depends on: Attr, Bash, Binutils, Coreutils, GCC, Gettext, Grep, M4, Make, Perl, Sed, and Texinfo
# 018679           Test suite depends on: Automake, Diffutils, Findutils, and Libtool
# 018680           Must be installed before: Coreutils, Sed, Tar, and Vim
# 018681           Optional dependencies: None  
# 018682          Attr 
# 018683           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Grep, M4, Make, Perl, Sed, and Texinfo
# 018684           Test suite depends on: Automake, Diffutils, Findutils, and Libtool
# 018685           Must be installed before: Acl and Libcap
# 018686           Optional dependencies: None  
# 018687          Autoconf 
# 018688           Installation depends on: Bash, Coreutils, Grep, M4, Make, Perl, Sed, and Texinfo
# 018689           Test suite depends on: Automake, Diffutils, Findutils, GCC, and Libtool
# 018690           Must be installed before: Automake
# 018691           Optional dependencies: Emacs  
# 018692          Automake 
# 018693           Installation depends on: Autoconf, Bash, Coreutils, Gettext, Grep, M4, Make, Perl, Sed, and Texinfo
# 018694           Test suite depends on: Binutils, Bison, Bzip2, DejaGNU, Diffutils, Expect, Findutils, Flex, GCC, Gettext, Gzip, Libtool, and Tar
# 018695           Must be installed before: None
# 018696           Optional dependencies: None  
# 018697          Bash 
# 018698           Installation depends on: Bash, Binutils, Bison, Coreutils, Diffutils, Gawk, GCC, Glibc, Grep, Make, Ncurses, Patch, Readline, Sed, and Texinfo
# 018699           Test suite depends on: Shadow
# 018700           Must be installed before: None
# 018701           Optional dependencies: Xorg  
# 018702          Bc 
# 018703           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, Grep, and Make
# 018704           Test suite depends on: Gawk
# 018705           Must be installed before: Linux Kernel
# 018706           Optional dependencies: None  
# 018707          Binutils 
# 018708           Installation depends on: Bash, Binutils, Coreutils, Diffutils, File, Flex, Gawk, GCC, Glibc, Grep, Make, Perl, Sed, Texinfo and Zlib
# 018709           Test suite depends on: DejaGNU and Expect
# 018710           Must be installed before: None
# 018711           Optional dependencies: Debuginfod  
# 018712          Bison 
# 018713           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Glibc, Grep, M4, Make, Perl, and Sed
# 018714           Test suite depends on: Diffutils, Findutils, and Flex
# 018715           Must be installed before: Kbd and Tar
# 018716           Optional dependencies: Doxygen (test suite)  
# 018717          Bzip2 
# 018718           Installation depends on: Bash, Binutils, Coreutils, Diffutils, GCC, Glibc, Make, and Patch
# 018719           Test suite depends on: None
# 018720           Must be installed before: File
# 018721           Optional dependencies: None  
# 018722          Check 
# 018723           Installation depends on: GCC, Grep, Make, Sed, and Texinfo
# 018724           Test suite depends on: None
# 018725           Must be installed before: None
# 018726           Optional dependencies: None  
# 018727          Coreutils 
# 018728           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Glibc, GMP, Grep, Libcap, Make, Patch, Perl, Sed, and Texinfo
# 018729           Test suite depends on: Diffutils, E2fsprogs, Findutils, Shadow, and Util-linux
# 018730           Must be installed before: Bash, Diffutils, Eudev, Findutils, and Man-DB
# 018731           Optional dependencies: Perl Expect and IO:Tty modules (for test suite)  
# 018732          DejaGNU 
# 018733           Installation depends on: Bash, Coreutils, Diffutils, GCC, Grep, Make, Sed, and Texinfo
# 018734           Test suite depends on: None
# 018735           Must be installed before: None
# 018736           Optional dependencies: None  
# 018737          Diffutils 
# 018738           Installation depends on: Bash, Binutils, Coreutils, Gawk, GCC, Gettext, Glibc, Grep, Make, Sed, and Texinfo
# 018739           Test suite depends on: Perl
# 018740           Must be installed before: None
# 018741           Optional dependencies: None  
# 018742          E2fsprogs 
# 018743           Installation depends on: Bash, Binutils, Coreutils, Diffutils, Gawk, GCC, Glibc, Grep, Gzip, Make, Sed, Texinfo, and Util-linux
# 018744           Test suite depends on: Procps-ng and Psmisc
# 018745           Must be installed before: None
# 018746           Optional dependencies: None  
# 018747          Eudev 
# 018748           Installation depends on: Bash, Binutils, Coreutils, Gawk, GCC, Glibc, Grep, Gperf, Make, Sed, and Util-linux
# 018749           Test suite depends on: None
# 018750           Must be installed before: None
# 018751           Optional dependencies: None  
# 018752          Expat 
# 018753           Installation depends on: Bash, Binutils, Coreutils, Gawk, GCC, Glibc, Grep, Make, and Sed
# 018754           Test suite depends on: None
# 018755           Must be installed before: Python and XML::Parser
# 018756           Optional dependencies: None  
# 018757          Expect 
# 018758           Installation depends on: Bash, Binutils, Coreutils, Diffutils, GCC, Glibc, Grep, Make, Patch, Sed, and Tcl
# 018759           Test suite depends on: None
# 018760           Must be installed before: None
# 018761           Optional dependencies: 
# 018762                tk   
# 018763          File 
# 018764           Installation depends on: Bash, Binutils, Bzip2, Coreutils, Diffutils, Gawk, GCC, Glibc, Grep, Make, Sed, Xz, and Zlib
# 018765           Test suite depends on: None
# 018766           Must be installed before: None
# 018767           Optional dependencies: None  
# 018768          Findutils 
# 018769           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Glibc, Grep, Make, Sed, and Texinfo
# 018770           Test suite depends on: DejaGNU, Diffutils, and Expect
# 018771           Must be installed before: None
# 018772           Optional dependencies: None  
# 018773          Flex 
# 018774           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Glibc, Grep, M4, Make, Patch, Sed, and Texinfo
# 018775           Test suite depends on: Bison and Gawk
# 018776           Must be installed before: Binutils, IProute2, Kbd, Kmod, and Man-DB
# 018777           Optional dependencies: None  
# 018778          Gawk 
# 018779           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Glibc, GMP, Grep, Make, MPFR, Patch, Readline, Sed, and Texinfo
# 018780           Test suite depends on: Diffutils
# 018781           Must be installed before: None
# 018782           Optional dependencies: libsigsegv  
# 018783          GCC 
# 018784           Installation depends on: Bash, Binutils, Coreutils, Diffutils, Findutils, Gawk, GCC, Gettext, Glibc, GMP, Grep, M4, Make, MPC, MPFR, Patch, Perl, Sed, Tar, Texinfo, and Zstd
# 018785           Test suite depends on: DejaGNU, Expect, and Shadow
# 018786           Must be installed before: None
# 018787           Optional dependencies: 
# 018788                GNAT and 
# 018789                ISL   
# 018790          GDBM 
# 018791           Installation depends on: Bash, Binutils, Coreutils, Diffutils, GCC, Grep, Make, and Sed
# 018792           Test suite depends on: None
# 018793           Must be installed before: None
# 018794           Optional dependencies: None  
# 018795          Gettext 
# 018796           Installation depends on: Bash, Binutils, Coreutils, Gawk, GCC, Glibc, Grep, Make, Ncurses, Sed, and Texinfo
# 018797           Test suite depends on: Diffutils, Perl, and Tcl
# 018798           Must be installed before: Automake and Bison
# 018799           Optional dependencies: None  
# 018800          Glibc 
# 018801           Installation depends on: Bash, Binutils, Bison, Coreutils, Diffutils, Gawk, GCC, Gettext, Grep, Gzip, Linux API Headers, Make, Perl, Python, Sed, and Texinfo
# 018802           Test suite depends on: File
# 018803           Must be installed before: None
# 018804           Optional dependencies: None  
# 018805          GMP 
# 018806           Installation depends on: Bash, Binutils, Coreutils, Diffutils, Gawk, GCC, Glibc, Grep, M4, Make, Sed, and Texinfo
# 018807           Test suite depends on: None
# 018808           Must be installed before: MPFR and GCC
# 018809           Optional dependencies: None  
# 018810          Gperf 
# 018811           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, and Make
# 018812           Test suite depends on: Diffutils and Expect
# 018813           Must be installed before: None
# 018814           Optional dependencies: None  
# 018815          Grep 
# 018816           Installation depends on: Bash, Binutils, Coreutils, Diffutils, GCC, Gettext, Glibc, Grep, Make, Patch, Sed, and Texinfo
# 018817           Test suite depends on: Gawk
# 018818           Must be installed before: Man-DB
# 018819           Optional dependencies: Pcre and libsigsegv  
# 018820          Groff 
# 018821           Installation depends on: Bash, Binutils, Bison, Coreutils, Gawk, GCC, Glibc, Grep, Make, Patch, Sed, and Texinfo
# 018822           Test suite depends on: No test suite available
# 018823           Must be installed before: Man-DB and Perl
# 018824           Optional dependencies: Ghostscript  
# 018825          GRUB 
# 018826           Installation depends on: Bash, Binutils, Bison, Coreutils, Diffutils, GCC, Gettext, Glibc, Grep, Make, Ncurses, Sed, Texinfo, and Xz
# 018827           Test suite depends on: None
# 018828           Must be installed before: None
# 018829           Optional dependencies: None  
# 018830          Gzip 
# 018831           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, Grep, Make, Sed, and Texinfo
# 018832           Test suite depends on: Diffutils and Less
# 018833           Must be installed before: Man-DB
# 018834           Optional dependencies: None  
# 018835          Iana-Etc 
# 018836           Installation depends on: Coreutils, Gawk, and Make
# 018837           Test suite depends on: No test suite available
# 018838           Must be installed before: Perl
# 018839           Optional dependencies: None  
# 018840          Inetutils 
# 018841           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, Grep, Make, Ncurses, Patch, Sed, Texinfo, and Zlib
# 018842           Test suite depends on: None
# 018843           Must be installed before: Tar
# 018844           Optional dependencies: None  
# 018845          Intltool 
# 018846           Installation depends on: Bash, Gawk, Glibc, Make, Perl, Sed, and XML::Parser
# 018847           Test suite depends on: Perl
# 018848           Must be installed before: None
# 018849           Optional dependencies: None  
# 018850          IProute2 
# 018851           Installation depends on: Bash, Bison, Coreutils, Flex, GCC, Glibc, Make, Libcap, Libelf, and Linux API Headers
# 018852           Test suite depends on: No test suite available
# 018853           Must be installed before: None
# 018854           Optional dependencies: Berkeley DB and Iptables  
# 018855          Kbd 
# 018856           Installation depends on: Bash, Binutils, Bison, Check, Coreutils, Flex, GCC, Gettext, Glibc, Gzip, Make, Patch, and Sed
# 018857           Test suite depends on: None
# 018858           Must be installed before: None
# 018859           Optional dependencies: None  
# 018860          Kmod 
# 018861           Installation depends on: Bash, Binutils, Bison, Coreutils, Flex, GCC, Gettext, Glibc, Gzip, Make, Pkg-config, Sed, Xz-Utils, and Zlib
# 018862           Test suite depends on: No test suite available
# 018863           Must be installed before: Eudev
# 018864           Optional dependencies: None  
# 018865          Less 
# 018866           Installation depends on: Bash, Binutils, Coreutils, Diffutils, GCC, Glibc, Grep, Make, Ncurses, and Sed
# 018867           Test suite depends on: No test suite available
# 018868           Must be installed before: Gzip
# 018869           Optional dependencies: Pcre  
# 018870          Libcap 
# 018871           Installation depends on: Attr, Bash, Binutils, Coreutils, GCC, Glibc, Perl, Make, and Sed
# 018872           Test suite depends on: None
# 018873           Must be installed before: IProute2 and Shadow
# 018874           Optional dependencies: Linux-PAM  
# 018875          Libelf 
# 018876           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, and Make
# 018877           Test suite depends on: None
# 018878           Must be installed before: IProute2 and Linux Kernel
# 018879           Optional dependencies: None  
# 018880          Libffi 
# 018881           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, Make, and Sed
# 018882           Test suite depends on: DejaGnu
# 018883           Must be installed before: Python
# 018884           Optional dependencies: None  
# 018885          Libpipeline 
# 018886           Installation depends on: Bash, Binutils, Coreutils, Diffutils, Gawk, GCC, Glibc, Grep, Make, Sed, and Texinfo
# 018887           Test suite depends on: Check
# 018888           Must be installed before: Man-DB
# 018889           Optional dependencies: None  
# 018890          Libtool 
# 018891           Installation depends on: Bash, Binutils, Coreutils, Diffutils, Gawk, GCC, Glibc, Grep, Make, Sed, and Texinfo
# 018892           Test suite depends on: Autoconf, Automake, and Findutils
# 018893           Must be installed before: None
# 018894           Optional dependencies: None  
# 018895          Linux Kernel 
# 018896           Installation depends on: Bash, Bc, Binutils, Coreutils, Diffutils, Findutils, GCC, Glibc, Grep, Gzip, Kmod, Libelf, Make, Ncurses, OpenSSL, Perl, and Sed
# 018897           Test suite depends on: No test suite available
# 018898           Must be installed before: None
# 018899           Optional dependencies: None  
# 018900          M4 
# 018901           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, Grep, Make, Sed, and Texinfo
# 018902           Test suite depends on: Diffutils
# 018903           Must be installed before: Autoconf and Bison
# 018904           Optional dependencies: libsigsegv  
# 018905          Make 
# 018906           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Glibc, Grep, Make, Sed, and Texinfo
# 018907           Test suite depends on: Perl and Procps-ng
# 018908           Must be installed before: None
# 018909           Optional dependencies: None  
# 018910          Man-DB 
# 018911           Installation depends on: Bash, Binutils, Bzip2, Coreutils, Flex, GCC, GDBM, Gettext, Glibc, Grep, Groff, Gzip, Less, Libpipeline, Make, Sed, and Xz
# 018912           Test suite depends on: Util-linux
# 018913           Must be installed before: None
# 018914           Optional dependencies: None  
# 018915          Man-Pages 
# 018916           Installation depends on: Bash, Coreutils, and Make
# 018917           Test suite depends on: No test suite available
# 018918           Must be installed before: None
# 018919           Optional dependencies: None  
# 018920          Meson 
# 018921           Installation depends on: Ninja and Python
# 018922           Test suite depends on: No test suite available
# 018923           Must be installed before: Systemd
# 018924           Optional dependencies: None  
# 018925          MPC 
# 018926           Installation depends on: Bash, Binutils, Coreutils, Diffutils, Gawk, GCC, Glibc, Grep, GMP, Make, MPFR, Sed, and Texinfo
# 018927           Test suite depends on: None
# 018928           Must be installed before: GCC
# 018929           Optional dependencies: None  
# 018930          MPFR 
# 018931           Installation depends on: Bash, Binutils, Coreutils, Diffutils, Gawk, GCC, Glibc, Grep, GMP, Make, Sed, and Texinfo
# 018932           Test suite depends on: None
# 018933           Must be installed before: Gawk and GCC
# 018934           Optional dependencies: None  
# 018935          Ncurses 
# 018936           Installation depends on: Bash, Binutils, Coreutils, Diffutils, Gawk, GCC, Glibc, Grep, Make, Patch, and Sed
# 018937           Test suite depends on: No test suite available
# 018938           Must be installed before: Bash, GRUB, Inetutils, Less, Procps-ng, Psmisc, Readline, Texinfo, Util-linux, and Vim
# 018939           Optional dependencies: None  
# 018940          Ninja 
# 018941           Installation depends on: Binutils, Coreutils, GCC, and Python
# 018942           Test suite depends on: None
# 018943           Must be installed before: Meson
# 018944           Optional dependencies: Asciidoc, Doxygen, Emacs, and re2c  
# 018945          Openssl 
# 018946           Installation depends on: Binutils, Coreutils, GCC, Make, and Perl
# 018947           Test suite depends on: None
# 018948           Must be installed before: Linux
# 018949           Optional dependencies: None  
# 018950          Patch 
# 018951           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, Grep, Make, and Sed
# 018952           Test suite depends on: Diffutils
# 018953           Must be installed before: None
# 018954           Optional dependencies: Ed  
# 018955          Perl 
# 018956           Installation depends on: Bash, Binutils, Coreutils, Gawk, GCC, GDBM, Glibc, Grep, Groff, Make, Sed, and Zlib
# 018957           Test suite depends on: Iana-Etc and Procps-ng
# 018958           Must be installed before: Autoconf
# 018959           Optional dependencies: None  
# 018960          Pkg-config 
# 018961           Installation depends on: Bash, Binutils, Coreutils, Gawk, GCC, Glibc, Grep, Make, Popt, and Sed
# 018962           Test suite depends on: None
# 018963           Must be installed before: Kmod
# 018964           Optional dependencies: None  
# 018965          Popt 
# 018966           Installation depends on: Bash, Binutils, Coreutils, Gawk, GCC, Glibc, Grep, and Make
# 018967           Test suite depends on: Diffutils and Sed
# 018968           Must be installed before: Pkg-config
# 018969           Optional dependencies: None  
# 018970          Procps-ng 
# 018971           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, Make, and Ncurses
# 018972           Test suite depends on: DejaGNU
# 018973           Must be installed before: None
# 018974           Optional dependencies: None  
# 018975          Psmisc 
# 018976           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Glibc, Grep, Make, Ncurses, and Sed
# 018977           Test suite depends on: No test suite available
# 018978           Must be installed before: None
# 018979           Optional dependencies: None  
# 018980          Python 
# 018981           Installation depends on: Bash, Binutils, Coreutils, Expat, GCC, Gdbm, Gettext, Glibc, Grep, Libffi, Make, Ncurses, Sed, and Util-linux
# 018982           Test suite depends on: GDB and Valgrind
# 018983           Must be installed before: Ninja
# 018984           Optional dependencies: Berkeley DB, OpenSSL, SQLite, and Tk  
# 018985          Readline 
# 018986           Installation depends on: Bash, Binutils, Coreutils, Gawk, GCC, Glibc, Grep, Make, Ncurses, Patch, Sed, and Texinfo
# 018987           Test suite depends on: No test suite available
# 018988           Must be installed before: Bash and Gawk
# 018989           Optional dependencies: None  
# 018990          Sed 
# 018991           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Glibc, Grep, Make, Sed, and Texinfo
# 018992           Test suite depends on: Diffutils and Gawk
# 018993           Must be installed before: E2fsprogs, File, Libtool, and Shadow
# 018994           Optional dependencies: None  
# 018995          Shadow 
# 018996           Installation depends on: Acl, Attr, Bash, Binutils, Coreutils, Diffutils, Findutils, Gawk, GCC, Gettext, Glibc, Grep, Libcap, Make, and Sed
# 018997           Test suite depends on: No test suite available
# 018998           Must be installed before: Coreutils
# 018999           Optional dependencies: Cracklib and PAM  
# 019000          Sysklogd 
# 019001           Installation depends on: Binutils, Coreutils, GCC, Glibc, Make, and Patch
# 019002           Test suite depends on: No test suite available
# 019003           Must be installed before: None
# 019004           Optional dependencies: None  
# 019005          Systemd 
# 019006           Installation depends on: Acl, Attr, Bash, Binutils, Coreutils, Diffutils, Expat, Gawk, GCC, Glibc, Gperf, Grep, Intltool, Libcap, Meson, Sed, and Util-linux
# 019007           Test suite depends on: None
# 019008           Must be installed before: None
# 019009           Optional dependencies: Many, see 
# 019010                BLFS systemd page   
# 019011          Sysvinit 
# 019012           Installation depends on: Binutils, Coreutils, GCC, Glibc, Make, and Sed
# 019013           Test suite depends on: No test suite available
# 019014           Must be installed before: None
# 019015           Optional dependencies: None  
# 019016          Tar 
# 019017           Installation depends on: Acl, Attr, Bash, Binutils, Bison, Coreutils, GCC, Gettext, Glibc, Grep, Inetutils, Make, Sed, and Texinfo
# 019018           Test suite depends on: Autoconf, Diffutils, Findutils, Gawk, and Gzip
# 019019           Must be installed before: None
# 019020           Optional dependencies: None  
# 019021          Tcl 
# 019022           Installation depends on: Bash, Binutils, Coreutils, Diffutils, GCC, Glibc, Grep, Make, and Sed
# 019023           Test suite depends on: None
# 019024           Must be installed before: None
# 019025           Optional dependencies: None  
# 019026          Texinfo 
# 019027           Installation depends on: Bash, Binutils, Coreutils, GCC, Gettext, Glibc, Grep, Make, Ncurses, Patch, and Sed
# 019028           Test suite depends on: None
# 019029           Must be installed before: None
# 019030           Optional dependencies: None  
# 019031          Util-linux 
# 019032           Installation depends on: Bash, Binutils, Coreutils, Diffutils, Eudev, Findutils, Gawk, GCC, Gettext, Glibc, Grep, Make, Ncurses, Sed, and Zlib
# 019033           Test suite depends on: None
# 019034           Must be installed before: None
# 019035           Optional dependencies: 
# 019036                Libcap-ng   
# 019037          Vim 
# 019038           Installation depends on: Acl, Attr, Bash, Binutils, Coreutils, Diffutils, GCC, Glibc, Grep, Make, Ncurses, and Sed
# 019039           Test suite depends on: None
# 019040           Must be installed before: None
# 019041           Optional dependencies: Xorg, GTK+2, LessTif, Python, Tcl, Ruby, and GPM  
# 019042          XML::Parser 
# 019043           Installation depends on: Bash, Binutils, Coreutils, Expat, GCC, Glibc, Make, and Perl
# 019044           Test suite depends on: Perl
# 019045           Must be installed before: Intltool
# 019046           Optional dependencies: None  
# 019047          Xz 
# 019048           Installation depends on: Bash, Binutils, Coreutils, Diffutils, GCC, Glibc, and Make
# 019049           Test suite depends on: None
# 019050           Must be installed before: Eudev, File, GRUB, Kmod, and Man-DB
# 019051           Optional dependencies: None  
# 019052          Zlib 
# 019053           Installation depends on: Bash, Binutils, Coreutils, GCC, Glibc, Make, and Sed
# 019054           Test suite depends on: None
# 019055           Must be installed before: File, Kmod, Perl, and Util-linux
# 019056           Optional dependencies: None  
# 019057          Zstd 
# 019058           Installation depends on: Binutils, Coreutils, GCC, Glibc, Gzip, Make, and Xz
# 019059           Test suite depends on: None
# 019060           Must be installed before: GCC
# 019061           Optional dependencies: None  
# 019062        Appendix D. Boot and sysconfig scripts version-20210201 
# 019063 
# 019064                          The scripts in this appendix are listed by the directory where they normally reside.
# 019065                        The order is /etc/rc.d/init.d, /etc/sysconfig, /etc/sysconfig/network-devices, and
# 019066                        /etc/sysconfig/network-devices/services. Within each section, the files are listed
# 019067                        in the order they are normally called.  
# 019068        D.1. /etc/rc.d/init.d/rc 
# 019069 
# 019070                          The rcscript is the first script called by init and initiates the boot process. 



# 019074 #!/bin/bash
# 019075 ########################################################################
# 019076 # Begin rc
# 019077 #
# 019078 # Description : Main Run Level Control Script
# 019079 #
# 019080 # Authors     : Gerard Beekmans  - gerard AT linuxfromscratch D0T org
# 019081 #             : DJ Lucas - dj AT linuxfromscratch D0T org
# 019082 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 019083 #
# 019084 # Version     : LFS 7.0
# 019085 #
# 019086 ########################################################################
# 019087 
# 019088 . /lib/lsb/init-functions
# 019089 
# 019090 print_error_msg()
# 019091 {
# 019092    log_failure_msg
# 019093    # $i is set when called
# 019094    MSG="FAILURE:\n\nYou should not be reading this error message.\n\n" 
# 019095    MSG="${MSG}It means that an unforeseen error took place in\n"
# 019096    MSG="${MSG}${i},\n"
# 019097    MSG="${MSG}which exited with a return value of ${error_value}.\n"
# 019098   
# 019099    MSG="${MSG}If you're able to track this error down to a bug in one of\n"
# 019100    MSG="${MSG}the files provided by the ${DISTRO_MINI} book,\n"
# 019101    MSG="${MSG}please be so kind to inform us at ${DISTRO_CONTACT}.\n"
# 019102    log_failure_msg "${MSG}"
# 019103 
# 019104    log_info_msg "Press Enter to continue..."
# 019105    wait_for_user
# 019106 }
# 019107 
# 019108 check_script_status()
# 019109 {
# 019110    # $i is set when called
# 019111    if [ ! -f ${i} ]; then
# 019112       log_warning_msg "${i} is not a valid symlink." 
# 019113       SCRIPT_STAT="1"
# 019114    fi
# 019115 
# 019116    if [ ! -x ${i} ]; then
# 019117       log_warning_msg "${i} is not executable, skipping."
# 019118       SCRIPT_STAT="1"
# 019119    fi
# 019120 }
# 019121 
# 019122 run()
# 019123 {
# 019124    if [ -z $interactive ]; then
# 019125       ${1} ${2}
# 019126       return $?
# 019127    fi
# 019128 
# 019129    while true; do
# 019130       read -p "Run ${1} ${2} (Yes/no/continue)? " -n 1 runit
# 019131       echo
# 019132 
# 019133       case ${runit} in
# 019134          c | C)
# 019135             interactive=""
# 019136             ${i} ${2}
# 019137             ret=${?}
# 019138             break;
# 019139             ;;
# 019140 
# 019141          n | N)
# 019142             return 0
# 019143             ;;
# 019144 
# 019145          y | Y)
# 019146             ${i} ${2}
# 019147             ret=${?}
# 019148             break
# 019149             ;;
# 019150       esac
# 019151    done
# 019152 
# 019153    return $ret
# 019154 }
# 019155 
# 019156 # Read any local settings/overrides
# 019157 [ -r /etc/sysconfig/rc.site ] && source /etc/sysconfig/rc.site
# 019158 
# 019159 DISTRO=${DISTRO:-"Linux From Scratch"}
# 019160 DISTRO_CONTACT=${DISTRO_CONTACT:-"lfs-dev@linuxfromscratch.org (Registration required)"}
# 019161 DISTRO_MINI=${DISTRO_MINI:-"LFS"}
# 019162 IPROMPT=${IPROMPT:-"no"}
# 019163 
# 019164 # These 3 signals will not cause our script to exit
# 019165 trap "" INT QUIT TSTP
# 019166 
# 019167 [ "${1}" != "" ] && runlevel=${1}
# 019168 
# 019169 if [ "${runlevel}" == "" ]; then
# 019170    echo "Usage: ${0} <runlevel>" >&2
# 019171    exit 1
# 019172 fi
# 019173 
# 019174 previous=${PREVLEVEL}
# 019175 [ "${previous}" == "" ] && previous=N
# 019176 
# 019177 if [ ! -d /etc/rc.d/rc${runlevel}.d ]; then
# 019178    log_info_msg "/etc/rc.d/rc${runlevel}.d does not exist.\n" 
# 019179    exit 1
# 019180 fi
# 019181 
# 019182 if [ "$runlevel" == "6" -o "$runlevel" == "0" ]; then IPROMPT="no"; fi
# 019183 
# 019184 # Note: In ${LOGLEVEL:-7}, it is ':' 'dash' '7', not minus 7
# 019185 if [ "$runlevel" == "S" ]; then 
# 019186    [ -r /etc/sysconfig/console ] && source /etc/sysconfig/console 
# 019187    dmesg -n "${LOGLEVEL:-7}" 
# 019188 fi
# 019189 
# 019190 if [ "${IPROMPT}" == "yes" -a "${runlevel}" == "S" ]; then
# 019191    # The total length of the distro welcome string, without escape codes
# 019192    wlen=${wlen:-$(echo "Welcome to ${DISTRO}" | wc -c )}
# 019193    welcome_message=${welcome_message:-"Welcome to ${INFO}${DISTRO}${NORMAL}"}
# 019194 
# 019195    # The total length of the interactive string, without escape codes
# 019196    ilen=${ilen:-$(echo "Press 'I' to enter interactive startup" | wc -c )}
# 019197    i_message=${i_message:-"Press '${FAILURE}I${NORMAL}' to enter interactive startup"}
# 019198 
# 019199 
# 019200    # dcol and icol are spaces before the message to center the message
# 019201    # on screen. itime is the amount of wait time for the user to press a key
# 019202    wcol=$(( ( ${COLUMNS} - ${wlen} ) / 2 ))
# 019203    icol=$(( ( ${COLUMNS} - ${ilen} ) / 2 ))
# 019204    itime=${itime:-"3"}
# 019205 
# 019206    echo -e "\n\n"
# 019207    echo -e "\\033[${wcol}G${welcome_message}"
# 019208    echo -e "\\033[${icol}G${i_message}${NORMAL}"
# 019209    echo ""
# 019210    read -t "${itime}" -n 1 interactive 2>&1 > /dev/null
# 019211 fi
# 019212 
# 019213 # Make lower case
# 019214 [ "${interactive}" == "I" ] && interactive="i"
# 019215 [ "${interactive}" != "i" ] && interactive=""
# 019216 
# 019217 # Read the state file if it exists from runlevel S
# 019218 [ -r /run/interactive ] && source /run/interactive
# 019219 
# 019220 # Attempt to stop all services started by the previous runlevel,
# 019221 # and killed in this runlevel
# 019222 if [ "${previous}" != "N" ]; then
# 019223    for i in $(ls -v /etc/rc.d/rc${runlevel}.d/K* 2> /dev/null)
# 019224    do
# 019225       check_script_status
# 019226       if [ "${SCRIPT_STAT}" == "1" ]; then
# 019227          SCRIPT_STAT="0"
# 019228          continue
# 019229       fi
# 019230 
# 019231       suffix=${i#/etc/rc.d/rc$runlevel.d/K[0-9][0-9]}
# 019232       prev_start=/etc/rc.d/rc$previous.d/S[0-9][0-9]$suffix
# 019233       sysinit_start=/etc/rc.d/rcS.d/S[0-9][0-9]$suffix
# 019234 
# 019235       if [ "${runlevel}" != "0" -a "${runlevel}" != "6" ]; then
# 019236          if [ ! -f ${prev_start} -a  ! -f ${sysinit_start} ]; then
# 019237             MSG="WARNING:\n\n${i} can't be "
# 019238             MSG="${MSG}executed because it was not "
# 019239             MSG="${MSG}not started in the previous "
# 019240             MSG="${MSG}runlevel (${previous})."
# 019241             log_warning_msg "$MSG"
# 019242             continue
# 019243          fi
# 019244       fi
# 019245 
# 019246       run ${i} stop
# 019247       error_value=${?}
# 019248 
# 019249       if [ "${error_value}" != "0" ]; then print_error_msg; fi
# 019250    done
# 019251 fi
# 019252 
# 019253 if [ "${previous}" == "N" ]; then export IN_BOOT=1; fi
# 019254 
# 019255 if [ "$runlevel" == "6" -a -n "${FASTBOOT}" ]; then
# 019256    touch /fastboot
# 019257 fi
# 019258 
# 019259 
# 019260 # Start all functions in this runlevel
# 019261 for i in $( ls -v /etc/rc.d/rc${runlevel}.d/S* 2> /dev/null)
# 019262 do
# 019263    if [ "${previous}" != "N" ]; then
# 019264       suffix=${i#/etc/rc.d/rc$runlevel.d/S[0-9][0-9]}
# 019265       stop=/etc/rc.d/rc$runlevel.d/K[0-9][0-9]$suffix
# 019266       prev_start=/etc/rc.d/rc$previous.d/S[0-9][0-9]$suffix
# 019267 
# 019268       [ -f ${prev_start} -a ! -f ${stop} ] && continue
# 019269    fi
# 019270 
# 019271    check_script_status
# 019272       if [ "${SCRIPT_STAT}" == "1" ]; then
# 019273          SCRIPT_STAT="0"
# 019274          continue
# 019275       fi
# 019276 
# 019277    case ${runlevel} in
# 019278       0|6)
# 019279          run ${i} stop
# 019280          ;;
# 019281       *)
# 019282          run ${i} start
# 019283          ;;
# 019284    esac
# 019285 
# 019286    error_value=${?}
# 019287 
# 019288    if [ "${error_value}" != "0" ]; then print_error_msg; fi
# 019289 done
# 019290 
# 019291 # Store interactive variable on switch from runlevel S and remove if not
# 019292 if [ "${runlevel}" == "S" -a "${interactive}" == "i" ]; then
# 019293     echo "interactive=\"i\"" > /run/interactive
# 019294 else
# 019295     rm -f /run/interactive 2> /dev/null
# 019296 fi
# 019297 
# 019298 # Copy the boot log on initial boot only
# 019299 if [ "${previous}" == "N" -a  "${runlevel}" != "S" ]; then
# 019300    cat $BOOTLOG >> /var/log/boot.log
# 019301       
# 019302    # Mark the end of boot
# 019303    echo "--------" >> /var/log/boot.log
# 019304    
# 019305    # Remove the temporary file
# 019306    rm -f $BOOTLOG 2> /dev/null
# 019307 fi
# 019308 
# 019309 # End rc
# 019310 

 
# 019313        D.2. /lib/lsb/init-functions 



# 019317 #!/bin/sh
# 019318 ########################################################################
# 019319 # 
# 019320 # Begin /lib/lsb/init-funtions
# 019321 #
# 019322 # Description : Run Level Control Functions
# 019323 #
# 019324 # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# 019325 #             : DJ Lucas - dj AT linuxfromscratch D0T org
# 019326 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 019327 #
# 019328 # Version     : LFS 7.0
# 019329 #
# 019330 # Notes       : With code based on Matthias Benkmann's simpleinit-msb
# 019331 #               http://winterdrache.de/linux/newboot/index.html
# 019332 #
# 019333 #               The file should be located in /lib/lsb
# 019334 #
# 019335 ########################################################################
# 019336 
# 019337 ## Environmental setup
# 019338 # Setup default values for environment
# 019339 umask 022
# 019340 export PATH="/bin:/usr/bin:/sbin:/usr/sbin"
# 019341 
# 019342 ## Set color commands, used via echo
# 019343 # Please consult `man console_codes for more information
# 019344 # under the "ECMA-48 Set Graphics Rendition" section
# 019345 #
# 019346 # Warning: when switching from a 8bit to a 9bit font,
# 019347 # the linux console will reinterpret the bold (1;) to
# 019348 # the top 256 glyphs of the 9bit font.  This does
# 019349 # not affect framebuffer consoles
# 019350 
# 019351 NORMAL="\\033[0;39m"         # Standard console grey
# 019352 SUCCESS="\\033[1;32m"        # Success is green
# 019353 WARNING="\\033[1;33m"        # Warnings are yellow
# 019354 FAILURE="\\033[1;31m"        # Failures are red
# 019355 INFO="\\033[1;36m"           # Information is light cyan
# 019356 BRACKET="\\033[1;34m"        # Brackets are blue
# 019357 
# 019358 # Use a colored prefix
# 019359 BMPREFIX="      "
# 019360 SUCCESS_PREFIX="${SUCCESS}  *  ${NORMAL} "
# 019361 FAILURE_PREFIX="${FAILURE}*****${NORMAL} "
# 019362 WARNING_PREFIX="${WARNING} *** ${NORMAL} "
# 019363 SKIP_PREFIX="${INFO}  S   ${NORMAL}"
# 019364 
# 019365 SUCCESS_SUFFIX="${BRACKET}[${SUCCESS}  OK  ${BRACKET}]${NORMAL}"
# 019366 FAILURE_SUFFIX="${BRACKET}[${FAILURE} FAIL ${BRACKET}]${NORMAL}"
# 019367 WARNING_SUFFIX="${BRACKET}[${WARNING} WARN ${BRACKET}]${NORMAL}"
# 019368 SKIP_SUFFIX="${BRACKET}[${INFO} SKIP ${BRACKET}]${NORMAL}"
# 019369 
# 019370 BOOTLOG=/run/bootlog
# 019371 KILLDELAY=3
# 019372 SCRIPT_STAT="0"
# 019373 
# 019374 # Set any user specified environment variables e.g. HEADLESS
# 019375 [ -r /etc/sysconfig/rc.site ]  && . /etc/sysconfig/rc.site
# 019376 
# 019377 ## Screen Dimensions
# 019378 # Find current screen size
# 019379 if [ -z "${COLUMNS}" ]; then
# 019380    COLUMNS=$(stty size)
# 019381    COLUMNS=${COLUMNS##* }
# 019382 fi
# 019383 
# 019384 # When using remote connections, such as a serial port, stty size returns 0
# 019385 if [ "${COLUMNS}" = "0" ]; then
# 019386    COLUMNS=80
# 019387 fi
# 019388 
# 019389 ## Measurements for positioning result messages
# 019390 COL=$((${COLUMNS} - 8))
# 019391 WCOL=$((${COL} - 2))
# 019392 
# 019393 ## Set Cursor Position Commands, used via echo
# 019394 SET_COL="\\033[${COL}G"      # at the $COL char
# 019395 SET_WCOL="\\033[${WCOL}G"    # at the $WCOL char
# 019396 CURS_UP="\\033[1A\\033[0G"   # Up one line, at the 0'th char
# 019397 CURS_ZERO="\\033[0G"
# 019398 
# 019399 ################################################################################
# 019400 # start_daemon()                                                               #
# 019401 # Usage: start_daemon [-f] [-n nicelevel] [-p pidfile] pathname [args...]      #
# 019402 #                                                                              #
# 019403 # Purpose: This runs the specified program as a daemon                         #
# 019404 #                                                                              #
# 019405 # Inputs: -f: (force) run the program even if it is already running.           #
# 019406 #         -n nicelevel: specify a nice level. See 'man nice(1)'.               #
# 019407 #         -p pidfile: use the specified file to determine PIDs.                #
# 019408 #         pathname: the complete path to the specified program                 #
# 019409 #         args: additional arguments passed to the program (pathname)          #
# 019410 #                                                                              #
# 019411 # Return values (as defined by LSB exit codes):                                #
# 019412 #       0 - program is running or service is OK                                #
# 019413 #       1 - generic or unspecified error                                       #
# 019414 #       2 - invalid or excessive argument(s)                                   #
# 019415 #       5 - program is not installed                                           #
# 019416 ################################################################################
# 019417 start_daemon()
# 019418 {
# 019419     local force=""
# 019420     local nice="0"
# 019421     local pidfile=""
# 019422     local pidlist=""
# 019423     local retval=""
# 019424 
# 019425     # Process arguments
# 019426     while true
# 019427     do
# 019428         case "${1}" in
# 019429 
# 019430             -f)
# 019431                 force="1"
# 019432                 shift 1
# 019433                 ;;
# 019434 
# 019435             -n)
# 019436                 nice="${2}"
# 019437                 shift 2
# 019438                 ;;
# 019439 
# 019440             -p)
# 019441                 pidfile="${2}"
# 019442                 shift 2
# 019443                 ;;
# 019444 
# 019445             -*)
# 019446                 return 2
# 019447                 ;;
# 019448 
# 019449             *)
# 019450                 program="${1}"
# 019451                 break
# 019452                 ;;
# 019453         esac
# 019454     done
# 019455 
# 019456     # Check for a valid program
# 019457     if [ ! -e "${program}" ]; then return 5; fi
# 019458 
# 019459     # Execute
# 019460     if [ -z "${force}" ]; then
# 019461         if [ -z "${pidfile}" ]; then
# 019462             # Determine the pid by discovery
# 019463             pidlist=`pidofproc "${1}"`
# 019464             retval="${?}"
# 019465         else
# 019466             # The PID file contains the needed PIDs
# 019467             # Note that by LSB requirement, the path must be given to pidofproc,
# 019468             # however, it is not used by the current implementation or standard.
# 019469             pidlist=`pidofproc -p "${pidfile}" "${1}"`
# 019470             retval="${?}"
# 019471         fi
# 019472 
# 019473         # Return a value ONLY 
# 019474         # It is the init script's (or distribution's functions) responsibilty
# 019475         # to log messages!
# 019476         case "${retval}" in
# 019477 
# 019478             0)
# 019479                 # Program is already running correctly, this is a 
# 019480                 # successful start.
# 019481                 return 0
# 019482                 ;;
# 019483 
# 019484             1)
# 019485                 # Program is not running, but an invalid pid file exists
# 019486                 # remove the pid file and continue
# 019487                 rm -f "${pidfile}"
# 019488                 ;;
# 019489 
# 019490             3)
# 019491                 # Program is not running and no pidfile exists
# 019492                 # do nothing here, let start_deamon continue.
# 019493                 ;;
# 019494 
# 019495             *)
# 019496                 # Others as returned by status values shall not be interpreted
# 019497                 # and returned as an unspecified error.
# 019498                 return 1
# 019499                 ;;
# 019500         esac
# 019501     fi
# 019502 
# 019503     # Do the start!
# 019504     nice -n "${nice}" "${@}"
# 019505 }
# 019506 
# 019507 ################################################################################
# 019508 # killproc()                                                                   #
# 019509 # Usage: killproc [-p pidfile] pathname [signal]                               #
# 019510 #                                                                              #
# 019511 # Purpose: Send control signals to running processes                           #
# 019512 #                                                                              #
# 019513 # Inputs: -p pidfile, uses the specified pidfile                               #
# 019514 #         pathname, pathname to the specified program                          #
# 019515 #         signal, send this signal to pathname                                 #
# 019516 #                                                                              #
# 019517 # Return values (as defined by LSB exit codes):                                #
# 019518 #       0 - program (pathname) has stopped/is already stopped or a             #
# 019519 #           running program has been sent specified signal and stopped         #
# 019520 #           successfully                                                       #
# 019521 #       1 - generic or unspecified error                                       #
# 019522 #       2 - invalid or excessive argument(s)                                   #
# 019523 #       5 - program is not installed                                           #
# 019524 #       7 - program is not running and a signal was supplied                   #
# 019525 ################################################################################
# 019526 killproc()
# 019527 {
# 019528     local pidfile
# 019529     local program
# 019530     local prefix
# 019531     local progname
# 019532     local signal="-TERM"
# 019533     local fallback="-KILL"
# 019534     local nosig
# 019535     local pidlist
# 019536     local retval
# 019537     local pid
# 019538     local delay="30"
# 019539     local piddead
# 019540     local dtime
# 019541 
# 019542     # Process arguments
# 019543     while true; do
# 019544         case "${1}" in
# 019545             -p)
# 019546                 pidfile="${2}"
# 019547                 shift 2
# 019548                 ;;
# 019549  
# 019550              *)
# 019551                  program="${1}"
# 019552                  if [ -n "${2}" ]; then
# 019553                      signal="${2}"
# 019554                      fallback=""
# 019555                  else
# 019556                      nosig=1
# 019557                  fi
# 019558 
# 019559                  # Error on additional arguments
# 019560                  if [ -n "${3}" ]; then
# 019561                      return 2
# 019562                  else 
# 019563                      break
# 019564                  fi                 
# 019565                  ;;
# 019566         esac
# 019567     done
# 019568 
# 019569     # Check for a valid program
# 019570     if [ ! -e "${program}" ]; then return 5; fi
# 019571 
# 019572     # Check for a valid signal
# 019573     check_signal "${signal}"
# 019574     if [ "${?}" -ne "0" ]; then return 2; fi
# 019575 
# 019576     # Get a list of pids
# 019577     if [ -z "${pidfile}" ]; then
# 019578         # determine the pid by discovery
# 019579         pidlist=`pidofproc "${1}"`
# 019580         retval="${?}"
# 019581     else
# 019582         # The PID file contains the needed PIDs
# 019583         # Note that by LSB requirement, the path must be given to pidofproc,
# 019584         # however, it is not used by the current implementation or standard.
# 019585         pidlist=`pidofproc -p "${pidfile}" "${1}"`
# 019586         retval="${?}"
# 019587     fi
# 019588 
# 019589     # Return a value ONLY
# 019590     # It is the init script's (or distribution's functions) responsibilty
# 019591     # to log messages!
# 019592     case "${retval}" in
# 019593 
# 019594         0)
# 019595             # Program is running correctly
# 019596             # Do nothing here, let killproc continue.
# 019597             ;;
# 019598 
# 019599         1)
# 019600             # Program is not running, but an invalid pid file exists
# 019601             # Remove the pid file.
# 019602             rm -f "${pidfile}"
# 019603 
# 019604             # This is only a success if no signal was passed.
# 019605             if [ -n "${nosig}" ]; then
# 019606                 return 0
# 019607             else
# 019608                 return 7
# 019609             fi
# 019610             ;;
# 019611 
# 019612         3)
# 019613             # Program is not running and no pidfile exists
# 019614             # This is only a success if no signal was passed.
# 019615             if [ -n "${nosig}" ]; then
# 019616                 return 0
# 019617             else
# 019618                 return 7
# 019619             fi
# 019620             ;;
# 019621 
# 019622         *)
# 019623             # Others as returned by status values shall not be interpreted
# 019624             # and returned as an unspecified error.
# 019625             return 1
# 019626             ;;
# 019627     esac
# 019628 
# 019629     # Perform different actions for exit signals and control signals
# 019630     check_sig_type "${signal}"
# 019631 
# 019632     if [ "${?}" -eq "0" ]; then # Signal is used to terminate the program
# 019633 
# 019634         # Account for empty pidlist (pid file still exists and no 
# 019635         # signal was given)
# 019636         if [ "${pidlist}" != "" ]; then
# 019637 
# 019638             # Kill the list of pids
# 019639             for pid in ${pidlist}; do
# 019640 
# 019641                 kill -0 "${pid}" 2> /dev/null
# 019642 
# 019643                 if [ "${?}" -ne "0" ]; then
# 019644                     # Process is dead, continue to next and assume all is well
# 019645                     continue
# 019646                 else
# 019647                     kill "${signal}" "${pid}" 2> /dev/null
# 019648 
# 019649                     # Wait up to ${delay}/10 seconds to for "${pid}" to 
# 019650                     # terminate in 10ths of a second
# 019651 
# 019652                     while [ "${delay}" -ne "0" ]; do
# 019653                         kill -0 "${pid}" 2> /dev/null || piddead="1"
# 019654                         if [ "${piddead}" = "1" ]; then break; fi
# 019655                         sleep 0.1
# 019656                         delay="$(( ${delay} - 1 ))"
# 019657                     done
# 019658 
# 019659                     # If a fallback is set, and program is still running, then
# 019660                     # use the fallback
# 019661                     if [ -n "${fallback}" -a "${piddead}" != "1" ]; then
# 019662                         kill "${fallback}" "${pid}" 2> /dev/null
# 019663                         sleep 1
# 019664                         # Check again, and fail if still running
# 019665                         kill -0 "${pid}" 2> /dev/null && return 1
# 019666                     fi
# 019667                 fi
# 019668             done
# 019669         fi
# 019670 
# 019671         # Check for and remove stale PID files.
# 019672         if [ -z "${pidfile}" ]; then
# 019673             # Find the basename of $program
# 019674             prefix=`echo "${program}" | sed 's/[^/]*$//'`
# 019675             progname=`echo "${program}" | sed "s@${prefix}@@"`
# 019676 
# 019677             if [ -e "/run/${progname}.pid" ]; then
# 019678                 rm -f "/run/${progname}.pid" 2> /dev/null
# 019679             fi
# 019680         else
# 019681             if [ -e "${pidfile}" ]; then rm -f "${pidfile}" 2> /dev/null; fi
# 019682         fi
# 019683 
# 019684     # For signals that do not expect a program to exit, simply
# 019685     # let kill do its job, and evaluate kill's return for value
# 019686 
# 019687     else # check_sig_type - signal is not used to terminate program
# 019688         for pid in ${pidlist}; do
# 019689             kill "${signal}" "${pid}"
# 019690             if [ "${?}" -ne "0" ]; then return 1; fi
# 019691         done
# 019692     fi
# 019693 }
# 019694 
# 019695 ################################################################################
# 019696 # pidofproc()                                                                  #
# 019697 # Usage: pidofproc [-p pidfile] pathname                                       #
# 019698 #                                                                              #
# 019699 # Purpose: This function returns one or more pid(s) for a particular daemon    #
# 019700 #                                                                              #
# 019701 # Inputs: -p pidfile, use the specified pidfile instead of pidof               #
# 019702 #         pathname, path to the specified program                              #
# 019703 #                                                                              #
# 019704 # Return values (as defined by LSB status codes):                              #
# 019705 #       0 - Success (PIDs to stdout)                                           #
# 019706 #       1 - Program is dead, PID file still exists (remaining PIDs output)     #
# 019707 #       3 - Program is not running (no output)                                 #
# 019708 ################################################################################
# 019709 pidofproc()
# 019710 {
# 019711     local pidfile
# 019712     local program
# 019713     local prefix
# 019714     local progname
# 019715     local pidlist
# 019716     local lpids
# 019717     local exitstatus="0"
# 019718 
# 019719     # Process arguments
# 019720     while true; do
# 019721         case "${1}" in
# 019722 
# 019723             -p)
# 019724                 pidfile="${2}"
# 019725                 shift 2
# 019726                 ;;
# 019727 
# 019728             *)
# 019729                 program="${1}"
# 019730                 if [ -n "${2}" ]; then
# 019731                     # Too many arguments
# 019732                     # Since this is status, return unknown
# 019733                     return 4
# 019734                 else
# 019735                     break
# 019736                 fi
# 019737                 ;;
# 019738         esac
# 019739     done
# 019740 
# 019741     # If a PID file is not specified, try and find one.
# 019742     if [ -z "${pidfile}" ]; then
# 019743         # Get the program's basename
# 019744         prefix=`echo "${program}" | sed 's/[^/]*$//'`
# 019745 
# 019746         if [ -z "${prefix}" ]; then 
# 019747            progname="${program}"
# 019748         else
# 019749            progname=`echo "${program}" | sed "s@${prefix}@@"`
# 019750         fi
# 019751 
# 019752         # If a PID file exists with that name, assume that is it.
# 019753         if [ -e "/run/${progname}.pid" ]; then
# 019754             pidfile="/run/${progname}.pid"
# 019755         fi
# 019756     fi
# 019757 
# 019758     # If a PID file is set and exists, use it.
# 019759     if [ -n "${pidfile}" -a -e "${pidfile}" ]; then
# 019760 
# 019761         # Use the value in the first line of the pidfile
# 019762         pidlist=`/bin/head -n1 "${pidfile}"`
# 019763         # This can optionally be written as 'sed 1q' to repalce 'head -n1'
# 019764         # should LFS move /bin/head to /usr/bin/head
# 019765     else
# 019766         # Use pidof
# 019767         pidlist=`pidof "${program}"`
# 019768     fi
# 019769 
# 019770     # Figure out if all listed PIDs are running.
# 019771     for pid in ${pidlist}; do
# 019772         kill -0 ${pid} 2> /dev/null
# 019773 
# 019774         if [ "${?}" -eq "0" ]; then
# 019775             lpids="${lpids}${pid} "
# 019776         else
# 019777             exitstatus="1"
# 019778         fi
# 019779     done
# 019780 
# 019781     if [ -z "${lpids}" -a ! -f "${pidfile}" ]; then
# 019782         return 3
# 019783     else
# 019784         echo "${lpids}"
# 019785         return "${exitstatus}"
# 019786     fi
# 019787 }
# 019788 
# 019789 ################################################################################
# 019790 # statusproc()                                                                 #
# 019791 # Usage: statusproc [-p pidfile] pathname                                      #
# 019792 #                                                                              #
# 019793 # Purpose: This function prints the status of a particular daemon to stdout    #
# 019794 #                                                                              #
# 019795 # Inputs: -p pidfile, use the specified pidfile instead of pidof               #
# 019796 #         pathname, path to the specified program                              #
# 019797 #                                                                              #
# 019798 # Return values:                                                               #
# 019799 #       0 - Status printed                                                     #
# 019800 #       1 - Input error. The daemon to check was not specified.                #
# 019801 ################################################################################
# 019802 statusproc()
# 019803 {
# 019804    local pidfile
# 019805    local pidlist
# 019806 
# 019807    if [ "${#}" = "0" ]; then
# 019808       echo "Usage: statusproc [-p pidfle] {program}"
# 019809       exit 1
# 019810    fi
# 019811 
# 019812    # Process arguments
# 019813    while true; do
# 019814        case "${1}" in
# 019815 
# 019816            -p)
# 019817                pidfile="${2}"
# 019818                shift 2
# 019819                ;;
# 019820 
# 019821            *)
# 019822                if [ -n "${2}" ]; then
# 019823                    echo "Too many arguments"
# 019824                    return 1
# 019825                else
# 019826                    break
# 019827                fi
# 019828                ;;
# 019829        esac
# 019830    done
# 019831 
# 019832    if [ -n "${pidfile}" ]; then
# 019833       pidlist=`pidofproc -p "${pidfile}" $@`
# 019834    else
# 019835       pidlist=`pidofproc $@`
# 019836    fi
# 019837 
# 019838    # Trim trailing blanks
# 019839    pidlist=`echo "${pidlist}" | sed -r 's/ +$//'`
# 019840 
# 019841    base="${1##*/}"
# 019842 
# 019843    if [ -n "${pidlist}" ]; then
# 019844       /bin/echo -e "${INFO}${base} is running with Process" \
# 019845          "ID(s) ${pidlist}.${NORMAL}"
# 019846    else
# 019847       if [ -n "${base}" -a -e "/run/${base}.pid" ]; then
# 019848          /bin/echo -e "${WARNING}${1} is not running but" \
# 019849             "/run/${base}.pid exists.${NORMAL}"
# 019850       else
# 019851          if [ -n "${pidfile}" -a -e "${pidfile}" ]; then
# 019852             /bin/echo -e "${WARNING}${1} is not running" \
# 019853                "but ${pidfile} exists.${NORMAL}"
# 019854          else
# 019855             /bin/echo -e "${INFO}${1} is not running.${NORMAL}"
# 019856          fi
# 019857       fi
# 019858    fi
# 019859 }
# 019860 
# 019861 ################################################################################
# 019862 # timespec()                                                                   #
# 019863 #                                                                              #
# 019864 # Purpose: An internal utility function to format a timestamp                  #
# 019865 #          a boot log file.  Sets the STAMP variable.                          #
# 019866 #                                                                              #
# 019867 # Return value: Not used                                                       #
# 019868 ################################################################################
# 019869 timespec()
# 019870 {
# 019871    STAMP="$(echo `date +"%b %d %T %:z"` `hostname`) "
# 019872    return 0
# 019873 }
# 019874 
# 019875 ################################################################################
# 019876 # log_success_msg()                                                            #
# 019877 # Usage: log_success_msg ["message"]                                           #
# 019878 #                                                                              #
# 019879 # Purpose: Print a successful status message to the screen and                 #
# 019880 #          a boot log file.                                                    #
# 019881 #                                                                              #
# 019882 # Inputs: $@ - Message                                                         #
# 019883 #                                                                              #
# 019884 # Return values: Not used                                                      #
# 019885 ################################################################################
# 019886 log_success_msg()
# 019887 {
# 019888     /bin/echo -n -e "${BMPREFIX}${@}"
# 019889     /bin/echo -e "${CURS_ZERO}${SUCCESS_PREFIX}${SET_COL}${SUCCESS_SUFFIX}"
# 019890 
# 019891     # Strip non-printable characters from log file
# 019892     logmessage=`echo "${@}" | sed 's/\\\033[^a-zA-Z]*.//g'`
# 019893 
# 019894     timespec
# 019895     /bin/echo -e "${STAMP} ${logmessage} OK" >> ${BOOTLOG}
# 019896     
# 019897     return 0
# 019898 }
# 019899 
# 019900 log_success_msg2()
# 019901 {
# 019902     /bin/echo -n -e "${BMPREFIX}${@}"
# 019903     /bin/echo -e "${CURS_ZERO}${SUCCESS_PREFIX}${SET_COL}${SUCCESS_SUFFIX}"
# 019904 
# 019905     echo " OK" >> ${BOOTLOG}
# 019906     
# 019907     return 0
# 019908 }
# 019909 
# 019910 ################################################################################
# 019911 # log_failure_msg()                                                            #
# 019912 # Usage: log_failure_msg ["message"]                                           #
# 019913 #                                                                              #
# 019914 # Purpose: Print a failure status message to the screen and                    #
# 019915 #          a boot log file.                                                    #
# 019916 #                                                                              #
# 019917 # Inputs: $@ - Message                                                         #
# 019918 #                                                                              #
# 019919 # Return values: Not used                                                      #
# 019920 ################################################################################
# 019921 log_failure_msg()
# 019922 {
# 019923     /bin/echo -n -e "${BMPREFIX}${@}"
# 019924     /bin/echo -e "${CURS_ZERO}${FAILURE_PREFIX}${SET_COL}${FAILURE_SUFFIX}"
# 019925 
# 019926     # Strip non-printable characters from log file
# 019927 
# 019928     timespec
# 019929     logmessage=`echo "${@}" | sed 's/\\\033[^a-zA-Z]*.//g'`
# 019930     /bin/echo -e "${STAMP} ${logmessage} FAIL" >> ${BOOTLOG}
# 019931     
# 019932     return 0
# 019933 }
# 019934 
# 019935 log_failure_msg2()
# 019936 {
# 019937     /bin/echo -n -e "${BMPREFIX}${@}"
# 019938     /bin/echo -e "${CURS_ZERO}${FAILURE_PREFIX}${SET_COL}${FAILURE_SUFFIX}"
# 019939 
# 019940     echo "FAIL" >> ${BOOTLOG}
# 019941     
# 019942     return 0
# 019943 }
# 019944 
# 019945 ################################################################################
# 019946 # log_warning_msg()                                                            #
# 019947 # Usage: log_warning_msg ["message"]                                           #
# 019948 #                                                                              #
# 019949 # Purpose: Print a warning status message to the screen and                    #
# 019950 #          a boot log file.                                                    #
# 019951 #                                                                              #
# 019952 # Return values: Not used                                                      #
# 019953 ################################################################################
# 019954 log_warning_msg()
# 019955 {
# 019956     /bin/echo -n -e "${BMPREFIX}${@}"
# 019957     /bin/echo -e "${CURS_ZERO}${WARNING_PREFIX}${SET_COL}${WARNING_SUFFIX}"
# 019958 
# 019959     # Strip non-printable characters from log file
# 019960     logmessage=`echo "${@}" | sed 's/\\\033[^a-zA-Z]*.//g'`
# 019961     timespec
# 019962     /bin/echo -e "${STAMP} ${logmessage} WARN" >> ${BOOTLOG}
# 019963     
# 019964     return 0
# 019965 }
# 019966 
# 019967 log_skip_msg()
# 019968 {
# 019969     /bin/echo -n -e "${BMPREFIX}${@}"
# 019970     /bin/echo -e "${CURS_ZERO}${SKIP_PREFIX}${SET_COL}${SKIP_SUFFIX}"
# 019971 
# 019972     # Strip non-printable characters from log file
# 019973     logmessage=`echo "${@}" | sed 's/\\\033[^a-zA-Z]*.//g'`
# 019974     /bin/echo "SKIP" >> ${BOOTLOG}
# 019975     
# 019976     return 0
# 019977 }
# 019978 
# 019979 ################################################################################
# 019980 # log_info_msg()                                                               #
# 019981 # Usage: log_info_msg message                                                  #
# 019982 #                                                                              #
# 019983 # Purpose: Print an information message to the screen and                      #
# 019984 #          a boot log file.  Does not print a trailing newline character.      #
# 019985 #                                                                              #
# 019986 # Return values: Not used                                                      #
# 019987 ################################################################################
# 019988 log_info_msg()
# 019989 {
# 019990     /bin/echo -n -e "${BMPREFIX}${@}"
# 019991 
# 019992     # Strip non-printable characters from log file
# 019993     logmessage=`echo "${@}" | sed 's/\\\033[^a-zA-Z]*.//g'`
# 019994     timespec
# 019995     /bin/echo -n -e "${STAMP} ${logmessage}" >> ${BOOTLOG}
# 019996     
# 019997     return 0
# 019998 }
# 019999 
# 020000 log_info_msg2()
# 020001 {
# 020002     /bin/echo -n -e "${@}"
# 020003 
# 020004     # Strip non-printable characters from log file
# 020005     logmessage=`echo "${@}" | sed 's/\\\033[^a-zA-Z]*.//g'`
# 020006     /bin/echo -n -e "${logmessage}" >> ${BOOTLOG}
# 020007     
# 020008     return 0
# 020009 }
# 020010 
# 020011 ################################################################################
# 020012 # evaluate_retval()                                                            #
# 020013 # Usage: Evaluate a return value and print success or failyure as appropriate  #
# 020014 #                                                                              #
# 020015 # Purpose: Convenience function to terminate an info message                   #
# 020016 #                                                                              #
# 020017 # Return values: Not used                                                      #
# 020018 ################################################################################
# 020019 evaluate_retval()
# 020020 {
# 020021    local error_value="${?}"
# 020022 
# 020023    if [ ${error_value} = 0 ]; then
# 020024       log_success_msg2
# 020025    else
# 020026       log_failure_msg2
# 020027    fi
# 020028 }
# 020029 
# 020030 ################################################################################
# 020031 # check_signal()                                                               #
# 020032 # Usage: check_signal [ -{signal} | {signal} ]                                 #
# 020033 #                                                                              #
# 020034 # Purpose: Check for a valid signal.  This is not defined by any LSB draft,    #
# 020035 #          however, it is required to check the signals to determine if the    #
# 020036 #          signals chosen are invalid arguments to the other functions.        #
# 020037 #                                                                              #
# 020038 # Inputs: Accepts a single string value in the form or -{signal} or {signal}   #
# 020039 #                                                                              #
# 020040 # Return values:                                                               #
# 020041 #       0 - Success (signal is valid                                           #
# 020042 #       1 - Signal is not valid                                                #
# 020043 ################################################################################
# 020044 check_signal()
# 020045 {
# 020046     local valsig
# 020047 
# 020048     # Add error handling for invalid signals
# 020049     valsig="-ALRM -HUP -INT -KILL -PIPE -POLL -PROF -TERM -USR1 -USR2"
# 020050     valsig="${valsig} -VTALRM -STKFLT -PWR -WINCH -CHLD -URG -TSTP -TTIN"
# 020051     valsig="${valsig} -TTOU -STOP -CONT -ABRT -FPE -ILL -QUIT -SEGV -TRAP"
# 020052     valsig="${valsig} -SYS -EMT -BUS -XCPU -XFSZ -0 -1 -2 -3 -4 -5 -6 -8 -9"
# 020053     valsig="${valsig} -11 -13 -14 -15"
# 020054 
# 020055     echo "${valsig}" | grep -- " ${1} " > /dev/null
# 020056 
# 020057     if [ "${?}" -eq "0" ]; then
# 020058         return 0
# 020059     else
# 020060         return 1
# 020061     fi
# 020062 }
# 020063 
# 020064 ################################################################################
# 020065 # check_sig_type()                                                             #
# 020066 # Usage: check_signal [ -{signal} | {signal} ]                                 #
# 020067 #                                                                              #
# 020068 # Purpose: Check if signal is a program termination signal or a control signal #
# 020069 #          This is not defined by any LSB draft, however, it is required to    #
# 020070 #          check the signals to determine if they are intended to end a        #
# 020071 #          program or simply to control it.                                    #
# 020072 #                                                                              #
# 020073 # Inputs: Accepts a single string value in the form or -{signal} or {signal}   #
# 020074 #                                                                              #
# 020075 # Return values:                                                               #
# 020076 #       0 - Signal is used for program termination                             #
# 020077 #       1 - Signal is used for program control                                 #
# 020078 ################################################################################
# 020079 check_sig_type()
# 020080 {
# 020081     local valsig
# 020082 
# 020083     # The list of termination signals (limited to generally used items)
# 020084     valsig="-ALRM -INT -KILL -TERM -PWR -STOP -ABRT -QUIT -2 -3 -6 -9 -14 -15"
# 020085 
# 020086     echo "${valsig}" | grep -- " ${1} " > /dev/null
# 020087 
# 020088     if [ "${?}" -eq "0" ]; then
# 020089         return 0
# 020090     else
# 020091         return 1
# 020092     fi
# 020093 }
# 020094 
# 020095 ################################################################################
# 020096 # wait_for_user()                                                              #
# 020097 #                                                                              #
# 020098 # Purpose: Wait for the user to respond if not a headless system               #
# 020099 #                                                                              #
# 020100 ################################################################################
# 020101 wait_for_user()
# 020102 {
# 020103    # Wait for the user by default
# 020104    [ "${HEADLESS=0}" = "0" ] && read ENTER
# 020105    return 0
# 020106 }
# 020107 
# 020108 ################################################################################
# 020109 # is_true()                                                                    #
# 020110 #                                                                              #
# 020111 # Purpose: Utility to test if a variable is true | yes | 1                     #
# 020112 #                                                                              #
# 020113 ################################################################################
# 020114 is_true()
# 020115 {
# 020116    [ "$1" = "1" ] || [ "$1" = "yes" ] || [ "$1" = "true" ] ||  [ "$1" = "y" ] ||
# 020117    [ "$1" = "t" ]
# 020118 }
# 020119 
# 020120 # End /lib/lsb/init-functions
# 020121 

 
# 020124        D.3. /etc/rc.d/init.d/mountvirtfs 



# 020128 #!/bin/sh
# 020129 ########################################################################
# 020130 # Begin mountvirtfs
# 020131 #
# 020132 # Description : Mount proc, sysfs, and run
# 020133 #
# 020134 # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# 020135 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 020136 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 020137 #
# 020138 # Version     : LFS 7.0
# 020139 #
# 020140 ########################################################################
# 020141 
# 020142 ### BEGIN INIT INFO
# 020143 # Provides:            mountvirtfs
# 020144 # Required-Start:      $first
# 020145 # Should-Start:
# 020146 # Required-Stop:
# 020147 # Should-Stop:
# 020148 # Default-Start:       S
# 020149 # Default-Stop:
# 020150 # Short-Description:   Mounts /sys and /proc virtual (kernel) filesystems.
# 020151 #                      Mounts /run (tmpfs) and /dev (devtmpfs).
# 020152 # Description:         Mounts /sys and /proc virtual (kernel) filesystems.
# 020153 #                      Mounts /run (tmpfs) and /dev (devtmpfs).
# 020154 # X-LFS-Provided-By:   LFS
# 020155 ### END INIT INFO
# 020156 
# 020157 . /lib/lsb/init-functions
# 020158 
# 020159 case "${1}" in
# 020160    start)
# 020161       # Make sure /run is available before logging any messages
# 020162       if ! mountpoint /run >/dev/null; then
# 020163          mount /run || failed=1
# 020164       fi
# 020165 
# 020166       mkdir -p /run/lock /run/shm
# 020167       chmod 1777 /run/shm /run/lock
# 020168 
# 020169       log_info_msg "Mounting virtual file systems: ${INFO}/run" 
# 020170 
# 020171       if ! mountpoint /proc >/dev/null; then
# 020172          log_info_msg2 " ${INFO}/proc"
# 020173          mount -o nosuid,noexec,nodev /proc || failed=1
# 020174       fi
# 020175 
# 020176       if ! mountpoint /sys >/dev/null; then
# 020177          log_info_msg2 " ${INFO}/sys" 
# 020178          mount -o nosuid,noexec,nodev /sys || failed=1
# 020179       fi
# 020180 
# 020181       if ! mountpoint /dev >/dev/null; then
# 020182          log_info_msg2 " ${INFO}/dev" 
# 020183          mount -o mode=0755,nosuid /dev  || failed=1
# 020184       fi
# 020185 
# 020186       ln -sfn /run/shm /dev/shm
# 020187       
# 020188       (exit ${failed})
# 020189       evaluate_retval
# 020190       exit $failed
# 020191       ;;
# 020192 
# 020193    *)
# 020194       echo "Usage: ${0} {start}"
# 020195       exit 1
# 020196       ;;
# 020197 esac
# 020198 
# 020199 # End mountvirtfs
# 020200 

 
# 020203        D.4. /etc/rc.d/init.d/modules 



# 020207 #!/bin/sh
# 020208 ########################################################################
# 020209 # Begin modules
# 020210 #
# 020211 # Description : Module auto-loading script
# 020212 #
# 020213 # Authors     : Zack Winkles
# 020214 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 020215 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 020216 #
# 020217 # Version     : LFS 7.0
# 020218 #
# 020219 ########################################################################
# 020220 
# 020221 ### BEGIN INIT INFO
# 020222 # Provides:            modules
# 020223 # Required-Start:      mountvirtfs
# 020224 # Should-Start:
# 020225 # Required-Stop:
# 020226 # Should-Stop:
# 020227 # Default-Start:       S
# 020228 # Default-Stop:
# 020229 # Short-Description:   Loads required modules.
# 020230 # Description:         Loads modules listed in /etc/sysconfig/modules.
# 020231 # X-LFS-Provided-By:   LFS
# 020232 ### END INIT INFO
# 020233 
# 020234 # Assure that the kernel has module support.
# 020235 [ -e /proc/modules ] || exit 0
# 020236 
# 020237 . /lib/lsb/init-functions
# 020238 
# 020239 case "${1}" in
# 020240    start)
# 020241       # Exit if there's no modules file or there are no
# 020242       # valid entries
# 020243       [ -r /etc/sysconfig/modules ]             || exit 0
# 020244       egrep -qv '^($|#)' /etc/sysconfig/modules || exit 0
# 020245 
# 020246       log_info_msg "Loading modules:" 
# 020247 
# 020248       # Only try to load modules if the user has actually given us
# 020249       # some modules to load.
# 020250 
# 020251       while read module args; do
# 020252 
# 020253          # Ignore comments and blank lines.
# 020254          case "$module" in
# 020255             ""|"#"*) continue ;;
# 020256          esac
# 020257 
# 020258          # Attempt to load the module, passing any arguments provided.
# 020259          modprobe ${module} ${args} >/dev/null
# 020260 
# 020261          # Print the module name if successful, otherwise take note.
# 020262          if [ $? -eq 0 ]; then
# 020263             log_info_msg2 " ${module}" 
# 020264          else
# 020265             failedmod="${failedmod} ${module}"
# 020266          fi
# 020267       done < /etc/sysconfig/modules
# 020268 
# 020269       # Print a message about successfully loaded modules on the correct line.
# 020270       log_success_msg2
# 020271 
# 020272       # Print a failure message with a list of any modules that 
# 020273       # may have failed to load.
# 020274       if [ -n "${failedmod}" ]; then
# 020275          log_failure_msg "Failed to load modules:${failedmod}" 
# 020276          exit 1
# 020277       fi
# 020278       ;;
# 020279 
# 020280    *)
# 020281       echo "Usage: ${0} {start}"
# 020282       exit 1
# 020283       ;;
# 020284 esac
# 020285 
# 020286 exit 0
# 020287 
# 020288 # End modules
# 020289 

 
# 020292        D.5. /etc/rc.d/init.d/udev 



# 020296 #!/bin/sh
# 020297 ########################################################################
# 020298 # Begin udev
# 020299 #
# 020300 # Description : Udev cold-plugging script
# 020301 #
# 020302 # Authors     : Zack Winkles, Alexander E. Patrakov
# 020303 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 020304 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 020305 #
# 020306 # Version     : LFS 7.0
# 020307 #
# 020308 ########################################################################
# 020309 
# 020310 ### BEGIN INIT INFO
# 020311 # Provides:            udev $time
# 020312 # Required-Start:      localnet
# 020313 # Should-Start:        modules
# 020314 # Required-Stop:
# 020315 # Should-Stop:
# 020316 # Default-Start:       S
# 020317 # Default-Stop:
# 020318 # Short-Description:   Populates /dev with device nodes.
# 020319 # Description:         Mounts a tempfs on /dev and starts the udevd daemon.
# 020320 #                      Device nodes are created as defined by udev.
# 020321 # X-LFS-Provided-By:   LFS
# 020322 ### END INIT INFO
# 020323 
# 020324 . /lib/lsb/init-functions
# 020325 
# 020326 case "${1}" in
# 020327    start)
# 020328       log_info_msg "Populating /dev with device nodes... "
# 020329       if ! grep -q '[[:space:]]sysfs' /proc/mounts; then
# 020330          log_failure_msg2
# 020331          msg="FAILURE:\n\nUnable to create "
# 020332          msg="${msg}devices without a SysFS filesystem\n\n"
# 020333          msg="${msg}After you press Enter, this system "
# 020334          msg="${msg}will be halted and powered off.\n\n"
# 020335          log_info_msg "$msg"
# 020336          log_info_msg "Press Enter to continue..."
# 020337          wait_for_user
# 020338          /etc/rc.d/init.d/halt stop
# 020339       fi
# 020340 
# 020341       # Start the udev daemon to continually watch for, and act on,
# 020342       # uevents
# 020343       /sbin/udevd --daemon
# 020344 
# 020345       # Now traverse /sys in order to "coldplug" devices that have
# 020346       # already been discovered
# 020347       /sbin/udevadm trigger --action=add    --type=subsystems
# 020348       /sbin/udevadm trigger --action=add    --type=devices
# 020349       /sbin/udevadm trigger --action=change --type=devices
# 020350 
# 020351       # Now wait for udevd to process the uevents we triggered
# 020352       if ! is_true "$OMIT_UDEV_SETTLE"; then
# 020353          /sbin/udevadm settle
# 020354       fi
# 020355 
# 020356       # If any LVM based partitions are on the system, ensure they
# 020357       # are activated so they can be used.
# 020358       if [ -x /sbin/vgchange ]; then /sbin/vgchange -a y >/dev/null; fi 
# 020359 
# 020360       log_success_msg2 
# 020361       ;;
# 020362 
# 020363    *)
# 020364       echo "Usage ${0} {start}"
# 020365       exit 1
# 020366       ;;
# 020367 esac
# 020368 
# 020369 exit 0
# 020370 
# 020371 # End udev
# 020372 

 
# 020375        D.6. /etc/rc.d/init.d/swap 



# 020379 #!/bin/sh
# 020380 ########################################################################
# 020381 # Begin swap
# 020382 #
# 020383 # Description : Swap Control Script
# 020384 #
# 020385 # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# 020386 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 020387 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 020388 #
# 020389 # Version     : LFS 7.0
# 020390 #
# 020391 ########################################################################
# 020392 
# 020393 ### BEGIN INIT INFO
# 020394 # Provides:            swap
# 020395 # Required-Start:      udev
# 020396 # Should-Start:        modules
# 020397 # Required-Stop:       localnet
# 020398 # Should-Stop:         $local_fs
# 020399 # Default-Start:       S
# 020400 # Default-Stop:        0 6
# 020401 # Short-Description:   Mounts and unmounts swap partitions.
# 020402 # Description:         Mounts and unmounts swap partitions defined in
# 020403 #                      /etc/fstab.
# 020404 # X-LFS-Provided-By:   LFS
# 020405 ### END INIT INFO
# 020406 
# 020407 . /lib/lsb/init-functions
# 020408 
# 020409 case "${1}" in
# 020410    start)
# 020411       log_info_msg "Activating all swap files/partitions..."
# 020412       swapon -a
# 020413       evaluate_retval
# 020414       ;;
# 020415 
# 020416    stop)
# 020417       log_info_msg "Deactivating all swap files/partitions..."
# 020418       swapoff -a
# 020419       evaluate_retval
# 020420       ;;
# 020421 
# 020422    restart)
# 020423       ${0} stop
# 020424       sleep 1
# 020425       ${0} start
# 020426       ;;
# 020427 
# 020428    status)
# 020429       log_success_msg "Retrieving swap status." 
# 020430       swapon -s
# 020431       ;;
# 020432 
# 020433    *)
# 020434       echo "Usage: ${0} {start|stop|restart|status}"
# 020435       exit 1
# 020436       ;;
# 020437 esac
# 020438 
# 020439 exit 0
# 020440 
# 020441 # End swap
# 020442 

 
# 020445        D.7. /etc/rc.d/init.d/setclock 



# 020449 #!/bin/sh
# 020450 ########################################################################
# 020451 # Begin setclock
# 020452 #
# 020453 # Description : Setting Linux Clock
# 020454 #
# 020455 # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# 020456 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 020457 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 020458 #
# 020459 # Version     : LFS 7.0
# 020460 #
# 020461 ########################################################################
# 020462 
# 020463 ### BEGIN INIT INFO
# 020464 # Provides:            
# 020465 # Required-Start:
# 020466 # Should-Start:        modules
# 020467 # Required-Stop:
# 020468 # Should-Stop:         $syslog
# 020469 # Default-Start:       S
# 020470 # Default-Stop:
# 020471 # Short-Description:   Stores and restores time from the hardware clock
# 020472 # Description:         On boot, system time is obtained from hwclock.  The
# 020473 #                      hardware clock can also be set on shutdown.
# 020474 # X-LFS-Provided-By:   LFS
# 020475 ### END INIT INFO
# 020476 
# 020477 . /lib/lsb/init-functions
# 020478 
# 020479 [ -r /etc/sysconfig/clock ] && . /etc/sysconfig/clock
# 020480 
# 020481 
# 020482 case "${UTC}" in
# 020483    yes|true|1)
# 020484       CLOCKPARAMS="${CLOCKPARAMS} --utc"
# 020485       ;;
# 020486 
# 020487    no|false|0)
# 020488       CLOCKPARAMS="${CLOCKPARAMS} --localtime"
# 020489       ;;
# 020490 
# 020491 esac
# 020492 
# 020493 case ${1} in
# 020494    start)
# 020495       hwclock --hctosys ${CLOCKPARAMS} >/dev/null
# 020496       ;;
# 020497 
# 020498    stop)
# 020499       log_info_msg "Setting hardware clock..."
# 020500       hwclock --systohc ${CLOCKPARAMS} >/dev/null
# 020501       evaluate_retval
# 020502       ;;
# 020503 
# 020504    *)
# 020505       echo "Usage: ${0} {start|stop}"
# 020506       exit 1
# 020507       ;;
# 020508 
# 020509 esac
# 020510 
# 020511 exit 0
# 020512 

 
# 020515        D.8. /etc/rc.d/init.d/checkfs 



# 020519 #!/bin/sh
# 020520 ########################################################################
# 020521 # Begin checkfs
# 020522 #
# 020523 # Description : File System Check
# 020524 #
# 020525 # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# 020526 #               A. Luebke - luebke@users.sourceforge.net
# 020527 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 020528 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 020529 #
# 020530 # Version     : LFS 7.0
# 020531 #
# 020532 # Based on checkfs script from LFS-3.1 and earlier.
# 020533 #
# 020534 # From man fsck
# 020535 # 0    - No errors
# 020536 # 1    - File system errors corrected
# 020537 # 2    - System should be rebooted
# 020538 # 4    - File system errors left uncorrected
# 020539 # 8    - Operational error
# 020540 # 16   - Usage or syntax error
# 020541 # 32   - Fsck canceled by user request
# 020542 # 128  - Shared library error
# 020543 #
# 020544 #########################################################################
# 020545 
# 020546 ### BEGIN INIT INFO
# 020547 # Provides:            checkfs
# 020548 # Required-Start:      udev swap
# 020549 # Should-Start:
# 020550 # Required-Stop:
# 020551 # Should-Stop:
# 020552 # Default-Start:       S
# 020553 # Default-Stop:
# 020554 # Short-Description:   Checks local filesystems before mounting.
# 020555 # Description:         Checks local filesystmes before mounting.
# 020556 # X-LFS-Provided-By:   LFS
# 020557 ### END INIT INFO
# 020558 
# 020559 . /lib/lsb/init-functions
# 020560 
# 020561 case "${1}" in
# 020562    start)
# 020563       if [ -f /fastboot ]; then
# 020564          msg="/fastboot found, will omit "
# 020565          msg="${msg} file system checks as requested.\n"
# 020566          log_info_msg "${msg}"
# 020567          exit 0
# 020568       fi
# 020569 
# 020570       log_info_msg "Mounting root file system in read-only mode... "
# 020571       mount -n -o remount,ro / >/dev/null
# 020572 
# 020573       if [ ${?} != 0 ]; then
# 020574          log_failure_msg2
# 020575          msg="\n\nCannot check root "
# 020576          msg="${msg}filesystem because it could not be mounted "
# 020577          msg="${msg}in read-only mode.\n\n"
# 020578          msg="${msg}After you press Enter, this system will be "
# 020579          msg="${msg}halted and powered off.\n\n"
# 020580          log_failure_msg "${msg}"
# 020581 
# 020582          log_info_msg "Press Enter to continue..." 
# 020583          wait_for_user
# 020584          /etc/rc.d/init.d/halt stop
# 020585       else
# 020586          log_success_msg2
# 020587       fi
# 020588 
# 020589       if [ -f /forcefsck ]; then
# 020590          msg="/forcefsck found, forcing file" 
# 020591          msg="${msg} system checks as requested."
# 020592          log_success_msg "$msg"
# 020593          options="-f"
# 020594       else
# 020595          options=""
# 020596       fi
# 020597 
# 020598       log_info_msg "Checking file systems..."
# 020599       # Note: -a option used to be -p; but this fails e.g. on fsck.minix
# 020600       if is_true "$VERBOSE_FSCK"; then
# 020601         fsck ${options} -a -A -C -T
# 020602       else
# 020603         fsck ${options} -a -A -C -T >/dev/null
# 020604       fi
# 020605 
# 020606       error_value=${?}
# 020607 
# 020608       if [ "${error_value}" = 0 ]; then
# 020609          log_success_msg2
# 020610       fi
# 020611 
# 020612       if [ "${error_value}" = 1 ]; then
# 020613          msg="\nWARNING:\n\nFile system errors "
# 020614          msg="${msg}were found and have been corrected.\n"
# 020615          msg="${msg}      You may want to double-check that "
# 020616          msg="${msg}everything was fixed properly."
# 020617          log_warning_msg "$msg"
# 020618       fi
# 020619 
# 020620       if [ "${error_value}" = 2 -o "${error_value}" = 3 ]; then
# 020621          msg="\nWARNING:\n\nFile system errors "
# 020622          msg="${msg}were found and have been been "
# 020623          msg="${msg}corrected, but the nature of the "
# 020624          msg="${msg}errors require this system to be rebooted.\n\n"
# 020625          msg="${msg}After you press enter, "
# 020626          msg="${msg}this system will be rebooted\n\n"
# 020627          log_failure_msg "$msg"
# 020628 
# 020629          log_info_msg "Press Enter to continue..." 
# 020630          wait_for_user
# 020631          reboot -f
# 020632       fi
# 020633 
# 020634       if [ "${error_value}" -gt 3 -a "${error_value}" -lt 16 ]; then
# 020635          msg="\nFAILURE:\n\nFile system errors "
# 020636          msg="${msg}were encountered that could not be "
# 020637          msg="${msg}fixed automatically.\nThis system "
# 020638          msg="${msg}cannot continue to boot and will "
# 020639          msg="${msg}therefore be halted until those "
# 020640          msg="${msg}errors are fixed manually by a "
# 020641          msg="${msg}System Administrator.\n\n"
# 020642          msg="${msg}After you press Enter, this system will be "
# 020643          msg="${msg}halted and powered off.\n\n"
# 020644          log_failure_msg "$msg"
# 020645 
# 020646          log_info_msg "Press Enter to continue..." 
# 020647          wait_for_user
# 020648          /etc/rc.d/init.d/halt stop
# 020649       fi
# 020650 
# 020651       if [ "${error_value}" -ge 16 ]; then
# 020652          msg="FAILURE:\n\nUnexpected failure "
# 020653          msg="${msg}running fsck.  Exited with error "
# 020654          msg="${msg} code: ${error_value}.\n"
# 020655          log_info_msg $msg
# 020656          exit ${error_value}
# 020657       fi
# 020658 
# 020659       exit 0
# 020660       ;;
# 020661    *)
# 020662       echo "Usage: ${0} {start}"
# 020663       exit 1
# 020664       ;;
# 020665 esac
# 020666 
# 020667 # End checkfs
# 020668 

 
# 020671        D.9. /etc/rc.d/init.d/mountfs 



# 020675 #!/bin/sh
# 020676 ########################################################################
# 020677 # Begin mountfs
# 020678 #
# 020679 # Description : File System Mount Script
# 020680 #
# 020681 # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# 020682 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 020683 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 020684 #
# 020685 # Version     : LFS 7.0
# 020686 #
# 020687 ########################################################################
# 020688 
# 020689 ### BEGIN INIT INFO
# 020690 # Provides:            $local_fs
# 020691 # Required-Start:      udev checkfs
# 020692 # Should-Start:        modules
# 020693 # Required-Stop:       localnet
# 020694 # Should-Stop:
# 020695 # Default-Start:       S
# 020696 # Default-Stop:        0 6
# 020697 # Short-Description:   Mounts/unmounts local filesystems defined in /etc/fstab.
# 020698 # Description:         Remounts root filesystem read/write and mounts all
# 020699 #                      remaining local filesystems defined in /etc/fstab on
# 020700 #                      start.  Remounts root filesystem read-only and unmounts
# 020701 #                      remaining filesystems on stop.
# 020702 # X-LFS-Provided-By:   LFS
# 020703 ### END INIT INFO
# 020704 
# 020705 . /lib/lsb/init-functions
# 020706 
# 020707 case "${1}" in
# 020708    start)
# 020709       log_info_msg "Remounting root file system in read-write mode..."
# 020710       mount --options remount,rw / >/dev/null
# 020711       evaluate_retval
# 020712 
# 020713       # Remove fsck-related file system watermarks.
# 020714       rm -f /fastboot /forcefsck
# 020715 
# 020716       # Make sure /dev/pts exists
# 020717       mkdir -p /dev/pts
# 020718 
# 020719       # This will mount all filesystems that do not have _netdev in
# 020720       # their option list.  _netdev denotes a network filesystem.
# 020721 
# 020722       log_info_msg "Mounting remaining file systems..."
# 020723       failed=0
# 020724       mount --all --test-opts no_netdev >/dev/null || failed=1
# 020725       evaluate_retval
# 020726       exit $failed
# 020727       ;;
# 020728 
# 020729    stop)
# 020730       # Don't unmount virtual file systems like /run
# 020731       log_info_msg "Unmounting all other currently mounted file systems..."
# 020732       # Ensure any loop devies are removed
# 020733       losetup -D
# 020734       umount --all --detach-loop --read-only \
# 020735              --types notmpfs,nosysfs,nodevtmpfs,noproc,nodevpts >/dev/null
# 020736       evaluate_retval
# 020737 
# 020738       # Make sure / is mounted read only (umount bug)
# 020739       mount --options remount,ro /
# 020740 
# 020741       # Make all LVM volume groups unavailable, if appropriate
# 020742       # This fails if swap or / are on an LVM partition
# 020743       #if [ -x /sbin/vgchange ]; then /sbin/vgchange -an > /dev/null; fi
# 020744       ;;
# 020745 
# 020746    *)
# 020747       echo "Usage: ${0} {start|stop}"
# 020748       exit 1
# 020749       ;;
# 020750 esac
# 020751 
# 020752 # End mountfs
# 020753 

 
# 020756        D.10. /etc/rc.d/init.d/udev_retry 



# 020760 #!/bin/sh
# 020761 ########################################################################
# 020762 # Begin udev_retry
# 020763 #
# 020764 # Description : Udev cold-plugging script (retry)
# 020765 #
# 020766 # Authors     : Alexander E. Patrakov
# 020767 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 020768 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 020769 #               Bryan Kadzban - 
# 020770 #
# 020771 # Version     : LFS 7.0
# 020772 #
# 020773 ########################################################################
# 020774 
# 020775 ### BEGIN INIT INFO
# 020776 # Provides:            udev_retry
# 020777 # Required-Start:      udev
# 020778 # Should-Start:        $local_fs cleanfs
# 020779 # Required-Stop:
# 020780 # Should-Stop:
# 020781 # Default-Start:       S
# 020782 # Default-Stop:
# 020783 # Short-Description:   Replays failed uevents and creates additional devices.
# 020784 # Description:         Replays any failed uevents that were skipped due to
# 020785 #                      slow hardware initialization, and creates those needed
# 020786 #                      device nodes
# 020787 # X-LFS-Provided-By:   LFS
# 020788 ### END INIT INFO
# 020789 
# 020790 . /lib/lsb/init-functions
# 020791 
# 020792 case "${1}" in
# 020793    start)
# 020794       log_info_msg "Retrying failed uevents, if any..."
# 020795 
# 020796       # As of udev-186, the --run option is no longer valid
# 020797       #rundir=$(/sbin/udevadm info --run)
# 020798       rundir=/run/udev
# 020799       # From Debian: "copy the rules generated before / was mounted
# 020800       # read-write":
# 020801     
# 020802       for file in ${rundir}/tmp-rules--*; do
# 020803          dest=${file##*tmp-rules--}
# 020804          [ "$dest" = '*' ] && break
# 020805          cat $file >> /etc/udev/rules.d/$dest
# 020806          rm -f $file
# 020807       done
# 020808 
# 020809       # Re-trigger the uevents that may have failed, 
# 020810       # in hope they will succeed now
# 020811       /bin/sed -e 's/#.*$//' /etc/sysconfig/udev_retry | /bin/grep -v '^$' | \
# 020812       while read line ; do
# 020813          for subsystem in $line ; do
# 020814             /sbin/udevadm trigger --subsystem-match=$subsystem --action=add
# 020815          done
# 020816       done
# 020817 
# 020818       # Now wait for udevd to process the uevents we triggered
# 020819       if ! is_true "$OMIT_UDEV_RETRY_SETTLE"; then
# 020820          /sbin/udevadm settle
# 020821       fi
# 020822 
# 020823       evaluate_retval
# 020824       ;;
# 020825 
# 020826    *)
# 020827       echo "Usage ${0} {start}"
# 020828       exit 1
# 020829       ;;
# 020830 esac
# 020831 
# 020832 exit 0
# 020833 
# 020834 # End udev_retry
# 020835 

 
# 020838        D.11. /etc/rc.d/init.d/cleanfs 



# 020842 #!/bin/sh
# 020843 ########################################################################
# 020844 # Begin cleanfs
# 020845 #
# 020846 # Description : Clean file system
# 020847 #
# 020848 # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# 020849 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 020850 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 020851 #
# 020852 # Version     : LFS 7.0
# 020853 #
# 020854 ########################################################################
# 020855 
# 020856 ### BEGIN INIT INFO
# 020857 # Provides:            cleanfs
# 020858 # Required-Start:      $local_fs
# 020859 # Should-Start:
# 020860 # Required-Stop:
# 020861 # Should-Stop:
# 020862 # Default-Start:       S
# 020863 # Default-Stop:
# 020864 # Short-Description:   Cleans temporary directories early in the boot process.
# 020865 # Description:         Cleans temporary directories /run, /var/lock, and
# 020866 #                      optionally, /tmp.  cleanfs also creates /run/utmp 
# 020867 #                      and any files defined in /etc/sysconfig/createfiles.
# 020868 # X-LFS-Provided-By:   LFS
# 020869 ### END INIT INFO
# 020870 
# 020871 . /lib/lsb/init-functions
# 020872 
# 020873 # Function to create files/directory on boot.
# 020874 create_files() 
# 020875 {
# 020876    # Input to file descriptor 9 and output to stdin (redirection)
# 020877    exec 9>&0 < /etc/sysconfig/createfiles
# 020878 
# 020879    while read name type perm usr grp dtype maj min junk
# 020880    do
# 020881       # Ignore comments and blank lines.
# 020882       case "${name}" in
# 020883          ""|\#*) continue ;;
# 020884       esac
# 020885 
# 020886       # Ignore existing files.
# 020887       if [ ! -e "${name}" ]; then
# 020888          # Create stuff based on its type.
# 020889          case "${type}" in
# 020890             dir)
# 020891                mkdir "${name}"
# 020892                ;;
# 020893             file)
# 020894                :> "${name}"
# 020895                ;;
# 020896             dev)
# 020897                case "${dtype}" in
# 020898                   char)
# 020899                      mknod "${name}" c ${maj} ${min}
# 020900                      ;;
# 020901                   block)
# 020902                      mknod "${name}" b ${maj} ${min}
# 020903                      ;;
# 020904                   pipe)
# 020905                      mknod "${name}" p
# 020906                      ;;
# 020907                   *) 
# 020908                      log_warning_msg "\nUnknown device type: ${dtype}" 
# 020909                      ;;
# 020910                esac
# 020911                ;;
# 020912             *)
# 020913                log_warning_msg "\nUnknown type: ${type}" 
# 020914                continue
# 020915                ;;
# 020916          esac
# 020917 
# 020918          # Set up the permissions, too.
# 020919          chown ${usr}:${grp} "${name}"
# 020920          chmod ${perm} "${name}"
# 020921       fi
# 020922    done
# 020923 
# 020924    # Close file descriptor 9 (end redirection)
# 020925    exec 0>&9 9>&-
# 020926    return 0
# 020927 }
# 020928 
# 020929 case "${1}" in
# 020930    start)
# 020931       log_info_msg "Cleaning file systems:" 
# 020932 
# 020933       if [ "${SKIPTMPCLEAN}" = "" ]; then
# 020934          log_info_msg2 " /tmp" 
# 020935          cd /tmp &&
# 020936          find . -xdev -mindepth 1 ! -name lost+found -delete || failed=1
# 020937       fi
# 020938 
# 020939       > /run/utmp
# 020940 
# 020941       if grep -q '^utmp:' /etc/group ; then
# 020942          chmod 664 /run/utmp
# 020943          chgrp utmp /run/utmp
# 020944       fi
# 020945 
# 020946       (exit ${failed})
# 020947       evaluate_retval
# 020948 
# 020949       if egrep -qv '^(#|$)' /etc/sysconfig/createfiles 2>/dev/null; then
# 020950          log_info_msg "Creating files and directories... "
# 020951          create_files      # Always returns 0
# 020952          evaluate_retval
# 020953       fi
# 020954 
# 020955       exit $failed
# 020956       ;;
# 020957    *)
# 020958       echo "Usage: ${0} {start}"
# 020959       exit 1
# 020960       ;;
# 020961 esac
# 020962 
# 020963 # End cleanfs
# 020964 

 
# 020967        D.12. /etc/rc.d/init.d/console 



# 020971 #!/bin/sh
# 020972 ########################################################################
# 020973 # Begin console
# 020974 #
# 020975 # Description : Sets keymap and screen font
# 020976 #
# 020977 # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# 020978 #               Alexander E. Patrakov
# 020979 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 020980 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 020981 #
# 020982 # Version     : LFS 7.0
# 020983 #
# 020984 ########################################################################
# 020985 
# 020986 ### BEGIN INIT INFO
# 020987 # Provides:            console
# 020988 # Required-Start:      $local_fs
# 020989 # Should-Start:        udev_retry
# 020990 # Required-Stop:
# 020991 # Should-Stop:
# 020992 # Default-Start:       S
# 020993 # Default-Stop:
# 020994 # Short-Description:   Sets up a localised console.
# 020995 # Description:         Sets up fonts and language settings for the user's
# 020996 #                      local as defined by /etc/sysconfig/console.
# 020997 # X-LFS-Provided-By:   LFS
# 020998 ### END INIT INFO
# 020999 
# 021000 . /lib/lsb/init-functions
# 021001 
# 021002 # Native English speakers probably don't have /etc/sysconfig/console at all
# 021003 [ -r /etc/sysconfig/console ] && . /etc/sysconfig/console
# 021004 
# 021005 is_true() 
# 021006 {
# 021007    [ "$1" = "1" ] || [ "$1" = "yes" ] || [ "$1" = "true" ]
# 021008 }
# 021009 
# 021010 failed=0
# 021011 
# 021012 case "${1}" in
# 021013    start)
# 021014       # See if we need to do anything
# 021015       if [ -z "${KEYMAP}"         ] && [ -z "${KEYMAP_CORRECTIONS}" ] &&
# 021016          [ -z "${FONT}"           ] && [ -z "${LEGACY_CHARSET}"     ] &&     
# 021017          ! is_true "${UNICODE}"; then 
# 021018          exit 0
# 021019       fi
# 021020 
# 021021       # There should be no bogus failures below this line!
# 021022       log_info_msg "Setting up Linux console..."
# 021023 
# 021024       # Figure out if a framebuffer console is used
# 021025       [ -d /sys/class/graphics/fb0 ] && use_fb=1 || use_fb=0
# 021026 
# 021027       # Figure out the command to set the console into the
# 021028       # desired mode
# 021029       is_true "${UNICODE}" &&
# 021030          MODE_COMMAND="echo -en '\033%G' && kbd_mode -u" ||
# 021031          MODE_COMMAND="echo -en '\033%@\033(K' && kbd_mode -a"
# 021032 
# 021033       # On framebuffer consoles, font has to be set for each vt in
# 021034       # UTF-8 mode. This doesn't hurt in non-UTF-8 mode also.
# 021035 
# 021036       ! is_true "${use_fb}" || [ -z "${FONT}" ] ||
# 021037          MODE_COMMAND="${MODE_COMMAND} && setfont ${FONT}"
# 021038 
# 021039       # Apply that command to all consoles mentioned in
# 021040       # /etc/inittab. Important: in the UTF-8 mode this should
# 021041       # happen before setfont, otherwise a kernel bug will
# 021042       # show up and the unicode map of the font will not be
# 021043       # used.
# 021044 
# 021045       for TTY in `grep '^[^#].*respawn:/sbin/agetty' /etc/inittab |
# 021046          grep -o '\btty[[:digit:]]*\b'`
# 021047       do
# 021048          openvt -f -w -c ${TTY#tty} -- \
# 021049             /bin/sh -c "${MODE_COMMAND}" || failed=1
# 021050       done
# 021051 
# 021052       # Set the font (if not already set above) and the keymap
# 021053       [ "${use_fb}" == "1" ] || [ -z "${FONT}" ] || setfont $FONT || failed=1
# 021054 
# 021055       [ -z "${KEYMAP}" ] ||
# 021056          loadkeys ${KEYMAP} >/dev/null 2>&1 ||
# 021057          failed=1
# 021058       
# 021059       [ -z "${KEYMAP_CORRECTIONS}" ] ||
# 021060          loadkeys ${KEYMAP_CORRECTIONS} >/dev/null 2>&1 ||
# 021061          failed=1
# 021062 
# 021063       # Convert the keymap from $LEGACY_CHARSET to UTF-8
# 021064       [ -z "$LEGACY_CHARSET" ] ||
# 021065          dumpkeys -c "$LEGACY_CHARSET" | loadkeys -u >/dev/null 2>&1 ||
# 021066          failed=1
# 021067 
# 021068       # If any of the commands above failed, the trap at the
# 021069       # top would set $failed to 1
# 021070       ( exit $failed ) 
# 021071       evaluate_retval
# 021072 
# 021073       exit $failed
# 021074       ;;              
# 021075 
# 021076    *)                 
# 021077       echo "Usage:  ${0} {start}"
# 021078       exit 1          
# 021079       ;;              
# 021080 esac
# 021081 
# 021082 # End console
# 021083 

 
# 021086        D.13. /etc/rc.d/init.d/localnet 



# 021090 #!/bin/sh
# 021091 ########################################################################
# 021092 # Begin localnet
# 021093 #
# 021094 # Description : Loopback device
# 021095 #
# 021096 # Authors     : Gerard Beekmans  - gerard AT linuxfromscratch D0T org
# 021097 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 021098 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 021099 #
# 021100 # Version     : LFS 7.0
# 021101 #
# 021102 ########################################################################
# 021103 
# 021104 ### BEGIN INIT INFO
# 021105 # Provides:            localnet
# 021106 # Required-Start:      mountvirtfs
# 021107 # Should-Start:        modules
# 021108 # Required-Stop:
# 021109 # Should-Stop:
# 021110 # Default-Start:       S
# 021111 # Default-Stop:        0 6
# 021112 # Short-Description:   Starts the local network.
# 021113 # Description:         Sets the hostname of the machine and starts the
# 021114 #                      loopback interface.
# 021115 # X-LFS-Provided-By:   LFS
# 021116 ### END INIT INFO
# 021117 
# 021118 . /lib/lsb/init-functions
# 021119 [ -r /etc/sysconfig/network ] && . /etc/sysconfig/network
# 021120 [ -r /etc/hostname ] && HOSTNAME=`cat /etc/hostname`
# 021121 
# 021122 case "${1}" in
# 021123    start)
# 021124       log_info_msg "Bringing up the loopback interface..."
# 021125       ip addr add 127.0.0.1/8 label lo dev lo
# 021126       ip link set lo up
# 021127       evaluate_retval
# 021128 
# 021129       log_info_msg "Setting hostname to ${HOSTNAME}..."
# 021130       hostname ${HOSTNAME}
# 021131       evaluate_retval
# 021132       ;;
# 021133 
# 021134    stop)
# 021135       log_info_msg "Bringing down the loopback interface..."
# 021136       ip link set lo down
# 021137       evaluate_retval
# 021138       ;;
# 021139 
# 021140    restart)
# 021141       ${0} stop
# 021142       sleep 1
# 021143       ${0} start
# 021144       ;;
# 021145 
# 021146    status)
# 021147       echo "Hostname is: $(hostname)"
# 021148       ip link show lo
# 021149       ;;
# 021150 
# 021151    *)
# 021152       echo "Usage: ${0} {start|stop|restart|status}"
# 021153       exit 1
# 021154       ;;
# 021155 esac
# 021156 
# 021157 exit 0
# 021158 
# 021159 # End localnet
# 021160 

 
# 021163        D.14. /etc/rc.d/init.d/sysctl 



# 021167 #!/bin/sh
# 021168 ########################################################################
# 021169 # Begin sysctl
# 021170 #
# 021171 # Description : File uses /etc/sysctl.conf to set kernel runtime
# 021172 #               parameters
# 021173 #
# 021174 # Authors     : Nathan Coulson (nathan AT linuxfromscratch D0T org)
# 021175 #               Matthew Burgress (matthew AT linuxfromscratch D0T org)
# 021176 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 021177 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 021178 #
# 021179 # Version     : LFS 7.0
# 021180 #
# 021181 ########################################################################
# 021182 
# 021183 ### BEGIN INIT INFO
# 021184 # Provides:            sysctl
# 021185 # Required-Start:      mountvirtfs
# 021186 # Should-Start:        console
# 021187 # Required-Stop:
# 021188 # Should-Stop:
# 021189 # Default-Start:       S
# 021190 # Default-Stop:
# 021191 # Short-Description:   Makes changes to the proc filesystem
# 021192 # Description:         Makes changes to the proc filesystem as defined in
# 021193 #                      /etc/sysctl.conf.  See 'man sysctl(8)'.
# 021194 # X-LFS-Provided-By:   LFS
# 021195 ### END INIT INFO
# 021196 
# 021197 . /lib/lsb/init-functions
# 021198 
# 021199 case "${1}" in
# 021200    start)
# 021201       if [ -f "/etc/sysctl.conf" ]; then
# 021202          log_info_msg "Setting kernel runtime parameters..."
# 021203          sysctl -q -p
# 021204          evaluate_retval
# 021205       fi
# 021206       ;;
# 021207 
# 021208    status)
# 021209       sysctl -a
# 021210       ;;
# 021211 
# 021212    *)
# 021213       echo "Usage: ${0} {start|status}"
# 021214       exit 1
# 021215       ;;
# 021216 esac
# 021217 
# 021218 exit 0
# 021219 
# 021220 # End sysctl
# 021221 

 
# 021224        D.15. /etc/rc.d/init.d/sysklogd 



# 021228 #!/bin/sh
# 021229 ########################################################################
# 021230 # Begin sysklogd
# 021231 #
# 021232 # Description : Sysklogd loader
# 021233 #
# 021234 # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# 021235 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 021236 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 021237 #
# 021238 # Version     : LFS 7.0
# 021239 #
# 021240 ########################################################################
# 021241 
# 021242 ### BEGIN INIT INFO
# 021243 # Provides:            $syslog
# 021244 # Required-Start:      $first localnet
# 021245 # Should-Start:
# 021246 # Required-Stop:       $local_fs
# 021247 # Should-Stop:         sendsignals
# 021248 # Default-Start:       3 4 5
# 021249 # Default-Stop:        0 1 2 6
# 021250 # Short-Description:   Starts kernel and system log daemons.
# 021251 # Description:         Starts kernel and system log daemons.
# 021252 #                      /etc/fstab.
# 021253 # X-LFS-Provided-By:   LFS
# 021254 ### END INIT INFO
# 021255 
# 021256 # Note: sysklogd is not started in runlevel 2 due to possible
# 021257 # remote logging configurations
# 021258 
# 021259 . /lib/lsb/init-functions
# 021260 
# 021261 case "${1}" in
# 021262    start)
# 021263       log_info_msg "Starting system log daemon..."
# 021264       parms=${SYSKLOGD_PARMS-'-m 0'}
# 021265       start_daemon /sbin/syslogd $parms
# 021266       evaluate_retval
# 021267 
# 021268       log_info_msg "Starting kernel log daemon..."
# 021269       start_daemon /sbin/klogd
# 021270       evaluate_retval
# 021271       ;;
# 021272 
# 021273    stop)
# 021274       log_info_msg "Stopping kernel log daemon..."
# 021275       killproc /sbin/klogd
# 021276       evaluate_retval
# 021277 
# 021278       log_info_msg "Stopping system log daemon..."
# 021279       killproc /sbin/syslogd
# 021280       evaluate_retval
# 021281       ;;
# 021282 
# 021283    reload)
# 021284       log_info_msg "Reloading system log daemon config file..."
# 021285       pid=`pidofproc syslogd`
# 021286       kill -HUP "${pid}"
# 021287       evaluate_retval
# 021288       ;;
# 021289 
# 021290    restart)
# 021291       ${0} stop
# 021292       sleep 1
# 021293       ${0} start
# 021294       ;;
# 021295 
# 021296    status)
# 021297       statusproc /sbin/syslogd
# 021298       statusproc klogd
# 021299       ;;
# 021300 
# 021301    *)
# 021302       echo "Usage: ${0} {start|stop|reload|restart|status}"
# 021303       exit 1
# 021304       ;;
# 021305 esac
# 021306 
# 021307 exit 0
# 021308 
# 021309 # End sysklogd
# 021310 

 
# 021313        D.16. /etc/rc.d/init.d/network 



# 021317 #!/bin/sh
# 021318 ########################################################################
# 021319 # Begin network
# 021320 #
# 021321 # Description : Network Control Script
# 021322 #
# 021323 # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# 021324 #               Nathan Coulson - nathan AT linuxfromscratch D0T org
# 021325 #               Kevin P. Fleming - kpfleming@linuxfromscratch.org
# 021326 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 021327 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 021328 #
# 021329 # Version     : LFS 7.0
# 021330 #
# 021331 ########################################################################
# 021332 
# 021333 ### BEGIN INIT INFO
# 021334 # Provides:            $network
# 021335 # Required-Start:      $local_fs localnet swap
# 021336 # Should-Start:        $syslog firewalld iptables nftables
# 021337 # Required-Stop:       $local_fs localnet swap
# 021338 # Should-Stop:         $syslog firewalld iptables nftables
# 021339 # Default-Start:       3 4 5
# 021340 # Default-Stop:        0 1 2 6
# 021341 # Short-Description:   Starts and configures network interfaces.
# 021342 # Description:         Starts and configures network interfaces.
# 021343 # X-LFS-Provided-By:   LFS
# 021344 ### END INIT INFO
# 021345 
# 021346 case "${1}" in
# 021347    start)
# 021348       # Start all network interfaces
# 021349       for file in /etc/sysconfig/ifconfig.*
# 021350       do
# 021351          interface=${file##*/ifconfig.}
# 021352 
# 021353          # Skip if $file is * (because nothing was found)
# 021354          if [ "${interface}" = "*" ]
# 021355          then
# 021356             continue
# 021357          fi
# 021358 
# 021359          /sbin/ifup ${interface}
# 021360       done
# 021361       ;;
# 021362 
# 021363    stop)
# 021364       # Unmount any network mounted file systems
# 021365        umount --all --force --types nfs,cifs,nfs4 
# 021366 
# 021367       # Reverse list
# 021368       net_files=""
# 021369       for file in  /etc/sysconfig/ifconfig.*
# 021370       do
# 021371          net_files="${file} ${net_files}"
# 021372       done
# 021373 
# 021374       # Stop all network interfaces
# 021375       for file in ${net_files}
# 021376       do
# 021377          interface=${file##*/ifconfig.}
# 021378 
# 021379          # Skip if $file is * (because nothing was found)
# 021380          if [ "${interface}" = "*" ]
# 021381          then
# 021382             continue
# 021383          fi
# 021384 
# 021385          /sbin/ifdown ${interface}
# 021386       done
# 021387       ;;
# 021388 
# 021389    restart)
# 021390       ${0} stop
# 021391       sleep 1
# 021392       ${0} start
# 021393       ;;
# 021394 
# 021395    *)
# 021396       echo "Usage: ${0} {start|stop|restart}"
# 021397       exit 1
# 021398       ;;
# 021399 esac
# 021400 
# 021401 exit 0
# 021402 
# 021403 # End network
# 021404 

 
# 021407        D.17. /etc/rc.d/init.d/sendsignals 



# 021411 #!/bin/sh
# 021412 ########################################################################
# 021413 # Begin sendsignals
# 021414 #
# 021415 # Description : Sendsignals Script
# 021416 #
# 021417 # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# 021418 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 021419 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 021420 #
# 021421 # Version     : LFS 7.0
# 021422 #
# 021423 ########################################################################
# 021424 
# 021425 ### BEGIN INIT INFO
# 021426 # Provides:            sendsignals
# 021427 # Required-Start:
# 021428 # Should-Start:
# 021429 # Required-Stop:       $local_fs swap localnet
# 021430 # Should-Stop:
# 021431 # Default-Start:
# 021432 # Default-Stop:        0 6
# 021433 # Short-Description:   Attempts to kill remaining processes.
# 021434 # Description:         Attempts to kill remaining processes.
# 021435 # X-LFS-Provided-By:   LFS
# 021436 ### END INIT INFO
# 021437 
# 021438 . /lib/lsb/init-functions
# 021439 
# 021440 case "${1}" in
# 021441    stop)
# 021442       log_info_msg "Sending all processes the TERM signal..."
# 021443       killall5 -15
# 021444       error_value=${?}
# 021445 
# 021446       sleep ${KILLDELAY}
# 021447 
# 021448       if [ "${error_value}" = 0 -o "${error_value}" = 2 ]; then
# 021449          log_success_msg
# 021450       else
# 021451          log_failure_msg
# 021452       fi
# 021453 
# 021454       log_info_msg "Sending all processes the KILL signal..."
# 021455       killall5 -9
# 021456       error_value=${?}
# 021457 
# 021458       sleep ${KILLDELAY}
# 021459 
# 021460       if [ "${error_value}" = 0 -o "${error_value}" = 2 ]; then
# 021461          log_success_msg
# 021462       else
# 021463          log_failure_msg
# 021464       fi
# 021465       ;;
# 021466 
# 021467    *)
# 021468       echo "Usage: ${0} {stop}"
# 021469       exit 1
# 021470       ;;
# 021471 
# 021472 esac
# 021473 
# 021474 exit 0
# 021475 
# 021476 # End sendsignals
# 021477 

 
# 021480        D.18. /etc/rc.d/init.d/reboot 



# 021484 #!/bin/sh
# 021485 ########################################################################
# 021486 # Begin reboot
# 021487 #
# 021488 # Description : Reboot Scripts
# 021489 #
# 021490 # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# 021491 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 021492 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 021493 #
# 021494 # Version     : LFS 7.0
# 021495 #
# 021496 ########################################################################
# 021497 
# 021498 ### BEGIN INIT INFO
# 021499 # Provides:            reboot
# 021500 # Required-Start:
# 021501 # Should-Start:
# 021502 # Required-Stop:
# 021503 # Should-Stop:
# 021504 # Default-Start:       6
# 021505 # Default-Stop:
# 021506 # Short-Description:   Reboots the system.
# 021507 # Description:         Reboots the System.
# 021508 # X-LFS-Provided-By:   LFS
# 021509 ### END INIT INFO
# 021510 
# 021511 . /lib/lsb/init-functions
# 021512 
# 021513 case "${1}" in
# 021514    stop)
# 021515       log_info_msg "Restarting system..."
# 021516       reboot -d -f -i
# 021517       ;;
# 021518 
# 021519    *)
# 021520       echo "Usage: ${0} {stop}"
# 021521       exit 1
# 021522       ;;
# 021523 
# 021524 esac
# 021525 
# 021526 # End reboot
# 021527 

 
# 021530        D.19. /etc/rc.d/init.d/halt 



# 021534 #!/bin/sh
# 021535 ########################################################################
# 021536 # Begin halt
# 021537 #
# 021538 # Description : Halt Script
# 021539 #
# 021540 # Authors     : Gerard Beekmans - gerard AT linuxfromscratch D0T org
# 021541 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 021542 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 021543 #
# 021544 # Version     : LFS 7.0
# 021545 #
# 021546 ########################################################################
# 021547 
# 021548 ### BEGIN INIT INFO
# 021549 # Provides:            halt
# 021550 # Required-Start:
# 021551 # Should-Start:
# 021552 # Required-Stop:
# 021553 # Should-Stop:
# 021554 # Default-Start:       0
# 021555 # Default-Stop:
# 021556 # Short-Description:   Halts the system.
# 021557 # Description:         Halts the System.
# 021558 # X-LFS-Provided-By:   LFS
# 021559 ### END INIT INFO
# 021560 
# 021561 case "${1}" in
# 021562    stop)
# 021563       halt -d -f -i -p
# 021564       ;;
# 021565 
# 021566    *)
# 021567       echo "Usage: {stop}"
# 021568       exit 1
# 021569       ;;
# 021570 esac
# 021571 
# 021572 # End halt
# 021573 

 
# 021576        D.20. /etc/rc.d/init.d/template 



# 021580 #!/bin/sh
# 021581 ########################################################################
# 021582 # Begin scriptname
# 021583 #
# 021584 # Description :
# 021585 #
# 021586 # Authors     :
# 021587 #
# 021588 # Version     : LFS x.x
# 021589 #
# 021590 # Notes       :
# 021591 #
# 021592 ########################################################################
# 021593 
# 021594 ### BEGIN INIT INFO
# 021595 # Provides:            template
# 021596 # Required-Start:
# 021597 # Should-Start:
# 021598 # Required-Stop:
# 021599 # Should-Stop:
# 021600 # Default-Start:
# 021601 # Default-Stop:
# 021602 # Short-Description:
# 021603 # Description:
# 021604 # X-LFS-Provided-By:
# 021605 ### END INIT INFO
# 021606 
# 021607 . /lib/lsb/init-functions
# 021608 
# 021609 case "${1}" in
# 021610    start)
# 021611       log_info_msg "Starting..."
# 021612       start_daemon fully_qualified_path
# 021613       ;;
# 021614 
# 021615    stop)
# 021616       log_info_msg "Stopping..."
# 021617       killproc fully_qualified_path
# 021618       ;;
# 021619 
# 021620    restart)
# 021621       ${0} stop
# 021622       sleep 1
# 021623       ${0} start
# 021624       ;;
# 021625 
# 021626    *)
# 021627       echo "Usage: ${0} {start|stop|restart}"
# 021628       exit 1
# 021629       ;;
# 021630 esac
# 021631 
# 021632 exit 0
# 021633 
# 021634 # End scriptname
# 021635 

 
# 021638        D.21. /etc/sysconfig/modules 



# 021642 ########################################################################
# 021643 # Begin /etc/sysconfig/modules
# 021644 #
# 021645 # Description : Module auto-loading configuration
# 021646 #
# 021647 # Authors     :
# 021648 #
# 021649 # Version     : 00.00
# 021650 #
# 021651 # Notes       : The syntax of this file is as follows:
# 021652 #          <module> [<arg1> <arg2> ...]
# 021653 #
# 021654 # Each module should be on its own line, and any options that you want
# 021655 # passed to the module should follow it.  The line deliminator is either
# 021656 # a space or a tab.
# 021657 ########################################################################
# 021658 
# 021659 # End /etc/sysconfig/modules
# 021660 

 
# 021663        D.22. /etc/sysconfig/createfiles 



# 021667 ########################################################################
# 021668 # Begin /etc/sysconfig/createfiles
# 021669 #
# 021670 # Description : Createfiles script config file
# 021671 #
# 021672 # Authors     :
# 021673 #
# 021674 # Version     : 00.00
# 021675 #
# 021676 # Notes       : The syntax of this file is as follows:
# 021677 #         if type is equal to "file" or "dir"
# 021678 #          <filename> <type> <permissions> <user> <group>
# 021679 #         if type is equal to "dev"
# 021680 #          <filename> <type> <permissions> <user> <group> <devtype> 
# 021681 #             <major> <minor>
# 021682 #
# 021683 #         <filename> is the name of the file which is to be created
# 021684 #         <type> is either file, dir, or dev.
# 021685 #               file creates a new file
# 021686 #               dir creates a new directory
# 021687 #               dev creates a new device
# 021688 #         <devtype> is either block, char or pipe
# 021689 #               block creates a block device
# 021690 #               char creates a character deivce
# 021691 #               pipe creates a pipe, this will ignore the <major> and 
# 021692 #           <minor> fields
# 021693 #         <major> and <minor> are the major and minor numbers used for 
# 021694 #     the device.
# 021695 ########################################################################
# 021696 
# 021697 # End /etc/sysconfig/createfiles
# 021698 

 
# 021701        D.23. /etc/sysconfig/udev-retry 



# 021705 ########################################################################
# 021706 # Begin /etc/sysconfig/udev_retry
# 021707 #
# 021708 # Description : udev_retry script configuration
# 021709 #
# 021710 # Authors     :
# 021711 #
# 021712 # Version     : 00.00
# 021713 #
# 021714 # Notes       : Each subsystem that may need to be re-triggered after mountfs
# 021715 #               runs should be listed in this file.  Probable subsystems to be
# 021716 #               listed here are rtc (due to /var/lib/hwclock/adjtime) and sound
# 021717 #               (due to both /var/lib/alsa/asound.state and /usr/sbin/alsactl).
# 021718 #               Entries are whitespace-separated.
# 021719 ########################################################################
# 021720 
# 021721 rtc
# 021722 
# 021723 # End /etc/sysconfig/udev_retry
# 021724 

 
# 021727        D.24. /sbin/ifup 



# 021731 #!/bin/sh
# 021732 ########################################################################
# 021733 # Begin /sbin/ifup
# 021734 #
# 021735 # Description : Interface Up
# 021736 #
# 021737 # Authors     : Nathan Coulson - nathan AT linuxfromscratch D0T org
# 021738 #               Kevin P. Fleming - kpfleming@linuxfromscratch.org
# 021739 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 021740 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 021741 #
# 021742 # Version     : LFS 7.7
# 021743 #
# 021744 # Notes       : The IFCONFIG variable is passed to the SERVICE script
# 021745 #               in the /lib/services directory, to indicate what file the
# 021746 #               service should source to get interface specifications.
# 021747 #
# 021748 ########################################################################
# 021749 
# 021750 up()
# 021751 {
# 021752   log_info_msg "Bringing up the ${1} interface..."
# 021753 
# 021754   if ip link show $1 > /dev/null 2>&1; then
# 021755      link_status=`ip link show $1`
# 021756 
# 021757      if [ -n "${link_status}" ]; then
# 021758         if ! echo "${link_status}" | grep -q UP; then
# 021759            ip link set $1 up
# 021760         fi
# 021761      fi
# 021762 
# 021763   else
# 021764      log_failure_msg "Interface ${IFACE} doesn't exist."
# 021765      exit 1
# 021766   fi
# 021767 
# 021768   evaluate_retval
# 021769 }
# 021770 
# 021771 RELEASE="7.7"
# 021772 
# 021773 USAGE="Usage: $0 [ -hV ] [--help] [--version] interface"
# 021774 VERSTR="LFS ifup, version ${RELEASE}"
# 021775 
# 021776 while [ $# -gt 0 ]; do
# 021777    case "$1" in
# 021778       --help | -h)     help="y"; break ;;
# 021779 
# 021780       --version | -V)  echo "${VERSTR}"; exit 0 ;;
# 021781    
# 021782       -*)              echo "ifup: ${1}: invalid option" >&2
# 021783                        echo "${USAGE}" >& 2
# 021784                        exit 2 ;;
# 021785                        
# 021786       *)               break ;;
# 021787    esac
# 021788 done
# 021789 
# 021790 if [ -n "$help" ]; then
# 021791    echo "${VERSTR}"
# 021792    echo "${USAGE}"
# 021793    echo
# 021794    cat << HERE_EOF
# 021795 ifup is used to bring up a network interface.  The interface
# 021796 parameter, e.g. eth0 or eth0:2, must match the trailing part of the
# 021797 interface specifications file, e.g. /etc/sysconfig/ifconfig.eth0:2.
# 021798 
# 021799 HERE_EOF
# 021800    exit 0
# 021801 fi
# 021802 
# 021803 file=/etc/sysconfig/ifconfig.${1}
# 021804 
# 021805 # Skip backup files
# 021806 [ "${file}" = "${file%""~""}" ] || exit 0
# 021807 
# 021808 . /lib/lsb/init-functions
# 021809 
# 021810 if [ ! -r "${file}" ]; then
# 021811    log_failure_msg "Unable to bring up ${1} interface! ${file} is missing or cannot be accessed."
# 021812    exit 1
# 021813 fi
# 021814 
# 021815 .  $file
# 021816 
# 021817 if [ "$IFACE" = "" ]; then
# 021818    log_failure_msg "Unable to bring up ${1} interface! ${file} does not define an interface [IFACE]."
# 021819    exit 1
# 021820 fi
# 021821 
# 021822 # Do not process this service if started by boot, and ONBOOT
# 021823 # is not set to yes
# 021824 if [ "${IN_BOOT}" = "1" -a "${ONBOOT}" != "yes" ]; then
# 021825    exit 0
# 021826 fi
# 021827 
# 021828 # Bring up the interface
# 021829 if [ "$VIRTINT" != "yes" ]; then
# 021830    up ${IFACE}
# 021831 fi
# 021832 
# 021833 for S in ${SERVICE}; do
# 021834   if [ ! -x "/lib/services/${S}" ]; then
# 021835     MSG="\nUnable to process ${file}.  Either " 
# 021836     MSG="${MSG}the SERVICE '${S} was not present "
# 021837     MSG="${MSG}or cannot be executed."
# 021838     log_failure_msg "$MSG"
# 021839     exit 1
# 021840   fi
# 021841 done
# 021842 
# 021843 if [ "${SERVICE}" = "wpa" ]; then log_success_msg; fi
# 021844 
# 021845 # Create/configure the interface
# 021846 for S in ${SERVICE}; do 
# 021847   IFCONFIG=${file} /lib/services/${S} ${IFACE} up
# 021848 done
# 021849 
# 021850 # Set link up virtual interfaces
# 021851 if [ "${VIRTINT}" == "yes" ]; then
# 021852    up ${IFACE}
# 021853 fi
# 021854 
# 021855 # Bring up any additional interface components
# 021856 for I in $INTERFACE_COMPONENTS; do up $I; done
# 021857 
# 021858 # Set MTU if requested. Check if MTU has a "good" value.
# 021859 if test -n "${MTU}"; then
# 021860    if [[ ${MTU} =~ ^[0-9]+$ ]] && [[ $MTU -ge 68 ]] ; then
# 021861       for I in $IFACE $INTERFACE_COMPONENTS; do 
# 021862          ip link set dev $I mtu $MTU; 
# 021863       done
# 021864    else
# 021865       log_info_msg2 "Invalid MTU $MTU"
# 021866    fi
# 021867 fi 
# 021868 
# 021869 # Set the route default gateway if requested
# 021870 if [ -n "${GATEWAY}" ]; then
# 021871    if ip route | grep -q default; then
# 021872       log_warning_msg "Gateway already setup; skipping."
# 021873    else
# 021874       log_info_msg "Adding default gateway ${GATEWAY} to the ${IFACE} interface..."
# 021875       ip route add default via ${GATEWAY} dev ${IFACE}
# 021876       evaluate_retval
# 021877    fi
# 021878 fi
# 021879 
# 021880 # End /sbin/ifup
# 021881 

 
# 021884        D.25. /sbin/ifdown 



# 021888 #!/bin/bash 
# 021889 ########################################################################
# 021890 # Begin /sbin/ifdown
# 021891 #
# 021892 # Description : Interface Down
# 021893 #
# 021894 # Authors     : Nathan Coulson - nathan AT linuxfromscratch D0T org
# 021895 #               Kevin P. Fleming - kpfleming@linuxfromscratch.org
# 021896 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 021897 #
# 021898 # Version     : LFS 7.0
# 021899 #
# 021900 # Notes       : the IFCONFIG variable is passed to the scripts found
# 021901 #               in the /lib/services directory, to indicate what file the
# 021902 #               service should source to get interface specifications.
# 021903 #
# 021904 ########################################################################
# 021905 
# 021906 RELEASE="7.0"
# 021907 
# 021908 USAGE="Usage: $0 [ -hV ] [--help] [--version] interface"
# 021909 VERSTR="LFS ifdown, version ${RELEASE}"
# 021910 
# 021911 while [ $# -gt 0 ]; do
# 021912    case "$1" in
# 021913       --help | -h)     help="y"; break ;;
# 021914 
# 021915       --version | -V)  echo "${VERSTR}"; exit 0 ;;
# 021916 
# 021917       -*)              echo "ifup: ${1}: invalid option" >&2
# 021918                        echo "${USAGE}" >& 2
# 021919                        exit 2 ;;
# 021920                     
# 021921       *)               break ;;
# 021922    esac
# 021923 done
# 021924 
# 021925 if [ -n "$help" ]; then
# 021926    echo "${VERSTR}"
# 021927    echo "${USAGE}"
# 021928    echo
# 021929    cat << HERE_EOF
# 021930 ifdown is used to bring down a network interface.  The interface
# 021931 parameter, e.g. eth0 or eth0:2, must match the trailing part of the
# 021932 interface specifications file, e.g. /etc/sysconfig/ifconfig.eth0:2.
# 021933 
# 021934 HERE_EOF
# 021935    exit 0
# 021936 fi
# 021937 
# 021938 file=/etc/sysconfig/ifconfig.${1}
# 021939 
# 021940 # Skip backup files
# 021941 [ "${file}" = "${file%""~""}" ] || exit 0
# 021942 
# 021943 . /lib/lsb/init-functions 
# 021944 
# 021945 if [ ! -r "${file}" ]; then
# 021946    log_warning_msg "${file} is missing or cannot be accessed."
# 021947    exit 1
# 021948 fi
# 021949 
# 021950 . ${file}
# 021951 
# 021952 if [ "$IFACE" = "" ]; then
# 021953    log_failure_msg "${file} does not define an interface [IFACE]."
# 021954    exit 1
# 021955 fi
# 021956 
# 021957 # We only need to first service to bring down the interface
# 021958 S=`echo ${SERVICE} | cut -f1 -d" "`
# 021959 
# 021960 if ip link show ${IFACE} > /dev/null 2>&1; then
# 021961    if [ -n "${S}" -a -x "/lib/services/${S}" ]; then
# 021962      IFCONFIG=${file} /lib/services/${S} ${IFACE} down
# 021963    else
# 021964      MSG="Unable to process ${file}.  Either "
# 021965      MSG="${MSG}the SERVICE variable was not set "
# 021966      MSG="${MSG}or the specified service cannot be executed."
# 021967      log_failure_msg "$MSG"
# 021968      exit 1
# 021969   fi
# 021970 else
# 021971    log_warning_msg "Interface ${1} doesn't exist."
# 021972 fi
# 021973 
# 021974 # Leave the interface up if there are additional interfaces in the device
# 021975 link_status=`ip link show ${IFACE} 2>/dev/null`
# 021976 
# 021977 if [ -n "${link_status}" ]; then
# 021978    if [ "$(echo "${link_status}" | grep UP)" != "" ]; then
# 021979       if [ "$(ip addr show ${IFACE} | grep 'inet ')" == ""  ]; then
# 021980          log_info_msg "Bringing down the ${IFACE} interface..."
# 021981          ip link set ${IFACE} down
# 021982          evaluate_retval
# 021983       fi
# 021984    fi
# 021985 fi
# 021986 
# 021987 # End /sbin/ifdown
# 021988 

 
# 021991        D.26. /lib/services/ipv4-static 



# 021995 #!/bin/sh
# 021996 ########################################################################
# 021997 # Begin /lib/services/ipv4-static
# 021998 #
# 021999 # Description : IPV4 Static Boot Script
# 022000 #
# 022001 # Authors     : Nathan Coulson - nathan AT linuxfromscratch D0T org
# 022002 #               Kevin P. Fleming - kpfleming@linuxfromscratch.org
# 022003 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 022004 #
# 022005 # Version     : LFS 7.0
# 022006 #
# 022007 ########################################################################
# 022008 
# 022009 . /lib/lsb/init-functions
# 022010 . ${IFCONFIG}
# 022011 
# 022012 if [ -z "${IP}" ]; then
# 022013    log_failure_msg "\nIP variable missing from ${IFCONFIG}, cannot continue."
# 022014    exit 1
# 022015 fi
# 022016 
# 022017 if [ -z "${PREFIX}" -a -z "${PEER}" ]; then
# 022018    log_warning_msg "\nPREFIX variable missing from ${IFCONFIG}, assuming 24."
# 022019    PREFIX=24
# 022020    args="${args} ${IP}/${PREFIX}"
# 022021 
# 022022 elif [ -n "${PREFIX}" -a -n "${PEER}" ]; then
# 022023    log_failure_msg "\nPREFIX and PEER both specified in ${IFCONFIG}, cannot continue."
# 022024    exit 1
# 022025 
# 022026 elif [ -n "${PREFIX}" ]; then
# 022027    args="${args} ${IP}/${PREFIX}"
# 022028 
# 022029 elif [ -n "${PEER}" ]; then
# 022030    args="${args} ${IP} peer ${PEER}"
# 022031 fi
# 022032 
# 022033 if [ -n "${LABEL}" ]; then
# 022034    args="${args} label ${LABEL}"
# 022035 fi
# 022036 
# 022037 if [ -n "${BROADCAST}" ]; then
# 022038    args="${args} broadcast ${BROADCAST}"
# 022039 fi
# 022040 
# 022041 case "${2}" in
# 022042    up)
# 022043       if [ "$(ip addr show ${1} 2>/dev/null | grep ${IP}/)" = "" ]; then
# 022044          log_info_msg "Adding IPv4 address ${IP} to the ${1} interface..."
# 022045          ip addr add ${args} dev ${1}
# 022046          evaluate_retval
# 022047       else
# 022048          log_warning_msg "Cannot add IPv4 address ${IP} to ${1}.  Already present."
# 022049       fi
# 022050    ;;
# 022051 
# 022052    down)
# 022053       if [ "$(ip addr show ${1} 2>/dev/null | grep ${IP}/)" != "" ]; then
# 022054          log_info_msg "Removing IPv4 address ${IP} from the ${1} interface..."
# 022055          ip addr del ${args} dev ${1}
# 022056          evaluate_retval
# 022057       fi
# 022058 
# 022059       if [ -n "${GATEWAY}" ]; then
# 022060          # Only remove the gateway if there are no remaining ipv4 addresses
# 022061          if [ "$(ip addr show ${1} 2>/dev/null | grep 'inet ')" != "" ]; then
# 022062             log_info_msg "Removing default gateway..."
# 022063             ip route del default
# 022064             evaluate_retval
# 022065          fi
# 022066       fi
# 022067    ;;
# 022068 
# 022069    *)
# 022070       echo "Usage: ${0} [interface] {up|down}"
# 022071       exit 1
# 022072    ;;
# 022073 esac
# 022074 
# 022075 # End /lib/services/ipv4-static
# 022076 

 
# 022079        D.27. /lib/services/ipv4-static-route 



# 022083 #!/bin/sh
# 022084 ########################################################################
# 022085 # Begin /lib/services/ipv4-static-route
# 022086 #
# 022087 # Description : IPV4 Static Route Script
# 022088 #
# 022089 # Authors     : Kevin P. Fleming - kpfleming@linuxfromscratch.org
# 022090 #               DJ Lucas - dj AT linuxfromscratch D0T org
# 022091 # Update      : Bruce Dubbs - bdubbs AT linuxfromscratch D0T org
# 022092 #
# 022093 # Version     : LFS 7.0
# 022094 #
# 022095 ########################################################################
# 022096 
# 022097 . /lib/lsb/init-functions
# 022098 . ${IFCONFIG}
# 022099 
# 022100 case "${TYPE}" in
# 022101    ("" | "network")
# 022102       need_ip=1
# 022103       need_gateway=1
# 022104    ;;
# 022105 
# 022106    ("default")
# 022107       need_gateway=1
# 022108       args="${args} default"
# 022109       desc="default"
# 022110    ;;
# 022111 
# 022112    ("host")
# 022113       need_ip=1
# 022114    ;;
# 022115 
# 022116    ("unreachable")
# 022117       need_ip=1
# 022118       args="${args} unreachable"
# 022119       desc="unreachable "
# 022120    ;;
# 022121 
# 022122    (*)
# 022123       log_failure_msg "Unknown route type (${TYPE}) in ${IFCONFIG}, cannot continue."
# 022124       exit 1
# 022125    ;;
# 022126 esac
# 022127 
# 022128 if [ -n "${GATEWAY}" ]; then
# 022129    MSG="The GATEWAY variable cannot be set in ${IFCONFIG} for static routes.\n"
# 022130    log_failure_msg "$MSG Use STATIC_GATEWAY only, cannot continue"
# 022131    exit 1
# 022132 fi
# 022133 
# 022134 if [ -n "${need_ip}" ]; then
# 022135    if [ -z "${IP}" ]; then
# 022136       log_failure_msg "IP variable missing from ${IFCONFIG}, cannot continue."
# 022137       exit 1
# 022138    fi
# 022139 
# 022140    if [ -z "${PREFIX}" ]; then
# 022141       log_failure_msg "PREFIX variable missing from ${IFCONFIG}, cannot continue." 
# 022142       exit 1
# 022143    fi
# 022144    
# 022145    args="${args} ${IP}/${PREFIX}"
# 022146    desc="${desc}${IP}/${PREFIX}"
# 022147 fi
# 022148 
# 022149 if [ -n "${need_gateway}" ]; then
# 022150    if [ -z "${STATIC_GATEWAY}" ]; then
# 022151       log_failure_msg "STATIC_GATEWAY variable missing from ${IFCONFIG}, cannot continue."
# 022152       exit 1
# 022153    fi
# 022154    args="${args} via ${STATIC_GATEWAY}"
# 022155 fi
# 022156 
# 022157 if [ -n "${SOURCE}" ]; then
# 022158         args="${args} src ${SOURCE}"
# 022159 fi
# 022160 
# 022161 case "${2}" in
# 022162    up)
# 022163       log_info_msg "Adding '${desc}' route to the ${1} interface..."
# 022164       ip route add ${args} dev ${1}
# 022165       evaluate_retval
# 022166    ;;
# 022167    
# 022168    down)
# 022169       log_info_msg "Removing '${desc}' route from the ${1} interface..."
# 022170       ip route del ${args} dev ${1}
# 022171       evaluate_retval
# 022172    ;;
# 022173    
# 022174    *)
# 022175       echo "Usage: ${0} [interface] {up|down}"
# 022176       exit 1
# 022177    ;;
# 022178 esac
# 022179 
# 022180 # End /lib/services/ipv4-static-route
# 022181 

 
# 022184        Appendix E. Udev configuration rules 
# 022185 
# 022186                          The rules in this appendix are listed for convenience. Installation is normally
# 022187                        done via instructions in Section 8.70, "Eudev-3.2.10" .  
# 022188        E.1. 55-lfs.rules 



# 022192 # /etc/udev/rules.d/55-lfs.rules: Rule definitions for LFS.
# 022193 
# 022194 # Core kernel devices
# 022195 
# 022196 # This causes the system clock to be set as soon as /dev/rtc becomes available.
# 022197 SUBSYSTEM=="rtc", ACTION=="add", MODE="0644", RUN+="/etc/rc.d/init.d/setclock start"
# 022198 KERNEL=="rtc", ACTION=="add", MODE="0644", RUN+="/etc/rc.d/init.d/setclock start"
# 022199 
# 022200 # Comms devices
# 022201 
# 022202 KERNEL=="ippp[0-9]*",       GROUP="dialout"
# 022203 KERNEL=="isdn[0-9]*",       GROUP="dialout"
# 022204 KERNEL=="isdnctrl[0-9]*",   GROUP="dialout"
# 022205 KERNEL=="dcbri[0-9]*",      GROUP="dialout"
# 022206 

 
# 022209        Appendix F. LFS Licenses 
# 022210 
# 022211                          This book is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike
# 022212                        2.0 License. 
# 022213 
# 022214                          Computer instructions may be extracted from the book under the MIT License.  
# 022215        F.1. Creative Commons License 
# 022216 
# 022217                          Creative Commons Legal Code 
# 022218 
# 022219                          Attribution-NonCommercial-ShareAlike 2.0 
# 022220          Important 
# 022221 
# 022222                          CREATIVE COMMONS CORPORATION IS NOT A LAW FIRM AND DOES NOT PROVIDE LEGAL SERVICES.
# 022223                        DISTRIBUTION OF THIS LICENSE DOES NOT CREATE AN ATTORNEY-CLIENT RELATIONSHIP. CREATIVE
# 022224                        COMMONS PROVIDES THIS INFORMATION ON AN "AS-IS" BASIS. CREATIVE COMMONS MAKES NO
# 022225                        WARRANTIES REGARDING THE INFORMATION PROVIDED, AND DISCLAIMS LIABILITY FOR DAMAGES
# 022226                        RESULTING FROM ITS USE. 
# 022227 
# 022228                          License 
# 022229 
# 022230                          THE WORK (AS DEFINED BELOW) IS PROVIDED UNDER THE TERMS OF THIS CREATIVE COMMONS
# 022231                        PUBLIC LICENSE ("CCPL" OR "LICENSE"). THE WORK IS PROTECTED BY COPYRIGHT AND/OR
# 022232                        OTHER APPLICABLE LAW. ANY USE OF THE WORK OTHER THAN AS AUTHORIZED UNDER THIS LICENSE
# 022233                        OR COPYRIGHT LAW IS PROHIBITED. 
# 022234 
# 022235                          BY EXERCISING ANY RIGHTS TO THE WORK PROVIDED HERE, YOU ACCEPT AND AGREE TO BE BOUND
# 022236                        BY THE TERMS OF THIS LICENSE. THE LICENSOR GRANTS YOU THE RIGHTS CONTAINED HERE
# 022237                        IN CONSIDERATION OF YOUR ACCEPTANCE OF SUCH TERMS AND CONDITIONS. 
# 022238 
# 022239                          Definitions 
# 022240 
# 022241                          "Collective Work" means a work, such as a periodical issue, anthology or encyclopedia,
# 022242                        in which the Work in its entirety in unmodified form, along with a number of other
# 022243                        contributions, constituting separate and independent works in themselves, are assembled
# 022244                        into a collective whole. A work that constitutes a Collective Work will not be considered
# 022245                        a Derivative Work (as defined below) for the purposes of this License. 
# 022246 
# 022247                          "Derivative Work" means a work based upon the Work or upon the Work and other pre-existing
# 022248                        works, such as a translation, musical arrangement, dramatization, fictionalization,
# 022249                        motion picture version, sound recording, art reproduction, abridgment, condensation,
# 022250                        or any other form in which the Work may be recast, transformed, or adapted, except
# 022251                        that a work that constitutes a Collective Work will not be considered a Derivative
# 022252                        Work for the purpose of this License. For the avoidance of doubt, where the Work
# 022253                        is a musical composition or sound recording, the synchronization of the Work in
# 022254                        timed-relation with a moving image ("synching") will be considered a Derivative
# 022255                        Work for the purpose of this License. 
# 022256 
# 022257                          "Licensor" means the individual or entity that offers the Work under the terms of
# 022258                        this License. 
# 022259 
# 022260                          "Original Author" means the individual or entity who created the Work. 
# 022261 
# 022262                          "Work" means the copyrightable work of authorship offered under the terms of this
# 022263                        License. 
# 022264 
# 022265                          "You" means an individual or entity exercising rights under this License who has
# 022266                        not previously violated the terms of this License with respect to the Work, or who
# 022267                        has received express permission from the Licensor to exercise rights under this
# 022268                        License despite a previous violation. 
# 022269 
# 022270                          "License Elements" means the following high-level license attributes as selected
# 022271                        by Licensor and indicated in the title of this License: Attribution, Noncommercial,
# 022272                        ShareAlike. 
# 022273 
# 022274                          Fair Use Rights. Nothing in this license is intended to reduce, limit, or restrict
# 022275                        any rights arising from fair use, first sale or other limitations on the exclusive
# 022276                        rights of the copyright owner under copyright law or other applicable laws. 
# 022277 
# 022278                          License Grant. Subject to the terms and conditions of this License, Licensor hereby
# 022279                        grants You a worldwide, royalty-free, non-exclusive, perpetual (for the duration
# 022280                        of the applicable copyright) license to exercise the rights in the Work as stated
# 022281                        below: 
# 022282 
# 022283                          to reproduce the Work, to incorporate the Work into one or more Collective Works,
# 022284                        and to reproduce the Work as incorporated in the Collective Works; 
# 022285 
# 022286                          to create and reproduce Derivative Works; 
# 022287 
# 022288                          to distribute copies or phonorecords of, display publicly, perform publicly, and
# 022289                        perform publicly by means of a digital audio transmission the Work including as
# 022290                        incorporated in Collective Works; 
# 022291 
# 022292                          to distribute copies or phonorecords of, display publicly, perform publicly, and
# 022293                        perform publicly by means of a digital audio transmission Derivative Works; 
# 022294 
# 022295                          The above rights may be exercised in all media and formats whether now known or
# 022296                        hereafter devised. The above rights include the right to make such modifications
# 022297                        as are technically necessary to exercise the rights in other media and formats.
# 022298                        All rights not expressly granted by Licensor are hereby reserved, including but
# 022299                        not limited to the rights set forth in Sections 4(e) and 4(f). 
# 022300 
# 022301                          Restrictions.The license granted in Section 3 above is expressly made subject to
# 022302                        and limited by the following restrictions: 
# 022303 
# 022304                          You may distribute, publicly display, publicly perform, or publicly digitally perform
# 022305                        the Work only under the terms of this License, and You must include a copy of, or
# 022306                        the Uniform Resource Identifier for, this License with every copy or phonorecord
# 022307                        of the Work You distribute, publicly display, publicly perform, or publicly digitally
# 022308                        perform. You may not offer or impose any terms on the Work that alter or restrict
# 022309                        the terms of this License or the recipients' exercise of the rights granted hereunder.
# 022310                        You may not sublicense the Work. You must keep intact all notices that refer to
# 022311                        this License and to the disclaimer of warranties. You may not distribute, publicly
# 022312                        display, publicly perform, or publicly digitally perform the Work with any technological
# 022313                        measures that control access or use of the Work in a manner inconsistent with the
# 022314                        terms of this License Agreement. The above applies to the Work as incorporated in
# 022315                        a Collective Work, but this does not require the Collective Work apart from the
# 022316                        Work itself to be made subject to the terms of this License. If You create a Collective
# 022317                        Work, upon notice from any Licensor You must, to the extent practicable, remove
# 022318                        from the Collective Work any reference to such Licensor or the Original Author,
# 022319                        as requested. If You create a Derivative Work, upon notice from any Licensor You
# 022320                        must, to the extent practicable, remove from the Derivative Work any reference to
# 022321                        such Licensor or the Original Author, as requested. 
# 022322 
# 022323                          You may distribute, publicly display, publicly perform, or publicly digitally perform
# 022324                        a Derivative Work only under the terms of this License, a later version of this
# 022325                        License with the same License Elements as this License, or a Creative Commons iCommons
# 022326                        license that contains the same License Elements as this License (e.g. Attribution-NonCommercial-ShareAlike
# 022327                        2.0 Japan). You must include a copy of, or the Uniform Resource Identifier for,
# 022328                        this License or other license specified in the previous sentence with every copy
# 022329                        or phonorecord of each Derivative Work You distribute, publicly display, publicly
# 022330                        perform, or publicly digitally perform. You may not offer or impose any terms on
# 022331                        the Derivative Works that alter or restrict the terms of this License or the recipients'
# 022332                        exercise of the rights granted hereunder, and You must keep intact all notices that
# 022333                        refer to this License and to the disclaimer of warranties. You may not distribute,
# 022334                        publicly display, publicly perform, or publicly digitally perform the Derivative
# 022335                        Work with any technological measures that control access or use of the Work in a
# 022336                        manner inconsistent with the terms of this License Agreement. The above applies
# 022337                        to the Derivative Work as incorporated in a Collective Work, but this does not require
# 022338                        the Collective Work apart from the Derivative Work itself to be made subject to
# 022339                        the terms of this License. 
# 022340 
# 022341                          You may not exercise any of the rights granted to You in Section 3 above in any
# 022342                        manner that is primarily intended for or directed toward commercial advantage or
# 022343                        private monetary compensation. The exchange of the Work for other copyrighted works
# 022344                        by means of digital file-sharing or otherwise shall not be considered to be intended
# 022345                        for or directed toward commercial advantage or private monetary compensation, provided
# 022346                        there is no payment of any monetary compensation in connection with the exchange
# 022347                        of copyrighted works. 
# 022348 
# 022349                          If you distribute, publicly display, publicly perform, or publicly digitally perform
# 022350                        the Work or any Derivative Works or Collective Works, You must keep intact all copyright
# 022351                        notices for the Work and give the Original Author credit reasonable to the medium
# 022352                        or means You are utilizing by conveying the name (or pseudonym if applicable) of
# 022353                        the Original Author if supplied; the title of the Work if supplied; to the extent
# 022354                        reasonably practicable, the Uniform Resource Identifier, if any, that Licensor specifies
# 022355                        to be associated with the Work, unless such URI does not refer to the copyright
# 022356                        notice or licensing information for the Work; and in the case of a Derivative Work,
# 022357                        a credit identifying the use of the Work in the Derivative Work (e.g., "French translation
# 022358                        of the Work by Original Author," or "Screenplay based on original Work by Original
# 022359                        Author"). Such credit may be implemented in any reasonable manner; provided, however,
# 022360                        that in the case of a Derivative Work or Collective Work, at a minimum such credit
# 022361                        will appear where any other comparable authorship credit appears and in a manner
# 022362                        at least as prominent as such other comparable authorship credit. 
# 022363 
# 022364                          For the avoidance of doubt, where the Work is a musical composition: 
# 022365 
# 022366                          Performance Royalties Under Blanket Licenses. Licensor reserves the exclusive right
# 022367                        to collect, whether individually or via a performance rights society (e.g. ASCAP,
# 022368                        BMI, SESAC), royalties for the public performance or public digital performance
# 022369                        (e.g. webcast) of the Work if that performance is primarily intended for or directed
# 022370                        toward commercial advantage or private monetary compensation. 
# 022371 
# 022372                          Mechanical Rights and Statutory Royalties. Licensor reserves the exclusive right
# 022373                        to collect, whether individually or via a music rights agency or designated agent
# 022374                        (e.g. Harry Fox Agency), royalties for any phonorecord You create from the Work
# 022375                        ("cover version") and distribute, subject to the compulsory license created by 17
# 022376                        USC Section 115 of the US Copyright Act (or the equivalent in other jurisdictions),
# 022377                        if Your distribution of such cover version is primarily intended for or directed
# 022378                        toward commercial advantage or private monetary compensation. 6. Webcasting Rights
# 022379                        and Statutory Royalties. For the avoidance of doubt, where the Work is a sound recording,
# 022380                        Licensor reserves the exclusive right to collect, whether individually or via a
# 022381                        performance-rights society (e.g. SoundExchange), royalties for the public digital
# 022382                        performance (e.g. webcast) of the Work, subject to the compulsory license created
# 022383                        by 17 USC Section 114 of the US Copyright Act (or the equivalent in other jurisdictions),
# 022384                        if Your public digital performance is primarily intended for or directed toward
# 022385                        commercial advantage or private monetary compensation. 
# 022386 
# 022387                          Webcasting Rights and Statutory Royalties. For the avoidance of doubt, where the
# 022388                        Work is a sound recording, Licensor reserves the exclusive right to collect, whether
# 022389                        individually or via a performance-rights society (e.g. SoundExchange), royalties
# 022390                        for the public digital performance (e.g. webcast) of the Work, subject to the compulsory
# 022391                        license created by 17 USC Section 114 of the US Copyright Act (or the equivalent
# 022392                        in other jurisdictions), if Your public digital performance is primarily intended
# 022393                        for or directed toward commercial advantage or private monetary compensation. 
# 022394 
# 022395                          Representations, Warranties and Disclaimer 
# 022396 
# 022397                          UNLESS OTHERWISE MUTUALLY AGREED TO BY THE PARTIES IN WRITING, LICENSOR OFFERS THE
# 022398                        WORK AS-IS AND MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND CONCERNING THE
# 022399                        WORK, EXPRESS, IMPLIED, STATUTORY OR OTHERWISE, INCLUDING, WITHOUT LIMITATION, WARRANTIES
# 022400                        OF TITLE, MERCHANTIBILITY, FITNESS FOR A PARTICULAR PURPOSE, NONINFRINGEMENT, OR
# 022401                        THE ABSENCE OF LATENT OR OTHER DEFECTS, ACCURACY, OR THE PRESENCE OF ABSENCE OF
# 022402                        ERRORS, WHETHER OR NOT DISCOVERABLE. SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION
# 022403                        OF IMPLIED WARRANTIES, SO SUCH EXCLUSION MAY NOT APPLY TO YOU. 
# 022404 
# 022405                          Limitation on Liability. EXCEPT TO THE EXTENT REQUIRED BY APPLICABLE LAW, IN NO
# 022406                        EVENT WILL LICENSOR BE LIABLE TO YOU ON ANY LEGAL THEORY FOR ANY SPECIAL, INCIDENTAL,
# 022407                        CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES ARISING OUT OF THIS LICENSE OR THE
# 022408                        USE OF THE WORK, EVEN IF LICENSOR HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
# 022409                        
# 022410 
# 022411                          Termination 
# 022412 
# 022413                          This License and the rights granted hereunder will terminate automatically upon
# 022414                        any breach by You of the terms of this License. Individuals or entities who have
# 022415                        received Derivative Works or Collective Works from You under this License, however,
# 022416                        will not have their licenses terminated provided such individuals or entities remain
# 022417                        in full compliance with those licenses. Sections 1, 2, 5, 6, 7, and 8 will survive
# 022418                        any termination of this License. 
# 022419 
# 022420                          Subject to the above terms and conditions, the license granted here is perpetual
# 022421                        (for the duration of the applicable copyright in the Work). Notwithstanding the
# 022422                        above, Licensor reserves the right to release the Work under different license terms
# 022423                        or to stop distributing the Work at any time; provided, however that any such election
# 022424                        will not serve to withdraw this License (or any other license that has been, or
# 022425                        is required to be, granted under the terms of this License), and this License will
# 022426                        continue in full force and effect unless terminated as stated above. 
# 022427 
# 022428                          Miscellaneous 
# 022429 
# 022430                          Each time You distribute or publicly digitally perform the Work or a Collective
# 022431                        Work, the Licensor offers to the recipient a license to the Work on the same terms
# 022432                        and conditions as the license granted to You under this License. 
# 022433 
# 022434                          Each time You distribute or publicly digitally perform a Derivative Work, Licensor
# 022435                        offers to the recipient a license to the original Work on the same terms and conditions
# 022436                        as the license granted to You under this License. 
# 022437 
# 022438                          If any provision of this License is invalid or unenforceable under applicable law,
# 022439                        it shall not affect the validity or enforceability of the remainder of the terms
# 022440                        of this License, and without further action by the parties to this agreement, such
# 022441                        provision shall be reformed to the minimum extent necessary to make such provision
# 022442                        valid and enforceable. 
# 022443 
# 022444                          No term or provision of this License shall be deemed waived and no breach consented
# 022445                        to unless such waiver or consent shall be in writing and signed by the party to
# 022446                        be charged with such waiver or consent. 
# 022447 
# 022448                          This License constitutes the entire agreement between the parties with respect to
# 022449                        the Work licensed here. There are no understandings, agreements or representations
# 022450                        with respect to the Work not specified here. Licensor shall not be bound by any
# 022451                        additional provisions that may appear in any communication from You. This License
# 022452                        may not be modified without the mutual written agreement of the Licensor and You.
# 022453                        
# 022454          Important 
# 022455 
# 022456                          Creative Commons is not a party to this License, and makes no warranty whatsoever
# 022457                        in connection with the Work. Creative Commons will not be liable to You or any party
# 022458                        on any legal theory for any damages whatsoever, including without limitation any
# 022459                        general, special, incidental or consequential damages arising in connection to this
# 022460                        license. Notwithstanding the foregoing two (2) sentences, if Creative Commons has
# 022461                        expressly identified itself as the Licensor hereunder, it shall have all rights
# 022462                        and obligations of Licensor. 
# 022463 
# 022464                          Except for the limited purpose of indicating to the public that the Work is licensed
# 022465                        under the CCPL, neither party will use the trademark "Creative Commons" or any related
# 022466                        trademark or logo of Creative Commons without the prior written consent of Creative
# 022467                        Commons. Any permitted use will be in compliance with Creative Commons' then-current
# 022468                        trademark usage guidelines, as may be published on its website or otherwise made
# 022469                        available upon request from time to time. 
# 022470 
# 022471                          Creative Commons may be contacted at http://creativecommons.org/ .  
# 022472        F.2. The MIT License 
# 022473 
# 022474                          Copyright C 1999-2021 Gerard Beekmans 
# 022475 
# 022476                          Permission is hereby granted, free of charge, to any person obtaining a copy of
# 022477                        this software and associated documentation files (the "Software"), to deal in the
# 022478                        Software without restriction, including without limitation the rights to use, copy,
# 022479                        modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
# 022480                        and to permit persons to whom the Software is furnished to do so, subject to the
# 022481                        following conditions: 
# 022482 
# 022483                          The above copyright notice and this permission notice shall be included in all copies
# 022484                        or substantial portions of the Software. 
# 022485 
# 022486                          THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# 022487                        INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
# 022488                        PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
# 022489                        BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# 022490                        TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
# 022491                        USE OR OTHER DEALINGS IN THE SOFTWARE.  
# 022492      Index  
# 022493        Packages 
# 022494           Acl: 
# 022495                Acl-2.2.53 
# 022496           Attr: 
# 022497                Attr-2.4.48 
# 022498           Autoconf: 
# 022499                Autoconf-2.71 
# 022500           Automake: 
# 022501                Automake-1.16.3 
# 022502           Bash: 
# 022503                Bash-5.1 
# 022504           tools: 
# 022505                Bash-5.1 
# 022506           Bc: 
# 022507                Bc-3.3.0 
# 022508           Binutils: 
# 022509                Binutils-2.36.1 
# 022510           tools, pass 1: 
# 022511                Binutils-2.36.1 - Pass 1 
# 022512           tools, pass 2: 
# 022513                Binutils-2.36.1 - Pass 2 
# 022514           Bison: 
# 022515                Bison-3.7.5 
# 022516           tools: 
# 022517                Bison-3.7.5 
# 022518           Bootscripts: 
# 022519                LFS-Bootscripts-20210201 
# 022520           usage: 
# 022521                System V Bootscript Usage and Configuration 
# 022522           Bzip2: 
# 022523                Bzip2-1.0.8 
# 022524           Check: 
# 022525                Check-0.15.2 
# 022526           Coreutils: 
# 022527                Coreutils-8.32 
# 022528           tools: 
# 022529                Coreutils-8.32 
# 022530           DejaGNU: 
# 022531                DejaGNU-1.6.2 
# 022532           Diffutils: 
# 022533                Diffutils-3.7 
# 022534           tools: 
# 022535                Diffutils-3.7 
# 022536           E2fsprogs: 
# 022537                E2fsprogs-1.46.1 
# 022538           Eudev: 
# 022539                Eudev-3.2.10 
# 022540           configuring: 
# 022541                Configuring Eudev 
# 022542           Expat: 
# 022543                Expat-2.2.10 
# 022544           Expect: 
# 022545                Expect-5.45.4 
# 022546           File: 
# 022547                File-5.39 
# 022548           tools: 
# 022549                File-5.39 
# 022550           Findutils: 
# 022551                Findutils-4.8.0 
# 022552           tools: 
# 022553                Findutils-4.8.0 
# 022554           Flex: 
# 022555                Flex-2.6.4 
# 022556           Gawk: 
# 022557                Gawk-5.1.0 
# 022558           tools: 
# 022559                Gawk-5.1.0 
# 022560           GCC: 
# 022561                GCC-10.2.0 
# 022562           tools, libstdc++ pass 1: 
# 022563                Libstdc++ from GCC-10.2.0, Pass 1 
# 022564           tools, libstdc++ pass 2: 
# 022565                Libstdc++ from GCC-10.2.0, Pass 2 
# 022566           tools, pass 1: 
# 022567                GCC-10.2.0 - Pass 1 
# 022568           tools, pass 2: 
# 022569                GCC-10.2.0 - Pass 2 
# 022570           GDBM: 
# 022571                GDBM-1.19 
# 022572           Gettext: 
# 022573                Gettext-0.21 
# 022574           tools: 
# 022575                Gettext-0.21 
# 022576           Glibc: 
# 022577                Glibc-2.33 
# 022578           tools: 
# 022579                Glibc-2.33 
# 022580           GMP: 
# 022581                GMP-6.2.1 
# 022582           Gperf: 
# 022583                Gperf-3.1 
# 022584           Grep: 
# 022585                Grep-3.6 
# 022586           tools: 
# 022587                Grep-3.6 
# 022588           Groff: 
# 022589                Groff-1.22.4 
# 022590           GRUB: 
# 022591                GRUB-2.04 
# 022592           Gzip: 
# 022593                Gzip-1.10 
# 022594           tools: 
# 022595                Gzip-1.10 
# 022596           Iana-Etc: 
# 022597                Iana-Etc-20210202 
# 022598           Inetutils: 
# 022599                Inetutils-2.0 
# 022600           Intltool: 
# 022601                Intltool-0.51.0 
# 022602           IPRoute2: 
# 022603                IPRoute2-5.10.0 
# 022604           Kbd: 
# 022605                Kbd-2.4.0 
# 022606           Kmod: 
# 022607                Kmod-28 
# 022608           Less: 
# 022609                Less-563 
# 022610           Libcap: 
# 022611                Libcap-2.48 
# 022612           Libelf: 
# 022613                Libelf from Elfutils-0.183 
# 022614           libffi: 
# 022615                Libffi-3.3 
# 022616           Libpipeline: 
# 022617                Libpipeline-1.5.3 
# 022618           Libtool: 
# 022619                Libtool-2.4.6 
# 022620           Linux: 
# 022621                Linux-5.10.17 
# 022622           tools, API headers: 
# 022623                Linux-5.10.17 API Headers 
# 022624           M4: 
# 022625                M4-1.4.18 
# 022626           tools: 
# 022627                M4-1.4.18 
# 022628           Make: 
# 022629                Make-4.3 
# 022630           tools: 
# 022631                Make-4.3 
# 022632           Man-DB: 
# 022633                Man-DB-2.9.4 
# 022634           Man-pages: 
# 022635                Man-pages-5.10 
# 022636           Meson: 
# 022637                Meson-0.57.1 
# 022638           MPC: 
# 022639                MPC-1.2.1 
# 022640           MPFR: 
# 022641                MPFR-4.1.0 
# 022642           Ncurses: 
# 022643                Ncurses-6.2 
# 022644           tools: 
# 022645                Ncurses-6.2 
# 022646           Ninja: 
# 022647                Ninja-1.10.2 
# 022648           OpenSSL: 
# 022649                OpenSSL-1.1.1j 
# 022650           Patch: 
# 022651                Patch-2.7.6 
# 022652           tools: 
# 022653                Patch-2.7.6 
# 022654           Perl: 
# 022655                Perl-5.32.1 
# 022656           tools: 
# 022657                Perl-5.32.1 
# 022658           Pkgconfig: 
# 022659                Pkg-config-0.29.2 
# 022660           Procps-ng: 
# 022661                Procps-ng-3.3.17 
# 022662           Psmisc: 
# 022663                Psmisc-23.4 
# 022664           Python: 
# 022665                Python-3.9.2 
# 022666           temporary: 
# 022667                Python-3.9.2 
# 022668           rc.site: 
# 022669                The rc.site File 
# 022670           Readline: 
# 022671                Readline-8.1 
# 022672           Sed: 
# 022673                Sed-4.8 
# 022674           tools: 
# 022675                Sed-4.8 
# 022676           Shadow: 
# 022677                Shadow-4.8.1 
# 022678           configuring: 
# 022679                Configuring Shadow 
# 022680           Sysklogd: 
# 022681                Sysklogd-1.5.1 
# 022682           configuring: 
# 022683                Configuring Sysklogd 
# 022684           Sysvinit: 
# 022685                Sysvinit-2.98 
# 022686           configuring: 
# 022687                Configuring Sysvinit 
# 022688           Tar: 
# 022689                Tar-1.34 
# 022690           tools: 
# 022691                Tar-1.34 
# 022692           Tcl: 
# 022693                Tcl-8.6.11 
# 022694           Texinfo: 
# 022695                Texinfo-6.7 
# 022696           temporary: 
# 022697                Texinfo-6.7 
# 022698           Udev: 
# 022699           usage: 
# 022700                Overview of Device and Module Handling 
# 022701           Util-linux: 
# 022702                Util-linux-2.36.2 
# 022703           tools: 
# 022704                Util-linux-2.36.2 
# 022705           Vim: 
# 022706                Vim-8.2.2433 
# 022707           XML::Parser: 
# 022708                XML::Parser-2.46 
# 022709           Xz: 
# 022710                Xz-5.2.5 
# 022711           tools: 
# 022712                Xz-5.2.5 
# 022713           Zlib: 
# 022714                Zlib-1.2.11 
# 022715           zstd: 
# 022716                Zstd-1.4.8   
# 022717        Programs 
# 022718           [: 
# 022719                Coreutils-8.32 -- 
# 022720                description 
# 022721           2to3: 
# 022722                Python-3.9.2 
# 022723           accessdb: 
# 022724                Man-DB-2.9.4 -- 
# 022725                description 
# 022726           aclocal: 
# 022727                Automake-1.16.3 -- 
# 022728                description 
# 022729           aclocal-1.16: 
# 022730                Automake-1.16.3 -- 
# 022731                description 
# 022732           addftinfo: 
# 022733                Groff-1.22.4 -- 
# 022734                description 
# 022735           addpart: 
# 022736                Util-linux-2.36.2 -- 
# 022737                description 
# 022738           addr2line: 
# 022739                Binutils-2.36.1 -- 
# 022740                description 
# 022741           afmtodit: 
# 022742                Groff-1.22.4 -- 
# 022743                description 
# 022744           agetty: 
# 022745                Util-linux-2.36.2 -- 
# 022746                description 
# 022747           apropos: 
# 022748                Man-DB-2.9.4 -- 
# 022749                description 
# 022750           ar: 
# 022751                Binutils-2.36.1 -- 
# 022752                description 
# 022753           as: 
# 022754                Binutils-2.36.1 -- 
# 022755                description 
# 022756           attr: 
# 022757                Attr-2.4.48 -- 
# 022758                description 
# 022759           autoconf: 
# 022760                Autoconf-2.71 -- 
# 022761                description 
# 022762           autoheader: 
# 022763                Autoconf-2.71 -- 
# 022764                description 
# 022765           autom4te: 
# 022766                Autoconf-2.71 -- 
# 022767                description 
# 022768           automake: 
# 022769                Automake-1.16.3 -- 
# 022770                description 
# 022771           automake-1.16: 
# 022772                Automake-1.16.3 -- 
# 022773                description 
# 022774           autopoint: 
# 022775                Gettext-0.21 -- 
# 022776                description 
# 022777           autoreconf: 
# 022778                Autoconf-2.71 -- 
# 022779                description 
# 022780           autoscan: 
# 022781                Autoconf-2.71 -- 
# 022782                description 
# 022783           autoupdate: 
# 022784                Autoconf-2.71 -- 
# 022785                description 
# 022786           awk: 
# 022787                Gawk-5.1.0 -- 
# 022788                description 
# 022789           b2sum: 
# 022790                Coreutils-8.32 -- 
# 022791                description 
# 022792           badblocks: 
# 022793                E2fsprogs-1.46.1 -- 
# 022794                description 
# 022795           base64: 
# 022796                Coreutils-8.32 -- 
# 022797                description 
# 022798           basename: 
# 022799                Coreutils-8.32 -- 
# 022800                description 
# 022801           basenc: 
# 022802                Coreutils-8.32 -- 
# 022803                description 
# 022804           bash: 
# 022805                Bash-5.1 -- 
# 022806                description 
# 022807           bashbug: 
# 022808                Bash-5.1 -- 
# 022809                description 
# 022810           bc: 
# 022811                Bc-3.3.0 -- 
# 022812                description 
# 022813           bison: 
# 022814                Bison-3.7.5 -- 
# 022815                description 
# 022816           blkdiscard: 
# 022817                Util-linux-2.36.2 -- 
# 022818                description 
# 022819           blkid: 
# 022820                Util-linux-2.36.2 -- 
# 022821                description 
# 022822           blkzone: 
# 022823                Util-linux-2.36.2 -- 
# 022824                description 
# 022825           blockdev: 
# 022826                Util-linux-2.36.2 -- 
# 022827                description 
# 022828           bootlogd: 
# 022829                Sysvinit-2.98 -- 
# 022830                description 
# 022831           bridge: 
# 022832                IPRoute2-5.10.0 -- 
# 022833                description 
# 022834           bunzip2: 
# 022835                Bzip2-1.0.8 -- 
# 022836                description 
# 022837           bzcat: 
# 022838                Bzip2-1.0.8 -- 
# 022839                description 
# 022840           bzcmp: 
# 022841                Bzip2-1.0.8 -- 
# 022842                description 
# 022843           bzdiff: 
# 022844                Bzip2-1.0.8 -- 
# 022845                description 
# 022846           bzegrep: 
# 022847                Bzip2-1.0.8 -- 
# 022848                description 
# 022849           bzfgrep: 
# 022850                Bzip2-1.0.8 -- 
# 022851                description 
# 022852           bzgrep: 
# 022853                Bzip2-1.0.8 -- 
# 022854                description 
# 022855           bzip2: 
# 022856                Bzip2-1.0.8 -- 
# 022857                description 
# 022858           bzip2recover: 
# 022859                Bzip2-1.0.8 -- 
# 022860                description 
# 022861           bzless: 
# 022862                Bzip2-1.0.8 -- 
# 022863                description 
# 022864           bzmore: 
# 022865                Bzip2-1.0.8 -- 
# 022866                description 
# 022867           c++: 
# 022868                GCC-10.2.0 -- 
# 022869                description 
# 022870           c++filt: 
# 022871                Binutils-2.36.1 -- 
# 022872                description 
# 022873           cal: 
# 022874                Util-linux-2.36.2 -- 
# 022875                description 
# 022876           capsh: 
# 022877                Libcap-2.48 -- 
# 022878                description 
# 022879           captoinfo: 
# 022880                Ncurses-6.2 -- 
# 022881                description 
# 022882           cat: 
# 022883                Coreutils-8.32 -- 
# 022884                description 
# 022885           catchsegv: 
# 022886                Glibc-2.33 -- 
# 022887                description 
# 022888           catman: 
# 022889                Man-DB-2.9.4 -- 
# 022890                description 
# 022891           cc: 
# 022892                GCC-10.2.0 -- 
# 022893                description 
# 022894           cfdisk: 
# 022895                Util-linux-2.36.2 -- 
# 022896                description 
# 022897           chacl: 
# 022898                Acl-2.2.53 -- 
# 022899                description 
# 022900           chage: 
# 022901                Shadow-4.8.1 -- 
# 022902                description 
# 022903           chattr: 
# 022904                E2fsprogs-1.46.1 -- 
# 022905                description 
# 022906           chcon: 
# 022907                Coreutils-8.32 -- 
# 022908                description 
# 022909           chcpu: 
# 022910                Util-linux-2.36.2 -- 
# 022911                description 
# 022912           checkmk: 
# 022913                Check-0.15.2 -- 
# 022914                description 
# 022915           chem: 
# 022916                Groff-1.22.4 -- 
# 022917                description 
# 022918           chfn: 
# 022919                Shadow-4.8.1 -- 
# 022920                description 
# 022921           chgpasswd: 
# 022922                Shadow-4.8.1 -- 
# 022923                description 
# 022924           chgrp: 
# 022925                Coreutils-8.32 -- 
# 022926                description 
# 022927           chmem: 
# 022928                Util-linux-2.36.2 -- 
# 022929                description 
# 022930           chmod: 
# 022931                Coreutils-8.32 -- 
# 022932                description 
# 022933           choom: 
# 022934                Util-linux-2.36.2 -- 
# 022935                description 
# 022936           chown: 
# 022937                Coreutils-8.32 -- 
# 022938                description 
# 022939           chpasswd: 
# 022940                Shadow-4.8.1 -- 
# 022941                description 
# 022942           chroot: 
# 022943                Coreutils-8.32 -- 
# 022944                description 
# 022945           chrt: 
# 022946                Util-linux-2.36.2 -- 
# 022947                description 
# 022948           chsh: 
# 022949                Shadow-4.8.1 -- 
# 022950                description 
# 022951           chvt: 
# 022952                Kbd-2.4.0 -- 
# 022953                description 
# 022954           cksum: 
# 022955                Coreutils-8.32 -- 
# 022956                description 
# 022957           clear: 
# 022958                Ncurses-6.2 -- 
# 022959                description 
# 022960           cmp: 
# 022961                Diffutils-3.7 -- 
# 022962                description 
# 022963           col: 
# 022964                Util-linux-2.36.2 -- 
# 022965                description 
# 022966           colcrt: 
# 022967                Util-linux-2.36.2 -- 
# 022968                description 
# 022969           colrm: 
# 022970                Util-linux-2.36.2 -- 
# 022971                description 
# 022972           column: 
# 022973                Util-linux-2.36.2 -- 
# 022974                description 
# 022975           comm: 
# 022976                Coreutils-8.32 -- 
# 022977                description 
# 022978           compile_et: 
# 022979                E2fsprogs-1.46.1 -- 
# 022980                description 
# 022981           corelist: 
# 022982                Perl-5.32.1 -- 
# 022983                description 
# 022984           cp: 
# 022985                Coreutils-8.32 -- 
# 022986                description 
# 022987           cpan: 
# 022988                Perl-5.32.1 -- 
# 022989                description 
# 022990           cpp: 
# 022991                GCC-10.2.0 -- 
# 022992                description 
# 022993           csplit: 
# 022994                Coreutils-8.32 -- 
# 022995                description 
# 022996           ctrlaltdel: 
# 022997                Util-linux-2.36.2 -- 
# 022998                description 
# 022999           ctstat: 
# 023000                IPRoute2-5.10.0 -- 
# 023001                description 
# 023002           cut: 
# 023003                Coreutils-8.32 -- 
# 023004                description 
# 023005           c_rehash: 
# 023006                OpenSSL-1.1.1j -- 
# 023007                description 
# 023008           date: 
# 023009                Coreutils-8.32 -- 
# 023010                description 
# 023011           dc: 
# 023012                Bc-3.3.0 -- 
# 023013                description 
# 023014           dd: 
# 023015                Coreutils-8.32 -- 
# 023016                description 
# 023017           deallocvt: 
# 023018                Kbd-2.4.0 -- 
# 023019                description 
# 023020           debugfs: 
# 023021                E2fsprogs-1.46.1 -- 
# 023022                description 
# 023023           delpart: 
# 023024                Util-linux-2.36.2 -- 
# 023025                description 
# 023026           depmod: 
# 023027                Kmod-28 -- 
# 023028                description 
# 023029           df: 
# 023030                Coreutils-8.32 -- 
# 023031                description 
# 023032           diff: 
# 023033                Diffutils-3.7 -- 
# 023034                description 
# 023035           diff3: 
# 023036                Diffutils-3.7 -- 
# 023037                description 
# 023038           dir: 
# 023039                Coreutils-8.32 -- 
# 023040                description 
# 023041           dircolors: 
# 023042                Coreutils-8.32 -- 
# 023043                description 
# 023044           dirname: 
# 023045                Coreutils-8.32 -- 
# 023046                description 
# 023047           dmesg: 
# 023048                Util-linux-2.36.2 -- 
# 023049                description 
# 023050           dnsdomainname: 
# 023051                Inetutils-2.0 -- 
# 023052                description 
# 023053           du: 
# 023054                Coreutils-8.32 -- 
# 023055                description 
# 023056           dumpe2fs: 
# 023057                E2fsprogs-1.46.1 -- 
# 023058                description 
# 023059           dumpkeys: 
# 023060                Kbd-2.4.0 -- 
# 023061                description 
# 023062           e2freefrag: 
# 023063                E2fsprogs-1.46.1 -- 
# 023064                description 
# 023065           e2fsck: 
# 023066                E2fsprogs-1.46.1 -- 
# 023067                description 
# 023068           e2image: 
# 023069                E2fsprogs-1.46.1 -- 
# 023070                description 
# 023071           e2label: 
# 023072                E2fsprogs-1.46.1 -- 
# 023073                description 
# 023074           e2mmpstatus: 
# 023075                E2fsprogs-1.46.1 -- 
# 023076                description 
# 023077           e2scrub: 
# 023078                E2fsprogs-1.46.1 -- 
# 023079                description 
# 023080           e2scrub_all: 
# 023081                E2fsprogs-1.46.1 -- 
# 023082                description 
# 023083           e2undo: 
# 023084                E2fsprogs-1.46.1 -- 
# 023085                description 
# 023086           e4crypt: 
# 023087                E2fsprogs-1.46.1 -- 
# 023088                description 
# 023089           e4defrag: 
# 023090                E2fsprogs-1.46.1 -- 
# 023091                description 
# 023092           echo: 
# 023093                Coreutils-8.32 -- 
# 023094                description 
# 023095           egrep: 
# 023096                Grep-3.6 -- 
# 023097                description 
# 023098           eject: 
# 023099                Util-linux-2.36.2 -- 
# 023100                description 
# 023101           elfedit: 
# 023102                Binutils-2.36.1 -- 
# 023103                description 
# 023104           enc2xs: 
# 023105                Perl-5.32.1 -- 
# 023106                description 
# 023107           encguess: 
# 023108                Perl-5.32.1 -- 
# 023109                description 
# 023110           env: 
# 023111                Coreutils-8.32 -- 
# 023112                description 
# 023113           envsubst: 
# 023114                Gettext-0.21 -- 
# 023115                description 
# 023116           eqn: 
# 023117                Groff-1.22.4 -- 
# 023118                description 
# 023119           eqn2graph: 
# 023120                Groff-1.22.4 -- 
# 023121                description 
# 023122           ex: 
# 023123                Vim-8.2.2433 -- 
# 023124                description 
# 023125           expand: 
# 023126                Coreutils-8.32 -- 
# 023127                description 
# 023128           expect: 
# 023129                Expect-5.45.4 -- 
# 023130                description 
# 023131           expiry: 
# 023132                Shadow-4.8.1 -- 
# 023133                description 
# 023134           expr: 
# 023135                Coreutils-8.32 -- 
# 023136                description 
# 023137           factor: 
# 023138                Coreutils-8.32 -- 
# 023139                description 
# 023140           faillog: 
# 023141                Shadow-4.8.1 -- 
# 023142                description 
# 023143           fallocate: 
# 023144                Util-linux-2.36.2 -- 
# 023145                description 
# 023146           false: 
# 023147                Coreutils-8.32 -- 
# 023148                description 
# 023149           fdformat: 
# 023150                Util-linux-2.36.2 -- 
# 023151                description 
# 023152           fdisk: 
# 023153                Util-linux-2.36.2 -- 
# 023154                description 
# 023155           fgconsole: 
# 023156                Kbd-2.4.0 -- 
# 023157                description 
# 023158           fgrep: 
# 023159                Grep-3.6 -- 
# 023160                description 
# 023161           file: 
# 023162                File-5.39 -- 
# 023163                description 
# 023164           filefrag: 
# 023165                E2fsprogs-1.46.1 -- 
# 023166                description 
# 023167           fincore: 
# 023168                Util-linux-2.36.2 -- 
# 023169                description 
# 023170           find: 
# 023171                Findutils-4.8.0 -- 
# 023172                description 
# 023173           findfs: 
# 023174                Util-linux-2.36.2 -- 
# 023175                description 
# 023176           findmnt: 
# 023177                Util-linux-2.36.2 -- 
# 023178                description 
# 023179           flex: 
# 023180                Flex-2.6.4 -- 
# 023181                description 
# 023182           flex++: 
# 023183                Flex-2.6.4 -- 
# 023184                description 
# 023185           flock: 
# 023186                Util-linux-2.36.2 -- 
# 023187                description 
# 023188           fmt: 
# 023189                Coreutils-8.32 -- 
# 023190                description 
# 023191           fold: 
# 023192                Coreutils-8.32 -- 
# 023193                description 
# 023194           free: 
# 023195                Procps-ng-3.3.17 -- 
# 023196                description 
# 023197           fsck: 
# 023198                Util-linux-2.36.2 -- 
# 023199                description 
# 023200           fsck.cramfs: 
# 023201                Util-linux-2.36.2 -- 
# 023202                description 
# 023203           fsck.ext2: 
# 023204                E2fsprogs-1.46.1 -- 
# 023205                description 
# 023206           fsck.ext3: 
# 023207                E2fsprogs-1.46.1 -- 
# 023208                description 
# 023209           fsck.ext4: 
# 023210                E2fsprogs-1.46.1 -- 
# 023211                description 
# 023212           fsck.minix: 
# 023213                Util-linux-2.36.2 -- 
# 023214                description 
# 023215           fsfreeze: 
# 023216                Util-linux-2.36.2 -- 
# 023217                description 
# 023218           fstab-decode: 
# 023219                Sysvinit-2.98 -- 
# 023220                description 
# 023221           fstrim: 
# 023222                Util-linux-2.36.2 -- 
# 023223                description 
# 023224           ftp: 
# 023225                Inetutils-2.0 -- 
# 023226                description 
# 023227           fuser: 
# 023228                Psmisc-23.4 -- 
# 023229                description 
# 023230           g++: 
# 023231                GCC-10.2.0 -- 
# 023232                description 
# 023233           gawk: 
# 023234                Gawk-5.1.0 -- 
# 023235                description 
# 023236           gawk-5.1.0: 
# 023237                Gawk-5.1.0 -- 
# 023238                description 
# 023239           gcc: 
# 023240                GCC-10.2.0 -- 
# 023241                description 
# 023242           gc-ar: 
# 023243                GCC-10.2.0 -- 
# 023244                description 
# 023245           gc-nm: 
# 023246                GCC-10.2.0 -- 
# 023247                description 
# 023248           gc-ranlib: 
# 023249                GCC-10.2.0 -- 
# 023250                description 
# 023251           gcov: 
# 023252                GCC-10.2.0 -- 
# 023253                description 
# 023254           gcov-dump: 
# 023255                GCC-10.2.0 -- 
# 023256                description 
# 023257           gcov-tool: 
# 023258                GCC-10.2.0 -- 
# 023259                description 
# 023260           gdbmtool: 
# 023261                GDBM-1.19 -- 
# 023262                description 
# 023263           gdbm_dump: 
# 023264                GDBM-1.19 -- 
# 023265                description 
# 023266           gdbm_load: 
# 023267                GDBM-1.19 -- 
# 023268                description 
# 023269           gdiffmk: 
# 023270                Groff-1.22.4 -- 
# 023271                description 
# 023272           gencat: 
# 023273                Glibc-2.33 -- 
# 023274                description 
# 023275           genl: 
# 023276                IPRoute2-5.10.0 -- 
# 023277                description 
# 023278           getcap: 
# 023279                Libcap-2.48 -- 
# 023280                description 
# 023281           getconf: 
# 023282                Glibc-2.33 -- 
# 023283                description 
# 023284           getent: 
# 023285                Glibc-2.33 -- 
# 023286                description 
# 023287           getfacl: 
# 023288                Acl-2.2.53 -- 
# 023289                description 
# 023290           getfattr: 
# 023291                Attr-2.4.48 -- 
# 023292                description 
# 023293           getkeycodes: 
# 023294                Kbd-2.4.0 -- 
# 023295                description 
# 023296           getopt: 
# 023297                Util-linux-2.36.2 -- 
# 023298                description 
# 023299           getpcaps: 
# 023300                Libcap-2.48 -- 
# 023301                description 
# 023302           gettext: 
# 023303                Gettext-0.21 -- 
# 023304                description 
# 023305           gettext.sh: 
# 023306                Gettext-0.21 -- 
# 023307                description 
# 023308           gettextize: 
# 023309                Gettext-0.21 -- 
# 023310                description 
# 023311           glilypond: 
# 023312                Groff-1.22.4 -- 
# 023313                description 
# 023314           gpasswd: 
# 023315                Shadow-4.8.1 -- 
# 023316                description 
# 023317           gperf: 
# 023318                Gperf-3.1 -- 
# 023319                description 
# 023320           gperl: 
# 023321                Groff-1.22.4 -- 
# 023322                description 
# 023323           gpinyin: 
# 023324                Groff-1.22.4 -- 
# 023325                description 
# 023326           gprof: 
# 023327                Binutils-2.36.1 -- 
# 023328                description 
# 023329           grap2graph: 
# 023330                Groff-1.22.4 -- 
# 023331                description 
# 023332           grep: 
# 023333                Grep-3.6 -- 
# 023334                description 
# 023335           grn: 
# 023336                Groff-1.22.4 -- 
# 023337                description 
# 023338           grodvi: 
# 023339                Groff-1.22.4 -- 
# 023340                description 
# 023341           groff: 
# 023342                Groff-1.22.4 -- 
# 023343                description 
# 023344           groffer: 
# 023345                Groff-1.22.4 -- 
# 023346                description 
# 023347           grog: 
# 023348                Groff-1.22.4 -- 
# 023349                description 
# 023350           grolbp: 
# 023351                Groff-1.22.4 -- 
# 023352                description 
# 023353           grolj4: 
# 023354                Groff-1.22.4 -- 
# 023355                description 
# 023356           gropdf: 
# 023357                Groff-1.22.4 -- 
# 023358                description 
# 023359           grops: 
# 023360                Groff-1.22.4 -- 
# 023361                description 
# 023362           grotty: 
# 023363                Groff-1.22.4 -- 
# 023364                description 
# 023365           groupadd: 
# 023366                Shadow-4.8.1 -- 
# 023367                description 
# 023368           groupdel: 
# 023369                Shadow-4.8.1 -- 
# 023370                description 
# 023371           groupmems: 
# 023372                Shadow-4.8.1 -- 
# 023373                description 
# 023374           groupmod: 
# 023375                Shadow-4.8.1 -- 
# 023376                description 
# 023377           groups: 
# 023378                Coreutils-8.32 -- 
# 023379                description 
# 023380           grpck: 
# 023381                Shadow-4.8.1 -- 
# 023382                description 
# 023383           grpconv: 
# 023384                Shadow-4.8.1 -- 
# 023385                description 
# 023386           grpunconv: 
# 023387                Shadow-4.8.1 -- 
# 023388                description 
# 023389           grub-bios-setup: 
# 023390                GRUB-2.04 -- 
# 023391                description 
# 023392           grub-editenv: 
# 023393                GRUB-2.04 -- 
# 023394                description 
# 023395           grub-file: 
# 023396                GRUB-2.04 -- 
# 023397                description 
# 023398           grub-fstest: 
# 023399                GRUB-2.04 -- 
# 023400                description 
# 023401           grub-glue-efi: 
# 023402                GRUB-2.04 -- 
# 023403                description 
# 023404           grub-install: 
# 023405                GRUB-2.04 -- 
# 023406                description 
# 023407           grub-kbdcomp: 
# 023408                GRUB-2.04 -- 
# 023409                description 
# 023410           grub-macbless: 
# 023411                GRUB-2.04 -- 
# 023412                description 
# 023413           grub-menulst2cfg: 
# 023414                GRUB-2.04 -- 
# 023415                description 
# 023416           grub-mkconfig: 
# 023417                GRUB-2.04 -- 
# 023418                description 
# 023419           grub-mkimage: 
# 023420                GRUB-2.04 -- 
# 023421                description 
# 023422           grub-mklayout: 
# 023423                GRUB-2.04 -- 
# 023424                description 
# 023425           grub-mknetdir: 
# 023426                GRUB-2.04 -- 
# 023427                description 
# 023428           grub-mkpasswd-pbkdf2: 
# 023429                GRUB-2.04 -- 
# 023430                description 
# 023431           grub-mkrelpath: 
# 023432                GRUB-2.04 -- 
# 023433                description 
# 023434           grub-mkrescue: 
# 023435                GRUB-2.04 -- 
# 023436                description 
# 023437           grub-mkstandalone: 
# 023438                GRUB-2.04 -- 
# 023439                description 
# 023440           grub-ofpathname: 
# 023441                GRUB-2.04 -- 
# 023442                description 
# 023443           grub-probe: 
# 023444                GRUB-2.04 -- 
# 023445                description 
# 023446           grub-reboot: 
# 023447                GRUB-2.04 -- 
# 023448                description 
# 023449           grub-render-label: 
# 023450                GRUB-2.04 -- 
# 023451                description 
# 023452           grub-script-check: 
# 023453                GRUB-2.04 -- 
# 023454                description 
# 023455           grub-set-default: 
# 023456                GRUB-2.04 -- 
# 023457                description 
# 023458           grub-setup: 
# 023459                GRUB-2.04 -- 
# 023460                description 
# 023461           grub-syslinux2cfg: 
# 023462                GRUB-2.04 -- 
# 023463                description 
# 023464           gunzip: 
# 023465                Gzip-1.10 -- 
# 023466                description 
# 023467           gzexe: 
# 023468                Gzip-1.10 -- 
# 023469                description 
# 023470           gzip: 
# 023471                Gzip-1.10 -- 
# 023472                description 
# 023473           h2ph: 
# 023474                Perl-5.32.1 -- 
# 023475                description 
# 023476           h2xs: 
# 023477                Perl-5.32.1 -- 
# 023478                description 
# 023479           halt: 
# 023480                Sysvinit-2.98 -- 
# 023481                description 
# 023482           head: 
# 023483                Coreutils-8.32 -- 
# 023484                description 
# 023485           hexdump: 
# 023486                Util-linux-2.36.2 -- 
# 023487                description 
# 023488           hostid: 
# 023489                Coreutils-8.32 -- 
# 023490                description 
# 023491           hostname: 
# 023492                Inetutils-2.0 -- 
# 023493                description 
# 023494           hpftodit: 
# 023495                Groff-1.22.4 -- 
# 023496                description 
# 023497           hwclock: 
# 023498                Util-linux-2.36.2 -- 
# 023499                description 
# 023500           i386: 
# 023501                Util-linux-2.36.2 -- 
# 023502                description 
# 023503           iconv: 
# 023504                Glibc-2.33 -- 
# 023505                description 
# 023506           iconvconfig: 
# 023507                Glibc-2.33 -- 
# 023508                description 
# 023509           id: 
# 023510                Coreutils-8.32 -- 
# 023511                description 
# 023512           idle3: 
# 023513                Python-3.9.2 
# 023514           ifcfg: 
# 023515                IPRoute2-5.10.0 -- 
# 023516                description 
# 023517           ifconfig: 
# 023518                Inetutils-2.0 -- 
# 023519                description 
# 023520           ifnames: 
# 023521                Autoconf-2.71 -- 
# 023522                description 
# 023523           ifstat: 
# 023524                IPRoute2-5.10.0 -- 
# 023525                description 
# 023526           indxbib: 
# 023527                Groff-1.22.4 -- 
# 023528                description 
# 023529           info: 
# 023530                Texinfo-6.7 -- 
# 023531                description 
# 023532           infocmp: 
# 023533                Ncurses-6.2 -- 
# 023534                description 
# 023535           infotocap: 
# 023536                Ncurses-6.2 -- 
# 023537                description 
# 023538           init: 
# 023539                Sysvinit-2.98 -- 
# 023540                description 
# 023541           insmod: 
# 023542                Kmod-28 -- 
# 023543                description 
# 023544           install: 
# 023545                Coreutils-8.32 -- 
# 023546                description 
# 023547           install-info: 
# 023548                Texinfo-6.7 -- 
# 023549                description 
# 023550           instmodsh: 
# 023551                Perl-5.32.1 -- 
# 023552                description 
# 023553           intltool-extract: 
# 023554                Intltool-0.51.0 -- 
# 023555                description 
# 023556           intltool-merge: 
# 023557                Intltool-0.51.0 -- 
# 023558                description 
# 023559           intltool-prepare: 
# 023560                Intltool-0.51.0 -- 
# 023561                description 
# 023562           intltool-update: 
# 023563                Intltool-0.51.0 -- 
# 023564                description 
# 023565           intltoolize: 
# 023566                Intltool-0.51.0 -- 
# 023567                description 
# 023568           ionice: 
# 023569                Util-linux-2.36.2 -- 
# 023570                description 
# 023571           ip: 
# 023572                IPRoute2-5.10.0 -- 
# 023573                description 
# 023574           ipcmk: 
# 023575                Util-linux-2.36.2 -- 
# 023576                description 
# 023577           ipcrm: 
# 023578                Util-linux-2.36.2 -- 
# 023579                description 
# 023580           ipcs: 
# 023581                Util-linux-2.36.2 -- 
# 023582                description 
# 023583           isosize: 
# 023584                Util-linux-2.36.2 -- 
# 023585                description 
# 023586           join: 
# 023587                Coreutils-8.32 -- 
# 023588                description 
# 023589           json_pp: 
# 023590                Perl-5.32.1 -- 
# 023591                description 
# 023592           kbdinfo: 
# 023593                Kbd-2.4.0 -- 
# 023594                description 
# 023595           kbdrate: 
# 023596                Kbd-2.4.0 -- 
# 023597                description 
# 023598           kbd_mode: 
# 023599                Kbd-2.4.0 -- 
# 023600                description 
# 023601           kill: 
# 023602                Util-linux-2.36.2 -- 
# 023603                description 
# 023604           killall: 
# 023605                Psmisc-23.4 -- 
# 023606                description 
# 023607           killall5: 
# 023608                Sysvinit-2.98 -- 
# 023609                description 
# 023610           klogd: 
# 023611                Sysklogd-1.5.1 -- 
# 023612                description 
# 023613           kmod: 
# 023614                Kmod-28 -- 
# 023615                description 
# 023616           last: 
# 023617                Util-linux-2.36.2 -- 
# 023618                description 
# 023619           lastb: 
# 023620                Util-linux-2.36.2 -- 
# 023621                description 
# 023622           lastlog: 
# 023623                Shadow-4.8.1 -- 
# 023624                description 
# 023625           ld: 
# 023626                Binutils-2.36.1 -- 
# 023627                description 
# 023628           ld.bfd: 
# 023629                Binutils-2.36.1 -- 
# 023630                description 
# 023631           ld.gold: 
# 023632                Binutils-2.36.1 -- 
# 023633                description 
# 023634           ldattach: 
# 023635                Util-linux-2.36.2 -- 
# 023636                description 
# 023637           ldconfig: 
# 023638                Glibc-2.33 -- 
# 023639                description 
# 023640           ldd: 
# 023641                Glibc-2.33 -- 
# 023642                description 
# 023643           lddlibc4: 
# 023644                Glibc-2.33 -- 
# 023645                description 
# 023646           less: 
# 023647                Less-563 -- 
# 023648                description 
# 023649           lessecho: 
# 023650                Less-563 -- 
# 023651                description 
# 023652           lesskey: 
# 023653                Less-563 -- 
# 023654                description 
# 023655           lex: 
# 023656                Flex-2.6.4 -- 
# 023657                description 
# 023658           lexgrog: 
# 023659                Man-DB-2.9.4 -- 
# 023660                description 
# 023661           lfskernel-5.10.17: 
# 023662                Linux-5.10.17 -- 
# 023663                description 
# 023664           libasan: 
# 023665                GCC-10.2.0 -- 
# 023666                description 
# 023667           libatomic: 
# 023668                GCC-10.2.0 -- 
# 023669                description 
# 023670           libcc1: 
# 023671                GCC-10.2.0 -- 
# 023672                description 
# 023673           libnetcfg: 
# 023674                Perl-5.32.1 -- 
# 023675                description 
# 023676           libtool: 
# 023677                Libtool-2.4.6 -- 
# 023678                description 
# 023679           libtoolize: 
# 023680                Libtool-2.4.6 -- 
# 023681                description 
# 023682           link: 
# 023683                Coreutils-8.32 -- 
# 023684                description 
# 023685           linux32: 
# 023686                Util-linux-2.36.2 -- 
# 023687                description 
# 023688           linux64: 
# 023689                Util-linux-2.36.2 -- 
# 023690                description 
# 023691           lkbib: 
# 023692                Groff-1.22.4 -- 
# 023693                description 
# 023694           ln: 
# 023695                Coreutils-8.32 -- 
# 023696                description 
# 023697           lnstat: 
# 023698                IPRoute2-5.10.0 -- 
# 023699                description 
# 023700           loadkeys: 
# 023701                Kbd-2.4.0 -- 
# 023702                description 
# 023703           loadunimap: 
# 023704                Kbd-2.4.0 -- 
# 023705                description 
# 023706           locale: 
# 023707                Glibc-2.33 -- 
# 023708                description 
# 023709           localedef: 
# 023710                Glibc-2.33 -- 
# 023711                description 
# 023712           locate: 
# 023713                Findutils-4.8.0 -- 
# 023714                description 
# 023715           logger: 
# 023716                Util-linux-2.36.2 -- 
# 023717                description 
# 023718           login: 
# 023719                Shadow-4.8.1 -- 
# 023720                description 
# 023721           logname: 
# 023722                Coreutils-8.32 -- 
# 023723                description 
# 023724           logoutd: 
# 023725                Shadow-4.8.1 -- 
# 023726                description 
# 023727           logsave: 
# 023728                E2fsprogs-1.46.1 -- 
# 023729                description 
# 023730           look: 
# 023731                Util-linux-2.36.2 -- 
# 023732                description 
# 023733           lookbib: 
# 023734                Groff-1.22.4 -- 
# 023735                description 
# 023736           losetup: 
# 023737                Util-linux-2.36.2 -- 
# 023738                description 
# 023739           ls: 
# 023740                Coreutils-8.32 -- 
# 023741                description 
# 023742           lsattr: 
# 023743                E2fsprogs-1.46.1 -- 
# 023744                description 
# 023745           lsblk: 
# 023746                Util-linux-2.36.2 -- 
# 023747                description 
# 023748           lscpu: 
# 023749                Util-linux-2.36.2 -- 
# 023750                description 
# 023751           lsipc: 
# 023752                Util-linux-2.36.2 -- 
# 023753                description 
# 023754           lslocks: 
# 023755                Util-linux-2.36.2 -- 
# 023756                description 
# 023757           lslogins: 
# 023758                Util-linux-2.36.2 -- 
# 023759                description 
# 023760           lsmem: 
# 023761                Util-linux-2.36.2 -- 
# 023762                description 
# 023763           lsmod: 
# 023764                Kmod-28 -- 
# 023765                description 
# 023766           lsns: 
# 023767                Util-linux-2.36.2 -- 
# 023768                description 
# 023769           lzcat: 
# 023770                Xz-5.2.5 -- 
# 023771                description 
# 023772           lzcmp: 
# 023773                Xz-5.2.5 -- 
# 023774                description 
# 023775           lzdiff: 
# 023776                Xz-5.2.5 -- 
# 023777                description 
# 023778           lzegrep: 
# 023779                Xz-5.2.5 -- 
# 023780                description 
# 023781           lzfgrep: 
# 023782                Xz-5.2.5 -- 
# 023783                description 
# 023784           lzgrep: 
# 023785                Xz-5.2.5 -- 
# 023786                description 
# 023787           lzless: 
# 023788                Xz-5.2.5 -- 
# 023789                description 
# 023790           lzma: 
# 023791                Xz-5.2.5 -- 
# 023792                description 
# 023793           lzmadec: 
# 023794                Xz-5.2.5 -- 
# 023795                description 
# 023796           lzmainfo: 
# 023797                Xz-5.2.5 -- 
# 023798                description 
# 023799           lzmore: 
# 023800                Xz-5.2.5 -- 
# 023801                description 
# 023802           m4: 
# 023803                M4-1.4.18 -- 
# 023804                description 
# 023805           make: 
# 023806                Make-4.3 -- 
# 023807                description 
# 023808           makedb: 
# 023809                Glibc-2.33 -- 
# 023810                description 
# 023811           makeinfo: 
# 023812                Texinfo-6.7 -- 
# 023813                description 
# 023814           man: 
# 023815                Man-DB-2.9.4 -- 
# 023816                description 
# 023817           mandb: 
# 023818                Man-DB-2.9.4 -- 
# 023819                description 
# 023820           manpath: 
# 023821                Man-DB-2.9.4 -- 
# 023822                description 
# 023823           mapscrn: 
# 023824                Kbd-2.4.0 -- 
# 023825                description 
# 023826           mcookie: 
# 023827                Util-linux-2.36.2 -- 
# 023828                description 
# 023829           md5sum: 
# 023830                Coreutils-8.32 -- 
# 023831                description 
# 023832           mesg: 
# 023833                Util-linux-2.36.2 -- 
# 023834                description 
# 023835           meson: 
# 023836                Meson-0.57.1 -- 
# 023837                description 
# 023838           mkdir: 
# 023839                Coreutils-8.32 -- 
# 023840                description 
# 023841           mke2fs: 
# 023842                E2fsprogs-1.46.1 -- 
# 023843                description 
# 023844           mkfifo: 
# 023845                Coreutils-8.32 -- 
# 023846                description 
# 023847           mkfs: 
# 023848                Util-linux-2.36.2 -- 
# 023849                description 
# 023850           mkfs.bfs: 
# 023851                Util-linux-2.36.2 -- 
# 023852                description 
# 023853           mkfs.cramfs: 
# 023854                Util-linux-2.36.2 -- 
# 023855                description 
# 023856           mkfs.ext2: 
# 023857                E2fsprogs-1.46.1 -- 
# 023858                description 
# 023859           mkfs.ext3: 
# 023860                E2fsprogs-1.46.1 -- 
# 023861                description 
# 023862           mkfs.ext4: 
# 023863                E2fsprogs-1.46.1 -- 
# 023864                description 
# 023865           mkfs.minix: 
# 023866                Util-linux-2.36.2 -- 
# 023867                description 
# 023868           mklost+found: 
# 023869                E2fsprogs-1.46.1 -- 
# 023870                description 
# 023871           mknod: 
# 023872                Coreutils-8.32 -- 
# 023873                description 
# 023874           mkswap: 
# 023875                Util-linux-2.36.2 -- 
# 023876                description 
# 023877           mktemp: 
# 023878                Coreutils-8.32 -- 
# 023879                description 
# 023880           mk_cmds: 
# 023881                E2fsprogs-1.46.1 -- 
# 023882                description 
# 023883           mmroff: 
# 023884                Groff-1.22.4 -- 
# 023885                description 
# 023886           modinfo: 
# 023887                Kmod-28 -- 
# 023888                description 
# 023889           modprobe: 
# 023890                Kmod-28 -- 
# 023891                description 
# 023892           more: 
# 023893                Util-linux-2.36.2 -- 
# 023894                description 
# 023895           mount: 
# 023896                Util-linux-2.36.2 -- 
# 023897                description 
# 023898           mountpoint: 
# 023899                Util-linux-2.36.2 -- 
# 023900                description 
# 023901           msgattrib: 
# 023902                Gettext-0.21 -- 
# 023903                description 
# 023904           msgcat: 
# 023905                Gettext-0.21 -- 
# 023906                description 
# 023907           msgcmp: 
# 023908                Gettext-0.21 -- 
# 023909                description 
# 023910           msgcomm: 
# 023911                Gettext-0.21 -- 
# 023912                description 
# 023913           msgconv: 
# 023914                Gettext-0.21 -- 
# 023915                description 
# 023916           msgen: 
# 023917                Gettext-0.21 -- 
# 023918                description 
# 023919           msgexec: 
# 023920                Gettext-0.21 -- 
# 023921                description 
# 023922           msgfilter: 
# 023923                Gettext-0.21 -- 
# 023924                description 
# 023925           msgfmt: 
# 023926                Gettext-0.21 -- 
# 023927                description 
# 023928           msggrep: 
# 023929                Gettext-0.21 -- 
# 023930                description 
# 023931           msginit: 
# 023932                Gettext-0.21 -- 
# 023933                description 
# 023934           msgmerge: 
# 023935                Gettext-0.21 -- 
# 023936                description 
# 023937           msgunfmt: 
# 023938                Gettext-0.21 -- 
# 023939                description 
# 023940           msguniq: 
# 023941                Gettext-0.21 -- 
# 023942                description 
# 023943           mtrace: 
# 023944                Glibc-2.33 -- 
# 023945                description 
# 023946           mv: 
# 023947                Coreutils-8.32 -- 
# 023948                description 
# 023949           namei: 
# 023950                Util-linux-2.36.2 -- 
# 023951                description 
# 023952           ncursesw6-config: 
# 023953                Ncurses-6.2 -- 
# 023954                description 
# 023955           neqn: 
# 023956                Groff-1.22.4 -- 
# 023957                description 
# 023958           newgidmap: 
# 023959                Shadow-4.8.1 -- 
# 023960                description 
# 023961           newgrp: 
# 023962                Shadow-4.8.1 -- 
# 023963                description 
# 023964           newuidmap: 
# 023965                Shadow-4.8.1 -- 
# 023966                description 
# 023967           newusers: 
# 023968                Shadow-4.8.1 -- 
# 023969                description 
# 023970           ngettext: 
# 023971                Gettext-0.21 -- 
# 023972                description 
# 023973           nice: 
# 023974                Coreutils-8.32 -- 
# 023975                description 
# 023976           ninja: 
# 023977                Ninja-1.10.2 -- 
# 023978                description 
# 023979           nl: 
# 023980                Coreutils-8.32 -- 
# 023981                description 
# 023982           nm: 
# 023983                Binutils-2.36.1 -- 
# 023984                description 
# 023985           nohup: 
# 023986                Coreutils-8.32 -- 
# 023987                description 
# 023988           nologin: 
# 023989                Shadow-4.8.1 -- 
# 023990                description 
# 023991           nproc: 
# 023992                Coreutils-8.32 -- 
# 023993                description 
# 023994           nroff: 
# 023995                Groff-1.22.4 -- 
# 023996                description 
# 023997           nscd: 
# 023998                Glibc-2.33 -- 
# 023999                description 
# 024000           nsenter: 
# 024001                Util-linux-2.36.2 -- 
# 024002                description 
# 024003           nstat: 
# 024004                IPRoute2-5.10.0 -- 
# 024005                description 
# 024006           numfmt: 
# 024007                Coreutils-8.32 -- 
# 024008                description 
# 024009           objcopy: 
# 024010                Binutils-2.36.1 -- 
# 024011                description 
# 024012           objdump: 
# 024013                Binutils-2.36.1 -- 
# 024014                description 
# 024015           od: 
# 024016                Coreutils-8.32 -- 
# 024017                description 
# 024018           openssl: 
# 024019                OpenSSL-1.1.1j -- 
# 024020                description 
# 024021           openvt: 
# 024022                Kbd-2.4.0 -- 
# 024023                description 
# 024024           partx: 
# 024025                Util-linux-2.36.2 -- 
# 024026                description 
# 024027           passwd: 
# 024028                Shadow-4.8.1 -- 
# 024029                description 
# 024030           paste: 
# 024031                Coreutils-8.32 -- 
# 024032                description 
# 024033           patch: 
# 024034                Patch-2.7.6 -- 
# 024035                description 
# 024036           pathchk: 
# 024037                Coreutils-8.32 -- 
# 024038                description 
# 024039           pcprofiledump: 
# 024040                Glibc-2.33 -- 
# 024041                description 
# 024042           pdfmom: 
# 024043                Groff-1.22.4 -- 
# 024044                description 
# 024045           pdfroff: 
# 024046                Groff-1.22.4 -- 
# 024047                description 
# 024048           pdftexi2dvi: 
# 024049                Texinfo-6.7 -- 
# 024050                description 
# 024051           peekfd: 
# 024052                Psmisc-23.4 -- 
# 024053                description 
# 024054           perl: 
# 024055                Perl-5.32.1 -- 
# 024056                description 
# 024057           perl5.32.1: 
# 024058                Perl-5.32.1 -- 
# 024059                description 
# 024060           perlbug: 
# 024061                Perl-5.32.1 -- 
# 024062                description 
# 024063           perldoc: 
# 024064                Perl-5.32.1 -- 
# 024065                description 
# 024066           perlivp: 
# 024067                Perl-5.32.1 -- 
# 024068                description 
# 024069           perlthanks: 
# 024070                Perl-5.32.1 -- 
# 024071                description 
# 024072           pfbtops: 
# 024073                Groff-1.22.4 -- 
# 024074                description 
# 024075           pgrep: 
# 024076                Procps-ng-3.3.17 -- 
# 024077                description 
# 024078           pic: 
# 024079                Groff-1.22.4 -- 
# 024080                description 
# 024081           pic2graph: 
# 024082                Groff-1.22.4 -- 
# 024083                description 
# 024084           piconv: 
# 024085                Perl-5.32.1 -- 
# 024086                description 
# 024087           pidof: 
# 024088                Procps-ng-3.3.17 -- 
# 024089                description 
# 024090           ping: 
# 024091                Inetutils-2.0 -- 
# 024092                description 
# 024093           ping6: 
# 024094                Inetutils-2.0 -- 
# 024095                description 
# 024096           pinky: 
# 024097                Coreutils-8.32 -- 
# 024098                description 
# 024099           pip3: 
# 024100                Python-3.9.2 
# 024101           pivot_root: 
# 024102                Util-linux-2.36.2 -- 
# 024103                description 
# 024104           pkg-config: 
# 024105                Pkg-config-0.29.2 -- 
# 024106                description 
# 024107           pkill: 
# 024108                Procps-ng-3.3.17 -- 
# 024109                description 
# 024110           pl2pm: 
# 024111                Perl-5.32.1 -- 
# 024112                description 
# 024113           pldd: 
# 024114                Glibc-2.33 -- 
# 024115                description 
# 024116           pmap: 
# 024117                Procps-ng-3.3.17 -- 
# 024118                description 
# 024119           pod2html: 
# 024120                Perl-5.32.1 -- 
# 024121                description 
# 024122           pod2man: 
# 024123                Perl-5.32.1 -- 
# 024124                description 
# 024125           pod2texi: 
# 024126                Texinfo-6.7 -- 
# 024127                description 
# 024128           pod2text: 
# 024129                Perl-5.32.1 -- 
# 024130                description 
# 024131           pod2usage: 
# 024132                Perl-5.32.1 -- 
# 024133                description 
# 024134           podchecker: 
# 024135                Perl-5.32.1 -- 
# 024136                description 
# 024137           podselect: 
# 024138                Perl-5.32.1 -- 
# 024139                description 
# 024140           post-grohtml: 
# 024141                Groff-1.22.4 -- 
# 024142                description 
# 024143           poweroff: 
# 024144                Sysvinit-2.98 -- 
# 024145                description 
# 024146           pr: 
# 024147                Coreutils-8.32 -- 
# 024148                description 
# 024149           pre-grohtml: 
# 024150                Groff-1.22.4 -- 
# 024151                description 
# 024152           preconv: 
# 024153                Groff-1.22.4 -- 
# 024154                description 
# 024155           printenv: 
# 024156                Coreutils-8.32 -- 
# 024157                description 
# 024158           printf: 
# 024159                Coreutils-8.32 -- 
# 024160                description 
# 024161           prlimit: 
# 024162                Util-linux-2.36.2 -- 
# 024163                description 
# 024164           prove: 
# 024165                Perl-5.32.1 -- 
# 024166                description 
# 024167           prtstat: 
# 024168                Psmisc-23.4 -- 
# 024169                description 
# 024170           ps: 
# 024171                Procps-ng-3.3.17 -- 
# 024172                description 
# 024173           psfaddtable: 
# 024174                Kbd-2.4.0 -- 
# 024175                description 
# 024176           psfgettable: 
# 024177                Kbd-2.4.0 -- 
# 024178                description 
# 024179           psfstriptable: 
# 024180                Kbd-2.4.0 -- 
# 024181                description 
# 024182           psfxtable: 
# 024183                Kbd-2.4.0 -- 
# 024184                description 
# 024185           pslog: 
# 024186                Psmisc-23.4 -- 
# 024187                description 
# 024188           pstree: 
# 024189                Psmisc-23.4 -- 
# 024190                description 
# 024191           pstree.x11: 
# 024192                Psmisc-23.4 -- 
# 024193                description 
# 024194           ptar: 
# 024195                Perl-5.32.1 -- 
# 024196                description 
# 024197           ptardiff: 
# 024198                Perl-5.32.1 -- 
# 024199                description 
# 024200           ptargrep: 
# 024201                Perl-5.32.1 -- 
# 024202                description 
# 024203           ptx: 
# 024204                Coreutils-8.32 -- 
# 024205                description 
# 024206           pwait: 
# 024207                Procps-ng-3.3.17 -- 
# 024208                description 
# 024209           pwck: 
# 024210                Shadow-4.8.1 -- 
# 024211                description 
# 024212           pwconv: 
# 024213                Shadow-4.8.1 -- 
# 024214                description 
# 024215           pwd: 
# 024216                Coreutils-8.32 -- 
# 024217                description 
# 024218           pwdx: 
# 024219                Procps-ng-3.3.17 -- 
# 024220                description 
# 024221           pwunconv: 
# 024222                Shadow-4.8.1 -- 
# 024223                description 
# 024224           pydoc3: 
# 024225                Python-3.9.2 
# 024226           python3: 
# 024227                Python-3.9.2 
# 024228           ranlib: 
# 024229                Binutils-2.36.1 -- 
# 024230                description 
# 024231           raw: 
# 024232                Util-linux-2.36.2 -- 
# 024233                description 
# 024234           readelf: 
# 024235                Binutils-2.36.1 -- 
# 024236                description 
# 024237           readlink: 
# 024238                Coreutils-8.32 -- 
# 024239                description 
# 024240           readprofile: 
# 024241                Util-linux-2.36.2 -- 
# 024242                description 
# 024243           realpath: 
# 024244                Coreutils-8.32 -- 
# 024245                description 
# 024246           reboot: 
# 024247                Sysvinit-2.98 -- 
# 024248                description 
# 024249           recode-sr-latin: 
# 024250                Gettext-0.21 -- 
# 024251                description 
# 024252           refer: 
# 024253                Groff-1.22.4 -- 
# 024254                description 
# 024255           rename: 
# 024256                Util-linux-2.36.2 -- 
# 024257                description 
# 024258           renice: 
# 024259                Util-linux-2.36.2 -- 
# 024260                description 
# 024261           reset: 
# 024262                Ncurses-6.2 -- 
# 024263                description 
# 024264           resize2fs: 
# 024265                E2fsprogs-1.46.1 -- 
# 024266                description 
# 024267           resizepart: 
# 024268                Util-linux-2.36.2 -- 
# 024269                description 
# 024270           rev: 
# 024271                Util-linux-2.36.2 -- 
# 024272                description 
# 024273           rkfill: 
# 024274                Util-linux-2.36.2 -- 
# 024275                description 
# 024276           rm: 
# 024277                Coreutils-8.32 -- 
# 024278                description 
# 024279           rmdir: 
# 024280                Coreutils-8.32 -- 
# 024281                description 
# 024282           rmmod: 
# 024283                Kmod-28 -- 
# 024284                description 
# 024285           roff2dvi: 
# 024286                Groff-1.22.4 -- 
# 024287                description 
# 024288           roff2html: 
# 024289                Groff-1.22.4 -- 
# 024290                description 
# 024291           roff2pdf: 
# 024292                Groff-1.22.4 -- 
# 024293                description 
# 024294           roff2ps: 
# 024295                Groff-1.22.4 -- 
# 024296                description 
# 024297           roff2text: 
# 024298                Groff-1.22.4 -- 
# 024299                description 
# 024300           roff2x: 
# 024301                Groff-1.22.4 -- 
# 024302                description 
# 024303           routef: 
# 024304                IPRoute2-5.10.0 -- 
# 024305                description 
# 024306           routel: 
# 024307                IPRoute2-5.10.0 -- 
# 024308                description 
# 024309           rtacct: 
# 024310                IPRoute2-5.10.0 -- 
# 024311                description 
# 024312           rtcwake: 
# 024313                Util-linux-2.36.2 -- 
# 024314                description 
# 024315           rtmon: 
# 024316                IPRoute2-5.10.0 -- 
# 024317                description 
# 024318           rtpr: 
# 024319                IPRoute2-5.10.0 -- 
# 024320                description 
# 024321           rtstat: 
# 024322                IPRoute2-5.10.0 -- 
# 024323                description 
# 024324           runcon: 
# 024325                Coreutils-8.32 -- 
# 024326                description 
# 024327           runlevel: 
# 024328                Sysvinit-2.98 -- 
# 024329                description 
# 024330           runtest: 
# 024331                DejaGNU-1.6.2 -- 
# 024332                description 
# 024333           rview: 
# 024334                Vim-8.2.2433 -- 
# 024335                description 
# 024336           rvim: 
# 024337                Vim-8.2.2433 -- 
# 024338                description 
# 024339           script: 
# 024340                Util-linux-2.36.2 -- 
# 024341                description 
# 024342           scriptreplay: 
# 024343                Util-linux-2.36.2 -- 
# 024344                description 
# 024345           sdiff: 
# 024346                Diffutils-3.7 -- 
# 024347                description 
# 024348           sed: 
# 024349                Sed-4.8 -- 
# 024350                description 
# 024351           seq: 
# 024352                Coreutils-8.32 -- 
# 024353                description 
# 024354           setarch: 
# 024355                Util-linux-2.36.2 -- 
# 024356                description 
# 024357           setcap: 
# 024358                Libcap-2.48 -- 
# 024359                description 
# 024360           setfacl: 
# 024361                Acl-2.2.53 -- 
# 024362                description 
# 024363           setfattr: 
# 024364                Attr-2.4.48 -- 
# 024365                description 
# 024366           setfont: 
# 024367                Kbd-2.4.0 -- 
# 024368                description 
# 024369           setkeycodes: 
# 024370                Kbd-2.4.0 -- 
# 024371                description 
# 024372           setleds: 
# 024373                Kbd-2.4.0 -- 
# 024374                description 
# 024375           setmetamode: 
# 024376                Kbd-2.4.0 -- 
# 024377                description 
# 024378           setsid: 
# 024379                Util-linux-2.36.2 -- 
# 024380                description 
# 024381           setterm: 
# 024382                Util-linux-2.36.2 -- 
# 024383                description 
# 024384           setvtrgb: 
# 024385                Kbd-2.4.0 -- 
# 024386                description 
# 024387           sfdisk: 
# 024388                Util-linux-2.36.2 -- 
# 024389                description 
# 024390           sg: 
# 024391                Shadow-4.8.1 -- 
# 024392                description 
# 024393           sh: 
# 024394                Bash-5.1 -- 
# 024395                description 
# 024396           sha1sum: 
# 024397                Coreutils-8.32 -- 
# 024398                description 
# 024399           sha224sum: 
# 024400                Coreutils-8.32 -- 
# 024401                description 
# 024402           sha256sum: 
# 024403                Coreutils-8.32 -- 
# 024404                description 
# 024405           sha384sum: 
# 024406                Coreutils-8.32 -- 
# 024407                description 
# 024408           sha512sum: 
# 024409                Coreutils-8.32 -- 
# 024410                description 
# 024411           shasum: 
# 024412                Perl-5.32.1 -- 
# 024413                description 
# 024414           showconsolefont: 
# 024415                Kbd-2.4.0 -- 
# 024416                description 
# 024417           showkey: 
# 024418                Kbd-2.4.0 -- 
# 024419                description 
# 024420           shred: 
# 024421                Coreutils-8.32 -- 
# 024422                description 
# 024423           shuf: 
# 024424                Coreutils-8.32 -- 
# 024425                description 
# 024426           shutdown: 
# 024427                Sysvinit-2.98 -- 
# 024428                description 
# 024429           size: 
# 024430                Binutils-2.36.1 -- 
# 024431                description 
# 024432           slabtop: 
# 024433                Procps-ng-3.3.17 -- 
# 024434                description 
# 024435           sleep: 
# 024436                Coreutils-8.32 -- 
# 024437                description 
# 024438           sln: 
# 024439                Glibc-2.33 -- 
# 024440                description 
# 024441           soelim: 
# 024442                Groff-1.22.4 -- 
# 024443                description 
# 024444           sort: 
# 024445                Coreutils-8.32 -- 
# 024446                description 
# 024447           sotruss: 
# 024448                Glibc-2.33 -- 
# 024449                description 
# 024450           splain: 
# 024451                Perl-5.32.1 -- 
# 024452                description 
# 024453           split: 
# 024454                Coreutils-8.32 -- 
# 024455                description 
# 024456           sprof: 
# 024457                Glibc-2.33 -- 
# 024458                description 
# 024459           ss: 
# 024460                IPRoute2-5.10.0 -- 
# 024461                description 
# 024462           stat: 
# 024463                Coreutils-8.32 -- 
# 024464                description 
# 024465           stdbuf: 
# 024466                Coreutils-8.32 -- 
# 024467                description 
# 024468           strings: 
# 024469                Binutils-2.36.1 -- 
# 024470                description 
# 024471           strip: 
# 024472                Binutils-2.36.1 -- 
# 024473                description 
# 024474           stty: 
# 024475                Coreutils-8.32 -- 
# 024476                description 
# 024477           su: 
# 024478                Shadow-4.8.1 -- 
# 024479                description 
# 024480           sulogin: 
# 024481                Util-linux-2.36.2 -- 
# 024482                description 
# 024483           sum: 
# 024484                Coreutils-8.32 -- 
# 024485                description 
# 024486           swaplabel: 
# 024487                Util-linux-2.36.2 -- 
# 024488                description 
# 024489           swapoff: 
# 024490                Util-linux-2.36.2 -- 
# 024491                description 
# 024492           swapon: 
# 024493                Util-linux-2.36.2 -- 
# 024494                description 
# 024495           switch_root: 
# 024496                Util-linux-2.36.2 -- 
# 024497                description 
# 024498           sync: 
# 024499                Coreutils-8.32 -- 
# 024500                description 
# 024501           sysctl: 
# 024502                Procps-ng-3.3.17 -- 
# 024503                description 
# 024504           syslogd: 
# 024505                Sysklogd-1.5.1 -- 
# 024506                description 
# 024507           tabs: 
# 024508                Ncurses-6.2 -- 
# 024509                description 
# 024510           tac: 
# 024511                Coreutils-8.32 -- 
# 024512                description 
# 024513           tail: 
# 024514                Coreutils-8.32 -- 
# 024515                description 
# 024516           tailf: 
# 024517                Util-linux-2.36.2 -- 
# 024518                description 
# 024519           talk: 
# 024520                Inetutils-2.0 -- 
# 024521                description 
# 024522           tar: 
# 024523                Tar-1.34 -- 
# 024524                description 
# 024525           taskset: 
# 024526                Util-linux-2.36.2 -- 
# 024527                description 
# 024528           tbl: 
# 024529                Groff-1.22.4 -- 
# 024530                description 
# 024531           tc: 
# 024532                IPRoute2-5.10.0 -- 
# 024533                description 
# 024534           tclsh: 
# 024535                Tcl-8.6.11 -- 
# 024536                description 
# 024537           tclsh8.6: 
# 024538                Tcl-8.6.11 -- 
# 024539                description 
# 024540           tee: 
# 024541                Coreutils-8.32 -- 
# 024542                description 
# 024543           telinit: 
# 024544                Sysvinit-2.98 -- 
# 024545                description 
# 024546           telnet: 
# 024547                Inetutils-2.0 -- 
# 024548                description 
# 024549           test: 
# 024550                Coreutils-8.32 -- 
# 024551                description 
# 024552           texi2dvi: 
# 024553                Texinfo-6.7 -- 
# 024554                description 
# 024555           texi2pdf: 
# 024556                Texinfo-6.7 -- 
# 024557                description 
# 024558           texi2any: 
# 024559                Texinfo-6.7 -- 
# 024560                description 
# 024561           texindex: 
# 024562                Texinfo-6.7 -- 
# 024563                description 
# 024564           tfmtodit: 
# 024565                Groff-1.22.4 -- 
# 024566                description 
# 024567           tftp: 
# 024568                Inetutils-2.0 -- 
# 024569                description 
# 024570           tic: 
# 024571                Ncurses-6.2 -- 
# 024572                description 
# 024573           timeout: 
# 024574                Coreutils-8.32 -- 
# 024575                description 
# 024576           tload: 
# 024577                Procps-ng-3.3.17 -- 
# 024578                description 
# 024579           toe: 
# 024580                Ncurses-6.2 -- 
# 024581                description 
# 024582           top: 
# 024583                Procps-ng-3.3.17 -- 
# 024584                description 
# 024585           touch: 
# 024586                Coreutils-8.32 -- 
# 024587                description 
# 024588           tput: 
# 024589                Ncurses-6.2 -- 
# 024590                description 
# 024591           tr: 
# 024592                Coreutils-8.32 -- 
# 024593                description 
# 024594           traceroute: 
# 024595                Inetutils-2.0 -- 
# 024596                description 
# 024597           troff: 
# 024598                Groff-1.22.4 -- 
# 024599                description 
# 024600           true: 
# 024601                Coreutils-8.32 -- 
# 024602                description 
# 024603           truncate: 
# 024604                Coreutils-8.32 -- 
# 024605                description 
# 024606           tset: 
# 024607                Ncurses-6.2 -- 
# 024608                description 
# 024609           tsort: 
# 024610                Coreutils-8.32 -- 
# 024611                description 
# 024612           tty: 
# 024613                Coreutils-8.32 -- 
# 024614                description 
# 024615           tune2fs: 
# 024616                E2fsprogs-1.46.1 -- 
# 024617                description 
# 024618           tzselect: 
# 024619                Glibc-2.33 -- 
# 024620                description 
# 024621           udevadm: 
# 024622                Eudev-3.2.10 -- 
# 024623                description 
# 024624           udevd: 
# 024625                Eudev-3.2.10 -- 
# 024626                description 
# 024627           ul: 
# 024628                Util-linux-2.36.2 -- 
# 024629                description 
# 024630           umount: 
# 024631                Util-linux-2.36.2 -- 
# 024632                description 
# 024633           uname: 
# 024634                Coreutils-8.32 -- 
# 024635                description 
# 024636           uname26: 
# 024637                Util-linux-2.36.2 -- 
# 024638                description 
# 024639           uncompress: 
# 024640                Gzip-1.10 -- 
# 024641                description 
# 024642           unexpand: 
# 024643                Coreutils-8.32 -- 
# 024644                description 
# 024645           unicode_start: 
# 024646                Kbd-2.4.0 -- 
# 024647                description 
# 024648           unicode_stop: 
# 024649                Kbd-2.4.0 -- 
# 024650                description 
# 024651           uniq: 
# 024652                Coreutils-8.32 -- 
# 024653                description 
# 024654           unlink: 
# 024655                Coreutils-8.32 -- 
# 024656                description 
# 024657           unlzma: 
# 024658                Xz-5.2.5 -- 
# 024659                description 
# 024660           unshare: 
# 024661                Util-linux-2.36.2 -- 
# 024662                description 
# 024663           unxz: 
# 024664                Xz-5.2.5 -- 
# 024665                description 
# 024666           updatedb: 
# 024667                Findutils-4.8.0 -- 
# 024668                description 
# 024669           uptime: 
# 024670                Procps-ng-3.3.17 -- 
# 024671                description 
# 024672           useradd: 
# 024673                Shadow-4.8.1 -- 
# 024674                description 
# 024675           userdel: 
# 024676                Shadow-4.8.1 -- 
# 024677                description 
# 024678           usermod: 
# 024679                Shadow-4.8.1 -- 
# 024680                description 
# 024681           users: 
# 024682                Coreutils-8.32 -- 
# 024683                description 
# 024684           utmpdump: 
# 024685                Util-linux-2.36.2 -- 
# 024686                description 
# 024687           uuidd: 
# 024688                Util-linux-2.36.2 -- 
# 024689                description 
# 024690           uuidgen: 
# 024691                Util-linux-2.36.2 -- 
# 024692                description 
# 024693           uuidparse: 
# 024694                Util-linux-2.36.2 -- 
# 024695                description 
# 024696           vdir: 
# 024697                Coreutils-8.32 -- 
# 024698                description 
# 024699           vi: 
# 024700                Vim-8.2.2433 -- 
# 024701                description 
# 024702           view: 
# 024703                Vim-8.2.2433 -- 
# 024704                description 
# 024705           vigr: 
# 024706                Shadow-4.8.1 -- 
# 024707                description 
# 024708           vim: 
# 024709                Vim-8.2.2433 -- 
# 024710                description 
# 024711           vimdiff: 
# 024712                Vim-8.2.2433 -- 
# 024713                description 
# 024714           vimtutor: 
# 024715                Vim-8.2.2433 -- 
# 024716                description 
# 024717           vipw: 
# 024718                Shadow-4.8.1 -- 
# 024719                description 
# 024720           vmstat: 
# 024721                Procps-ng-3.3.17 -- 
# 024722                description 
# 024723           w: 
# 024724                Procps-ng-3.3.17 -- 
# 024725                description 
# 024726           wall: 
# 024727                Util-linux-2.36.2 -- 
# 024728                description 
# 024729           watch: 
# 024730                Procps-ng-3.3.17 -- 
# 024731                description 
# 024732           wc: 
# 024733                Coreutils-8.32 -- 
# 024734                description 
# 024735           wdctl: 
# 024736                Util-linux-2.36.2 -- 
# 024737                description 
# 024738           whatis: 
# 024739                Man-DB-2.9.4 -- 
# 024740                description 
# 024741           whereis: 
# 024742                Util-linux-2.36.2 -- 
# 024743                description 
# 024744           who: 
# 024745                Coreutils-8.32 -- 
# 024746                description 
# 024747           whoami: 
# 024748                Coreutils-8.32 -- 
# 024749                description 
# 024750           wipefs: 
# 024751                Util-linux-2.36.2 -- 
# 024752                description 
# 024753           x86_64: 
# 024754                Util-linux-2.36.2 -- 
# 024755                description 
# 024756           xargs: 
# 024757                Findutils-4.8.0 -- 
# 024758                description 
# 024759           xgettext: 
# 024760                Gettext-0.21 -- 
# 024761                description 
# 024762           xmlwf: 
# 024763                Expat-2.2.10 -- 
# 024764                description 
# 024765           xsubpp: 
# 024766                Perl-5.32.1 -- 
# 024767                description 
# 024768           xtrace: 
# 024769                Glibc-2.33 -- 
# 024770                description 
# 024771           xxd: 
# 024772                Vim-8.2.2433 -- 
# 024773                description 
# 024774           xz: 
# 024775                Xz-5.2.5 -- 
# 024776                description 
# 024777           xzcat: 
# 024778                Xz-5.2.5 -- 
# 024779                description 
# 024780           xzcmp: 
# 024781                Xz-5.2.5 -- 
# 024782                description 
# 024783           xzdec: 
# 024784                Xz-5.2.5 -- 
# 024785                description 
# 024786           xzdiff: 
# 024787                Xz-5.2.5 -- 
# 024788                description 
# 024789           xzegrep: 
# 024790                Xz-5.2.5 -- 
# 024791                description 
# 024792           xzfgrep: 
# 024793                Xz-5.2.5 -- 
# 024794                description 
# 024795           xzgrep: 
# 024796                Xz-5.2.5 -- 
# 024797                description 
# 024798           xzless: 
# 024799                Xz-5.2.5 -- 
# 024800                description 
# 024801           xzmore: 
# 024802                Xz-5.2.5 -- 
# 024803                description 
# 024804           yacc: 
# 024805                Bison-3.7.5 -- 
# 024806                description 
# 024807           yes: 
# 024808                Coreutils-8.32 -- 
# 024809                description 
# 024810           zcat: 
# 024811                Gzip-1.10 -- 
# 024812                description 
# 024813           zcmp: 
# 024814                Gzip-1.10 -- 
# 024815                description 
# 024816           zdiff: 
# 024817                Gzip-1.10 -- 
# 024818                description 
# 024819           zdump: 
# 024820                Glibc-2.33 -- 
# 024821                description 
# 024822           zegrep: 
# 024823                Gzip-1.10 -- 
# 024824                description 
# 024825           zfgrep: 
# 024826                Gzip-1.10 -- 
# 024827                description 
# 024828           zforce: 
# 024829                Gzip-1.10 -- 
# 024830                description 
# 024831           zgrep: 
# 024832                Gzip-1.10 -- 
# 024833                description 
# 024834           zic: 
# 024835                Glibc-2.33 -- 
# 024836                description 
# 024837           zipdetails: 
# 024838                Perl-5.32.1 -- 
# 024839                description 
# 024840           zless: 
# 024841                Gzip-1.10 -- 
# 024842                description 
# 024843           zmore: 
# 024844                Gzip-1.10 -- 
# 024845                description 
# 024846           znew: 
# 024847                Gzip-1.10 -- 
# 024848                description 
# 024849           zramctl: 
# 024850                Util-linux-2.36.2 -- 
# 024851                description 
# 024852           zstd: 
# 024853                Zstd-1.4.8 -- 
# 024854                description 
# 024855           zstdgrep: 
# 024856                Zstd-1.4.8 -- 
# 024857                description 
# 024858           zstdless: 
# 024859                Zstd-1.4.8 -- 
# 024860                description   
# 024861        Libraries 
# 024862           Expat: 
# 024863                XML::Parser-2.46 -- 
# 024864                description 
# 024865           ld-2.33.so: 
# 024866                Glibc-2.33 -- 
# 024867                description 
# 024868           libacl: 
# 024869                Acl-2.2.53 -- 
# 024870                description 
# 024871           libanl: 
# 024872                Glibc-2.33 -- 
# 024873                description 
# 024874           libasprintf: 
# 024875                Gettext-0.21 -- 
# 024876                description 
# 024877           libattr: 
# 024878                Attr-2.4.48 -- 
# 024879                description 
# 024880           libbfd: 
# 024881                Binutils-2.36.1 -- 
# 024882                description 
# 024883           libblkid: 
# 024884                Util-linux-2.36.2 -- 
# 024885                description 
# 024886           libBrokenLocale: 
# 024887                Glibc-2.33 -- 
# 024888                description 
# 024889           libbz2: 
# 024890                Bzip2-1.0.8 -- 
# 024891                description 
# 024892           libc: 
# 024893                Glibc-2.33 -- 
# 024894                description 
# 024895           libcap: 
# 024896                Libcap-2.48 -- 
# 024897                description 
# 024898           libcheck: 
# 024899                Check-0.15.2 -- 
# 024900                description 
# 024901           libcom_err: 
# 024902                E2fsprogs-1.46.1 -- 
# 024903                description 
# 024904           libcrypt: 
# 024905                Glibc-2.33 -- 
# 024906                description 
# 024907           libcrypto.so: 
# 024908                OpenSSL-1.1.1j -- 
# 024909                description 
# 024910           libctf: 
# 024911                Binutils-2.36.1 -- 
# 024912                description 
# 024913           libctf-nobfd: 
# 024914                Binutils-2.36.1 -- 
# 024915                description 
# 024916           libcursesw: 
# 024917                Ncurses-6.2 -- 
# 024918                description 
# 024919           libdl: 
# 024920                Glibc-2.33 -- 
# 024921                description 
# 024922           libe2p: 
# 024923                E2fsprogs-1.46.1 -- 
# 024924                description 
# 024925           libelf: 
# 024926                Libelf from Elfutils-0.183 -- 
# 024927                description 
# 024928           libexpat: 
# 024929                Expat-2.2.10 -- 
# 024930                description 
# 024931           libexpect-5.45: 
# 024932                Expect-5.45.4 -- 
# 024933                description 
# 024934           libext2fs: 
# 024935                E2fsprogs-1.46.1 -- 
# 024936                description 
# 024937           libfdisk: 
# 024938                Util-linux-2.36.2 -- 
# 024939                description 
# 024940           libffi: 
# 024941                Libffi-3.3 
# 024942           libfl: 
# 024943                Flex-2.6.4 -- 
# 024944                description 
# 024945           libformw: 
# 024946                Ncurses-6.2 -- 
# 024947                description 
# 024948           libg: 
# 024949                Glibc-2.33 -- 
# 024950                description 
# 024951           libgcc: 
# 024952                GCC-10.2.0 -- 
# 024953                description 
# 024954           libgcov: 
# 024955                GCC-10.2.0 -- 
# 024956                description 
# 024957           libgdbm: 
# 024958                GDBM-1.19 -- 
# 024959                description 
# 024960           libgdbm_compat: 
# 024961                GDBM-1.19 -- 
# 024962                description 
# 024963           libgettextlib: 
# 024964                Gettext-0.21 -- 
# 024965                description 
# 024966           libgettextpo: 
# 024967                Gettext-0.21 -- 
# 024968                description 
# 024969           libgettextsrc: 
# 024970                Gettext-0.21 -- 
# 024971                description 
# 024972           libgmp: 
# 024973                GMP-6.2.1 -- 
# 024974                description 
# 024975           libgmpxx: 
# 024976                GMP-6.2.1 -- 
# 024977                description 
# 024978           libgomp: 
# 024979                GCC-10.2.0 -- 
# 024980                description 
# 024981           libhistory: 
# 024982                Readline-8.1 -- 
# 024983                description 
# 024984           libkmod: 
# 024985                Kmod-28 
# 024986           liblsan: 
# 024987                GCC-10.2.0 -- 
# 024988                description 
# 024989           libltdl: 
# 024990                Libtool-2.4.6 -- 
# 024991                description 
# 024992           liblto_plugin: 
# 024993                GCC-10.2.0 -- 
# 024994                description 
# 024995           liblzma: 
# 024996                Xz-5.2.5 -- 
# 024997                description 
# 024998           libm: 
# 024999                Glibc-2.33 -- 
# 025000                description 
# 025001           libmagic: 
# 025002                File-5.39 -- 
# 025003                description 
# 025004           libman: 
# 025005                Man-DB-2.9.4 -- 
# 025006                description 
# 025007           libmandb: 
# 025008                Man-DB-2.9.4 -- 
# 025009                description 
# 025010           libmcheck: 
# 025011                Glibc-2.33 -- 
# 025012                description 
# 025013           libmemusage: 
# 025014                Glibc-2.33 -- 
# 025015                description 
# 025016           libmenuw: 
# 025017                Ncurses-6.2 -- 
# 025018                description 
# 025019           libmount: 
# 025020                Util-linux-2.36.2 -- 
# 025021                description 
# 025022           libmpc: 
# 025023                MPC-1.2.1 -- 
# 025024                description 
# 025025           libmpfr: 
# 025026                MPFR-4.1.0 -- 
# 025027                description 
# 025028           libncursesw: 
# 025029                Ncurses-6.2 -- 
# 025030                description 
# 025031           libnsl: 
# 025032                Glibc-2.33 -- 
# 025033                description 
# 025034           libnss: 
# 025035                Glibc-2.33 -- 
# 025036                description 
# 025037           libopcodes: 
# 025038                Binutils-2.36.1 -- 
# 025039                description 
# 025040           libpanelw: 
# 025041                Ncurses-6.2 -- 
# 025042                description 
# 025043           libpcprofile: 
# 025044                Glibc-2.33 -- 
# 025045                description 
# 025046           libpipeline: 
# 025047                Libpipeline-1.5.3 
# 025048           libprocps: 
# 025049                Procps-ng-3.3.17 -- 
# 025050                description 
# 025051           libpsx: 
# 025052                Libcap-2.48 -- 
# 025053                description 
# 025054           libpthread: 
# 025055                Glibc-2.33 -- 
# 025056                description 
# 025057           libquadmath: 
# 025058                GCC-10.2.0 -- 
# 025059                description 
# 025060           libreadline: 
# 025061                Readline-8.1 -- 
# 025062                description 
# 025063           libresolv: 
# 025064                Glibc-2.33 -- 
# 025065                description 
# 025066           librt: 
# 025067                Glibc-2.33 -- 
# 025068                description 
# 025069           libSegFault: 
# 025070                Glibc-2.33 -- 
# 025071                description 
# 025072           libsmartcols: 
# 025073                Util-linux-2.36.2 -- 
# 025074                description 
# 025075           libss: 
# 025076                E2fsprogs-1.46.1 -- 
# 025077                description 
# 025078           libssl.so: 
# 025079                OpenSSL-1.1.1j -- 
# 025080                description 
# 025081           libssp: 
# 025082                GCC-10.2.0 -- 
# 025083                description 
# 025084           libstdbuf: 
# 025085                Coreutils-8.32 -- 
# 025086                description 
# 025087           libstdc++: 
# 025088                GCC-10.2.0 -- 
# 025089                description 
# 025090           libstdc++fs: 
# 025091                GCC-10.2.0 -- 
# 025092                description 
# 025093           libsupc++: 
# 025094                GCC-10.2.0 -- 
# 025095                description 
# 025096           libtcl8.6.so: 
# 025097                Tcl-8.6.11 -- 
# 025098                description 
# 025099           libtclstub8.6.a: 
# 025100                Tcl-8.6.11 -- 
# 025101                description 
# 025102           libtextstyle: 
# 025103                Gettext-0.21 -- 
# 025104                description 
# 025105           libthread_db: 
# 025106                Glibc-2.33 -- 
# 025107                description 
# 025108           libtsan: 
# 025109                GCC-10.2.0 -- 
# 025110                description 
# 025111           libubsan: 
# 025112                GCC-10.2.0 -- 
# 025113                description 
# 025114           libudev: 
# 025115                Eudev-3.2.10 -- 
# 025116                description 
# 025117           libutil: 
# 025118                Glibc-2.33 -- 
# 025119                description 
# 025120           libuuid: 
# 025121                Util-linux-2.36.2 -- 
# 025122                description 
# 025123           liby: 
# 025124                Bison-3.7.5 -- 
# 025125                description 
# 025126           libz: 
# 025127                Zlib-1.2.11 -- 
# 025128                description 
# 025129           libzstd: 
# 025130                Zstd-1.4.8 -- 
# 025131                description 
# 025132           preloadable_libintl: 
# 025133                Gettext-0.21 -- 
# 025134                description   
# 025135        Scripts 
# 025136           checkfs: 
# 025137                LFS-Bootscripts-20210201 -- 
# 025138                description 
# 025139           cleanfs: 
# 025140                LFS-Bootscripts-20210201 -- 
# 025141                description 
# 025142           console: 
# 025143                LFS-Bootscripts-20210201 -- 
# 025144                description 
# 025145           configuring: 
# 025146                Configuring the Linux Console 
# 025147           File creation at boot: 
# 025148           configuring: 
# 025149                Creating Files at Boot 
# 025150           functions: 
# 025151                LFS-Bootscripts-20210201 -- 
# 025152                description 
# 025153           halt: 
# 025154                LFS-Bootscripts-20210201 -- 
# 025155                description 
# 025156           hostname: 
# 025157           configuring: 
# 025158                Configuring the system hostname 
# 025159           ifdown: 
# 025160                LFS-Bootscripts-20210201 -- 
# 025161                description 
# 025162           ifup: 
# 025163                LFS-Bootscripts-20210201 -- 
# 025164                description 
# 025165           ipv4-static: 
# 025166                LFS-Bootscripts-20210201 -- 
# 025167                description 
# 025168           localnet: 
# 025169                LFS-Bootscripts-20210201 -- 
# 025170                description 
# 025171           /etc/hosts: 
# 025172                Customizing the /etc/hosts File 
# 025173           modules: 
# 025174                LFS-Bootscripts-20210201 -- 
# 025175                description 
# 025176           mountfs: 
# 025177                LFS-Bootscripts-20210201 -- 
# 025178                description 
# 025179           mountvirtfs: 
# 025180                LFS-Bootscripts-20210201 -- 
# 025181                description 
# 025182           network: 
# 025183                LFS-Bootscripts-20210201 -- 
# 025184                description 
# 025185           /etc/hosts: 
# 025186                Customizing the /etc/hosts File 
# 025187           configuring: 
# 025188                General Network Configuration 
# 025189           rc: 
# 025190                LFS-Bootscripts-20210201 -- 
# 025191                description 
# 025192           reboot: 
# 025193                LFS-Bootscripts-20210201 -- 
# 025194                description 
# 025195           sendsignals: 
# 025196                LFS-Bootscripts-20210201 -- 
# 025197                description 
# 025198           setclock: 
# 025199                LFS-Bootscripts-20210201 -- 
# 025200                description 
# 025201           configuring: 
# 025202                Configuring the System Clock 
# 025203           swap: 
# 025204                LFS-Bootscripts-20210201 -- 
# 025205                description 
# 025206           sysctl: 
# 025207                LFS-Bootscripts-20210201 -- 
# 025208                description 
# 025209           sysklogd: 
# 025210                LFS-Bootscripts-20210201 -- 
# 025211                description 
# 025212           configuring: 
# 025213                Configuring the sysklogd Script 
# 025214           template: 
# 025215                LFS-Bootscripts-20210201 -- 
# 025216                description 
# 025217           udev: 
# 025218                LFS-Bootscripts-20210201 -- 
# 025219                description 
# 025220           udev_retry: 
# 025221                LFS-Bootscripts-20210201 -- 
# 025222                description 
# 025223           dwp: 
# 025224                Binutils-2.36.1 -- 
# 025225                description   
# 025226        Others 
# 025227           /boot/config-5.10.17: 
# 025228                Linux-5.10.17 -- 
# 025229                description 
# 025230           /boot/System.map-5.10.17: 
# 025231                Linux-5.10.17 -- 
# 025232                description 
# 025233           /dev/*: 
# 025234                Preparing Virtual Kernel File Systems 
# 025235           /etc/fstab: 
# 025236                Creating the /etc/fstab File 
# 025237           /etc/group: 
# 025238                Creating Essential Files and Symlinks 
# 025239           /etc/hosts: 
# 025240                Customizing the /etc/hosts File 
# 025241           /etc/inittab: 
# 025242                Configuring Sysvinit 
# 025243           /etc/inputrc: 
# 025244                Creating the /etc/inputrc File 
# 025245           /etc/ld.so.conf: 
# 025246                Configuring the Dynamic Loader 
# 025247           /etc/lfs-release: 
# 025248                The End 
# 025249           /etc/localtime: 
# 025250                Configuring Glibc 
# 025251           /etc/lsb-release: 
# 025252                The End 
# 025253           /etc/modprobe.d/usb.conf: 
# 025254                Configuring Linux Module Load Order 
# 025255           /etc/nsswitch.conf: 
# 025256                Configuring Glibc 
# 025257           /etc/os-release: 
# 025258                The End 
# 025259           /etc/passwd: 
# 025260                Creating Essential Files and Symlinks 
# 025261           /etc/profile: 
# 025262                The Bash Shell Startup Files 
# 025263           /etc/protocols: 
# 025264                Iana-Etc-20210202 
# 025265           /etc/resolv.conf: 
# 025266                Creating the /etc/resolv.conf File 
# 025267           /etc/services: 
# 025268                Iana-Etc-20210202 
# 025269           /etc/syslog.conf: 
# 025270                Configuring Sysklogd 
# 025271           /etc/udev: 
# 025272                Eudev-3.2.10 -- 
# 025273                description 
# 025274           /etc/udev/hwdb.bin: 
# 025275                Configuring Eudev 
# 025276           /etc/vimrc: 
# 025277                Configuring Vim 
# 025278           /run/utmp: 
# 025279                Creating Essential Files and Symlinks 
# 025280           /usr/include/asm-generic/*.h: 
# 025281                Linux-5.10.17 API Headers -- 
# 025282                description 
# 025283           /usr/include/asm/*.h: 
# 025284                Linux-5.10.17 API Headers -- 
# 025285                description 
# 025286           /usr/include/drm/*.h: 
# 025287                Linux-5.10.17 API Headers -- 
# 025288                description 
# 025289           /usr/include/linux/*.h: 
# 025290                Linux-5.10.17 API Headers -- 
# 025291                description 
# 025292           /usr/include/misc/*.h: 
# 025293                Linux-5.10.17 API Headers -- 
# 025294                description 
# 025295           /usr/include/mtd/*.h: 
# 025296                Linux-5.10.17 API Headers -- 
# 025297                description 
# 025298           /usr/include/rdma/*.h: 
# 025299                Linux-5.10.17 API Headers -- 
# 025300                description 
# 025301           /usr/include/scsi/*.h: 
# 025302                Linux-5.10.17 API Headers -- 
# 025303                description 
# 025304           /usr/include/sound/*.h: 
# 025305                Linux-5.10.17 API Headers -- 
# 025306                description 
# 025307           /usr/include/video/*.h: 
# 025308                Linux-5.10.17 API Headers -- 
# 025309                description 
# 025310           /usr/include/xen/*.h: 
# 025311                Linux-5.10.17 API Headers -- 
# 025312                description 
# 025313           /var/log/btmp: 
# 025314                Creating Essential Files and Symlinks 
# 025315           /var/log/lastlog: 
# 025316                Creating Essential Files and Symlinks 
# 025317           /var/log/wtmp: 
# 025318                Creating Essential Files and Symlinks 
# 025319           /etc/shells: 
# 025320                Creating the /etc/shells File 
# 025321           man pages: 
# 025322                Man-pages-5.10 -- 
# 025323                description 