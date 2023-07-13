/*mip.c*/
}else if(strcmp(applet,"mip")==0){
 char *mip[1000]={
  "curl ifconfig.me",
  "echo"
 };
 while(mip[i]!=NULL){
  sprintf(cmd,"%s",mip[i]);
  system(cmd);
  i++;
 };
