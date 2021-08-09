/*
 *
 *    Linux From Scratch bash extractor !
 *
 *    written by Keith Michael Bradley
 *          (all rights reserved)
 *
 */



#define FALSE 0
#define TRUE 1



#include <stdio.h>
#include  <stdlib.h>



extern  FILE    *outFile;
extern  int     a_count;
extern  int     global_id_flag;
extern  char    att_id_value[64];
extern  int     comment_flag;



extern  void    new_outFile();
extern  void    preBuild_LFS(const char* chapterName, const char* pkgName, const char* fileType);
extern  void    preBuild_chroot(const char* chapterName, const char* pkgName, const char* fileType);
extern  int     str_match(const char *str1, const char *str2, int count);




  const
  char        Part1_name[] = "part1";                      // Part 1 anchor tag name attribute.
//
  const
  char        Ch1_name[] = "chapter-intro";                // Chapter 1 anchor tag name attribute.
//
  const
  char        Part2_name[] = "part2";                      // Part 2 anchor tag name attribute.
//
  const
  char        Ch2_name[] = "chapter-partitioning";         // Chapter 2 anchor tag name attribute.
  const
  char        Ch22_name[] = "ch-partitioning-hostreqs";    // Chapter 2.2 anchor tag name attribute.
  const
  char        Ch23_name[] = "ch-partitioning-stages";      // Chapter 2.3 anchor tag name attribute.
  const
  char        Ch25_name[] = "ch-partitioning-creatingfilesystem";// Chapter 2.5 anchor tag name attribute.
  const
  char        Ch26_name[] = "ch-partitioning-aboutlfs";    // Chapter 2.6 anchor tag name attribute.
  const
  char        Ch27_name[] = "ch-partitioning-mounting";    // Chapter 2.7 anchor tag name attribute.
//
  const
  char        Ch3_name[] = "chapter-getting-materials";    // Chapter 3 anchor tag name attribute.
  const
  char        Ch31_name[] = "ch-materials-introduction";   // Chapter 3.1 anchor tag name attribute.
//
  const
  char        Ch4_name[] = "chapter-final-preps";          // Chapter 4 anchor tag name attribute.
//
  const
  char        Ch42_name[] = "ch-tools-creatingminlayout";  // Chapter 4.2 anchor tag name attribute.
  const
  char        Ch43_name[] = "ch-preps-addinguser";         // Chapter 4.3 anchor tag name attribute.
  const
  char        Ch44_name[] = "ch-preps-settingenviron";     // Chapter 4.4 anchor tag name attribute.
  const
  char        Ch45_name[] = "ch-preps-aboutsbus";          // Chapter 4.5 anchor tag name attribute.
//
  const
  char        Part3_name[] = "part3";                      // Part 3 anchor tag name attribute.
//
  const
  char        Ch5_name[] = "chapter-cross-tools";          // Chapter 5 anchor tag name attribute.
/*  const
  char        Ch51_name[] = "ch-tools-introduction";       // Chapter 5.1 anchor tag name attribute.*/
  const
  char        Ch52_name[] = "ch-tools-binutils-pass1";     // Chapter 5.2 anchor tag name attribute.
  const
  char        Ch53_name[] = "ch-tools-gcc-pass1";          // Chapter 5.3 anchor tag name attribute.
  const
  char        Ch54_name[] = "ch-tools-linux-headers";      // Chapter 5.4 anchor tag name attribute.
  const
  char        Ch55_name[] = "ch-tools-glibc";              // Chapter 5.5 anchor tag name attribute.
  const
  char        Ch56_name[] = "ch-tools-libstdcpp-pass1";    // Chapter 5.6 anchor tag name attribute.
//
  const
  char        Ch6_name[] = "chapter-temporary-tools";      // Chapter 6 anchor tag name attribute.
  const
  char        Ch62_name[] = "ch-tools-m4";                 // Chapter 6.2 anchor tag name attribute.
  const
  char        Ch63_name[] = "ch-tools-ncurses";            // Chapter 6.3 anchor tag name attribute.
  const
  char        Ch64_name[] = "ch-tools-bash";               // Chapter 6.4 anchor tag name attribute.
  const
  char        Ch65_name[] = "ch-tools-coreutils";          // Chapter 6.5 anchor tag name attribute.
  const
  char        Ch66_name[] = "ch-tools-diffutils";          // Chapter 6.6 anchor tag name attribute.
  const
  char        Ch67_name[] = "ch-tools-file";               // Chapter 6.7 anchor tag name attribute.
  const
  char        Ch68_name[] = "ch-tools-findutils";          // Chapter 6.8 anchor tag name attribute.
  const
  char        Ch69_name[] = "ch-tools-gawk";               // Chapter 6.9 anchor tag name attribute.
  const
  char        Ch610_name[] = "ch-tools-grep";              // Chapter 6.10 anchor tag name attribute.
  const
  char        Ch611_name[] = "ch-tools-gzip";              // Chapter 6.11 anchor tag name attribute.
  const
  char        Ch612_name[] = "ch-tools-make";              // Chapter 6.12 anchor tag name attribute.
  const
  char        Ch613_name[] = "ch-tools-patch";             // Chapter 6.13 anchor tag name attribute.
  const
  char        Ch614_name[] = "ch-tools-sed";               // Chapter 6.14 anchor tag name attribute.
  const
  char        Ch615_name[] = "ch-tools-tar";               // Chapter 6.15 anchor tag name attribute.
  const
  char        Ch616_name[] = "ch-tools-xz";                // Chapter 6.16 anchor tag name attribute.
  const
  char        Ch617_name[] = "ch-tools-binutils-pass2";    // Chapter 6.17 anchor tag name attribute.
  const
  char        Ch618_name[] = "ch-tools-gcc-pass2";         // Chapter 6.18 anchor tag name attribute.
