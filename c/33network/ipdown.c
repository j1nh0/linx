/*ipdown.c*/
}else if(strcmp(applet,"ipdown")==0){
 if(argc==1){
  system("for LINK in $(ip addr | grep ^[0-99] | awk '{print substr($2, 1, length($2)-1)}');do sudo ip link set down $LINK;done");
 }else{
  sprintf(cmd,"sudo ip link set down %s",sel);
  system(cmd);
 };
