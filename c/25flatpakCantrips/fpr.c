/*fpr.c*/
}else if(strcmp(applet,"fpr")==0){
 void usage(){printf("\nPlease provide a flatpak to run!\n\n");};
 if(argc==1){
  usage();
 }else{
  sprintf(cmd,"flatpak run %s",sel);
  system(cmd);
 };
