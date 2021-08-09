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



#include  <stdio.h>
#include  <stdlib.h>
#include  <unistd.h>
#include  <errno.h>
#include  <string.h>
#include  <sys/stat.h>



extern
void      process_chapter();



// --------------------------------------------------------------------
// file scope globals.
//
FILE    *inFile;

// output file variables.
FILE    *outFile;
FILE    *dbgFile;
char    outFileName[32];
char    outPathFileName[32];
int     fileNum = 0;
char    fileNumStr[8];
char    LFS_ver_str[8];

int     lineNum = 0;
char    lineNumStr[8];

int     line_comment_list[] = {   3949,
                                  3950,
                                  3951,
                                  3952,
                                  3953
                                        };
uint    line_comment_Pntr = 0;

char    inChar;

// stores the current HTML tag type.
char    tagType[16];
uint    tagLength = 0;

// HTML attribute type strings:
const
char      att_id_const[] = "id=\"";
const
char      att_class_const[] = "class=\"";
const
char      att_class_computeroutput_const[] = "computeroutput";

// HTML attribute value strings:
char    att_id_value[64];
int     global_id_flag = FALSE;
char    att_class_value[64];
int     global_class_flag = FALSE;

// HTML tags.
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
int     code_class_computeroutput_flag = FALSE;
int     dt_flag = FALSE;
int     em_close_flag = FALSE;
int     hr_flag = FALSE;
int     Hx_flag = FALSE;
int     kbd_flag = FALSE;
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





// --------------------------------------------------------------------
// gets one character from the inFile stream into inChar.
int getOnechar()
{
  // get next char but check for end of file.
  if ((inChar = fgetc(inFile)) != EOF)
    return EXIT_SUCCESS;
  else
    EOF_flag = TRUE;

  return EXIT_FAILURE;
}



// --------------------------------------------------------------------
// puts one character in the outFile stream,
// ... inc lineNum for all '/n' (newline characters.
void putOnechar(int outChar)
{
  fputc(outChar, outFile);
  if (outChar == '\n')
    lineNum++;
}



