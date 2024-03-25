}else if(strcmp(applet,"ext")==0){
 char *remove_ext (char* myStr, char extSep, char pathSep) {
  char *retStr, *lastExt, *lastPath;
  if (myStr == NULL) return NULL;
  if ((retStr = malloc (strlen (myStr) + 1)) == NULL) return NULL;
  strcpy (retStr, myStr);
  lastExt = strrchr (retStr, extSep);
  lastPath = (pathSep == 0) ? NULL : strrchr (retStr, pathSep);
  if (lastExt != NULL) {
   if (lastPath != NULL) {
    if (lastPath < lastExt) {
     *lastExt = '\0';
    }
   } else {
    *lastExt = '\0';
   }
  }
  return retStr;
 }
 char *s;
 printf ("[%s]\n", (s = remove_ext ("hello", '.', '/'))); free (s);
 printf ("[%s]\n", (s = remove_ext ("hello.", '.', '/'))); free (s);
 printf ("[%s]\n", (s = remove_ext ("hello.txt", '.', '/'))); free (s);
 printf ("[%s]\n", (s = remove_ext ("hello.txt.txt", '.', '/'))); free (s);
 printf ("[%s]\n", (s = remove_ext ("/no.dot/in_path", '.', '/'))); free (s);
 printf ("[%s]\n", (s = remove_ext ("/has.dot/in.path", '.', '/'))); free (s);
 printf ("[%s]\n", (s = remove_ext ("/no.dot/in_path", '.', 0))); free (s);
