/*aptjammy2focal.c*/
}else if(strcmp(applet,"aptjammy2focal")==0){
 char *aptjammy2focal[150]={
  "cp -v /etc/apt/sources.list /etc/apt/sources.list.jammy",
  "cp -v /etc/apt/sources.list /etc/apt/sources.list.focal",
  "sed -i 's/jammy/focal/g' sources.list.focal",
  "cat sources.list.jammy>sources.list",
  "cat sources.list.focal>>sources.list"
 };
 while(aptjammy2focal!=NULL){
  sprintf(cmd,"%s",aptjammy2focal[i]);
  system(cmd);
  i++;
 };