//
  const
  char        Ch7_name[] = "chapter-chroot-temporary-tools";// Chapter 7 anchor tag name attribute.
/*  const
  char        Ch71_name[] = "ch-tools-introduction-chroot";// Chapter 7.1 anchor tag name attribute.*/
  const
  char        Ch72_name[] = "ch-tools-changingowner";      // Chapter 7.2 anchor tag name attribute.
  const
  char        Ch73_name[] = "ch-tools-kernfs";             // Chapter 7.3 anchor tag name attribute.
  const
  char        Ch733_name[] = "ch-tools-kernfsmount";       // Chapter 7.3 anchor tag name attribute.
  const
  char        Ch74_name[] = "ch-tools-chroot";             // Chapter 7.4 anchor tag name attribute.
  const
  char        Ch75_name[] = "ch-tools-creatingdirs";       // Chapter 7.5 anchor tag name attribute.
  const
  char        Ch76_name[] = "ch-tools-createfiles";        // Chapter 7.6 anchor tag name attribute.
  const
  char        Ch77_name[] = "ch-tools-libstdcpp-pass2";    // Chapter 7.7 anchor tag name attribute.
  const
  char        Ch78_name[] = "ch-tools-gettext";            // Chapter 7.8 anchor tag name attribute.
  const
  char        Ch79_name[] = "ch-tools-bison";              // Chapter 7.9 anchor tag name attribute.
  const
  char        Ch710_name[] = "ch-tools-perl";              // Chapter 7.10 anchor tag name attribute.
  const
  char        Ch711_name[] = "ch-tools-Python";            // Chapter 7.11 anchor tag name attribute.
  const
  char        Ch712_name[] = "ch-tools-texinfo";           // Chapter 7.12 anchor tag name attribute.
  const
  char        Ch713_name[] = "ch-tools-util-linux";        // Chapter 7.13 anchor tag name attribute.
  const
  char        Ch714_name[] = "ch-tools-stripping";         // Chapter 7.13 anchor tag name attribute.
//
  const
  char        Part4_name[] = "part4";                      // Part 4 anchor tag name attribute.
