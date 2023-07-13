/*gitprune.c*/
}else if(strcmp(applet,"gitprune")==0){
 char *gitprune[1000]={
  "gc --aggressive --prune=now",
  "repack -Ad",
  "prune",
  "prune-packed"
 };
 while(gitprune[i]!=NULL){
  sprintf(cmd,"git %s",gitprune[i]);
  system(cmd);
  i++;
 };
