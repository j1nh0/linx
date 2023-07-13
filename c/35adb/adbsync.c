/*adbsync.c*/
}else if(strcmp(applet,"adbsync")==0){
 void usage(){printf("\nUSAGE: adbsync ${FOLDER}\n\n");};
 if(argc==1){
  usage();
 }else{
  sprintf(cmd,"adb-sync --delete %s /sdcard/%s",sel,sel);
  system(cmd);
  sync();
 };
