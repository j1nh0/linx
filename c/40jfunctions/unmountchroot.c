/*unmountchroot.c*/
}else if(strcmp(applet,"unmountchroot")==0){
 char *unmountchroot[1000]={
  "run",
  "proc",
  "sys",
  "dev/shm",
  "dev/pts",
  "dev"
 };
 while(unmountchroot[i]!=NULL){
  sprintf(cmd,"sudo umount ./%s/",unmountchroot[i]);
  system(cmd);
  i++;
 };
 sync();