//
  const
  char        Ch8_name[] = "chapter-building-system";      // Chapter 8 anchor tag name attribute.
  const
  char        Ch81_name[] = "ch-system-introduction";      // Chapter 8.1 anchor tag name attribute.
  const
  char        Ch82_name[] = "ch-system-pkgmgt";            // Chapter 8.2 anchor tag name attribute.
  const
  char        Ch83_name[] = "ch-system-man-pages";         // Chapter 8.3 anchor tag name attribute.
  const
  char        Ch84_name[] = "ch-system-iana-etc";          // Chapter 8.4 anchor tag name attribute.
  const
  char        Ch85_name[] = "ch-system-glibc";             // Chapter 8.5 anchor tag name attribute.
  const
  char        Ch86_name[] = "ch-system-zlib";              // Chapter 8.6 anchor tag name attribute.
  const
  char        Ch87_name[] = "ch-system-bzip2";             // Chapter 8.7 anchor tag name attribute.
  const
  char        Ch88_name[] = "ch-system-xz";                // Chapter 8.8 anchor tag name attribute.
  const
  char        Ch89_name[] = "ch-system-zstd";              // Chapter 8.9 anchor tag name attribute.
  const
  char        Ch810_name[] = "ch-system-file";             // Chapter 8.10 anchor tag name attribute.
  const
  char        Ch811_name[] = "ch-system-readline";         // Chapter 8.11 anchor tag name attribute.
  const
  char        Ch812_name[] = "ch-system-m4";               // Chapter 8.12 anchor tag name attribute.
  const
  char        Ch813_name[] = "ch-system-bc";               // Chapter 8.13 anchor tag name attribute.
  const
  char        Ch814_name[] = "ch-system-flex";             // Chapter 8.14 anchor tag name attribute.
  const
  char        Ch815_name[] = "ch-tools-tcl";               // Chapter 8.15 anchor tag name attribute.
  const
  char        Ch816_name[] = "ch-tools-expect";            // Chapter 8.16 anchor tag name attribute.
  const
  char        Ch817_name[] = "ch-tools-dejagnu";           // Chapter 8.17 anchor tag name attribute.
  const
  char        Ch818_name[] = "ch-system-binutils";         // Chapter 8.18 anchor tag name attribute.
  const
  char        Ch819_name[] = "ch-system-gmp";              // Chapter 8.19 anchor tag name attribute.
  const
  char        Ch820_name[] = "ch-system-mpfr";             // Chapter 8.20 anchor tag name attribute.
  const
  char        Ch821_name[] = "ch-system-mpc";              // Chapter 8.21 anchor tag name attribute.
  const
  char        Ch822_name[] = "ch-system-attr";             // Chapter 8.22 anchor tag name attribute.
  const
  char        Ch823_name[] = "ch-system-acl";              // Chapter 8.23 anchor tag name attribute.
  const
  char        Ch824_name[] = "ch-system-libcap";           // Chapter 8.24 anchor tag name attribute.
  const
  char        Ch825_name[] = "ch-system-shadow";           // Chapter 8.25 anchor tag name attribute.
  const
  char        Ch826_name[] = "ch-system-gcc";              // Chapter 8.26 anchor tag name attribute.
  const
  char        Ch827_name[] = "ch-system-pkgconfig";        // Chapter 8.27 anchor tag name attribute.
  const
  char        Ch828_name[] = "ch-system-ncurses";          // Chapter 8.28 anchor tag name attribute.
  const
  char        Ch829_name[] = "ch-system-sed";              // Chapter 8.29 anchor tag name attribute.
  const
  char        Ch830_name[] = "ch-system-psmisc";           // Chapter 8.30 anchor tag name attribute.
  const
  char        Ch831_name[] = "ch-system-gettext";          // Chapter 8.31 anchor tag name attribute.
  const
  char        Ch832_name[] = "ch-system-bison";            // Chapter 8.32 anchor tag name attribute.
  const
  char        Ch833_name[] = "ch-system-grep";             // Chapter 8.33 anchor tag name attribute.
  const
  char        Ch834_name[] = "ch-system-bash";             // Chapter 8.34 anchor tag name attribute.
  const
  char        Ch835_name[] = "ch-system-libtool";          // Chapter 8.35 anchor tag name attribute.
  const
  char        Ch836_name[] = "ch-system-gdbm";             // Chapter 8.36 anchor tag name attribute.
  const
  char        Ch837_name[] = "ch-system-gperf";            // Chapter 8.37 anchor tag name attribute.
  const
  char        Ch838_name[] = "ch-system-expat";            // Chapter 8.38 anchor tag name attribute.
  const
  char        Ch839_name[] = "ch-system-inetutils";        // Chapter 8.39 anchor tag name attribute.
  const
  char        Ch840_name[] = "ch-system-perl";             // Chapter 8.40 anchor tag name attribute.
  const
  char        Ch841_name[] = "ch-system-xml-parser";       // Chapter 8.41 anchor tag name attribute.
  const
  char        Ch842_name[] = "ch-system-intltool";         // Chapter 8.42 anchor tag name attribute.
  const
  char        Ch843_name[] = "ch-system-autoconf";         // Chapter 8.43 anchor tag name attribute.
  const
  char        Ch844_name[] = "ch-system-automake";         // Chapter 8.44 anchor tag name attribute.
  const
  char        Ch845_name[] = "ch-system-kmod";             // Chapter 8.45 anchor tag name attribute.
  const
  char        Ch846_name[] = "ch-system-libelf";           // Chapter 8.46 anchor tag name attribute.
  const
  char        Ch847_name[] = "ch-system-libffi";           // Chapter 8.47 anchor tag name attribute.
  const
  char        Ch848_name[] = "ch-system-openssl";          // Chapter 8.48 anchor tag name attribute.
  const
  char        Ch849_name[] = "ch-system-Python";           // Chapter 8.49 anchor tag name attribute.
  const
  char        Ch850_name[] = "ch-system-ninja";            // Chapter 8.50 anchor tag name attribute.
  const
  char        Ch851_name[] = "ch-system-meson";            // Chapter 8.51 anchor tag name attribute.
  const
  char        Ch852_name[] = "ch-system-coreutils";        // Chapter 8.52 anchor tag name attribute.
  const
  char        Ch853_name[] = "ch-system-check";            // Chapter 8.53 anchor tag name attribute.
  const
  char        Ch854_name[] = "ch-system-diffutils";        // Chapter 8.54 anchor tag name attribute.
  const
  char        Ch855_name[] = "ch-system-gawk";             // Chapter 8.55 anchor tag name attribute.
  const
  char        Ch856_name[] = "ch-system-findutils";        // Chapter 8.56 anchor tag name attribute.
  const
  char        Ch857_name[] = "ch-system-groff";            // Chapter 8.57 anchor tag name attribute.
  const
  char        Ch858_name[] = "ch-system-grub";             // Chapter 8.58 anchor tag name attribute.
  const
  char        Ch859_name[] = "ch-system-less";             // Chapter 8.59 anchor tag name attribute.
  const
  char        Ch860_name[] = "ch-system-gzip";             // Chapter 8.60 anchor tag name attribute.
  const
  char        Ch861_name[] = "ch-system-iproute2";         // Chapter 8.61 anchor tag name attribute.
  const
  char        Ch862_name[] = "ch-system-kbd";              // Chapter 8.62 anchor tag name attribute.
  const
  char        Ch863_name[] = "ch-system-libpipeline";      // Chapter 8.63 anchor tag name attribute.
  const
  char        Ch864_name[] = "ch-system-make";             // Chapter 8.64 anchor tag name attribute.
  const
  char        Ch865_name[] = "ch-system-patch";            // Chapter 8.65 anchor tag name attribute.
  const
  char        Ch866_name[] = "ch-system-man-db";           // Chapter 8.66 anchor tag name attribute.
  const
  char        Ch867_name[] = "ch-system-tar";              // Chapter 8.67 anchor tag name attribute.
  const
  char        Ch868_name[] = "ch-system-texinfo";          // Chapter 8.68 anchor tag name attribute.
  const
  char        Ch869_name[] = "ch-system-vim";              // Chapter 8.69 anchor tag name attribute.
  const
  char        Ch870_name[] = "ch-system-eudev";            // Chapter 8.70 anchor tag name attribute.
  const
  char        Ch871_name[] = "ch-system-procps";           // Chapter 8.71 anchor tag name attribute.
  const
  char        Ch872_name[] = "ch-system-util-linux";       // Chapter 8.72 anchor tag name attribute.
  const
  char        Ch873_name[] = "ch-system-e2fsprogs";        // Chapter 8.73 anchor tag name attribute.
  const
  char        Ch874_name[] = "ch-system-sysklogd";         // Chapter 8.74 anchor tag name attribute.
  const
  char        Ch875_name[] = "ch-system-sysvinit";         // Chapter 8.75 anchor tag name attribute.
  const
  char        Ch876_name[] = "ch-system-aboutdebug";       // Chapter 8.76 anchor tag name attribute.
  const
  char        Ch877_name[] = "ch-system-strippingagain";   // Chapter 8.77 anchor tag name attribute.
  const
  char        Ch878_name[] = "ch-system-revisedchroot";    // Chapter 8.78 anchor tag name attribute.
