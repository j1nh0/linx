/*ship.c*/
}else if(strcmp(applet,"ship")==0){
 if(argc!=3){
  printf("\nUSAGE: ship ${SOURCE} ${DESTINATION}\n\n");
 }else{
  sprintf(cmd,"rsync --archive --progress --human-readable --whole-file --remove-source-files --exclude=.* --exclude=studio --exclude=sdk %s %s",sel,sell);
  system(cmd);
  sync();
 };
