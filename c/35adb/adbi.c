/*adbi.c*/
}else if(strcmp(applet,"adbi")==0){
 void usage(){printf("\nUSAGE: adbi ${APK INSTALL}\n\n");};
 if(argc==1){
  usage();
 }else{
  sprintf(cmd,"adb install %s",sel);
  system(cmd);
 };
