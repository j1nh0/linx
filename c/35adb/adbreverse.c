/*adbreverse.c*/
}else if(strcmp(applet,"adbreverse")==0){
 void usage(){printf("\nUSAGE: adbreverse ${FOLDER}\n\n");};
 if(argc==1){
  usage();
 }else{
  sprintf(cmd,"adb-sync --reverse /sdcard/%s %s",sel,sel);
  system(cmd);
  sync();
 };
