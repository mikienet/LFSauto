/*
 *
 *    Linux From Scratch bash extractor !
 *
 *    Copyright 2021 Keith Michael Bradley
 *          (all rights reserved)
 *
 */



#define FALSE 0
#define TRUE 1



#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <sys/stat.h>

#include "chapter.h"



// --------------------------------------------------------------------
// file scope globals.
//
FILE    *inFile;

// output file variables.
FILE    *outFile;
char    outFileName[32];
char    outPathFileName[32];
int     fileNum = 0;
char    fileNumStr[8];
char    LFS_ver_str[8];

FILE    *dbgFile;

char    myChar;

char    tagType[16];

char    att_value[64];
int     att_name_flag = FALSE;

int     a_count = 0;
int     blockquote_count = 0;
int     body_count = 0;
int     code_count = 0;
int     colgroup_count = 0;
int     dd_count = 0;
int     div_count = 0;
int     dl_count = 0;
int     dt_count = 0;
int     em_count = 0;
int     H1_count = 0;
int     H2_count = 0;
int     H3_count = 0;
int     H4_count = 0;
int     H5_count = 0;
int     H6_count = 0;
int     head_count = 0;
int     html_count = 0;
int     kbd_count = 0;
int     li_count = 0;
int     ol_count = 0;
int     pre_count = 0;
int     p_count = 0;
int     span_count = 0;
int     strong_count = 0;
int     style_count = 0;
int     table_count = 0;
int     tbody_count = 0;
int     th_count = 0;
int     thead_count = 0;
int     td_count = 0;
int     title_count = 0;
int     tr_count = 0;
int     ul_count = 0;

int     a_close_flag = FALSE;
int     code_flag = FALSE;
int     dt_flag = FALSE;
int     em_close_flag = FALSE;
int     hr_flag = FALSE;
int     Hx_flag = FALSE;
int     p_flag = FALSE;
int     span_flag = FALSE;
int     span_close_flag = FALSE;
int     strong_close_flag = FALSE;
int     pre_flag = FALSE;
int     pre_close_flag = FALSE;
int     table_flag = FALSE;

int     comment_flag = TRUE;

int     spaceCount = 0;
int     p_width = 0;
int     self_closing = FALSE;

int     EOF_flag = FALSE;

int     mid_Chap43_flag = FALSE;                // a hack to find text bewteen ancor tag chapter names.
int     mid_Chap43_newFile_flag = FALSE;



// --------------------------------------------------------------------
// gets one character from the inFile stream into myChar.
// .. trims white space (' ' and '\n') if paramter set TRUE.
int getOnechar(int trim_white_space)
{

  while (EOF_flag == FALSE) {

    // get next char but check for end of file.
    if ((myChar = fgetc(inFile)) != EOF) {
      if (trim_white_space == TRUE)
        // remove newline and ..
        if ((myChar == '\n') || (myChar == ' '))
          continue;
      return EXIT_SUCCESS;

    }
    else {
      EOF_flag = TRUE;
      return EXIT_FAILURE;
    }
  }
  return EXIT_FAILURE;
}



// --------------------------------------------------------------------
// gets us to the next tag.
//
void search_start_of_tag()
{
  while (EOF_flag == FALSE) {

    getOnechar(FALSE);

    // find the close of the current tag.
    if (myChar != '<')
      continue;
    else
      break;
  }
}



// --------------------------------------------------------------------
// gets us out of the current tag.
//
void search_end_of_tag()
{
  while (EOF_flag == FALSE) {

    getOnechar(FALSE);

    // find the close of the current tag.
    if (myChar != '>')
      continue;
    else
      break;
  }
}



// --------------------------------------------------------------------
// matches a string.
//
int str_match(const char *str1, const char *str2, int count)
{
  for (int i = 0; i < count; i++) {
    if (str1[i] != str2[i])
      return -1;
  }
  return 0;
}



// --------------------------------------------------------------------
// sets flags based on the current just open tag
//
void tag_open_flags()
{

  switch (tagType[0]) {

  case 'a':
  case 'A':
    if (str_match(tagType, "a", 1) == 0)
      a_count++;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ 'a' tag not known !\n");
    break;

  case 'b':
  case 'B':
    if (str_match(tagType, "blockquote", 10) == 0)
      blockquote_count++;
    else if (str_match(tagType, "body", 4) == 0)
      body_count++;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ 'b' tag not known !\n");
    break;

  case 'c':
  case 'C':
    if (str_match(tagType, "code", 4) == 0) {
      code_count++;
      code_flag = TRUE;
    }
    else if (str_match(tagType, "colgroup", 8) == 0)
      colgroup_count++;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ 'c' tag not known !\n");
    break;

  case 'd':
  case 'D':
    if (str_match(tagType, "dd", 2) == 0)
      dd_count++;
    else if (str_match(tagType, "div", 3) == 0)
      div_count++;
    else if (str_match(tagType, "dl", 2) == 0)
      dl_count++;
    else if (str_match(tagType, "dt", 2) == 0) {
      dt_count++;
      dt_flag = TRUE;
    }
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ 'd' tag not known !\n");
    break;

  case 'e':
  case 'E':
    if (str_match(tagType, "em", 2) == 0)
      em_count++;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ 'e' tag not known !\n");
    break;

  case 'h':
  case 'H':
    if (str_match(tagType, "h1", 2) == 0) {
      H1_count++;
      Hx_flag = TRUE;
      spaceCount = 5;
    }
    else if (str_match(tagType, "h2", 2) == 0) {
      H2_count++;
      Hx_flag = TRUE;
      spaceCount = 7;
    }
    else if (str_match(tagType, "h3", 2) == 0) {
      H3_count++;
      Hx_flag = TRUE;
      spaceCount = 9;
    }
    else if (str_match(tagType, "h4", 2) == 0) {
      H4_count++;
      Hx_flag = TRUE;
      spaceCount = 11;
    }
    else if (str_match(tagType, "h5", 2) == 0) {
      H5_count++;
      Hx_flag = TRUE;
      spaceCount = 13;
    }
    else if (str_match(tagType, "h6", 2) == 0) {
      H6_count++;
      Hx_flag = TRUE;
      spaceCount = 15;
    }
    else if (str_match(tagType, "head", 4) == 0)
      head_count++;
    else if (str_match(tagType, "html", 4) == 0)
      html_count++;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ 'h' tag not known !\n");
    break;

  case 'k':
  case 'K':
    if (str_match(tagType, "kbd", 3) == 0)
      kbd_count++;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ 'k' tag not known !\n");
    break;

  case 'l':
  case 'L':
    if (str_match(tagType, "li", 2) == 0)
      li_count++;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ 'l' tag not known !\n");
    break;

  case 'o':
  case 'O':
    if (str_match(tagType, "ol", 2) == 0)
        ol_count++;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ 'o' tag not known !\n");
    break;

  case 'p':
  case 'P':
    if (str_match(tagType, "pre", 3) == 0) {
      pre_count++;
      pre_flag = TRUE;
    }
    else if (str_match(tagType, "p", 1) == 0) {
      p_count++;
      p_flag = TRUE;
    }
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ 'p' tag not known !\n");
    break;

  case 's':
  case 'S':
    if (str_match(tagType, "span", 4) == 0) {
      span_count++;
      span_flag = TRUE;
    }
    else if (str_match(tagType, "strong", 6) == 0)
      strong_count++;
    else if (str_match(tagType, "style", 5) == 0)
      style_count++;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ 's' tag not known !\n");
    break;

  case 't':
  case 'T':
    if (str_match(tagType, "table", 5) == 0) {
      table_count++;
      table_flag = TRUE;
    }
    else if (str_match(tagType, "tbody", 5) == 0)
      tbody_count++;
    else if (str_match(tagType, "th", 2) == 0)
      th_count++;
    else if (str_match(tagType, "thead", 5) == 0)
      thead_count++;
    else if (str_match(tagType, "td", 2) == 0)
      td_count++;
    else if (str_match(tagType, "title", 5) == 0)
      title_count++;
    else if (str_match(tagType, "tr", 2) == 0)
      tr_count++;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ 't' tag not known !\n");
    break;

  case 'u':
  case 'U':
    if (str_match(tagType, "ul", 2) == 0)
      ul_count++;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ 'u' tag not known !\n");
    break;

  case '!':
    // need this to avoid "tag not know".
    break;

  default:
    if (dbgFile != NULL)
      fprintf(dbgFile, "<------ tag_open_flags(), 'default' tag not known !\n");
    break;

  }
}



