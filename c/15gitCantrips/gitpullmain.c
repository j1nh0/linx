/*gitpullmain.c*/
}else if(strcmp(applet,"gitpullmain")==0){
 char *gitpull[100]={
  "fetch",
  "pull origin main"
 };
 while(gitpull[i]!=NULL){
  sprintf(cmd,"git %s",gitpull[i]);
  system(cmd);
  i++;
 };
