/*xmlviewer.c*/
}else if(strcmp(applet,"xmlviewer")==0){
 void usage(){printf("\nUSAGE: xmlviewer ${XML FILE}\n\n");};
 if(argc==1){
  usage();
 }else{
  sprintf(cmd,"xmllint --format %s|highlight --syntax=xml --out-format=xterm256|less -RN",sel);
  system(cmd);
 };