// --------------------------------------------------------------------
// sets flags based on the current just closed tag
//
void tag_close_flags()
{
  switch (tagType[1]) {

  case 'a':
  case 'A':
    if (str_match(tagType, "/a", 2)  == 0) {
      a_count--;
      a_close_flag = TRUE;
    }
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ tag not known !\n");
    break;

  case 'b':
  case 'B':
    if (str_match(tagType, "/blockquote", 11) == 0)
      blockquote_count--;
    else if (str_match(tagType, "/body", 5) == 0)
      body_count--;
    else
      if (dbgFile != NULL)
      fprintf(dbgFile, "<------ tag not known !\n");
    break;

  case 'c':
  case 'C':
    if (str_match(tagType, "/code", 5) == 0)
      code_count--;
    else if (str_match(tagType, "/colgroup", 9) == 0)
      colgroup_count--;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ tag not known !\n");
    break;

  case 'd':
  case 'D':
    if (str_match(tagType, "/dd", 3) == 0)
      dd_count--;
    else if (str_match(tagType, "/div", 4) == 0)
      div_count--;
    else if (str_match(tagType, "/dl", 3) == 0)
      dl_count--;
    else if (str_match(tagType, "/dt", 3) == 0)
      dt_count--;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ tag not known !\n");
    break;

  case 'e':
  case 'E':
    if (str_match(tagType, "/em", 3) == 0) {
      em_count--;
      em_close_flag = TRUE;
    }
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ tag not known !\n");
    break;

  case 'h':
  case 'H':
    if (str_match(tagType, "/h1", 3) == 0)
      H1_count--;
    else if (str_match(tagType, "/h2", 3) == 0)
      H2_count--;
    else if (str_match(tagType, "/h3", 3) == 0)
      H3_count--;
    else if (str_match(tagType, "/h4", 3) == 0)
      H4_count--;
    else if (str_match(tagType, "/h5", 3) == 0)
      H5_count--;
    else if (str_match(tagType, "/h6", 3) == 0)
      H6_count--;
    else if (str_match(tagType, "/html", 5) == 0)
      html_count--;
    else if (str_match(tagType, "/head", 5) == 0)
      head_count--;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ tag not known !\n");
    break;

  case 'k':
  case 'K':
    if (str_match(tagType, "/kbd", 4) == 0)
      kbd_count--;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ tag not known !\n");
    break;

  case 'l':
  case 'L':
    if (str_match(tagType, "/li", 3) == 0)
      li_count--;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ tag not known !\n");
    break;

  case 'o':
  case 'O':
    if (str_match(tagType, "/ol", 3) == 0)
      ol_count--;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ tag not known !\n");
    break;

  case 'p':
  case 'P':
    if (str_match(tagType, "/pre", 4) == 0) {
      pre_count--;
      pre_close_flag = TRUE;
    }
    else if (str_match(tagType, "/p", 2) == 0)
      p_count--;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ tag not known !\n");
    break;

  case 's':
  case 'S':
    if (str_match(tagType, "/span", 5) == 0) {
      span_count--;
      if (span_close_flag == FALSE)
        span_close_flag = TRUE;
    }
    else if (str_match(tagType, "/strong", 7) == 0) {
      strong_count--;
      strong_close_flag = TRUE;
    }
    else if (str_match(tagType, "/style", 6) == 0)
      style_count--;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ tag not known !\n");
    break;

  case 't':
  case 'T':
    if (str_match(tagType, "/table", 6) == 0)
      table_count--;
    else if (str_match(tagType, "/tbody", 6) == 0)
      tbody_count--;
    else if (str_match(tagType, "/th", 3) == 0)
      th_count--;
    else if (str_match(tagType, "/thead", 6) == 0)
      thead_count--;
    else if (str_match(tagType, "/td", 3) == 0)
      td_count--;
    else if (str_match(tagType, "/title", 6) == 0)
      title_count--;
    else if (str_match(tagType, "/tr", 3) == 0)
      tr_count--;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ tag not known !\n");
    break;

  case 'u':
  case 'U':
    if (str_match(tagType, "/ul", 3) == 0)
      ul_count--;
    else
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ tag not known !\n");
    break;


  default:
    if (dbgFile != NULL)
      fprintf(dbgFile, "<------ tag_close_flags(), 'default' tag not known !\n");
    break;

  }
}



// --------------------------------------------------------------------
// sets flags based on the current void (self closing) tag.
//
int tag_void_flags()
{
  if (str_match(tagType, "area", 4) == 0)
    return 1;
  else if (str_match(tagType, "base", 4) == 0)
    return 2;
  else if (str_match(tagType, "br", 2) == 0)
    return 3;
  else if (str_match(tagType, "col", 3) == 0)
    return 4;
  else if (str_match(tagType, "command", 7) == 0)
    return 5;
  else if (str_match(tagType, "embed", 5) == 0)
    return 6;
  else if (str_match(tagType, "hr", 2) == 0) {
    hr_flag = TRUE;
    return 7;
  }
  else if (str_match(tagType, "img", 3) == 0)
    return 8;
  else if (str_match(tagType, "input", 5) == 0)
    return 9;
  else if (str_match(tagType, "keygen", 6) == 0)
    return 10;
  else if (str_match(tagType, "link", 4) == 0)
    return 11;
  else if (str_match(tagType, "meta", 4) == 0)
    return 12;
  else if (str_match(tagType, "param", 5) == 0)
    return 13;
  else if (str_match(tagType, "source", 6) == 0)
    return 14;
  else if (str_match(tagType, "track", 5) == 0)
    return 15;
  else if (str_match(tagType, "wbr", 3) == 0)
    return 16;
  else
    if (dbgFile != NULL)
      fprintf(dbgFile, "<------ tag_void_flags(), 'default' tag not known !\n");
  return 0;
}



// --------------------------------------------------------------------
// collects string after 'name="' up to the closing '"' ..
// ... and stores in att_value[].
//
void save_name_attrib_value()
{
  int   i = 0;

  // store the name attribute value.
  while (EOF_flag == FALSE) {

    if (getOnechar(FALSE) == EXIT_FAILURE)
      return;
    else {
      if (myChar != '"')
        att_value[i] = myChar;
      else
        break;
    }
    i++;
  }
}



// --------------------------------------------------------------------
// search in the current tag for a 'name' attribute.
// ... if found ... call save_name_attrib_value() ...
// ... to store it's value ...
// .. if HTML close tag '>' encounterted ..
// ... backup one and return.
//
void get_attr_value()
{
  const
  char        name[] = "name=\"";
  u_int16_t   namePntr = 0;


  while (EOF_flag == FALSE) {

    if (getOnechar(TRUE) == EXIT_FAILURE)
      return;

    // greater than means end of tag,
    if (myChar == '>') {
      // stay inside tag.
      fseek(inFile, -1, SEEK_CUR);
      return;
    }

    // test for attribute named 'name' ..
    // .. and store it's value.
    if (att_name_flag == FALSE) {
      if (myChar == name[namePntr]) {
        if (namePntr == (sizeof(name) - 2)) {
          att_name_flag = TRUE;
          save_name_attrib_value();
        }
        else
          namePntr++;
      }
      else
        namePntr = 0;
    }
  }//  while()
  return;
}



// --------------------------------------------------------------------
// clears tagType[] with spaces.
//
void clear_tag_type()
{
  // clear tagType[].
  for (int j = 0; j < sizeof(tagType); j++) {
    tagType[j] = ' ';
  }
}



// --------------------------------------------------------------------
// clears att_value[] with spaces.
void clear_attr_value()
{
  // clear attr_value[].
  for (int j = 0; j < sizeof(att_value); j++) {
    att_value[j] = ' ';
  }
}



// --------------------------------------------------------------------
// search for and store tag name immediately after '<' (ie: p) ..
// .. in tagType[] .. return tagType{} length.
// .. if HTML close tag '>' found .. move inFile stream pointer back.
//
int get_tag_type()
{
  int   i = 0;

  while (EOF_flag == FALSE) {

    if (getOnechar(FALSE) == EXIT_FAILURE)
      return 0;

    if (i == 0) {
      // <! is HTML comment tag so ..
      if (myChar == '!') {
        tagType[0] = myChar;
        return 1;
      }
      else if (myChar == '/')
        self_closing = TRUE;
    }
    // i = 1 thru sizeof(tagType).
    else {

      // space ? (means HTML tag name).
      if (myChar == ' ')
        return i;

      // end of tag?
      if (myChar == '>') {
        // stay inside tag.
        fseek(inFile, -1, SEEK_CUR);
        return i;
      }
    }

    // stuff it !
    tagType[i] = myChar;

    // check 'i'.
    i++;
    if (i == sizeof(tagType)) {
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ tag name too large !\n");
      return 0;
    }
  }
  // we should never be here ever.
  return 0;
}



