/*addgroups.c*/
}else if(strcmp(applet,"addgroups")==0){
 char *addgroups[100]={
  "adm",
  "tty",
  "dialout",
  "cdrom",
  "floppy",
  "sudo",
  "audio",
  "dip",
  "video",
  "plugdev",
  "users",
  "lpadmin",
  "lxd",
  "sambashare",
  "libvirt"
 };
 while(addgroups[i]!=NULL){
  sprintf(cmd,"sudo usermod -aG %s $(whoami)",addgroups[i]);
  system(cmd);
  i++;
 };
