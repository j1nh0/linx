/*ipup.c*/
}else if(strcmp(applet,"ipup")==0){
 if(argc==1){
  system("for LINK in $(ip addr | grep ^[0-99] | awk '{print substr($2, 1, length($2)-1)}');do sudo ip link set up $LINK;done");
 }else{
  sprintf(cmd,"sudo ip link set up %s",sel);
  system(cmd);
 };