// --------------------------------------------------------------------
// gets us out of the current tag.
//
void search_end_of_tag()
{
  while (EOF_flag == FALSE) {

    getOnechar();

    // find the close of the current tag.
    if (inChar != '>')
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
// test that the last class attribute ..
// .. equals "computeroutput".
//
void test_att_computerOutput()
{
  for (uint i = 0; i < sizeof(att_class_computeroutput_const - 2); i++) {
    if (att_class_value[i] != att_class_computeroutput_const[i]) {
      code_class_computeroutput_flag = FALSE;
      return;
    }
  }
  code_class_computeroutput_flag = TRUE;
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
      test_att_computerOutput();
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
    if (str_match(tagType, "kbd", 3) == 0) {
      kbd_count++;
      kbd_flag = TRUE;
    }
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
// search for and store HTML tag 'TYPE' (in tagType[]), and length (tagLength),
// .. assumes inside the HTML tag   <__here__  tag_TYPE  attribute="value" .. .. ..>,
// .. return TRUE if HTML tag close encountered '>',
// .. or if tag TYPE = '!'.
// .. otherwise return FALSE if there are any attributes inside the HTML tag.
int get_tag_type()
{
  int   i = 0;

  // clear tagType[].
  for (int j = 0; j < sizeof(tagType); j++) {
    tagType[j] = ' ';
  }

  // loop here.
  while (EOF_flag == FALSE) {

    getOnechar();

    if (i == 0) {
      // <! is HTML comment tag so ..
      if (inChar == '!') {
        tagType[0] = inChar;
        tagLength = 1;
        search_end_of_tag();
        return TRUE;
      }
      else if (inChar == '/')
        self_closing = TRUE;
    }
    // i = 1 thru sizeof(tagType).
    else {
      // space ? (means HTML tag 'TYPE' ends).
      if (inChar == ' ')
        return FALSE;

      // '>' ? (means HTML 'TAG' ends).
      if (inChar == '>')
        return TRUE;
    }

    // stuff it !
    tagType[i] = inChar;
    // check 'i' ... inc if ok.
    if (i < sizeof(tagType))
      i++;
    else {
      if (dbgFile != NULL)
        fprintf(dbgFile, "<------ tag name too large !\n");
      break;
    }
    tagLength = i;

  }
  // only here if HTML tag length is larger than allocated storage.
  return FALSE;
}



// --------------------------------------------------------------------
// search for and store HTML tag 'ATTRIBUTE's (that we care about),
// assumes inside the HTML tag   <tag_TYPE  __here__  attribute="value" .. .. ..>,
// .. after the HTML tag 'TYPE' and at least one space.
//
// .. on return ... we are outside the HTML tag <> __here__
int get_att_str()
{
  // local pointers and flags.
  int   att_id_Pntr = 0;
  int   id_flag = FALSE;
  int   att_class_Pntr = 0;
  int   class_flag = FALSE;

  // clear attr_name_value[].
  for (int j = 0; j < sizeof(att_id_value); j++) {
    att_id_value[j] = ' ';
  }

  // clear attr_class_value[].
  for (int j = 0; j < sizeof(att_class_value); j++) {
    att_class_value[j] = ' ';
  }

  // *************************************************
  // loop here.
  while (EOF_flag == FALSE) {

    // get next character.
    getOnechar();

    // ignore all white space
    if (inChar == ' ')
        continue;

    // ignore all newlines.
    if (inChar == '\n')
      continue;

    // greater than means end of tag.
    if (inChar == '>')
      return TRUE;

    // *************************************************
    // look for an HTML attribute named 'id='.
    if (id_flag == FALSE) {
      if (inChar == att_id_const[att_id_Pntr]) {
        if (att_id_Pntr == (sizeof(att_id_const) - 2)) {
          id_flag = TRUE;
          att_id_Pntr = 0;
        }
        else
          att_id_Pntr++;
      }
      else
        att_id_Pntr = 0;
    }
    // save the 'name' attributes value.
    else {
      // second  "  means we're done.
      if (inChar == '"') {
        id_flag = FALSE;
        // we have a new complete name attribute value !
        global_id_flag = TRUE;
        // make it printable with a null term.
        att_id_value[att_id_Pntr] = '\0';
        // print it
        if ((str_match(tagType, "a", 1) == 0) && (att_id_value[0] == 'c') && (att_id_value[1] == 'h'))
          printf("    %s\n", att_id_value);
        continue;
      }
      else {
        // store it.
        att_id_value[att_id_Pntr] = inChar;
        // test and inc pointer.
        if (att_id_Pntr < (sizeof(att_id_value) - 2))
          att_id_Pntr++;
        // error so dump everything and continue.
        else {
          printf("ERROR - get_att_str() - exceeded size of att_name_value[] storage.\n");
          id_flag = FALSE;
          continue;
        }
      }
    }

    // *************************************************
    // look for an HTML attribute named 'class='.
    if (class_flag == FALSE) {
      if (inChar == att_class_const[att_class_Pntr]) {
        if (att_class_Pntr == (sizeof(att_class_const) - 2)) {
          class_flag = TRUE;
          att_class_Pntr = 0;
        }
        else
          att_class_Pntr++;
      }
      else
        att_class_Pntr = 0;
    }
    // save the 'class' attributes value.
    else {
      // second  "  means we're done.
      if (inChar == '"') {
        class_flag = FALSE;
        // we have a new complete class attribute value !
        global_class_flag = TRUE;
        continue;
      }
      else {
        // store it.
        att_class_value[att_class_Pntr] = inChar;
        // test and inc pointer.
        if (att_class_Pntr < (sizeof(att_class_value) - 2))
          att_class_Pntr++;
        // error so dump everything and continue.
        else {
          printf("ERROR - get_att_str() - exceeded size of att_class_value[] storage.\n");
          class_flag = FALSE;
          continue;
        }
      }
    }
  } // end while()
  return FALSE;
}



// --------------------------------------------------------------------
// converts entity reference (illegal characters) to the correct ..
// .. single character.
//
void do_ampersand()
{
  // get the string before ';'.

  for (int i = 0; i < 6; i++) {

    getOnechar();

    if ((inChar == ';') || (inChar == '<'))
      break;

    tagType[i] = inChar;
  }

  // which entity reference?
  if (str_match(tagType, "amp", 3) == 0)
    inChar = '&';
  else if (str_match(tagType, "gt", 2) == 0)
    inChar = '>';
  else if (str_match(tagType, "lt", 2) == 0)
    inChar = '<';
  // single quotes.
  else if (str_match(tagType, "lsquo", 5) == 0)
    inChar = '\'';
  else if (str_match(tagType, "rsquo", 5) == 0)
    inChar = '\'';
  // double quotes.
  else if (str_match(tagType, "ldquo", 5) == 0)
    inChar = '"';
  else if (str_match(tagType, "rdquo", 5) == 0)
    inChar = '"';
  // dash.
  else if (str_match(tagType, "ndash", 5) == 0)
    inChar = '-';
  // replace non break space with a space.
  else if (str_match(tagType, "nbsp", 4) == 0)
    inChar = ' ';
  // replace copyright special char with 'C'.
  else if (str_match(tagType, "copy", 4) == 0)
    inChar = 'C';
}



// --------------------------------------------------------------------
// writes a newline ' \n', comment with one space '# ', ..
// .. and line number with trailing space ...
// .. to the current outFile .. adds spaces as commanded.
void new_commented_line()
{
  fputs("\n# ", outFile);

  // point to next line number.
  lineNum++;

  sprintf(lineNumStr, "%.6d", lineNum);

  for (int i = 0; i < sizeof(lineNumStr) - 2; i++) {
    fputc(lineNumStr[i], outFile);
  }

  // we need at least one space after the line number.
  fputc(' ', outFile);

  for (; spaceCount > 0; spaceCount--) {
    fputc(' ', outFile);
  }
}



// --------------------------------------------------------------------
// ignores (trims) all white space after the HTML tag close ..
// .. until we see a text character.
// .. assumes inFile stream pointer points to HTML tag close '>'.
//
// return TRUE means:
// .. non-whiteSpace character found (text).
// return FALSE means:
// .. all white space and/or HTML tag open '<' found (no text).
//
int trim_leading_white_space()
{

  while (EOF_flag == FALSE) {

    // ***********************************
    // get next character from inFile.
    getOnechar();

    // ***********************************
    // if new open tag ... bail.
    if (inChar == '<')
      return FALSE;

    // ***********************************
    // convert all TABs to a single space.
    if (inChar == '\t')
      inChar = ' ';

    // ***********************************
    // find first non white space char ..
    if ((inChar == ' ') || (inChar == '\n') || (inChar == '\r'))
      continue;
    else {
      // move back one so next getOnechar()
      // .. will get the 1st character non-whiteSpace.
      fseek(inFile, -1, SEEK_CUR);
      break;
    }
  }
  return TRUE;
}



// --------------------------------------------------------------------
// RULE's applied once before the text ..
// .. (after the HTML tag closes).
void check_start_comment()
{

  // RULE # 8 *************************
  // HTML 'pre' tag:
  // .. 3 newlines.
  if (pre_flag == TRUE) {
    pre_flag = FALSE;
    putOnechar('\n');
    putOnechar('\n');
    putOnechar('\n');
  }

  // RULE # 9 *************************
  // HTML 'code' tag ..
  // .. with "computeroutput attribute ..
  // .. comment the 1st line only.
  if ((code_flag == TRUE) && (code_class_computeroutput_flag == TRUE)) {
    code_flag = FALSE;
    new_commented_line();
  }

  // RULE # 10 ************************move me ??????????????????????????????????????????????????????*
  // specific line needing a comment?
  if (lineNum == line_comment_list[line_comment_Pntr]) {
    new_commented_line();
    if (line_comment_Pntr < sizeof(line_comment_list))
      line_comment_Pntr++;
  }

  // RULE # 11 ************************
  // create a horizontal ruler
  if (hr_flag == TRUE) {
    hr_flag = FALSE;
    spaceCount = 0;
    new_commented_line();
    for (int i = 0; i < 80; i++)
      putOnechar('-');
  }

  // RULE # 12 ************************
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

  // RULE # 13 ************************
  // HTML 'header' tag:
  // .. comment.
  if (Hx_flag == TRUE) {
    Hx_flag = FALSE;
    // spaceCount set in tag_flags().
    new_commented_line();
  }

  // RULE # 14 ************************
  // HTML 'anchor' tag:
  // .. if not nested .. comment.
  if (((H1_count + H2_count + H3_count + H4_count + H5_count + H6_count + p_count) == 0) &&
      (a_count > 0)) {
    spaceCount = 15;
    new_commented_line();
  }

  // RULE # 15 ************************
  // HTML 'dt' tag:
  // .. insert 2 commented lines.
  if (dt_flag == TRUE) {
    dt_flag = FALSE;
    new_commented_line();
    spaceCount = 15;
    new_commented_line();
  }

  // RULE # 16 ************************
  // HTML 'table' tag:
  // .. comment 1st line twice only.
  if (table_flag == TRUE) {
    table_flag = FALSE;
    spaceCount = 0;
    new_commented_line();
    spaceCount = 15;
    new_commented_line();
  }

  // RULE # 17 *************************
  // HTML 'strong' tag when not nested ..
  // .. gets a new commented line.
  if ((strong_count > 0) && (p_count + H1_count + H2_count + H3_count + H4_count + H5_count + H6_count == 0)) {
    spaceCount = 10;
    new_commented_line();
  }
}



// --------------------------------------------------------------------
// RULE's applied once after the text ..
// .. (before the next HTML tag opens).
void check_closed_tags()
{

  // RULE # 18 ************************
  // add 2 '\n' to end of pre tag ..
  if (pre_close_flag == TRUE) {
    pre_close_flag = FALSE;
    putOnechar('\n');
    putOnechar('\n');
  }

  // RULE # 19 ************************
  // add a ' ' to end of span tag ..
  // .. nested in a p or hx tag.
  if ((span_close_flag == TRUE) && (p_count + H1_count + H2_count + H3_count + H4_count + H5_count + H6_count > 0)) {
    span_close_flag = FALSE;
    putOnechar(' ');
  }

  // RULE # 20 ************************
  // add a ' ' to end of em tag ..
  // .. if not nested in pre tag.
  if ((em_close_flag == TRUE) && (pre_count == 0)) {
    em_close_flag = FALSE;
    putOnechar(' ');
  }

  // RULE # 21 ************************
  // add a ' ' to end of strong tag ..
  if (strong_close_flag == TRUE) {
    strong_close_flag = FALSE;
    putOnechar(' ');
  }

  // RULE # 22 ************************
  // add a ' ' to end of an anchor tag ..
  if (a_close_flag == TRUE) {
    a_close_flag = FALSE;
    putOnechar(' ');
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
  fprintf(outFile, "read -p \"... must run this with sudo\"\n");
  fprintf(outFile, "wget http://www.linuxfromscratch.org/lfs/downloads/stable/wget-list\n");
  fprintf(outFile, "wget http://www.linuxfromscratch.org/lfs/downloads/stable/md5sums --continue \n\n\n");
}



// --------------------------------------------------------------------
// insert commands needed only for the 2nd script file:
void  script_second_items()
{
  fprintf(outFile, "\n#----------------------------------------------\n");
  fprintf(outFile, "read -p \"... must run this as lfs user.\"\n");
}



// --------------------------------------------------------------------
// insert commands needed only for the 3rd script file:
void  script_third_items()
{
  fprintf(outFile, "\n#----------------------------------------------\n");
  fprintf(outFile, "read -p \"... must run this as lfs user.\"\n");
}



// --------------------------------------------------------------------
// insert commands needed only for the 4th script file:
void  script_fourth_items()
{
  fprintf(outFile, "\n#----------------------------------------------\n");
  fprintf(outFile, "read -p \"... must log out from lfs user and run this with sudo\"\n");
}



// --------------------------------------------------------------------
// insert commands needed only for the 5th script file:
void  script_fifth_items()
{
  fprintf(outFile, "\n#----------------------------------------------\n");
  fprintf(outFile, "read -p \"... must be in chroot.\"\n");
}



// --------------------------------------------------------------------
// insert commands needed only for the 6th script file:
void  script_sixth_items()
{
  fprintf(outFile, "\n#----------------------------------------------\n");
  fprintf(outFile, "read -p \"... must be in chroot.\"\n");
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
  fprintf(outFile, "read -p \"... must be in chroot.\"\n");
}



// --------------------------------------------------------------------
// insert last commands needed only for the 1st script file:
void script_first_final_items()
{
  fprintf(outFile, "\n#----------------------------------------------\n");
  fprintf(outFile, "read -p \"... run = cp /home/__your_user_name__/LFS* ~\"\n");
  fprintf(outFile, "read -p \"... run = ./LFS-10.1_step-2.sh\"\n");
}



// --------------------------------------------------------------------
// insert last commands needed only for the 2nd script file:
void  script_second_final_items()
{
  fprintf(outFile, "\n#----------------------------------------------\n");
  fprintf(outFile, "read -p \"... run = ./LFS-10.1_step-3.sh\"\n");
}



// --------------------------------------------------------------------
// insert last commands needed only for the 3rd script file:
void  script_third_final_items()
{
  fprintf(outFile, "\n#----------------------------------------------\n");
  fprintf(outFile, "read -p \"... run = sudo ./LFS-10.1_step-4.sh\"\n");
}



// --------------------------------------------------------------------
// insert last commands needed only for the 4th script file:
void  script_fourth_final_items()
{
  fprintf(outFile, "\n#----------------------------------------------\n");
  fprintf(outFile, "read -p \"... run = sudo ./LFS-10.1_step-5.sh\"\n");
}



// --------------------------------------------------------------------
// insert last commands needed only for the 5th script file:
void  script_fifth_final_items()
{
  fprintf(outFile, "\n#----------------------------------------------\n");
  fprintf(outFile, "read -p \"... open a 2nd non chroot terminal ... run = sudo cp /home/__your_user_name__/LFS* /mnt/lfs\"\n");
  fprintf(outFile, "read -p \"... run = ./LFS-10.1_step-6.sh\"\n");
}



// --------------------------------------------------------------------
// insert last commands needed only for the 6th script file:
void  script_sixth_final_items()
{
  fprintf(outFile, "\n#----------------------------------------------\n");
  fprintf(outFile, "read -p \"... run = ./LFS-10.1_step-7.sh\"\n");
}



// --------------------------------------------------------------------
// insert last commands needed only for the 7th script file:
void  script_seventh_final_items()
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

    // ***********************************
    // insert needed commands at the ..
    // .. bottom of each current script.
    if (fileNum == 1)
      script_first_final_items();
    else if (fileNum == 2)
      script_second_final_items();
    else if (fileNum == 3)
      script_third_final_items();
    else if (fileNum == 4)
      script_fourth_final_items();
    else if (fileNum == 5)
      script_fifth_final_items();
    else if (fileNum == 6)
      script_sixth_final_items();
    else if (fileNum == 7)
      script_seventh_final_items();

    // flush any last line that needs flushing.
    putOnechar('\n');
    fflush(outFile);
    usleep(100000);
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
  // .. top of each new script.
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
//
void preBuild_LFS(const char* chapterName, const char* pkgName, const char* fileType)
{
  fprintf(outFile, "\n\n\ncd $LFS/sources\n");
  fprintf(outFile, "rm -rf $(find -maxdepth 1 -type d -name '%s')\n", pkgName);
  fprintf(outFile, "tar xf $(find -maxdepth 1 -type f -name '%s%s' | cut -c 3-)\n", pkgName, fileType);
  fprintf(outFile, "cd $(find -maxdepth 1 -type d -name '%s')\n", pkgName);
  fprintf(outFile, "read -p \"%s\"\n", chapterName);
  printf("reached %s !\n", chapterName);
}



// --------------------------------------------------------------------
//
void preBuild_chroot(const char* chapterName, const char* pkgName, const char* fileType)
{
  fprintf(outFile, "\n\n\ncd /sources\n");
  fprintf(outFile, "rm -rf $(find -maxdepth 1 -type d -name '%s')\n", pkgName);
  fprintf(outFile, "tar xf $(find -maxdepth 1 -type f -name '%s%s' | cut -c 3-)\n", pkgName, fileType);
  fprintf(outFile, "cd $(find -maxdepth 1 -type d -name '%s')\n", pkgName);
  fprintf(outFile, "read -p \"%s\"\n", chapterName);
  printf("reached %s !\n", chapterName);
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
  putOnechar('#');

  // ***********************************
  // below while loop assumes a new ..
  // .. HTML tag open '<' has been found ..
  // .. so since we just opened the input file ...
  while (EOF_flag == FALSE) {

    getOnechar();

    // find the close of the current tag.
    if (inChar != '<')
      continue;
    else
      break;
  }


  // ==========================================================================================================
  //
  //
  // loop back here when:
  // .. inside a new HTML tag (we just found a new HTML tag open '<').
  //
  //
  // ==========================================================================================================
  while (EOF_flag == FALSE) {

    // ***********************************
    // store the tag type in tagType[] ..
    // store the tag length in tagLength.
    if (get_tag_type() == FALSE) {
      // do we have any attributes?
      get_att_str();
    }

    // ==========================================================================================================
    //
    //
    // we are now guaranteed,
    // ... to be outside the HTML tag (we just found a new HTML tag close '>').
    //
    //
    // ==========================================================================================================

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

    // ***********************************
    // process the book's chapter related tasks.
    process_chapter();

    // ***********************************
    // tag name is in tagType[], make printable with '\0'.
    tagType[tagLength] = '\0';


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


    // ==========================================================================================================
    //
    //
    // here we do anything we need to do ..
    // .. before processing the text after an HTML tag.
    //
    //
    // ==========================================================================================================

    // ***********************************
    // did we get a tag close ..
    // .. that needs something done?
    check_closed_tags();

    // ***********************************
    // trim text's leading white space,
    // .. after HTML tag <> __here__.
    // .. if next HTML open tag immediately ..
    // .. follows the previous close tag ..
    // .. restart loop to get new tag name.
    if ((pre_count == 0) && (trim_leading_white_space() == FALSE))
      continue;

    // ***********************************
    // do we need to comment at the start ..
    // ... of our text?
    check_start_comment();


    // ==========================================================================================================
    //
    //
    // loop back here to:
    // .. process text   "after / between"   HTML tags.
    //
    //
    // ==========================================================================================================
    while (EOF_flag == FALSE) {

      // ***********************************
      // get next character from inFile.
      getOnechar();

      // ***********************************
      // if new open tag ... bail.
      if (inChar == '<')
        break;

      // ***********************************
      // RULE's applied to every character
      // ***********************************

      // RULE # 1 **************************
      // comment within an open 'pre' tag ..
      // .. when comment_flag = TRUE.
      if ((inChar == '\n') && (pre_count > 0) && (comment_flag == TRUE)) {
        spaceCount = 0;
        new_commented_line();
        continue;
      }

      // RULE # 2 **************************
      // comment within a 'code' tag ..
      // .. when comment_flag = FALSE ..
      // .. and class="computeroutput"
      if ((inChar == '\n') && (code_count > 0) && (code_class_computeroutput_flag == TRUE) && (comment_flag == FALSE)) {
        spaceCount = 0;
        new_commented_line();
        continue;
      }

      // RULE # 3 **************************
      // strip all carriage returns.
      if (inChar == '\r')
        continue;

      // RULE # 4 **************************
      // convert entity reference to ascii.
      if (inChar == '&')
        do_ampersand();

      // RULE # 5 **************************
      // strip all newlines when:
      // .. not wrapped in a 'pre' tag.
      if ((inChar == '\n') && (pre_count == 0))
        continue;

      // RULE # 6 *************************
      // clear excessive white space when:
      // .. not wrapped in a 'pre' tag.
      if (pre_count == 0) {
        if ((inChar == ' ') && (spaceFlag == FALSE))          // 1st space char ...  allow space thru and set flag.
          spaceFlag = TRUE;
        else if ((inChar == ' ') && (spaceFlag == TRUE))      // subsequent space char is ignored.
          continue;
        else if ((inChar != ' ') && (spaceFlag == TRUE))      // 1st non space after flag set ... then clear flag.
          spaceFlag = FALSE;
      }

      // RULE # 7 *************************
      // newline and comment if inside a ..
      // .. paragraph and beyond 80 characters.
      p_width ++;
      if ((p_count > 0) && (p_width > 79) && (inChar == ' ')) {
        p_width = 0;
        spaceCount = 22;
        new_commented_line();
      }

      // ***********************************
      // print debug info to file if enabled.
      if (dbgFile != NULL)
        fprintf(dbgFile, "%c", inChar);

      // ***********************************
      // write to the outFile.
      putOnechar(inChar);

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
