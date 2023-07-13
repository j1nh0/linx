/*fbreb.c*/
}else if(strcmp(applet,"fbreb")==0){
 void usage(){printf("\nUSAGE: fbreb ${STANDALONE OR b|d|r}\n\n");};
 if(argc==1){
  system("sudo fastboot reboot");
 }else if(strcmp(sel,"b")==0){
  system("sudo fastboot reboot bootloader");
 }else if(strcmp(sel,"d")==0){
  system("sudo fastboot reboot download");
 }else if(strcmp(sel,"r")==0){
  system("sudo fastboot reboot recovery");
 }else{
  usage();
 };
