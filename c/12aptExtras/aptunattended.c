/*aptunattended.c*/
}else if(strcmp(applet,"aptunattended")==0){
 aptu();
 /*THIS NEEDS WORK*/
 sprintf(cmd,"%s install unattended-upgrades",apt);
 system(cmd);
 sprintf(cmd,"%s unattended-upgrades",dpkgreconf);
 system(cmd);
