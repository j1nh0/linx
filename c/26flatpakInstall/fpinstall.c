/*fpinstall.c*/
}else if(strcmp(applet,"fpinstall")==0){
 char *fpinstall[2000]={
  "--from https://dl.flathub.org/repo/appstream/org.qgis.qgis.flatpakref"
 };
 while(fpinstall[i]!=NULL){
  sprintf(cmd,"flatpak install --noninteractive %s",fpinstall[i]);
  system(cmd);
  i++;
 };
