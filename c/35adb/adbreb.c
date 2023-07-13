/*adbreb.c*/
}else if(strcmp(applet,"adbreb")==0){
 if(argc==1){
  system("adb reboot");
 }else if(strcmp(sel,"b")==0){
  system("adb reboot bootloader");
 }else if(strcmp(sel,"d")==0){
  system("adb reboot download");
 }else if(strcmp(sel,"r")==0){
  system("adb reboot recovery");
 }else{
  printf("\nUSAGE: adbreb ${b|d|r}\n\n");
 };