// --------------------------------------------------------------------
// stores the HTML tag type in tagType[].
// .. assumes inFile stream pointer points to the HTML tag open '<'.
// .. on return .. inFile stream pointer points to HTML tag close '>' ..
// .. returns tag type length and stores the 'name=' attribute value ..
// .. (if found) in 'att_value[32]'.
int process_HTML_tag()
{
  int   i = 0;

  // ***********************************
  // clear tagType[].
  clear_tag_type();

  // ***********************************
  // clear attr_value[].
  clear_attr_value();

  // ***********************************
  // store the tag type in tagType[] ..
  i = get_tag_type(FALSE);

  // ***********************************
  //  store the anchor tag 'name' attribute.
  get_attr_value();

  // ***********************************
  // must find end of tag for next loop iteration.
  search_end_of_tag();

  // ***********************************
  // run either tag_open_flags(),
  // ..         tag_close_flags(),
  // ..      or tag_void_flags().
  if (self_closing == TRUE)
    tag_close_flags();
  else {
    fseek(inFile, -2, SEEK_CUR);
    if (fgetc(inFile) == '/')
      tag_void_flags();
    else
      tag_open_flags();
    fseek(inFile, 1, SEEK_CUR);
  }

  // ***********************************
  // reset for next time.
  self_closing = FALSE;

  return i;
}



// --------------------------------------------------------------------
// converts entity reference (illegal characters) to the correct ..
// .. single character.
//
void do_ampersand()
{
  // get the string before ';'.

  for (int i = 0; i < 6; i++) {

    if (getOnechar(FALSE) == EXIT_FAILURE)
      return;

    if ((myChar == ';') || (myChar == '<'))
      break;

    tagType[i] = myChar;
  }

  // which entity reference?
  if (str_match(tagType, "amp", 3) == 0)
    myChar = '&';
  else if (str_match(tagType, "gt", 2) == 0)
    myChar = '>';
  else if (str_match(tagType, "lt", 2) == 0)
    myChar = '<';
  // single quotes.
  else if (str_match(tagType, "lsquo", 5) == 0)
    myChar = '\'';
  else if (str_match(tagType, "rsquo", 5) == 0)
    myChar = '\'';
  // double quotes.
  else if (str_match(tagType, "ldquo", 5) == 0)
    myChar = '"';
  else if (str_match(tagType, "rdquo", 5) == 0)
    myChar = '"';
  // dash.
  else if (str_match(tagType, "ndash", 5) == 0)
    myChar = '-';
  // replace non break space with a space.
  else if (str_match(tagType, "nbsp", 4) == 0)
    myChar = ' ';
  // replace copyright special char with 'C'.
  else if (str_match(tagType, "copy", 4) == 0)
    myChar = 'C';
}



// --------------------------------------------------------------------
// writes a newline ' \n' and comment with one space '# ' ..
// .. to the current outFile .. adds spaces as commanded.
void new_commented_line()
{
  fputs("\n# ", outFile);

  for(; spaceCount > 0; spaceCount--) {
    fputc(' ', outFile);
  }
}



// --------------------------------------------------------------------
// assumes inFile stream pointer points to HTML tag close '>'.
//
// return TRUE means non-whiteSpace character found.
// return FALSE means HTML tag open '<' found.
//
int trim_leading_white_space()
{
  if (pre_count == 0) {

    while (EOF_flag == FALSE) {

      // ***********************************
      // get next character from inFile.
      getOnechar(FALSE);

      // ***********************************
      // if new open tag ... bail.
      if (myChar == '<')
        return FALSE;

      // ***********************************
      // convert all TABs to a single space.
      if (myChar == '\t')
        myChar = ' ';

      // ***********************************
      // find first non white space char ..
      if ((myChar == ' ') || (myChar == '\n') || (myChar == '\r'))
        continue;
      else {
        // move back one so next getOnechar()
        // .. will get the 1st character non-whiteSPace.
        fseek(inFile, -1, SEEK_CUR);
        break;
      }
    }
  }
  return TRUE;
}



// --------------------------------------------------------------------
// do we have a new line of text ..
// ..that should be commented?
void check_start_comment()
{
  // RULE # 7 *************************
  // create a horizontal ruler
  if (hr_flag == TRUE) {
    hr_flag = FALSE;
    spaceCount = 0;
    new_commented_line();
    for (int i = 0; i < 80; i++)
      fputc('-', outFile);
  }

  // RULE # 8 *************************
  // HTML 'paragraph' tag:
  // .. comment 1st line twice only.
  if (p_flag == TRUE) {
    p_flag = FALSE;
    p_width = 0;
    spaceCount = 0;
    new_commented_line();
    spaceCount = 25;
    new_commented_line();
  }

  // RULE # 9 *************************
  // HTML 'header' tag:
  // .. comment.
  if (Hx_flag == TRUE) {
    Hx_flag = FALSE;
    // spaceCount set in tag_flags().
    new_commented_line();
  }

  // RULE # 10 ************************
  // HTML 'anchor' tag:
  // .. if not nested .. comment.
  if (((H1_count + H2_count + H3_count + H4_count + H5_count + H6_count + p_count) == 0) &&
      (a_count > 0)) {
    spaceCount = 15;
    new_commented_line();
  }

  // RULE # 11 ************************
  // HTML 'dt' tag:
  // .. insert 2 commented lines.
  if (dt_flag == TRUE) {
    dt_flag = FALSE;
    new_commented_line();
    spaceCount = 15;
    new_commented_line();
  }

  // RULE # 12 ************************
  // HTML 'pre' tag:
  // .. 3 newlines.
  if (pre_flag == TRUE) {
    pre_flag = FALSE;
    fputc('\n', outFile);
    fputc('\n', outFile);
    fputc('\n', outFile);
  }

  // RULE # 13 ************************
  // HTML 'table' tag:
  // .. comment 1st line twice only.
  if (table_flag == TRUE) {
    table_flag = FALSE;
    spaceCount = 0;
    new_commented_line();
    spaceCount = 15;
    new_commented_line();
  }

  // RULE # 14 *************************
  // HTML 'strong' tag when not nested ..
  // .. gets a new commented line.
  if ((strong_count > 0) && (p_count + H1_count + H2_count + H3_count + H4_count + H5_count + H6_count == 0)) {
    spaceCount = 10;
    new_commented_line();
  }
}



// --------------------------------------------------------------------
// run rules that should modify text right after an HTML tag closes.
//
void check_closed_tags()
{
  // RULE # 15 ************************
  // add a ' ' to end of span tag ..
  // .. nested in a p or hx tag.
  if ((span_close_flag == TRUE) && (p_count + H1_count + H2_count + H3_count + H4_count + H5_count + H6_count > 0)) {
    span_close_flag = FALSE;
    fputc(' ', outFile);
  }

  // RULE # 16 ************************
  // add 2 '\n' to end of pre tag ..
  if (pre_close_flag == TRUE) {
    pre_close_flag = FALSE;
    fputc('\n', outFile);
    fputc('\n', outFile);
  }

  // RULE # 17 ************************
  // add a ' ' to end of em tag ..
  // .. if not nested in pre tag.
  if ((em_close_flag == TRUE) && (pre_count == 0)) {
    em_close_flag = FALSE;
    fputc(' ', outFile);
  }

  // RULE # 18 ************************
  // add a ' ' to end of strong tag ..
  if (strong_close_flag == TRUE) {
    strong_close_flag = FALSE;
    fputc(' ', outFile);
  }

  // RULE # 19 ************************
  // add a ' ' to end of an anchor tag ..
  if (a_close_flag == TRUE) {
    a_close_flag = FALSE;
    fputc(' ', outFile);
  }
}