//
  const
  char        Ch9_name[] = "chapter-config";               // Chapter 9 anchor tag name attribute.
  const
  char        Ch92_name[] = "ch-config-bootscripts";       // Chapter 9.2 anchor tag name attribute.
  const
  char        Ch10_name[] = "chapter-bootable";            // Chapter 10 anchor tag name attribute.
  const
  char        Ch11_name[] = "chapter-finalizing";          // Chapter 11 anchor tag name attribute.
  const
  char        Ch111_name[] = "ch-finish-theend";           // Chapter 11.1 anchor tag name attribute.
  const
  char        Ch113_name[] = "ch-finish-reboot";           // Chapter 11.3 anchor tag name attribute.
  const
  char        Part5_name[] = "part5";                      // Part 5 anchor tag name attribute.




// --------------------------------------------------------------------
// check and set flags which indicate where we are in the No_Chunk_Book:
//
void process_chapter()
{
  // ***********************************

  if ((global_id_flag == TRUE) && (a_count > 0)) {

    // reset for next time we find a name attribute.
    global_id_flag = FALSE;

    // set all necessary flags if appropriate.
    if (str_match(att_id_value, Part1_name, sizeof(Part1_name) -1)  == 0) {
      comment_flag = TRUE;                                                  // comment ON from beginning.
      printf("reached Part 1 !\n");
    }
    else if (str_match(att_id_value, Ch1_name, sizeof(Ch1_name) -1)  == 0)
      printf("reached Chapter 1 !\n");
    else if (str_match(att_id_value, Part2_name, sizeof(Part2_name) -1)  == 0)
      printf("reached Part 2 !\n");
    else if (str_match(att_id_value, Ch2_name, sizeof(Ch2_name) -1)  == 0)
      printf("reached Chapter 2 !\n");
    else if (str_match(att_id_value, Ch22_name, sizeof(Ch22_name) -1)  == 0) {  // version-check-sh
      comment_flag = FALSE;                                                  // comment OFF
      fprintf(outFile, "\n\n\nread -p \"Chapter 2.2\"\n");
      printf("reached Chapter 2.2 !\n");
    }
    else if (str_match(att_id_value, Ch23_name, sizeof(Ch23_name) -1)  == 0) {
      comment_flag = TRUE;                                                  // comment ON
      printf("reached Chapter 2.3 !\n");
    }
    else if (str_match(att_id_value, Ch25_name, sizeof(Ch25_name) -1)  == 0) {
      comment_flag = TRUE;                                                  // comment ON
      printf("reached Chapter 2.5 !\n");
    }
    else if (str_match(att_id_value, Ch26_name, sizeof(Ch26_name) -1)  == 0) {  // Setting the $LFS variable.
      comment_flag = FALSE;                                                  // comment OFF
      fprintf(outFile, "\n\n\nread -p \"Chapter 2.6\"\n");
      printf("reached Chapter 2.6 !\n");
    }
    else if (str_match(att_id_value, Ch27_name, sizeof(Ch27_name) -1)  == 0) {
      comment_flag = TRUE;                                                   // comment ON
      printf("reached Chapter 2.7 !\n");
    }
    else if (str_match(att_id_value, Ch3_name, sizeof(Ch3_name) -1)  == 0)
      printf("reached Chapter 3 !\n");
    else if (str_match(att_id_value, Ch31_name, sizeof(Ch31_name) -1)  == 0) {  // sources folder w/ permissions ... wget, md5 sums
      comment_flag = FALSE;                                                  // comment OFF
      fprintf(outFile, "\n\n\nread -p \"Chapter 3.1\"\n");
      printf("reached Chapter 3.1 !\n");
    }
    else if (str_match(att_id_value, Ch4_name, sizeof(Ch4_name) -1)  == 0) {
      comment_flag = TRUE;                                                   // comment ON
      printf("reached Chapter 4 !\n");
    }
    else if (str_match(att_id_value, Ch42_name, sizeof(Ch42_name) -1)  == 0) {  // LFS tools and directory structure.
      comment_flag = FALSE;                                                  // comment OFF
      fprintf(outFile, "\n\n\nread -p \"Chapter 4.2\"\n");
      printf("reached Chapter 4.2 !\n");
    }
    else if (str_match(att_id_value, Ch43_name, sizeof(Ch43_name) -1)  == 0) {  // adding the LFS user.
      comment_flag = FALSE;                                                  // comment OFF
      fprintf(outFile, "\n\n\nread -p \"Chapter 4.3\"\n");
      printf("reached Chapter 4.3 !\n");
    }
    else if (str_match(att_id_value, Ch44_name, sizeof(Ch44_name) -1)  == 0) {  // setting up the LFS environment.
      new_outFile();                                                         // ---------------- 2nd new file !!!
      comment_flag = FALSE;                                                  // comment OFF
      fprintf(outFile, "\n\n\nread -p \"Chapter 4.4\"\n");
      printf("reached Chapter 4.4 !\n");
    }
    else if (str_match(att_id_value, Ch45_name, sizeof(Ch45_name) -1)  == 0) {  // About SBU's.
      new_outFile();                                                         // ---------------- 3rd new file !!!
      comment_flag = TRUE;                                                   // comment ON
      printf("reached Chapter 4.5 !\n");
    }
    else if (str_match(att_id_value, Part3_name, sizeof(Part3_name) -1)  == 0)
      printf("reached Part 3 !\n");
    else if (str_match(att_id_value, Ch5_name, sizeof(Ch5_name) -1)  == 0) {
      comment_flag = FALSE;                                                  // comment OFF
      fprintf(outFile, "read -p \"Chapter 5\"\n");
      printf("reached Chapter 5 !\n");
    }
    else if (str_match(att_id_value, Ch52_name, sizeof(Ch52_name) -1)  == 0)
      preBuild_LFS("Chapter 5.2", "binutils-*", "");
    else if (str_match(att_id_value, Ch53_name, sizeof(Ch53_name) -1)  == 0)
      preBuild_LFS("Chapter 5.3", "gcc-*", "");
    else if (str_match(att_id_value, Ch54_name, sizeof(Ch54_name) -1)  == 0)
      preBuild_LFS("Chapter 5.4", "linux-*", "");
    else if (str_match(att_id_value, Ch55_name, sizeof(Ch55_name) -1)  == 0)
      preBuild_LFS("Chapter 5.5", "glibc-*", ".xz");
    else if (str_match(att_id_value, Ch56_name, sizeof(Ch56_name) -1)  == 0)
      preBuild_LFS("Chapter 5.6", "gcc-*", "");
    else if (str_match(att_id_value, Ch6_name, sizeof(Ch6_name) -1)  == 0)
      printf("reached Chapter 6 !\n");
    else if (str_match(att_id_value, Ch62_name, sizeof(Ch62_name) -1)  == 0)
      preBuild_LFS("Chapter 6.2", "m4-*", "");
    else if (str_match(att_id_value, Ch63_name, sizeof(Ch63_name) -1)  == 0)
      preBuild_LFS("Chapter 6.3", "ncurses-*", "");
    else if (str_match(att_id_value, Ch64_name, sizeof(Ch64_name) -1)  == 0)
      preBuild_LFS("Chapter 6.4", "bash-*", "");
    else if (str_match(att_id_value, Ch65_name, sizeof(Ch65_name) -1)  == 0)
      preBuild_LFS("Chapter 6.5", "coreutils-*", ".xz");
    else if (str_match(att_id_value, Ch66_name, sizeof(Ch66_name) -1)  == 0)
      preBuild_LFS("Chapter 6.6", "diffutils-*", "");
    else if (str_match(att_id_value, Ch67_name, sizeof(Ch67_name) -1)  == 0)
      preBuild_LFS("Chapter 6.7", "file-*", "");
    else if (str_match(att_id_value, Ch68_name, sizeof(Ch68_name) -1)  == 0)
      preBuild_LFS("Chapter 6.8", "findutils-*", "");
    else if (str_match(att_id_value, Ch69_name, sizeof(Ch69_name) -1)  == 0)
      preBuild_LFS("Chapter 6.9", "gawk-*", "");
    else if (str_match(att_id_value, Ch610_name, sizeof(Ch610_name) -1)  == 0)
      preBuild_LFS("Chapter 6.10", "grep-*", "");
    else if (str_match(att_id_value, Ch611_name, sizeof(Ch611_name) -1)  == 0)
      preBuild_LFS("Chapter 6.11", "gzip-*", "");
    else if (str_match(att_id_value, Ch612_name, sizeof(Ch612_name) -1)  == 0)
      preBuild_LFS("Chapter 6.12", "make-*", "");
    else if (str_match(att_id_value, Ch613_name, sizeof(Ch613_name) -1)  == 0)
      preBuild_LFS("Chapter 6.13", "patch-*", "");
    else if (str_match(att_id_value, Ch614_name, sizeof(Ch614_name) -1)  == 0)
      preBuild_LFS("Chapter 6.14", "sed-*", "");
    else if (str_match(att_id_value, Ch615_name, sizeof(Ch615_name) -1)  == 0)
      preBuild_LFS("Chapter 6.15", "tar-*", "");
    else if (str_match(att_id_value, Ch616_name, sizeof(Ch616_name) -1)  == 0)
      preBuild_LFS("Chapter 6.16", ".xz-*", "");
    else if (str_match(att_id_value, Ch617_name, sizeof(Ch617_name) -1)  == 0)
      preBuild_LFS("Chapter 6.17", "binutils-*", "");
    else if (str_match(att_id_value, Ch618_name, sizeof(Ch618_name) -1)  == 0)
      preBuild_LFS("Chapter 6.18", "gcc-*", "");
    else if (str_match(att_id_value, Ch7_name, sizeof(Ch7_name) -1)  == 0) {
      new_outFile();                                                         // ---------------- 4th new file !!!
      printf("reached Chapter 7 !\n");
    }
    else if (str_match(att_id_value, Ch72_name, sizeof(Ch72_name) -1)  == 0) {
      fprintf(outFile, "\n\n\nread -p \"Chapter 7.2\"\n");
      printf("reached Chapter 7.2 !\n");
    }
    else if (str_match(att_id_value, Ch733_name, sizeof(Ch733_name) -1)  == 0) {
      fprintf(outFile, "\n\n\nread -p \"Chapter 7.3.3\"\n");
      printf("reached Chapter 7.3.3 !\n");
    }// ------------------------------------------------------------------------------------ must be this order ??????   FIX THIS !! string match function issue?
    else if (str_match(att_id_value, Ch73_name, sizeof(Ch73_name) -1)  == 0) {
      fprintf(outFile, "\n\n\nread -p \"Chapter 7.3\"\n");
      printf("reached Chapter 7.3 !\n");
    }
    else if (str_match(att_id_value, Ch74_name, sizeof(Ch74_name) -1)  == 0) {
      fprintf(outFile, "\n\n\nread -p \"Chapter 7.4\"\n");
      printf("reached Chapter 7.4 !\n");
    }
    else if (str_match(att_id_value, Ch75_name, sizeof(Ch75_name) -1)  == 0) {
      new_outFile();                                                         // ---------------- 5th new file !!!
      fprintf(outFile, "\n\n\nread -p \"Chapter 7.5\"\n");
      printf("reached Chapter 7.5 !\n");
    }
    else if (str_match(att_id_value, Ch76_name, sizeof(Ch76_name) -1)  == 0) {
      fprintf(outFile, "\n\n\nread -p \"Chapter 7.6\"\n");
      printf("reached Chapter 7.6 !\n");
    }
    else if (str_match(att_id_value, Ch77_name, sizeof(Ch77_name) -1)  == 0) {
      new_outFile();                                                         // ---------------- 6th new file !!!
      preBuild_chroot("Chapter 7.7", "gcc-*", "");
    }
    else if (str_match(att_id_value, Ch78_name, sizeof(Ch78_name) -1)  == 0)
      preBuild_chroot("Chapter 7.8", "gettext-*", "");
    else if (str_match(att_id_value, Ch79_name, sizeof(Ch79_name) -1)  == 0)
      preBuild_chroot("Chapter 7.9", "bison-*", "");
    else if (str_match(att_id_value, Ch710_name, sizeof(Ch710_name) -1)  == 0)
      preBuild_chroot("Chapter 7.10", "perl-*", "");
    else if (str_match(att_id_value, Ch711_name, sizeof(Ch711_name) -1)  == 0)
      preBuild_chroot("Chapter 7.11", "Python-*", "");
    else if (str_match(att_id_value, Ch712_name, sizeof(Ch712_name) -1)  == 0)
      preBuild_chroot("Chapter 7.12", "texinfo-*", "");
    else if (str_match(att_id_value, Ch713_name, sizeof(Ch713_name) -1)  == 0)
      preBuild_chroot("Chapter 7.13", "util-linux-*", "");
    else if (str_match(att_id_value, Ch714_name, sizeof(Ch714_name) -1)  == 0) {
      fprintf(outFile, "\n\n\nread -p \"Chapter 7.14\"\n");
      printf("reached Chapter 7.14 !\n");
    }
    else if (str_match(att_id_value, Part4_name, sizeof(Part4_name) -1)  == 0)
      printf("reached Part 4 !\n");
//
    else if (str_match(att_id_value, Ch8_name, sizeof(Ch8_name) -1)  == 0) {
      comment_flag = TRUE;                                                  // comment ON
      printf("reached Chapter 8 !\n");
    }
    else if (str_match(att_id_value, Ch81_name, sizeof(Ch81_name) -1)  == 0)
      printf("reached Chapter 8.1 !\n");
    else if (str_match(att_id_value, Ch82_name, sizeof(Ch82_name) -1)  == 0)
      printf("reached Chapter 8.2 !\n");
    else if (str_match(att_id_value, Ch83_name, sizeof(Ch83_name) -1)  == 0) {
      comment_flag = FALSE;                                                 // comment OFF
      preBuild_chroot("Chapter 8.3", "man-pages-*", "");
    }
    else if (str_match(att_id_value, Ch84_name, sizeof(Ch84_name) -1)  == 0)
      preBuild_chroot("Chapter 8.4", "iana-etc-*", "");
    else if (str_match(att_id_value, Ch85_name, sizeof(Ch85_name) -1)  == 0)
      preBuild_chroot("Chapter 8.5", "glibc-*", "");
    else if (str_match(att_id_value, Ch86_name, sizeof(Ch86_name) -1)  == 0)
      preBuild_chroot("Chapter 8.6", "zlib-*", "");
    else if (str_match(att_id_value, Ch87_name, sizeof(Ch87_name) -1)  == 0)
      preBuild_chroot("Chapter 8.7", "bzip-*", ".gz");
    else if (str_match(att_id_value, Ch88_name, sizeof(Ch88_name) -1)  == 0)
      preBuild_chroot("Chapter 8.8", ".xz-*", "");
    else if (str_match(att_id_value, Ch89_name, sizeof(Ch89_name) -1)  == 0)
      preBuild_chroot("Chapter 8.9", "zstd-*", "");
    else if (str_match(att_id_value, Ch810_name, sizeof(Ch810_name) -1)  == 0)
      preBuild_chroot("Chapter 8.10", "file-*", "");
    else if (str_match(att_id_value, Ch811_name, sizeof(Ch811_name) -1)  == 0)
      preBuild_chroot("Chapter 8.11", "readline-*", "");
    else if (str_match(att_id_value, Ch812_name, sizeof(Ch812_name) -1)  == 0)
      preBuild_chroot("Chapter 8.12", "m4-*", "");
    else if (str_match(att_id_value, Ch813_name, sizeof(Ch813_name) -1)  == 0)
      preBuild_chroot("Chapter 8.13", "bc-*", "");
    else if (str_match(att_id_value, Ch814_name, sizeof(Ch814_name) -1)  == 0)
      preBuild_chroot("Chapter 8.14", "flex-*", "");
    else if (str_match(att_id_value, Ch815_name, sizeof(Ch815_name) -1)  == 0)
      preBuild_chroot("Chapter 8.15", "tcl8*", "");
    else if (str_match(att_id_value, Ch816_name, sizeof(Ch816_name) -1)  == 0)
      preBuild_chroot("Chapter 8.16", "expect-*", "");
    else if (str_match(att_id_value, Ch817_name, sizeof(Ch817_name) -1)  == 0)
      preBuild_chroot("Chapter 8.17", "dejagnu-*", "");
    else if (str_match(att_id_value, Ch818_name, sizeof(Ch818_name) -1)  == 0)
      preBuild_chroot("Chapter 8.18", "binutils-*", "");
    else if (str_match(att_id_value, Ch819_name, sizeof(Ch819_name) -1)  == 0)
      preBuild_chroot("Chapter 8.19", "gmp-*", "");
    else if (str_match(att_id_value, Ch820_name, sizeof(Ch820_name) -1)  == 0)
      preBuild_chroot("Chapter 8.20", "mpfr-*", "");
    else if (str_match(att_id_value, Ch821_name, sizeof(Ch821_name) -1)  == 0)
      preBuild_chroot("Chapter 8.21", "mpc-*", "");
    else if (str_match(att_id_value, Ch822_name, sizeof(Ch822_name) -1)  == 0)
      preBuild_chroot("Chapter 8.22", "attr-*", "");
    else if (str_match(att_id_value, Ch823_name, sizeof(Ch823_name) -1)  == 0)
      preBuild_chroot("Chapter 8.23", "acl-*", "");
    else if (str_match(att_id_value, Ch824_name, sizeof(Ch824_name) -1)  == 0)
      preBuild_chroot("Chapter 8.24", "libcap-*", "");
    else if (str_match(att_id_value, Ch825_name, sizeof(Ch825_name) -1)  == 0)
      preBuild_chroot("Chapter 8.25", "shadow-*", "");
    else if (str_match(att_id_value, Ch826_name, sizeof(Ch826_name) -1)  == 0)
      preBuild_chroot("Chapter 8.26", "gcc-*", "");
    else if (str_match(att_id_value, Ch827_name, sizeof(Ch827_name) -1)  == 0)
      preBuild_chroot("Chapter 8.27", "pkg-config-*", "");
    else if (str_match(att_id_value, Ch828_name, sizeof(Ch828_name) -1)  == 0)
      preBuild_chroot("Chapter 8.28", "ncurses-*", "");
    else if (str_match(att_id_value, Ch829_name, sizeof(Ch829_name) -1)  == 0)
      preBuild_chroot("Chapter 8.29", "sed-*", "");
    else if (str_match(att_id_value, Ch830_name, sizeof(Ch830_name) -1)  == 0)
      preBuild_chroot("Chapter 8.30", "psmisc-*", "");
    else if (str_match(att_id_value, Ch831_name, sizeof(Ch831_name) -1)  == 0)
      preBuild_chroot("Chapter 8.31", "gettext-*", "");
    else if (str_match(att_id_value, Ch832_name, sizeof(Ch832_name) -1)  == 0)
      preBuild_chroot("Chapter 8.32", "bison-*", "");
    else if (str_match(att_id_value, Ch833_name, sizeof(Ch833_name) -1)  == 0)
      preBuild_chroot("Chapter 8.33", "grep-*", "");
    else if (str_match(att_id_value, Ch834_name, sizeof(Ch834_name) -1)  == 0)
      preBuild_chroot("Chapter 8.34", "bash-*", "");
    else if (str_match(att_id_value, Ch835_name, sizeof(Ch835_name) -1)  == 0) {
      new_outFile();                                                         // ---------------- 7th new file !!!
      preBuild_chroot("Chapter 8.35", "libtool-*", "");
    }
    else if (str_match(att_id_value, Ch836_name, sizeof(Ch836_name) -1)  == 0)
      preBuild_chroot("Chapter 8.36", "gdbm-*", "");
    else if (str_match(att_id_value, Ch837_name, sizeof(Ch837_name) -1)  == 0)
      preBuild_chroot("Chapter 8.37", "gperf-*", "");
    else if (str_match(att_id_value, Ch838_name, sizeof(Ch838_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "wget https://sourceforge.net/projects/expat/files/expat/2.4.1/expat-2.4.1.tar.xz --continue --directory-prefix=$LFS/sources\n");
      preBuild_chroot("Chapter 8.38", "expat-*", "");
    }
    else if (str_match(att_id_value, Ch839_name, sizeof(Ch839_name) -1)  == 0)
      preBuild_chroot("Chapter 8.39", "inetutils-*", "");
    else if (str_match(att_id_value, Ch840_name, sizeof(Ch840_name) -1)  == 0)
      preBuild_chroot("Chapter 8.40", "perl-*", "");
    else if (str_match(att_id_value, Ch841_name, sizeof(Ch841_name) -1)  == 0)
      preBuild_chroot("Chapter 8.41", "XML-P*", "");
    else if (str_match(att_id_value, Ch842_name, sizeof(Ch842_name) -1)  == 0)
      preBuild_chroot("Chapter 8.42", "intltool-*", "");
    else if (str_match(att_id_value, Ch843_name, sizeof(Ch843_name) -1)  == 0)
      preBuild_chroot("Chapter 8.43", "autoconf-*", "");
    else if (str_match(att_id_value, Ch844_name, sizeof(Ch844_name) -1)  == 0)
      preBuild_chroot("Chapter 8.44", "automake-*", "");
    else if (str_match(att_id_value, Ch845_name, sizeof(Ch845_name) -1)  == 0)
      preBuild_chroot("Chapter 8.45", "kmod-*", "");
    else if (str_match(att_id_value, Ch846_name, sizeof(Ch846_name) -1)  == 0)
      preBuild_chroot("Chapter 8.46", "elfutils-*", "");
    else if (str_match(att_id_value, Ch847_name, sizeof(Ch847_name) -1)  == 0)
      preBuild_chroot("Chapter 8.47", "libffi-*", "");
    else if (str_match(att_id_value, Ch848_name, sizeof(Ch848_name) -1)  == 0)
      preBuild_chroot("Chapter 8.48", "openssl-*", "");
    else if (str_match(att_id_value, Ch849_name, sizeof(Ch849_name) -1)  == 0)
      preBuild_chroot("Chapter 8.49", "Python-*", "");
    else if (str_match(att_id_value, Ch850_name, sizeof(Ch850_name) -1)  == 0)
      preBuild_chroot("Chapter 8.50", "ninja-*", "");
    else if (str_match(att_id_value, Ch851_name, sizeof(Ch851_name) -1)  == 0)
      preBuild_chroot("Chapter 8.51", "meson-*", "");
    else if (str_match(att_id_value, Ch852_name, sizeof(Ch852_name) -1)  == 0)
      preBuild_chroot("Chapter 8.52", "coreutils-*", "");
    else if (str_match(att_id_value, Ch853_name, sizeof(Ch853_name) -1)  == 0)
      preBuild_chroot("Chapter 8.53", "check-*", "");
    else if (str_match(att_id_value, Ch854_name, sizeof(Ch854_name) -1)  == 0)
      preBuild_chroot("Chapter 8.54", "diffutils-*", "");
    else if (str_match(att_id_value, Ch855_name, sizeof(Ch855_name) -1)  == 0)
      preBuild_chroot("Chapter 8.55", "gawk-*", "");
    else if (str_match(att_id_value, Ch856_name, sizeof(Ch856_name) -1)  == 0)
      preBuild_chroot("Chapter 8.56", "findutils-*", "");
    else if (str_match(att_id_value, Ch857_name, sizeof(Ch857_name) -1)  == 0)
      preBuild_chroot("Chapter 8.57", "groff-*", "");
    else if (str_match(att_id_value, Ch858_name, sizeof(Ch858_name) -1)  == 0)
      preBuild_chroot("Chapter 8.58", "grub-*", "");
    else if (str_match(att_id_value, Ch859_name, sizeof(Ch859_name) -1)  == 0)
      preBuild_chroot("Chapter 8.59", "less-*", "");
    else if (str_match(att_id_value, Ch860_name, sizeof(Ch860_name) -1)  == 0)
      preBuild_chroot("Chapter 8.60", "gzip-*", "");
    else if (str_match(att_id_value, Ch861_name, sizeof(Ch861_name) -1)  == 0)
      preBuild_chroot("Chapter 8.61", "iproute2-*", "");
    else if (str_match(att_id_value, Ch862_name, sizeof(Ch862_name) -1)  == 0)
      preBuild_chroot("Chapter 8.62", "kbd-*", ".xz");
    else if (str_match(att_id_value, Ch863_name, sizeof(Ch863_name) -1)  == 0)
      preBuild_chroot("Chapter 8.63", "libpipeline-*", "");
    else if (str_match(att_id_value, Ch864_name, sizeof(Ch864_name) -1)  == 0)
      preBuild_chroot("Chapter 8.64", "make-*", "");
    else if (str_match(att_id_value, Ch865_name, sizeof(Ch865_name) -1)  == 0)
      preBuild_chroot("Chapter 8.65", "patch-*", "");
    else if (str_match(att_id_value, Ch866_name, sizeof(Ch866_name) -1)  == 0)
      preBuild_chroot("Chapter 8.66", "man-db-*", "");
    else if (str_match(att_id_value, Ch867_name, sizeof(Ch867_name) -1)  == 0)
      preBuild_chroot("Chapter 8.67", "tar-*", "");
    else if (str_match(att_id_value, Ch868_name, sizeof(Ch868_name) -1)  == 0)
      preBuild_chroot("Chapter 8.68", "texinfo-*", "");
    else if (str_match(att_id_value, Ch869_name, sizeof(Ch869_name) -1)  == 0)
      preBuild_chroot("Chapter 8.69", "vim-*", "");
    else if (str_match(att_id_value, Ch870_name, sizeof(Ch870_name) -1)  == 0)
      preBuild_chroot("Chapter 8.70", "eudev-*", "");
    else if (str_match(att_id_value, Ch871_name, sizeof(Ch871_name) -1)  == 0)
      preBuild_chroot("Chapter 8.71", "procps-*", "");
    else if (str_match(att_id_value, Ch872_name, sizeof(Ch872_name) -1)  == 0)
      preBuild_chroot("Chapter 8.72", "util-linux-*", "");
    else if (str_match(att_id_value, Ch873_name, sizeof(Ch873_name) -1)  == 0)
      preBuild_chroot("Chapter 8.73", "e2fsprogs-*", "");
    else if (str_match(att_id_value, Ch874_name, sizeof(Ch874_name) -1)  == 0)
      preBuild_chroot("Chapter 8.74", "sysklogd-*", "");
    else if (str_match(att_id_value, Ch875_name, sizeof(Ch875_name) -1)  == 0)
      preBuild_chroot("Chapter 8.75", "sysvinit-*", ".xz");
    else if (str_match(att_id_value, Ch876_name, sizeof(Ch876_name) -1)  == 0)
      comment_flag = TRUE;                                                  // comment ON
    else if (str_match(att_id_value, Ch877_name, sizeof(Ch877_name) -1)  == 0)
      printf("reached Chapter 8.77 !\n");
    else if (str_match(att_id_value, Ch878_name, sizeof(Ch878_name) -1)  == 0)
      comment_flag = FALSE;                                                 // comment OFF
//
    else if (str_match(att_id_value, Ch9_name, sizeof(Ch9_name) -1)  == 0) {
      comment_flag = TRUE;                                                  // comment ON
      printf("reached Chapter 9 !\n");
    }
    else if (str_match(att_id_value, Ch92_name, sizeof(Ch92_name) -1)  == 0)
      printf("reached Chapter 9.2 !\n");
    else if (str_match(att_id_value, Ch10_name, sizeof(Ch10_name) -1)  == 0)
      printf("reached Chapter 10 !\n");
    else if (str_match(att_id_value, Ch11_name, sizeof(Ch11_name) -1)  == 0)
      printf("reached Chapter 11 !\n");
    else if (str_match(att_id_value, Ch111_name, sizeof(Ch111_name) -1)  == 0)
      printf("reached Chapter 11.1 !\n");
    else if (str_match(att_id_value, Ch113_name, sizeof(Ch113_name) -1)  == 0)
      printf("reached Chapter 11.3 !\n");
    else if (str_match(att_id_value, Part5_name, sizeof(Part5_name) -1)  == 0) {
      comment_flag = TRUE;                                                  // comment ON
      printf("reached Part 5 !\n");
    }
  }
}
