/*aptrepo.c*/
}else if(strcmp(applet,"aptrepo")==0){
 char *repo[1000]={
  "universe",
  "multiverse",
  "restricted",
  "ppa:cubic-wizard/release",
  "ppa:unit193/encryption"
 };
 while(repo[i]!=NULL){
  sprintf(cmd,"sudo add-apt-repository -y %s",repo[i]);
  system(cmd);
  i++;
 };
