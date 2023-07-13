/*aptlibdvd-pkg.c*/
}else if(strcmp(applet,"aptlibdvd-pkg")==0){
 char *libdvd[100]={
  "libdvdcss-dev",
  "libdvdcss2",
  "libdvdread-dev",
  "libdvdread8",
  "libdvdnav4",
  "libdvd-pkg"
 };
 sprintf(cmd,"%s update",apt);
 system(cmd);
 while(libdvd[i]!=NULL){
  sprintf(cmd,"%s install %s",apt,libdvd[i]);
  system(cmd);
  i++;
 };
 sprintf(cmd,"%s libdvd-pkg",dpkgreconf);
 system(cmd);
