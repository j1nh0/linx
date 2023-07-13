/*wmirror.c*/
}else if(strcmp(applet,"wmirror")==0){
 void usage(){printf("\nUSAGE: wmirror ${WEBSITE}\n\n");};
 if(argc==1){
  usage();
 }else{
  sprintf(cmd,"wget --random-wait -e robots=off --no-parent --page-requisites --mirror --convert-links --continue --recursive --user-agent='mozilla UCCS C++ UNOFFICIAL plugin' --show-progress %s",sel);
  system(cmd);
 };
