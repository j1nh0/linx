/*gitreset.c*/
}else if(strcmp(applet,"gitreset")==0){
 char *gitreset[1000]={
  "init",
  "branch -m main",
  "remote add origin https://github.com/j1nh0/${PWD##*/}.git",
  "add -A",
  "commit -m $(date +%Y%m%d%H%M%S)",
  "push -f -v origin main"
 };
 system("rm -rf ./.git/");
 sync();
 system("if [ ${PWD##*/} != 'j1nh0' ];then tree --du -h > README.md;fi");
 sync();
 while(gitreset[i]!=NULL){
  sprintf(cmd,"git %s",gitreset[i]);
  system(cmd);
  i++;
 };
 
