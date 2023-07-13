/*remount.c*/
}else if(strcmp(applet,"remount")==0){
 void usage(){printf("\nUSAGE: remount ${l(read only)|u(read/write)} ${SOME LOCATION}\n\n");};
 if(argc!=3){
  usage();
 }else{
  if(strcmp(sel,"l")==0){
   sprintf(cmd,"sudo mount -o ro,remount,ro %s&&echo 'Remount pass!'||echo 'Remount fail!'",sell);
   system(cmd);
  }else if(strcmp(sel,"u")==0){
   sprintf(cmd,"sudo mount -o rw,remount,rw %s&&echo 'Remount pass!'||echo 'Remount fail!'",sell);
   system(cmd);
  }else{
   usage();
  };
 };
