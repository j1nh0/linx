/*adbside.c*/
}else if(strcmp(applet,"adbside")==0){
 void usage(){printf("\nUSAGE: adbside ${SIDELOAD PACKAGE}\n\n");};
 if(argc==1){
  usage();
 }else{
  sprintf(cmd,"adb sideload %s",sel);
  system(cmd);
 };