// --------------------------------------------------------------------
// we put this stuff at the top of all generate scripts.
void script_all_items()
{
  // 1st line gets #!/bin/bash
  fprintf(outFile, "#!/bin/bash\n\n\n");
  // my fav pause function.
  fprintf(outFile, "\n# my fav pause function:\nfunction pause() {\nread -p \"Press any key to continue ...\"\n}\n\n\n\n\n\n\n\n\n");
  // add the LFS export
  fprintf(outFile, "\n#----------------------------------------------\n# 2.6 Setting The $LFS Variable\nexport LFS=/mnt/lfs\n");
  fprintf(outFile, "\n#----------------------------------------------\n# add '-j' to use all cores.\nexport MAKEFLAGS='-j'\n");
}



// --------------------------------------------------------------------
// insert commands needed only for the 1st script file:
void script_first_items()
{
  fprintf(outFile, "\n#----------------------------------------------\n");
  fprintf(outFile, "read -p \"at end .. run = cp /home/__your_user_name__/LFS* ~\"\n");
  fprintf(outFile, "read -p \"......... run = ./LFS-10.1_step-2.sh\"\n");
  fprintf(outFile, "\n#----------------------------------------------\n");
  fprintf(outFile, "mkdir -v $LFS/sources\n");
  fprintf(outFile, "chmod -v a+wt $LFS/sources\n\n\n\n\n\n\n\n\n");
}



// --------------------------------------------------------------------
// insert commands needed only for the 2nd script file:
void  script_second_items()
{
  fprintf(outFile, "\n#----------------------------------------------\n");
  fprintf(outFile, "read -p \"at end .. run = ./LFS-10.1_step-3.sh\"\n\n\n\n\n\n\n\n\n");
}



// --------------------------------------------------------------------
// insert commands needed only for the 3rd script file:
void  script_third_items()
{
  fprintf(outFile, "\n#----------------------------------------------\n");
  fprintf(outFile, "read -p \"at end ... run = sudo ./LFS-10.1_step-4.sh\"\n");
  fprintf(outFile, "\n#----------------------------------------------\n# not in LFS book ... need to untar.\n");
  fprintf(outFile, "cd $LFS/sources\n");
  fprintf(outFile, "wget http://www.linuxfromscratch.org/lfs/downloads/stable/wget-list --continue\n");
  fprintf(outFile, "wget --input-file=wget-list --continue \n");
  fprintf(outFile, "wget http://www.linuxfromscratch.org/lfs/downloads/stable/md5sums --continue\n");
  fprintf(outFile, "wget https://sourceforge.net/projects/expat/files/expat/2.4.1/expat-2.4.1.tar.xz --continue\n");
  fprintf(outFile, "for file in *.tar.*; do tar xvf \"$file\"; done\n");
}



// --------------------------------------------------------------------
// insert commands needed only for the 4th script file:
void  script_fourth_items()
{
  fprintf(outFile, "\n#----------------------------------------------\n");
  fprintf(outFile, "read -p \"at end .. in a 2nd non chroot terminal ... run = sudo cp /home/__your_user_name__/LFS* /mnt/lfs\"\n");
  fprintf(outFile, "read -p \"at end ... run = ./LFS-10.1_step-5.sh\"\n");
}



// --------------------------------------------------------------------
// insert commands needed only for the 5th script file:
void  script_fifth_items()
{
  fprintf(outFile, "\n#----------------------------------------------\n");
  fprintf(outFile, "read -p \"at end ... run = ./LFS-10.1_step-6.sh\"\n");
}



// --------------------------------------------------------------------
// insert commands needed only for the 6th script file:
void  script_sixth_items()
{
  fprintf(outFile, "\n#----------------------------------------------\n# 7.6 commands not run due to bash re-exec.\n");
  fprintf(outFile, "touch /var/log/{btmp,lastlog,faillog,wtmp}\n");
  fprintf(outFile, "chgrp -v utmp /var/log/lastlog\n");
  fprintf(outFile, "chmod -v 664 /var/log/lastlog\n");
  fprintf(outFile, "chmod -v 600 /var/log/btmp\n");
}



// --------------------------------------------------------------------
// insert commands needed only for the 7th script file:
void  script_seventh_items()
{
  fprintf(outFile, "\n#----------------------------------------------\n");
}



// --------------------------------------------------------------------
// close the current outFile (if open) ..
// .. and create a new outFile with the next sequential step number.
void new_outFile()
{

  // ***********************************
  // close the current outFile.
  if (outFile != NULL) {
    // flush any last line that needs flushing.
    fputc('\n', outFile);
    fflush(outFile);
    usleep(10000);
    fclose(outFile);
  }

  // ***********************************
  // CREATE the new Output File Name.
  // ***********************************

  // clear outFileName.
  for (int k = 0; k < sizeof(outFileName); k++)
    outFileName[k] = '\0';

  // clear outPathFileName.
  for (int k = 0; k < sizeof(outPathFileName); k++)
    outPathFileName[k] = '\0';

  // add 1st part of file name.
  strcat(outFileName, "LFS-");

  // concat the LFS version number ..
  // .. (argument # 2) to the end of ..
  // .. our partial output file name.
  strcat(outFileName, LFS_ver_str);

  // concat an underscore and 'step-' ..
  // .. to the end of our partial output file name.
  strcat(outFileName, "_step-");

  // each time we create a unique new ..
  // .. output file name.
  fileNum++;

  // convert the current fileNum integer ..
  // .. to a string to concat to the ..
  // .. each output file name.
  sprintf(fileNumStr, "%d", fileNum);
  strcat(outFileName, fileNumStr);

  // add the ".sh" to make it a script.
  strcat(outFileName, ".sh");

  // ***********************************
  // open a new one.
  if ((outFile = fopen(outFileName, "w")) == NULL) {
    printf("main(), fopen(), output file.\n%s\n", strerror(errno));
    exit(1);
  }

  // ***********************************
  // get full path and file name.
  strcat(outPathFileName, "./");
  strcat(outPathFileName, outFileName);

  // ***********************************
  // set execute permssions ..
  // .. (needed for all bash scripts).
  if (chmod(outPathFileName, S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH) != 0) {
    printf("main(), new_outFile()\n%s\n", strerror(errno));
  }

  // ***********************************
  // insert needed commands at the ..
  // .. top of each script.
  script_all_items();

  if (fileNum == 1)
    script_first_items();
  else if (fileNum == 2)
    script_second_items();
  else if (fileNum == 3)
    script_third_items();
  else if (fileNum == 4)
    script_fourth_items();
  else if (fileNum == 5)
    script_fifth_items();
  else if (fileNum == 6)
    script_sixth_items();
  else if (fileNum == 7)
    script_seventh_items();
}



