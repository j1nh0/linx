/*mountchroot.c*/
}else if(strcmp(applet,"mountchroot")==0){
 char *chroot[1000]={
  "dev",
  "dev/pts",
  "dev/shm",
  "sys",
  "proc",
  "run"
 };
 while(chroot[i]!=NULL){
  sprintf(cmd,"sudo mount -o bind /%s/ ./%s/",chroot[i],chroot[i]);
  system(cmd);
  i++;
 };
 sync();
 system("chroot .");
