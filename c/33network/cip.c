/*cip.c*/
}else if(strcmp(applet,"cip")==0){
 char *cip[1000]={
  "ip addr"
 };
 cls();
 while(cip[i]!=NULL){
  sprintf(cmd,"%s",cip[i]);
  system(cmd);
  i++;
 };
