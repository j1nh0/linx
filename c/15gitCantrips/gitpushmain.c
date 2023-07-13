/*gitpushmain.c*/
}else if(strcmp(applet,"gitpushmain")==0){
 char *gitpush[1000]={
  "add .",
  "commit -m $(date +%Y%m%d%H%M%S)",
  "push origin main"
 };
 while(gitpush[i]!=NULL){
  sprintf(cmd,"git %s",gitpush[i]);
  system(cmd);
  i++;
 };
