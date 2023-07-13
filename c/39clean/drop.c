/*drop.c*/
}else if(strcmp(applet,"drop")==0){
 char *drop[5]={
  "1",
  "2",
  "3"
 };
 while(drop[i]!=NULL){
  sync();
  sprintf(cmd,"sudo echo %s > /proc/sys/vm/drop_caches",drop[i]);
  system(cmd);
  i++;
 };
