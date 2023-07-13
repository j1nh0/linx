/*gitpull.c*/
}else if(strcmp(applet,"gitpull")==0){
 char *gitpull[100]={
  "fetch",
  "pull"
 };
 while(gitpull[i]!=NULL){
  sprintf(cmd,"git %s",gitpull[i]);
  system(cmd);
  i++;
 };
