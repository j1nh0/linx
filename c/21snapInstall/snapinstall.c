/*snapinstall.c*/
}else if(strcmp(applet,"snapinstall")==0){
 char *snap[1000]={
  "signal-desktop"
 };
 while(snap[i]!=NULL){
  sprintf(cmd,"sudo snap install %s",snap[i]);
  system(cmd);
  i++;
 };
