/*fpi.c*/
}else if(strcmp(applet,"fpi")==0){
 void usage(){printf("\nUSAGE: fpi ${FLATPAK PACKAGE NAME}\n\n");};
 if(argc==1){
  usage();
 }else{
  sprintf(cmd,"sudo flatpak install %s",sel);
  system(cmd);
 };
