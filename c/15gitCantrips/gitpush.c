/*gitpush.c*/
}else if(strcmp(applet,"gitpush")==0){
 char *gitpush[1000]={
  "add .",
  "commit -m $(date +%Y%m%d%H%M%S)",
  "push"
 };
 while(gitpush[i]!=NULL){
  sprintf(cmd,"git %s",gitpush[i]);
  system(cmd);
  i++;
 };
