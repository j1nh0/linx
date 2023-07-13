/*gitsubupdate.c*/
}else if(strcmp(applet,"gitsubupdate")==0){
 char *gitsubupdate[1000]={
  "init",
  "update",
  "foreach 'git fetch origin; git checkout $(git rev-parse --abbrev-ref HEAD); git reset --hard origin/$(git rev-parse --abbrev-ref HEAD); git submodule update --recursive; git clean -dfx'"
 };
 while(gitsubupdate[i]!=NULL){
  sprintf(cmd,"git submodule %s",gitsubupdate[i]);
  i++;
 };
