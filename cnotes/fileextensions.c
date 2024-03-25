/*fileextensions.c*/
}else if(strcmp(applet,"fileextensions")==0){
 char *showfileextensions[1000]={
  "",
  "FILE=example.tar.gz",
  "",
  " echo ${FILE%%.*}",
  "   example",
  "",
  " echo ${FILE%.*}",
  "   example.tar",
  "",
  " echo ${FILE#*.}",
  "   tar.gz",
  "",
  " echo ${FILE##*.}",
  "   gz",
  ""
 };
 while(showfileextensions[i]!=NULL){
  printf("%s",showfileextensions[i]);
  printf("\n");
  i++;
 };
