/*aptmega.c*/
}else if(strcmp(applet,"aptmega")==0){
 char *megapkg[1000]={
  "megasync",
  "nautilus-megasync",
  "megacmd"
 };
 sprintf(cmd,"%s update",apt);
 system(cmd);
 while(megapkg[i]!=NULL){
  sprintf(cmd,"wget https://mega.nz/linux/repo/xUbuntu_22.04/amd64/%s-xUbuntu_22.04_amd64.deb",megapkg[i]);
  system(cmd);
  sprintf(cmd,"%s install ./%s-xUbuntu_22.04_amd64.deb",apt,megapkg[i]);
  system(cmd);
  sprintf(cmd,"rm %s-xUbuntu_22.04_amd64.deb",megapkg[i]);
  system(cmd);
  i++;
 };