// --------------------------------------------------------------------
// check and set flags which indicate where we are in the No_Chunk_Book:
//
void chapter()
{
  // ***********************************

  if ((att_name_flag == TRUE) && (a_count > 0)) {

    // reset for next time we find a name attribute.
    att_name_flag = FALSE;

    // set all necessary flags if appropriate.
    if (str_match(att_value, Part1_name, sizeof(Part1_name) -1)  == 0) {
      comment_flag = TRUE;                                                  // comment ON from begining.
      printf("reached Part 1 !\n");
    }
    else if (str_match(att_value, Ch1_name, sizeof(Ch1_name) -1)  == 0)
      printf("reached Chapter 1 !\n");
    else if (str_match(att_value, Part2_name, sizeof(Part2_name) -1)  == 0)
      printf("reached Part 2 !\n");
    else if (str_match(att_value, Ch2_name, sizeof(Ch2_name) -1)  == 0)
      printf("reached Chapter 2 !\n");
    else if (str_match(att_value, Ch22_name, sizeof(Ch22_name) -1)  == 0) {  // version-check-sh
      comment_flag = FALSE;                                                  // comment OFF
      printf("reached Chapter 2.2 !\n");
    }
    else if (str_match(att_value, Ch23_name, sizeof(Ch23_name) -1)  == 0) {
      comment_flag = TRUE;                                                  // comment ON
      printf("reached Chapter 2.3 !\n");
    }
    else if (str_match(att_value, Ch25_name, sizeof(Ch25_name) -1)  == 0) {
      comment_flag = TRUE;                                                  // comment ON
      printf("reached Chapter 2.5 !\n");
    }
    else if (str_match(att_value, Ch26_name, sizeof(Ch26_name) -1)  == 0) {  // Setting the $LFS variable.
      comment_flag = TRUE;                                                   // comment ON
      printf("reached Chapter 2.6 !\n");
    }
    else if (str_match(att_value, Ch27_name, sizeof(Ch27_name) -1)  == 0) {
      comment_flag = TRUE;                                                   // comment ON
      printf("reached Chapter 2.7 !\n");
    }
    else if (str_match(att_value, Ch3_name, sizeof(Ch3_name) -1)  == 0)
      printf("reached Chapter 3 !\n");
    else if (str_match(att_value, Ch31_name, sizeof(Ch31_name) -1)  == 0) {  // sources folder w/ permisions ... wget, md5 sums
      comment_flag = TRUE;                                                   // comment ON
      printf("reached Chapter 3.1 !\n");
    }
    else if (str_match(att_value, Ch4_name, sizeof(Ch4_name) -1)  == 0) {
      comment_flag = TRUE;                                                   // comment ON
      printf("reached Chapter 4 !\n");
    }
    else if (str_match(att_value, Ch42_name, sizeof(Ch42_name) -1)  == 0) {  // LFS tools and directory structure.
      comment_flag = FALSE;                                                  // comment OFF
      printf("reached Chapter 4.2 !\n");
    }
    else if (str_match(att_value, Ch43_name, sizeof(Ch43_name) -1)  == 0) {  // adding the LFS user.
      comment_flag = FALSE;                                                  // comment OFF
      printf("reached Chapter 4.3 !\n");
    }
    else if (str_match(att_value, Ch44_name, sizeof(Ch44_name) -1)  == 0) {  // setting up the LFS environment.
      new_outFile();                                                         // ---------------- new file !!!
      comment_flag = FALSE;                                                  // comment OFF
      printf("reached Chapter 4.4 !\n");
    }
    else if (str_match(att_value, Ch45_name, sizeof(Ch45_name) -1)  == 0) {  // About SBU's.
      new_outFile();                                                         // ---------------- new file !!!
      comment_flag = TRUE;                                                   // comment ON
      printf("reached Chapter 4.5 !\n");
    }
    else if (str_match(att_value, Part3_name, sizeof(Part3_name) -1)  == 0)
      printf("reached Part 3 !\n");
    else if (str_match(att_value, Ch5_name, sizeof(Ch5_name) -1)  == 0) {
      comment_flag = FALSE;                                                  // comment OFF
      printf("reached Chapter 5 !\n");
    }
    else if (str_match(att_value, Ch52_name, sizeof(Ch52_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'binutils-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 5.2\"\n");
      printf("reached Chapter 5.2 !\n");
    }
    else if (str_match(att_value, Ch53_name, sizeof(Ch53_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd ..\n");
      fprintf(outFile, "rm -rf ./build\n");
      fprintf(outFile, "cd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'gcc-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 5.3\"\n");
      printf("reached Chapter 5.3 !\n");
    }
    else if (str_match(att_value, Ch54_name, sizeof(Ch54_name) -1)  == 0) {
      fprintf(outFile, "\n\n\nrm -rf ./build\n");
      fprintf(outFile, "cd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'linux-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 5.4\"\n");
      printf("reached Chapter 5.4 !\n");
    }
    else if (str_match(att_value, Ch55_name, sizeof(Ch55_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'glibc-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 5.5\"\n");
      printf("reached Chapter 5.5 !\n");
    }
    else if (str_match(att_value, Ch56_name, sizeof(Ch56_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd ..\n");
      fprintf(outFile, "rm -rf ./build\n");
      fprintf(outFile, "cd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'gcc-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 5.6\"\n");
      printf("reached Chapter 5.6 !\n");
    }
    else if (str_match(att_value, Ch6_name, sizeof(Ch6_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd ..\n");
      fprintf(outFile, "rm -rf ./build\n");
      printf("reached Chapter 6 !\n");
    }
    else if (str_match(att_value, Ch62_name, sizeof(Ch62_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'm4-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 6.2\"\n");
      printf("reached Chapter 6.2 !\n");
    }
    else if (str_match(att_value, Ch63_name, sizeof(Ch63_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'ncurses-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 6.3\"\n");
      printf("reached Chapter 6.3 !\n");
    }
    else if (str_match(att_value, Ch64_name, sizeof(Ch64_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd ..\n");
      fprintf(outFile, "rm -rf ./build\n");
      fprintf(outFile, "cd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'bash-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 6.4\"\n");
      printf("reached Chapter 6.4 !\n");
    }
    else if (str_match(att_value, Ch65_name, sizeof(Ch65_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'coreutils-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 6.5\"\n");
      printf("reached Chapter 6.5 !\n");
    }
    else if (str_match(att_value, Ch66_name, sizeof(Ch66_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'diffutils-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 6.6\"\n");
      printf("reached Chapter 6.6 !\n");
    }
    else if (str_match(att_value, Ch67_name, sizeof(Ch67_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'file-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 6.7\"\n");
      printf("reached Chapter 6.7 !\n");
    }
    else if (str_match(att_value, Ch68_name, sizeof(Ch68_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd ..\n");
      fprintf(outFile, "rm -rf ./build\n");
      fprintf(outFile, "cd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'findutils-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 6.8\"\n");
      printf("reached Chapter 6.8 !\n");
    }
    else if (str_match(att_value, Ch69_name, sizeof(Ch69_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'gawk-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 6.9\"\n");
      printf("reached Chapter 6.9 !\n");
    }
    else if (str_match(att_value, Ch610_name, sizeof(Ch610_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'grep-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 6.10\"\n");
      printf("reached Chapter 6.10 !\n");
    }
    else if (str_match(att_value, Ch611_name, sizeof(Ch611_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'gzip-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 6.11\"\n");
      printf("reached Chapter 6.11 !\n");
    }
    else if (str_match(att_value, Ch612_name, sizeof(Ch612_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'make-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 6.12\"\n");
      printf("reached Chapter 6.12 !\n");
    }
    else if (str_match(att_value, Ch613_name, sizeof(Ch613_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'patch-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 6.13\"\n");
      printf("reached Chapter 6.13 !\n");
    }
    else if (str_match(att_value, Ch614_name, sizeof(Ch614_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'sed-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 6.14\"\n");
      printf("reached Chapter 6.14 !\n");
    }
    else if (str_match(att_value, Ch615_name, sizeof(Ch615_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'tar-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 6.15\"\n");
      printf("reached Chapter 6.15 !\n");
    }
    else if (str_match(att_value, Ch616_name, sizeof(Ch616_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'xz-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 6.16\"\n");
      printf("reached Chapter 6.16 !\n");
    }
    else if (str_match(att_value, Ch617_name, sizeof(Ch617_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'binutils-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "rm -rf ./build\n");
      fprintf(outFile, "\nread -p \"Chapter 6.17\"\n");
      printf("reached Chapter 6.17 !\n");
    }
    else if (str_match(att_value, Ch618_name, sizeof(Ch618_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd ..\n");
      fprintf(outFile, "rm -rf ./build\n");
      fprintf(outFile, "cd $LFS/sources\n");
      fprintf(outFile, "cd \"$LFS/sources$(find -maxdepth 1 -type d -name 'gcc-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 6.18\"\n");
      printf("reached Chapter 6.18 !\n");
    }
    else if (str_match(att_value, Ch7_name, sizeof(Ch7_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd ..\n");
      fprintf(outFile, "rm -rf ./build\n");
      printf("reached Chapter 7 !\n");
    }
    else if (str_match(att_value, Ch71_name, sizeof(Ch71_name) -1)  == 0) {
      new_outFile();
      printf("reached Chapter 7.1 !\n");
    }
    else if (str_match(att_value, Ch72_name, sizeof(Ch72_name) -1)  == 0) {
      fprintf(outFile, "\nread -p \"Chapter 7.2\"\n");
      printf("reached Chapter 7.2 !\n");
    }
    else if (str_match(att_value, Ch733_name, sizeof(Ch733_name) -1)  == 0) {
      fprintf(outFile, "\nread -p \"Chapter 7.3.3\"\n");
      printf("reached Chapter 7.3.3 !\n");
    }// ------------------------------------------------------------------------------------ must be this order ??????   FIX THIS !! string match function issue?
    else if (str_match(att_value, Ch73_name, sizeof(Ch73_name) -1)  == 0) {
      fprintf(outFile, "\nread -p \"Chapter 7.3\"\n");
      printf("reached Chapter 7.3 !\n");
    }
    else if (str_match(att_value, Ch74_name, sizeof(Ch74_name) -1)  == 0) {
      fprintf(outFile, "\nread -p \"Chapter 7.4\"\n");
      printf("reached Chapter 7.4 !\n");
    }
    else if (str_match(att_value, Ch75_name, sizeof(Ch75_name) -1)  == 0) {
      new_outFile();
      fprintf(outFile, "\nread -p \"Chapter 7.5\"\n");
      printf("reached Chapter 7.5 !\n");
    }
    else if (str_match(att_value, Ch76_name, sizeof(Ch76_name) -1)  == 0) {
      fprintf(outFile, "\nread -p \"Chapter 7.6\"\n");
      printf("reached Chapter 7.6 !\n");
    }
    else if (str_match(att_value, Ch77_name, sizeof(Ch77_name) -1)  == 0) {
      new_outFile();
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'gcc-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "\nread -p \"Chapter 7.7\"\n");
      printf("reached Chapter 7.7 !\n");
    }
    else if (str_match(att_value, Ch78_name, sizeof(Ch78_name) -1)  == 0) {
      fprintf(outFile, "\n\n\nrm -rf ./build\n");
      fprintf(outFile, "cd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'gettext-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 7.8\"\n");
      printf("reached Chapter 7.8 !\n");
    }
    else if (str_match(att_value, Ch79_name, sizeof(Ch79_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'bison-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 7.9\"\n");
      printf("reached Chapter 7.9 !\n");
    }
    else if (str_match(att_value, Ch710_name, sizeof(Ch710_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'perl-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 7.10\"\n");
      printf("reached Chapter 7.10 !\n");
    }
    else if (str_match(att_value, Ch711_name, sizeof(Ch711_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'Python-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 7.11\"\n");
      printf("reached Chapter 7.11 !\n");
    }
    else if (str_match(att_value, Ch712_name, sizeof(Ch712_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'texinfo-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 7.12\"\n");
      printf("reached Chapter 7.12 !\n");
    }
    else if (str_match(att_value, Ch713_name, sizeof(Ch713_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'util-linux-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 7.13\"\n");
      printf("reached Chapter 7.13 !\n");
    }
    else if (str_match(att_value, Ch714_name, sizeof(Ch714_name) -1)  == 0) {
      fprintf(outFile, "read -p \"Chapter 7.14\"\n");
      printf("reached Chapter 7.14 !\n");
    }
    else if (str_match(att_value, Part4_name, sizeof(Part4_name) -1)  == 0)
      printf("reached Part 4 !\n");
//
    else if (str_match(att_value, Ch8_name, sizeof(Ch8_name) -1)  == 0) {
      comment_flag = TRUE;                                                  // comment ON
      printf("reached Chapter 8 !\n");
    }
    else if (str_match(att_value, Ch81_name, sizeof(Ch81_name) -1)  == 0) {
      printf("reached Chapter 8.1 !\n");
    }
    else if (str_match(att_value, Ch82_name, sizeof(Ch82_name) -1)  == 0) {
      printf("reached Chapter 8.2 !\n");
    }
    else if (str_match(att_value, Ch83_name, sizeof(Ch83_name) -1)  == 0) {
      comment_flag = FALSE;                                                 // comment OFF
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'man-pages-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.3\"\n");
      printf("reached Chapter 8.3 !\n");
    }
    else if (str_match(att_value, Ch84_name, sizeof(Ch84_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'iana-etc-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.4\"\n");
      printf("reached Chapter 8.4 !\n");
    }
    else if (str_match(att_value, Ch85_name, sizeof(Ch85_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'glibc-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "rm -rf ./build\n");
      fprintf(outFile, "read -p \"Chapter 8.5\"\n");
      printf("reached Chapter 8.5 !\n");
    }
    else if (str_match(att_value, Ch86_name, sizeof(Ch86_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'zlib-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.6\"\n");
      printf("reached Chapter 8.6 !\n");
    }
    else if (str_match(att_value, Ch87_name, sizeof(Ch87_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'bzip-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.7\"\n");
      printf("reached Chapter 8.7 !\n");
    }
    else if (str_match(att_value, Ch88_name, sizeof(Ch88_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'xz-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.8\"\n");
      printf("reached Chapter 8.8 !\n");
    }
    else if (str_match(att_value, Ch89_name, sizeof(Ch89_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'zstd-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.9\"\n");
      printf("reached Chapter 8.9 !\n");
    }
    else if (str_match(att_value, Ch810_name, sizeof(Ch810_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'file-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.10\"\n");
      printf("reached Chapter 8.10 !\n");
    }
    else if (str_match(att_value, Ch811_name, sizeof(Ch811_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'readline-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.11\"\n");
      printf("reached Chapter 8.11 !\n");
    }
    else if (str_match(att_value, Ch812_name, sizeof(Ch812_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'm4-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.12\"\n");
      printf("reached Chapter 8.12 !\n");
    }
    else if (str_match(att_value, Ch813_name, sizeof(Ch813_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'bc-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.13\"\n");
      printf("reached Chapter 8.13 !\n");
    }
    else if (str_match(att_value, Ch814_name, sizeof(Ch814_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'flex-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.14\"\n");
      printf("reached Chapter 8.14 !\n");
    }
    else if (str_match(att_value, Ch815_name, sizeof(Ch815_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd tlc8.6.11"
          "\n\n");
      fprintf(outFile, "read -p \"Chapter 8.15\"\n");
      printf("reached Chapter 8.15 !\n");
    }
    else if (str_match(att_value, Ch816_name, sizeof(Ch816_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'expect*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.16\"\n");
      printf("reached Chapter 8.16 !\n");
    }
    else if (str_match(att_value, Ch817_name, sizeof(Ch817_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'dejagnu-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.17\"\n");
      printf("reached Chapter 8.17 !\n");
    }
    else if (str_match(att_value, Ch818_name, sizeof(Ch818_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'binutils-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "rm -rf ./build\n");
      fprintf(outFile, "read -p \"Chapter 8.18\"\n");
      printf("reached Chapter 8.18 !\n");
    }
    else if (str_match(att_value, Ch819_name, sizeof(Ch819_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'gmp-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.19\"\n");
      printf("reached Chapter 8.19 !\n");
    }
    else if (str_match(att_value, Ch820_name, sizeof(Ch820_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'mpfr-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.20\"\n");
      printf("reached Chapter 8.20 !\n");
    }
    else if (str_match(att_value, Ch821_name, sizeof(Ch821_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'mpc-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.21\"\n");
      printf("reached Chapter 8.21 !\n");
    }
    else if (str_match(att_value, Ch822_name, sizeof(Ch822_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'attr-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.22\"\n");
      printf("reached Chapter 8.22 !\n");
    }
    else if (str_match(att_value, Ch823_name, sizeof(Ch823_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'acl-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.23\"\n");
      printf("reached Chapter 8.23 !\n");
    }
    else if (str_match(att_value, Ch824_name, sizeof(Ch824_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'libcap-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.24\"\n");
      printf("reached Chapter 8.24 !\n");
    }
    else if (str_match(att_value, Ch825_name, sizeof(Ch825_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'shadow-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.25\"\n");
      printf("reached Chapter 8.25 !\n");
    }
    else if (str_match(att_value, Ch826_name, sizeof(Ch826_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'gcc-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "rm -rf ./build\n");
      fprintf(outFile, "read -p \"Chapter 8.26\"\n");
      printf("reached Chapter 8.26 !\n");
    }
    else if (str_match(att_value, Ch827_name, sizeof(Ch827_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'pkg-config-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.27\"\n");
      printf("reached Chapter 8.27 !\n");
    }
    else if (str_match(att_value, Ch828_name, sizeof(Ch828_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'ncurses-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.28\"\n");
      printf("reached Chapter 8.28 !\n");
    }
    else if (str_match(att_value, Ch829_name, sizeof(Ch829_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'sed-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.29\"\n");
      printf("reached Chapter 8.29 !\n");
    }
    else if (str_match(att_value, Ch830_name, sizeof(Ch830_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'psmisc-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.30\"\n");
      printf("reached Chapter 8.30 !\n");
    }
    else if (str_match(att_value, Ch831_name, sizeof(Ch831_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'gettext-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.31\"\n");
      printf("reached Chapter 8.31 !\n");
    }
    else if (str_match(att_value, Ch832_name, sizeof(Ch832_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'bison-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.32\"\n");
      printf("reached Chapter 8.32 !\n");
    }
    else if (str_match(att_value, Ch833_name, sizeof(Ch833_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'grep-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.33\"\n");
      printf("reached Chapter 8.33 !\n");
    }
    else if (str_match(att_value, Ch834_name, sizeof(Ch834_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'bash-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.34\"\n");
      printf("reached Chapter 8.34 !\n");
    }
    else if (str_match(att_value, Ch835_name, sizeof(Ch835_name) -1)  == 0) {
      new_outFile();
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'libtool-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.35\"\n");
      printf("reached Chapter 8.35 !\n");
    }
    else if (str_match(att_value, Ch836_name, sizeof(Ch836_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'gdbm-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.36\"\n");
      printf("reached Chapter 8.36 !\n");
    }
    else if (str_match(att_value, Ch837_name, sizeof(Ch837_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'gperf-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.37\"\n");
      printf("reached Chapter 8.37 !\n");
    }
    else if (str_match(att_value, Ch838_name, sizeof(Ch838_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'expat-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.38\"\n");
      printf("reached Chapter 8.38 !\n");
    }
    else if (str_match(att_value, Ch839_name, sizeof(Ch839_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'inetutils-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.39\"\n");
      printf("reached Chapter 8.39 !\n");
    }
    else if (str_match(att_value, Ch840_name, sizeof(Ch840_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'perl-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.40\"\n");
      printf("reached Chapter 8.40 !\n");
    }
    else if (str_match(att_value, Ch841_name, sizeof(Ch841_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'XML-P*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.41\"\n");
      printf("reached Chapter 8.41 !\n");
    }
    else if (str_match(att_value, Ch842_name, sizeof(Ch842_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'intltool-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.42\"\n");
      printf("reached Chapter 8.42 !\n");
    }
    else if (str_match(att_value, Ch843_name, sizeof(Ch843_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'autoconf-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.43\"\n");
      printf("reached Chapter 8.43 !\n");
    }
    else if (str_match(att_value, Ch844_name, sizeof(Ch844_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'automake-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.44\"\n");
      printf("reached Chapter 8.44 !\n");
    }
    else if (str_match(att_value, Ch845_name, sizeof(Ch845_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'kmod-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.45\"\n");
      printf("reached Chapter 8.45 !\n");
    }
    else if (str_match(att_value, Ch846_name, sizeof(Ch846_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'elfutils-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.46\"\n");
      printf("reached Chapter 8.46 !\n");
    }
    else if (str_match(att_value, Ch847_name, sizeof(Ch847_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'libffi-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.47\"\n");
      printf("reached Chapter 8.47 !\n");
    }
    else if (str_match(att_value, Ch848_name, sizeof(Ch848_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'openssl-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.48\"\n");
      printf("reached Chapter 8.48 !\n");
    }
    else if (str_match(att_value, Ch849_name, sizeof(Ch849_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'Python-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.49\"\n");
      printf("reached Chapter 8.49 !\n");
    }
    else if (str_match(att_value, Ch850_name, sizeof(Ch850_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'ninja-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.50\"\n");
      printf("reached Chapter 8.50 !\n");
    }
    else if (str_match(att_value, Ch851_name, sizeof(Ch851_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'meson-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.51\"\n");
      printf("reached Chapter 8.51 !\n");
    }
    else if (str_match(att_value, Ch852_name, sizeof(Ch852_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'coreutils-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.52\"\n");
      printf("reached Chapter 8.52 !\n");
    }
    else if (str_match(att_value, Ch853_name, sizeof(Ch853_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'check-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.53\"\n");
      printf("reached Chapter 8.53 !\n");
    }
    else if (str_match(att_value, Ch854_name, sizeof(Ch854_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'diffutils-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.54\"\n");
      printf("reached Chapter 8.54 !\n");
    }
    else if (str_match(att_value, Ch855_name, sizeof(Ch855_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'gawk-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.55\"\n");
      printf("reached Chapter 8.55 !\n");
    }
    else if (str_match(att_value, Ch856_name, sizeof(Ch856_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'findutils-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.56\"\n");
      printf("reached Chapter 8.56 !\n");
    }
    else if (str_match(att_value, Ch857_name, sizeof(Ch857_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'groff-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.57\"\n");
      printf("reached Chapter 8.57 !\n");
    }
    else if (str_match(att_value, Ch858_name, sizeof(Ch858_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'grub-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.58\"\n");
      printf("reached Chapter 8.58 !\n");
    }
    else if (str_match(att_value, Ch859_name, sizeof(Ch859_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'less-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.59\"\n");
      printf("reached Chapter 8.59 !\n");
    }
    else if (str_match(att_value, Ch860_name, sizeof(Ch860_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'gzip-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.60\"\n");
      printf("reached Chapter 8.60 !\n");
    }
    else if (str_match(att_value, Ch861_name, sizeof(Ch861_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'iproute2-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.61\"\n");
      printf("reached Chapter 8.61 !\n");
    }
    else if (str_match(att_value, Ch862_name, sizeof(Ch862_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'kbd-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.62\"\n");
      printf("reached Chapter 8.62 !\n");
    }
    else if (str_match(att_value, Ch863_name, sizeof(Ch863_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'libpipeline-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.63\"\n");
      printf("reached Chapter 8.63 !\n");
    }
    else if (str_match(att_value, Ch864_name, sizeof(Ch864_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'make-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.64\"\n");
      printf("reached Chapter 8.64 !\n");
    }
    else if (str_match(att_value, Ch865_name, sizeof(Ch865_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'patch-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.65\"\n");
      printf("reached Chapter 8.65 !\n");
    }
    else if (str_match(att_value, Ch866_name, sizeof(Ch866_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'man-db-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.66\"\n");
      printf("reached Chapter 8.66 !\n");
    }
    else if (str_match(att_value, Ch867_name, sizeof(Ch867_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'tar-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.67\"\n");
      printf("reached Chapter 8.67 !\n");
    }
    else if (str_match(att_value, Ch868_name, sizeof(Ch868_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'texinfo-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.68\"\n");
      printf("reached Chapter 8.68 !\n");
    }
    else if (str_match(att_value, Ch869_name, sizeof(Ch869_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'vim-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.69\"\n");
      printf("reached Chapter 8.69 !\n");
    }
    else if (str_match(att_value, Ch870_name, sizeof(Ch870_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'eudev-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.70\"\n");
      printf("reached Chapter 8.70 !\n");
    }
    else if (str_match(att_value, Ch871_name, sizeof(Ch871_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'procps-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.71\"\n");
      printf("reached Chapter 8.71 !\n");
    }
    else if (str_match(att_value, Ch872_name, sizeof(Ch872_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'util-linux-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.72\"\n");
      printf("reached Chapter 8.72 !\n");
    }
    else if (str_match(att_value, Ch873_name, sizeof(Ch873_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'e2fsprogs-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.73\"\n");
      printf("reached Chapter 8.73 !\n");
    }
    else if (str_match(att_value, Ch874_name, sizeof(Ch874_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'sysklogd-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.74\"\n");
      printf("reached Chapter 8.74 !\n");
    }
    else if (str_match(att_value, Ch875_name, sizeof(Ch875_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name 'sysvinit-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.75\"\n");
      printf("reached Chapter 8.75 !\n");
    }
    else if (str_match(att_value, Ch876_name, sizeof(Ch876_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name '-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.76\"\n");
      comment_flag = TRUE;                                                  // comment ON
      printf("reached Chapter 8.76 !\n");
    }
    else if (str_match(att_value, Ch877_name, sizeof(Ch877_name) -1)  == 0) {
      printf("reached Chapter 8.77 !\n");
    }
    else if (str_match(att_value, Ch878_name, sizeof(Ch878_name) -1)  == 0) {
      fprintf(outFile, "\n\n\ncd /sources\n");
      fprintf(outFile, "cd \"/sources$(find -maxdepth 1 -type d -name '-*' | cut -c 2-)\"\n\n");
      fprintf(outFile, "read -p \"Chapter 8.78\"\n");
      comment_flag = FALSE;                                                 // comment OFF
      printf("reached Chapter 8.78 !\n");
    }
//
    else if (str_match(att_value, Ch9_name, sizeof(Ch9_name) -1)  == 0) {
      comment_flag = TRUE;                                                  // comment ON
      printf("reached Chapter 9 !\n");
    }
    else if (str_match(att_value, Ch92_name, sizeof(Ch92_name) -1)  == 0)
      printf("reached Chapter 9.2 !\n");
    else if (str_match(att_value, Ch10_name, sizeof(Ch10_name) -1)  == 0)
      printf("reached Chapter 10 !\n");
    else if (str_match(att_value, Ch11_name, sizeof(Ch11_name) -1)  == 0)
      printf("reached Chapter 11 !\n");
    else if (str_match(att_value, Ch111_name, sizeof(Ch111_name) -1)  == 0)
      printf("reached Chapter 11.1 !\n");
    else if (str_match(att_value, Ch113_name, sizeof(Ch113_name) -1)  == 0)
      printf("reached Chapter 11.3 !\n");
    else if (str_match(att_value, Part5_name, sizeof(Part5_name) -1)  == 0) {
      comment_flag = TRUE;                                                  // comment ON
      printf("reached Part 5 !\n");
    }
  }
}



// --------------------------------------------------------------------
// the one and only MAIN !!!
//
// ... like the highlander ... there can only be one !!
//
int main(int argc, char *argv[])
{
  // ***********************************
  // locals.
  //
  int         i = 0;
  int         spaceFlag = FALSE;

  char        mid_Chap43[] = {"To log in as"};
  int         mid_Chap43Pntr = 0;

  // ***********************************
  // check for proper command line arguments.
  //
  if (argc < 2) {
    printf("1st argument after command must be input file to open.\n");
    exit(1);
  }

  if (argc < 3) {
    printf("2nd argument after command must be the LFS version number (ie: 10.1).\n");
    exit(1);
  }

  if (argc > 4) {
    printf("Too many arguments!\n");
    exit(1);
  }

  // ***********************************
  // argument # 2 has the LFS version ..
  // .. save it to create the output ..
  // .. file name..
  strcpy(LFS_ver_str, argv[2]);

  // ***********************************
  // Open input, output, (and debug .. if specified) files.
  //

  if ((inFile = fopen(argv[1], "r")) == NULL) {
    printf("main(), fopen(), input file.\n%s\n", strerror(errno));
    exit(1);
  }

  new_outFile();

  if (argc > 3) {
    if ((dbgFile = fopen(argv[3], "w")) == NULL) {
      printf("main(), fopen(), dbg file.\n%s\n", strerror(errno));
      exit(1);
    }
  }

  // ***********************************
  // comment 1st line for title.
  fputc('#', outFile);

  // ***********************************
  // below while loop assumes a new ..
  // .. HTML tag open '<' has been found ..
  // .. so since we just opened the input file ...
  search_start_of_tag();


  // ==========================================================================================================
  // here when: next HTML tag open '<' has been found.
  while (EOF_flag == FALSE) {

    // ***********************************
    // get tag name in tagType[] with '\0'.
    tagType[process_HTML_tag()] = '\0';

    // ***********************************
    // process chapter related tasks.
    chapter();

    // ***********************************
    // print debug info to file if enabled.
    if (dbgFile != NULL) {

      fprintf(dbgFile, "%-20s H1-%1d      H2-%1d      H3-%1d      H4-%1d      H5-%1d      H6-%1d       a-%1d    code-%1d     div-%1d      em-%1d     kbd-%1d       p-%1d     pre-%1d    span-%1d\n",
                        tagType,
                              H1_count,
                                          H2_count,
                                                      H3_count,
                                                                  H4_count,
                                                                              H5_count,
                                                                                          H6_count,
                                                                                                       a_count,
                                                                                                                code_count,
                                                                                                                             div_count,
                                                                                                                                          em_count,
                                                                                                                                                     kbd_count,
                                                                                                                                                                   p_count,
                                                                                                                                                                             pre_count,
                                                                                                                                                                                        span_count);

      fprintf(dbgFile, "                     Bq-%1d    body-%1d  colgrp-%1d      dd-%1d      dl-%1d      dt-%1d    head-%1d    html-%1d      li-%1d      ol-%1d\n\n\n",
                                             blockquote_count,
                                                       body_count,
                                                                 colgroup_count,
                                                                                 dd_count,
                                                                                             dl_count,
                                                                                                         dt_count,
                                                                                                                   head_count,
                                                                                                                               html_count,
                                                                                                                                             li_count,
                                                                                                                                                         ol_count);
    }

    // ***********************************
    // trim leading white space after tag.
    // .. if HTML open tag immediately ..
    // .. follows the previous close tag ..
    // .. restart loop to get new tag name.
    if (trim_leading_white_space() == FALSE) {
      check_closed_tags();
      continue;
    }

    // ***********************************
    // do we need to comment at the start ..
    // ... of our text?
    check_start_comment();

    // ==========================================================================================================
    // loop to get any printable text between tags
    // .. from the input file to the buffer
    // .. up to the next tag open
    // .. and cleanup as we do.
    while (EOF_flag == FALSE) {

      // ***********************************
      // get next character from inFile.
      getOnechar(FALSE);

      // ***********************************
      // if new open tag ... bail.
      if (myChar == '<')
        break;

      // RULE # 1 **************************
      // strip all carriage returns.
      if (myChar == '\r')
        continue;

      // RULE # 2 **************************
      // convert entity reference to ascii.
      if (myChar == '&')
        do_ampersand();

      // RULE # 3 **************************
      // comment within an open 'pre' tag ..
      // .. when comment_flag = TRUE.
      if ((myChar == '\n') && (pre_count > 0) && (comment_flag == TRUE)) {
        spaceCount = 0;
        new_commented_line();
        continue;
      }

      // RULE # 4 **************************
      // strip all newlines when:
      // .. not wrapped in a 'pre' tag.
      if ((myChar == '\n') && (pre_count == 0))
        continue;

      // RULE # 5 *************************
      // clear excessive white space when:
      // .. not wrapped in a 'pre' tag.
      if (pre_count == 0) {
        if ((myChar == ' ') && (spaceFlag == FALSE))          // 1st space char ...  allow space thru and set flag.
          spaceFlag = TRUE;
        else if ((myChar == ' ') && (spaceFlag == TRUE))      // subsequent space char is ignored.
          continue;
        else if ((myChar != ' ') && (spaceFlag == TRUE))      // 1st non space after flag set ... then clear flag.
          spaceFlag = FALSE;
      }

      // RULE # 6 *************************
      // newline and comment if inside a ..
      // .. paragraph and beyond 80 characters.
      p_width ++;
      if ((p_count > 0) && (p_width > 79) && (myChar == ' ')) {
        p_width = 0;
        spaceCount = 22;
        new_commented_line();
      }

      // ***********************************
      // look for the mid_Chap43_flag text:
      if (mid_Chap43_flag == FALSE) {
        if (myChar == mid_Chap43[mid_Chap43Pntr]) {
          if (mid_Chap43Pntr == (sizeof(mid_Chap43) - 2)) {
            mid_Chap43_flag = TRUE;
            mid_Chap43_newFile_flag = TRUE;
          }
          else
            mid_Chap43Pntr++;
        }
        else
          mid_Chap43Pntr = 0;
      }

      // ***********************************
      // print debug info to file if enabled.
      if (dbgFile != NULL)
        fprintf(dbgFile, "%c", myChar);

      // ***********************************
      // write to the outFile.
      fputc(myChar, outFile);

    }//closes inner while()

    // ***********************************
    // we have finished a line of text between HTML tags
    // .. and encountered a new HTML tag open char '<'.

    // close out debug line.
    if (dbgFile != NULL)
      fprintf(dbgFile, "\n");

  }// closes outer while()

  // ***********************************
  // report if all non void HTML tags ..
  // .. are closed .. (is HTML well formed?).
  i = a_count +
      blockquote_count +
      body_count +
      code_count +
      colgroup_count +
      dd_count +
      div_count +
      dl_count +
      dt_count +
      em_count +
      H1_count +
      H2_count +
      H3_count +
      H4_count +
      H5_count +
      H6_count +
      head_count +
      html_count +
      kbd_count +
      li_count +
      ol_count +
      p_count +
      pre_count +
      span_count +
      strong_count +
      style_count +
      table_count +
      tbody_count +
      th_count +
      thead_count +
      td_count +
      title_count +
      tr_count +
      ul_count;

  if (i > 0)
    printf("tags sum = %d\n", i);


  // ***********************************
  // clean up and terminate.
  fclose(inFile);
  fclose(outFile);
  if (dbgFile != NULL)
    fclose(dbgFile);


}
