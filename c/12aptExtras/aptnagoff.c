/*aptnagoff.c*/
}else if(strcmp(applet,"aptnagoff")==0){
 char *aptnagoff[150]={
  "mkdir -vp /etc/apt/apt.conf.d/off/",
  "mv -vf /etc/apt/apt.conf.d/20apt-esm-hook.conf /etc/apt/apt.conf.d/off/"
 };
 while(aptnagoff[i]!=NULL){
  sprintf(cmd,"sudo %s",aptnagoff[i]);
  system(cmd);
  i++;
 };
