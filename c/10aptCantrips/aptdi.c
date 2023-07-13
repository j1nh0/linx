/*aptdi.c*/
}else if(strcmp(applet,"aptdi")==0){
 char *aptdi[100]={
  "update",
  "dist-upgrade",
  "upgrade"
 };
 while(aptdi[i]!=NULL){
  sprintf(cmd,"%s %s",apt,aptdi[i]);
  system(cmd);
  i++;
 };
