/*merge.c*/
}else if(strcmp(applet,"merge")==0){
 if(argc!=3){
  printf("\nUSAGE: merge ${SOURCE} ${DESTINATION}\n\n");
 }else{
  sprintf(cmd,"rsync --archive --progress --human-readable --whole-file --exclude=.* --exclude=studio --exclude=sdk %s %s",sel,sell);
  system(cmd);
  sync();
 };
