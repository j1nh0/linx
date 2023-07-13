/*fbstock.c*/
}else if(strcmp(applet,"fbstock")==0){
 void usage(){printf("\nUSAGE: fbstock ${lemonadep|instantnoodle}\n\n");};
 char *lemonadep[1000]={
  "abl",
  "aop",
  "bluetooth",
  "cpucp",
  "devcfg",
  "dsp",
  "engineering_cdt",
  "featenabler",
  "hyp",
  "imagefv",
  "keymaster",
  "modem",
  "multiimgoem",
  "oplus_sec",
  "oplusstanvbk",
  "qupfw",
  "qweslicstore",
  "shrm",
  "splash",
  "tz",
  "uefisecapp",
  "vm-bootsys",
  "xbl_config",
  "xbl"
 };
 char *instantnoodle[1000]={
  "abl",
  "aop",
  "bluetooth",
  "cmnlib64",
  "cmnlib",
  "devcfg",
  "dsp",
  "featenabler",
  "hyp",
  "imagefv",
  "keymaster",
  "logo",
  "mdm_oem_stanvbk",
  "modem",
  "multiimgoem",
  "qupfw",
  "spunvm",
  "storsec",
  "tz",
  "uefisecapp"
 };
 if(argc==1){
  usage();
 }else if(strcmp(sel,"lemonadep")==0){
  while(lemonadep[i]!=NULL){
   sprintf(cmd,"sudo fastboot flash --slot=all %s %s.img",lemonadep[i],lemonadep[i]);
   system(cmd);
   i++;
  };
 }else if(strcmp(sel,"instantnoodle")==0){
  while(instantnoodle[j]!=NULL){
   sprintf(cmd,"sudo fastboot flash --slot=all %s %s.img",instantnoodle[j],instantnoodle[j]);
   system(cmd);
   j++;
  };
 }else{
  usage();
 };
