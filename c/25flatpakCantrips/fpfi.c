/*fpfi.c*/
}else if(strcmp(applet,"fpfi")==0){
 void usage(){printf("\nUSAGE: fpfi ${FLATHUB FLATPAK PACKAGE}\n\n");};
 if(argc==1){
  usage();
 }else{
  sprintf(cmd,"sudo flatpak install flathub %s",sel);
  system(cmd);
 };
