/*mirror.c*/
}else if(strcmp(applet,"mirror")==0){
 if(argc!=3){
  printf("\nUSAGE: mirror ${SOURCE} ${DESTINATION}\n\n");
 }else{
  sprintf(cmd,"rsync --archive --progress --human-readable --whole-file --delete %s %s",sel,sell);
  system(cmd);
  sync();
 };
